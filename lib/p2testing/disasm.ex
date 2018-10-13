require P2Testing.Disasm.Macros

defmodule P2Testing.Disasm do
  def dfile(filename) do
    {:ok, filepid} = File.open(filename, [:binary, :read])
    data = IO.binread(filepid, :all)
    File.close(filepid)

    dissassemble(data)
  end

  def dissassemble(data) do
    dissassemble({data, 0}, [])
  end

  def dissassemble({<<>>, addr}, acc) do
    acc
    |> Enum.reverse()
  end

  def dissassemble({<<long::little-size(32), rest::binary>>, addr}, acc) do
    dsmstr = disasm(<<long::size(32)>>)

    v =
      {"#{:io_lib.format('~4.16.0b', [addr])}", "#{:io_lib.format('~8.16.0b', [long])}",
       disasm(<<long::size(32)>>)}

    dissassemble({rest, addr + 4}, [v | acc])
  end

  ## NOP - the global hard-coded

  def disasm(<<conditional::size(4), instr::size(7), czi::size(3), a::size(9), b::size(9)>>) do
    {"#{:io_lib.format('~4.2.0b', [conditional])} " <>
       "#{:io_lib.format('~7.2.0b', [instr])} " <>
       "#{:io_lib.format('~3.2.0b', [czi])} " <>
       "#{:io_lib.format('~9.2.0b', [a])} " <> "#{:io_lib.format('~9.2.0b', [b])}",
#     disasm_c(<<conditional::size(4)>>),
     disasm_instr(<<conditional::size(4), instr::size(7), czi::size(3), a::size(9), b::size(9)>>)}
  end

  def disasm_c(<<0b0000::size(4)>>), do: "_RET_"
  def disasm_c(<<0b0001::size(4)>>), do: "IF_NC_AND_NZ"
  def disasm_c(<<0b0010::size(4)>>), do: "IF_NC_AND_Z"
  def disasm_c(<<0b0011::size(4)>>), do: "IF_NC"
  def disasm_c(<<0b0100::size(4)>>), do: "IF_C_AND_NZ"
  def disasm_c(<<0b0101::size(4)>>), do: "IF_NZ"
  def disasm_c(<<0b0110::size(4)>>), do: "IF_C_NE_Z"
  def disasm_c(<<0b0111::size(4)>>), do: "IF_NC_OR_NZ"
  def disasm_c(<<0b1000::size(4)>>), do: "IF_C_AND_Z"
  def disasm_c(<<0b1001::size(4)>>), do: "IF_C_EQ_Z"
  def disasm_c(<<0b1010::size(4)>>), do: "IF_Z"
  def disasm_c(<<0b1011::size(4)>>), do: "IF_NC_OR_Z"
  def disasm_c(<<0b1100::size(4)>>), do: "IF_C"
  def disasm_c(<<0b1101::size(4)>>), do: "IF_C_OR_NZ"
  def disasm_c(<<0b1110::size(4)>>), do: "IF_C_OR_Z"
  def disasm_c(<<0b1111::size(4)>>), do: ""

  def hex(x), do: "$#{:io_lib.format('~.16.0b', [x])}"
  def ref?(0), do: ""
  def ref?(1), do: "#"
  def wcz?(0,0), do: ""
  def wcz?(0,1), do: "WZ"
  def wcz?(1,0), do: "WC"
  def wcz?(1,1), do: "WCZ"
  def callr?(0), do: ""
  def callr?(1), do: "$+"

  def relhubpc(r,a),  do: "##{callr?(r)}#{hubpc(a)}"
  def hubpc(a),  do: hex(div(a, 4) + 1)	## CHECK the theory behind div 4 plus 1
  def fnOptRefAddr(flag,addr), do: "#{ref?(flag)}#{hex(addr)}"
  def fnAbsAddr(addr), do: hex(addr)


  ## Drag this addr weirdness **CHECK the 1 OFFSET**
  def disasm_instr(<<0b00000000000000000000000000000000::size(32)>>),                                                           do: ["",                         "NOP",     "",                "",                ""       ]
  def disasm_instr(<<cnd::size(4), 0b1101101::size(7), r::size(1), a::size(20)>>),                                              do: [disasm_c(<<cnd::size(4)>>), "CALL",    relhubpc(r,a),     "",                ""       ]

  def disasm_instr(<<cnd::size(4), 0b1011001::size(7), c::size(1), z::size(1), i::size(1), d::size(9),           s::size(9)>>), do: [disasm_c(<<cnd::size(4)>>), "CALLD",   fnAbsAddr(d),      fnOptRefAddr(i,s), wcz?(c,z)]

  def disasm_instr(<<cnd::size(4), 0b0110000::size(7), c::size(1), z::size(1), i::size(1), d::size(9),           s::size(9)>>), do: [disasm_c(<<cnd::size(4)>>), "MOV",     fnAbsAddr(d),      fnOptRefAddr(i,s), wcz?(c,z)]
  def disasm_instr(<<cnd::size(4), 0b0000000::size(7), c::size(1), z::size(1), i::size(1), d::size(9),           s::size(9)>>), do: [disasm_c(<<cnd::size(4)>>), "ROR",     fnAbsAddr(d),      fnOptRefAddr(i,s), wcz?(c,z)]

  def disasm_instr(<<cnd::size(4), 0b1100011::size(7), 0::size(1), l::size(1), 1::size(1), d::size(9), 0b101100001::size(9)>>), do: [disasm_c(<<cnd::size(4)>>), "PUSHA",   fnOptRefAddr(l,d), "",                ""       ]
  def disasm_instr(<<cnd::size(4), 0b1100011::size(7), 0::size(1), l::size(1), 1::size(1), d::size(9), 0b111100001::size(9)>>), do: [disasm_c(<<cnd::size(4)>>), "PUSHB",   fnOptRefAddr(l,d), "",                ""       ]
  def disasm_instr(<<cnd::size(4), 0b1100011::size(7), 0::size(1), l::size(1), i::size(1), d::size(9),           s::size(9)>>), do: [disasm_c(<<cnd::size(4)>>), "WRLONG",  fnOptRefAddr(l,d), fnOptRefAddr(i,s), ""       ]

  def disasm_instr(<<cnd::size(4), 0b1101011::size(7), c::size(1), 0::size(1), l::size(1), d::size(9), 0b000000001::size(9)>>), do: [disasm_c(<<cnd::size(4)>>), "COGID",   fnOptRefAddr(l,d), "",                wcz?(c,0)]
  def disasm_instr(<<cnd::size(4), 0b1101011::size(7), 0::size(1), 0::size(1), l::size(1), d::size(9), 0b000000011::size(9)>>), do: [disasm_c(<<cnd::size(4)>>), "COGSTOP", fnOptRefAddr(l,d), "",                ""       ]

  #   P2Testing.Disasm.Macros.t7czids({0,0,0,0,0,0})

  def disasm_instr(_), do: "disasm_instr: WTF"


end


















  #  def disasm_czi_instr(<<0b0000000 :: size(7), czi :: size(3)>>), do: "ROR"
  #  def disasm_czi_instr(<<0b0000001 :: size(7), czi :: size(3)>>), do: "ROL"
  #  def disasm_czi_instr(<<0b0000010 :: size(7), czi :: size(3)>>), do: "SHR"
  #  def disasm_czi_instr(<<0b0000011 :: size(7), czi :: size(3)>>), do: "SHL"
  #  def disasm_czi_instr(<<0b0000100 :: size(7), czi :: size(3)>>), do: "RCR"
  #  def disasm_czi_instr(<<0b0000101 :: size(7), czi :: size(3)>>), do: "RCL"
  #  def disasm_czi_instr(<<0b0000110 :: size(7), czi :: size(3)>>), do: "SAR"
  #  def disasm_czi_instr(<<0b0000111 :: size(7), czi :: size(3)>>), do: "SAL"
  #  def disasm_czi_instr(<<0b0001000 :: size(7), czi :: size(3)>>), do: "ADD"
  #  def disasm_czi_instr(<<0b0001001 :: size(7), czi :: size(3)>>), do: "ADDX"
  #  def disasm_czi_instr(<<0b0001010 :: size(7), czi :: size(3)>>), do: "ADDS"
  #  def disasm_czi_instr(<<0b0001011 :: size(7), czi :: size(3)>>), do: "ADDSX"
  #  def disasm_czi_instr(<<0b0001100 :: size(7), czi :: size(3)>>), do: "SUB"
  #  def disasm_czi_instr(<<0b0001101 :: size(7), czi :: size(3)>>), do: "SUBX"
  #  def disasm_czi_instr(<<0b0001110 :: size(7), czi :: size(3)>>), do: "SUBS"
  #  def disasm_czi_instr(<<0b0001111 :: size(7), czi :: size(3)>>), do: "SUBSX"
  #  def disasm_czi_instr(<<0b0010000 :: size(7), czi :: size(3)>>), do: "CMP"
  #  def disasm_czi_instr(<<0b0010001 :: size(7), czi :: size(3)>>), do: "CMPX"
  #  def disasm_czi_instr(<<0b0010010 :: size(7), czi :: size(3)>>), do: "CMPS"
  #  def disasm_czi_instr(<<0b0010011 :: size(7), czi :: size(3)>>), do: "CMPSX"
  #  def disasm_czi_instr(<<0b0010100 :: size(7), czi :: size(3)>>), do: "CMPR"
  #  def disasm_czi_instr(<<0b0010101 :: size(7), czi :: size(3)>>), do: "CMPM"
  #  def disasm_czi_instr(<<0b0010110 :: size(7), czi :: size(3)>>), do: "SUBR"
  #  def disasm_czi_instr(<<0b0010111 :: size(7), czi :: size(3)>>), do: "CMPSUB"
  #  def disasm_czi_instr(<<0b0011000 :: size(7), czi :: size(3)>>), do: "FGE"
  #  def disasm_czi_instr(<<0b0011001 :: size(7), czi :: size(3)>>), do: "FLE"
  #  def disasm_czi_instr(<<0b0011010 :: size(7), czi :: size(3)>>), do: "FGES"
  #  def disasm_czi_instr(<<0b0011011 :: size(7), czi :: size(3)>>), do: "FLES"
  #  def disasm_czi_instr(<<0b0011100 :: size(7), czi :: size(3)>>), do: "SUMC"
  #  def disasm_czi_instr(<<0b0011101 :: size(7), czi :: size(3)>>), do: "SUMNC"
  #  def disasm_czi_instr(<<0b0011110 :: size(7), czi :: size(3)>>), do: "SUMZ"
  #  def disasm_czi_instr(<<0b0011111 :: size(7), czi :: size(3)>>), do: "SUMNZ"
  #  def disasm_czi_instr(<<0b0100000 :: size(7), czi :: size(3)>>), do: "TESTB"
  #  def disasm_czi_instr(<<0b0100001 :: size(7), czi :: size(3)>>), do: "TESTBN"
  #  def disasm_czi_instr(<<0b0100010 :: size(7), czi :: size(3)>>), do: "TESTB"
  #  def disasm_czi_instr(<<0b0100011 :: size(7), czi :: size(3)>>), do: "TESTBN"
  #  def disasm_czi_instr(<<0b0100100 :: size(7), czi :: size(3)>>), do: "TESTB"
  #  def disasm_czi_instr(<<0b0100101 :: size(7), czi :: size(3)>>), do: "TESTBN"
  #  def disasm_czi_instr(<<0b0100110 :: size(7), czi :: size(3)>>), do: "TESTB"
  #  def disasm_czi_instr(<<0b0100111 :: size(7), czi :: size(3)>>), do: "TESTBN"
  #  def disasm_czi_instr(<<0b0100000 :: size(7), czi :: size(3)>>), do: "BITL"
  #  def disasm_czi_instr(<<0b0100001 :: size(7), czi :: size(3)>>), do: "BITH"
  #  def disasm_czi_instr(<<0b0100010 :: size(7), czi :: size(3)>>), do: "BITC"
  #  def disasm_czi_instr(<<0b0100011 :: size(7), czi :: size(3)>>), do: "BITNC"
  #  def disasm_czi_instr(<<0b0100100 :: size(7), czi :: size(3)>>), do: "BITZ"
  #  def disasm_czi_instr(<<0b0100101 :: size(7), czi :: size(3)>>), do: "BITNZ"
  #  def disasm_czi_instr(<<0b0100110 :: size(7), czi :: size(3)>>), do: "BITRND"
  #  def disasm_czi_instr(<<0b0100111 :: size(7), czi :: size(3)>>), do: "BITNOT"
  #  def disasm_czi_instr(<<0b0101000 :: size(7), czi :: size(3)>>), do: "AND"
  #  def disasm_czi_instr(<<0b0101001 :: size(7), czi :: size(3)>>), do: "ANDN"
  #  def disasm_czi_instr(<<0b0101010 :: size(7), czi :: size(3)>>), do: "OR"
  #  def disasm_czi_instr(<<0b0101011 :: size(7), czi :: size(3)>>), do: "XOR"
  #  def disasm_czi_instr(<<0b0101100 :: size(7), czi :: size(3)>>), do: "MUXC"
  #  def disasm_czi_instr(<<0b0101101 :: size(7), czi :: size(3)>>), do: "MUXNC"
  #  def disasm_czi_instr(<<0b0101110 :: size(7), czi :: size(3)>>), do: "MUXZ"
  #  def disasm_czi_instr(<<0b0101111 :: size(7), czi :: size(3)>>), do: "MUXNZ"
  #  def disasm_czi_instr(<<0b0110000 :: size(7), czi :: size(3)>>), do: "MOV"
  #  def disasm_czi_instr(<<0b0110001 :: size(7), czi :: size(3)>>), do: "NOT"
  #  def disasm_czi_instr(_), do: "unknown"

  #  def disasm(<< _ :: size(4), 0b1011001110111110000111110001 :: size(28)>>), do: "XX RESI3"
  #  def disasm(<< _ :: size(4), 0b1011001110111110010111110011 :: size(28)>>), do: "XX RESI2"
  #  def disasm(<< _ :: size(4), 0b1011001110111110100111110101 :: size(28)>>), do: "XX RESI1"
  #  def disasm(<< _ :: size(4), 0b1011001110111111110111111111 :: size(28)>>), do: "XX RESI0"
  #  def disasm(<< _ :: size(4), 0b1011001110111111111111110001 :: size(28)>>), do: "XX RETI3"
  #  def disasm(<< _ :: size(4), 0b1011001110111111111111110011 :: size(28)>>), do: "XX RETI2"
  #  def disasm(<< _ :: size(4), 0b1011001110111111111111110101 :: size(28)>>), do: "XX RETI1"
  #  def disasm(<< _ :: size(4), 0b1011001110111111111111111111 :: size(28)>>), do: "XX RETI0"
