require P2Testing.Disasm.Macros

defmodule P2Testing.Disasm do
  ## OpCodes in the format 4,7,1,1,1,9,9
  def disasm_instr(<<0b0000::size(4), 0b0000000::size(7), 0::size(1), 0::size(1), 0::size(1), 0b000000000::size(9), 0b000000000::size(9)>>), do: ["",                         "NOP",     "",            "",          ""       ] #2
  def disasm_instr(<<   cnd::size(4), 0b0000000::size(7), c::size(1), z::size(1), i::size(1),           d::size(9),           s::size(9)>>), do: [disasm_c(<<cnd::size(4)>>), "ROR",     iVal(0,d),     iVal(i,s),   wcz?(c,z)] #3
  def disasm_instr(<<   cnd::size(4), 0b0000001::size(7), c::size(1), z::size(1), i::size(1),           d::size(9),           s::size(9)>>), do: [disasm_c(<<cnd::size(4)>>), "ROL",     iVal(0,d),     iVal(i,s),   wcz?(c,z)] #4
  def disasm_instr(<<   cnd::size(4), 0b0000010::size(7), c::size(1), z::size(1), i::size(1),           d::size(9),           s::size(9)>>), do: [disasm_c(<<cnd::size(4)>>), "SHR",     iVal(0,d),     iVal(i,s),   wcz?(c,z)] #5
  def disasm_instr(<<   cnd::size(4), 0b0000011::size(7), c::size(1), z::size(1), i::size(1),           d::size(9),           s::size(9)>>), do: [disasm_c(<<cnd::size(4)>>), "SHL",     iVal(0,d),     iVal(i,s),   wcz?(c,z)] #6
  def disasm_instr(<<   cnd::size(4), 0b0000100::size(7), c::size(1), z::size(1), i::size(1),           d::size(9),           s::size(9)>>), do: [disasm_c(<<cnd::size(4)>>), "RCR",     iVal(0,d),     iVal(i,s),   wcz?(c,z)] #7
  def disasm_instr(<<   cnd::size(4), 0b0000101::size(7), c::size(1), z::size(1), i::size(1),           d::size(9),           s::size(9)>>), do: [disasm_c(<<cnd::size(4)>>), "RCL",     iVal(0,d),     iVal(i,s),   wcz?(c,z)] #8
  def disasm_instr(<<   cnd::size(4), 0b0000110::size(7), c::size(1), z::size(1), i::size(1),           d::size(9),           s::size(9)>>), do: [disasm_c(<<cnd::size(4)>>), "SAR",     iVal(0,d),     iVal(i,s),   wcz?(c,z)] #9
  def disasm_instr(<<   cnd::size(4), 0b0000111::size(7), c::size(1), z::size(1), i::size(1),           d::size(9),           s::size(9)>>), do: [disasm_c(<<cnd::size(4)>>), "SAL",     iVal(0,d),     iVal(i,s),   wcz?(c,z)] #10

  def disasm_instr(<<   cnd::size(4), 0b0001000::size(7), c::size(1), z::size(1), i::size(1),           d::size(9),           s::size(9)>>), do: [disasm_c(<<cnd::size(4)>>), "ADD",     iVal(0,d),     iVal(i,s),   wcz?(c,z)] #11
  def disasm_instr(<<   cnd::size(4), 0b0001001::size(7), c::size(1), z::size(1), i::size(1),           d::size(9),           s::size(9)>>), do: [disasm_c(<<cnd::size(4)>>), "ADDX",    iVal(0,d),     iVal(i,s),   wcz?(c,z)] #12
  def disasm_instr(<<   cnd::size(4), 0b0001010::size(7), c::size(1), z::size(1), i::size(1),           d::size(9),           s::size(9)>>), do: [disasm_c(<<cnd::size(4)>>), "ADDS",    iVal(0,d),     iVal(i,s),   wcz?(c,z)] #13
  def disasm_instr(<<   cnd::size(4), 0b0001011::size(7), c::size(1), z::size(1), i::size(1),           d::size(9),           s::size(9)>>), do: [disasm_c(<<cnd::size(4)>>), "ADDSX",   iVal(0,d),     iVal(i,s),   wcz?(c,z)] #14
  def disasm_instr(<<   cnd::size(4), 0b0001100::size(7), c::size(1), z::size(1), i::size(1),           d::size(9),           s::size(9)>>), do: [disasm_c(<<cnd::size(4)>>), "SUB",     iVal(0,d),     iVal(i,s),   wcz?(c,z)] #15
  def disasm_instr(<<   cnd::size(4), 0b0001101::size(7), c::size(1), z::size(1), i::size(1),           d::size(9),           s::size(9)>>), do: [disasm_c(<<cnd::size(4)>>), "SUBX",    iVal(0,d),     iVal(i,s),   wcz?(c,z)] #16
  def disasm_instr(<<   cnd::size(4), 0b0001110::size(7), c::size(1), z::size(1), i::size(1),           d::size(9),           s::size(9)>>), do: [disasm_c(<<cnd::size(4)>>), "SUBS",    iVal(0,d),     iVal(i,s),   wcz?(c,z)] #17
  def disasm_instr(<<   cnd::size(4), 0b0001111::size(7), c::size(1), z::size(1), i::size(1),           d::size(9),           s::size(9)>>), do: [disasm_c(<<cnd::size(4)>>), "SUBSX",   iVal(0,d),     iVal(i,s),   wcz?(c,z)] #18

  def disasm_instr(<<   cnd::size(4), 0b0010000::size(7), c::size(1), z::size(1), i::size(1),           d::size(9),           s::size(9)>>), do: [disasm_c(<<cnd::size(4)>>), "CMP",     iVal(0,d),     iVal(i,s),   wcz?(c,z)] #19
  def disasm_instr(<<   cnd::size(4), 0b0010001::size(7), c::size(1), z::size(1), i::size(1),           d::size(9),           s::size(9)>>), do: [disasm_c(<<cnd::size(4)>>), "CMPX",    iVal(0,d),     iVal(i,s),   wcz?(c,z)] #20
  def disasm_instr(<<   cnd::size(4), 0b0010010::size(7), c::size(1), z::size(1), i::size(1),           d::size(9),           s::size(9)>>), do: [disasm_c(<<cnd::size(4)>>), "CMPS",    iVal(0,d),     iVal(i,s),   wcz?(c,z)] #21
  def disasm_instr(<<   cnd::size(4), 0b0010011::size(7), c::size(1), z::size(1), i::size(1),           d::size(9),           s::size(9)>>), do: [disasm_c(<<cnd::size(4)>>), "CMPSX",   iVal(0,d),     iVal(i,s),   wcz?(c,z)] #22
  def disasm_instr(<<   cnd::size(4), 0b0010100::size(7), c::size(1), z::size(1), i::size(1),           d::size(9),           s::size(9)>>), do: [disasm_c(<<cnd::size(4)>>), "CMPR",    iVal(0,d),     iVal(i,s),   wcz?(c,z)] #23
  def disasm_instr(<<   cnd::size(4), 0b0010101::size(7), c::size(1), z::size(1), i::size(1),           d::size(9),           s::size(9)>>), do: [disasm_c(<<cnd::size(4)>>), "CMPM",    iVal(0,d),     iVal(i,s),   wcz?(c,z)] #24
  def disasm_instr(<<   cnd::size(4), 0b0010110::size(7), c::size(1), z::size(1), i::size(1),           d::size(9),           s::size(9)>>), do: [disasm_c(<<cnd::size(4)>>), "SUBR",    iVal(0,d),     iVal(i,s),   wcz?(c,z)] #25
  def disasm_instr(<<   cnd::size(4), 0b0010111::size(7), c::size(1), z::size(1), i::size(1),           d::size(9),           s::size(9)>>), do: [disasm_c(<<cnd::size(4)>>), "CMPSUB",  iVal(0,d),     iVal(i,s),   wcz?(c,z)] #26
  def disasm_instr(<<   cnd::size(4), 0b0011000::size(7), c::size(1), z::size(1), i::size(1),           d::size(9),           s::size(9)>>), do: [disasm_c(<<cnd::size(4)>>), "FGE",     iVal(0,d),     iVal(i,s),   wcz?(c,z)] #27
  def disasm_instr(<<   cnd::size(4), 0b0011001::size(7), c::size(1), z::size(1), i::size(1),           d::size(9),           s::size(9)>>), do: [disasm_c(<<cnd::size(4)>>), "FLE",     iVal(0,d),     iVal(i,s),   wcz?(c,z)] #28
  def disasm_instr(<<   cnd::size(4), 0b0011010::size(7), c::size(1), z::size(1), i::size(1),           d::size(9),           s::size(9)>>), do: [disasm_c(<<cnd::size(4)>>), "FGES",    iVal(0,d),     iVal(i,s),   wcz?(c,z)] #29
  def disasm_instr(<<   cnd::size(4), 0b0011011::size(7), c::size(1), z::size(1), i::size(1),           d::size(9),           s::size(9)>>), do: [disasm_c(<<cnd::size(4)>>), "FLES",    iVal(0,d),     iVal(i,s),   wcz?(c,z)] #30
  def disasm_instr(<<   cnd::size(4), 0b0011100::size(7), c::size(1), z::size(1), i::size(1),           d::size(9),           s::size(9)>>), do: [disasm_c(<<cnd::size(4)>>), "SUMC",    iVal(0,d),     iVal(i,s),   wcz?(c,z)] #31
  def disasm_instr(<<   cnd::size(4), 0b0011101::size(7), c::size(1), z::size(1), i::size(1),           d::size(9),           s::size(9)>>), do: [disasm_c(<<cnd::size(4)>>), "SUMNC",   iVal(0,d),     iVal(i,s),   wcz?(c,z)] #32
  def disasm_instr(<<   cnd::size(4), 0b0011110::size(7), c::size(1), z::size(1), i::size(1),           d::size(9),           s::size(9)>>), do: [disasm_c(<<cnd::size(4)>>), "SUMZ",    iVal(0,d),     iVal(i,s),   wcz?(c,z)] #33
  def disasm_instr(<<   cnd::size(4), 0b0011111::size(7), c::size(1), z::size(1), i::size(1),           d::size(9),           s::size(9)>>), do: [disasm_c(<<cnd::size(4)>>), "SUMNZ",   iVal(0,d),     iVal(i,s),   wcz?(c,z)] #34

  def disasm_instr(<<   cnd::size(4), 0b0000011::size(7), c::size(1), z::size(1), i::size(1),           d::size(9),           s::size(9)>>), do: [disasm_c(<<cnd::size(4)>>), "SHL",     iVal(0,d),     iVal(i,s),   wcz?(c,z)] #6
  def disasm_instr(<<   cnd::size(4), 0b0110000::size(7), c::size(1), z::size(1), i::size(1),           d::size(9),           s::size(9)>>), do: [disasm_c(<<cnd::size(4)>>), "MOV",     iVal(0,d),     iVal(i,s),   wcz?(c,z)] 
  def disasm_instr(<<   cnd::size(4), 0b1011001::size(7), 1::size(1), 1::size(1), 0::size(1), 0b111110000::size(9), 0b111110001::size(9)>>), do: [disasm_c(<<cnd::size(4)>>), "RESI3",   "",            "",          ""       ]
  def disasm_instr(<<   cnd::size(4), 0b1011001::size(7), 1::size(1), 1::size(1), 0::size(1), 0b111110010::size(9), 0b111110011::size(9)>>), do: [disasm_c(<<cnd::size(4)>>), "RESI2",   "",            "",          ""       ]
  def disasm_instr(<<   cnd::size(4), 0b1011001::size(7), 1::size(1), 1::size(1), 0::size(1), 0b111110100::size(9), 0b111110101::size(9)>>), do: [disasm_c(<<cnd::size(4)>>), "RESI1",   "",            "",          ""       ]
  def disasm_instr(<<   cnd::size(4), 0b1011001::size(7), 1::size(1), 1::size(1), 0::size(1), 0b111111110::size(9), 0b111111111::size(9)>>), do: [disasm_c(<<cnd::size(4)>>), "RESI0",   "",            "",          ""       ]
  def disasm_instr(<<   cnd::size(4), 0b1011001::size(7), 1::size(1), 1::size(1), 0::size(1), 0b111111111::size(9), 0b111110001::size(9)>>), do: [disasm_c(<<cnd::size(4)>>), "RETI3",   "",            "",          ""       ]
  def disasm_instr(<<   cnd::size(4), 0b1011001::size(7), 1::size(1), 1::size(1), 0::size(1), 0b111111111::size(9), 0b111110011::size(9)>>), do: [disasm_c(<<cnd::size(4)>>), "RETI2",   "",            "",          ""       ]
  def disasm_instr(<<   cnd::size(4), 0b1011001::size(7), 1::size(1), 1::size(1), 0::size(1), 0b111111111::size(9), 0b111110101::size(9)>>), do: [disasm_c(<<cnd::size(4)>>), "RETI1",   "",            "",          ""       ]
  def disasm_instr(<<   cnd::size(4), 0b1011001::size(7), 1::size(1), 1::size(1), 0::size(1), 0b111111111::size(9), 0b111111111::size(9)>>), do: [disasm_c(<<cnd::size(4)>>), "RETI0",   "",            "",          ""       ]
  def disasm_instr(<<   cnd::size(4), 0b1011001::size(7), c::size(1), z::size(1), i::size(1),           d::size(9),           s::size(9)>>), do: [disasm_c(<<cnd::size(4)>>), "CALLD",   iVal(0,d),     iVal(i,s),   wcz?(c,z)]
  def disasm_instr(<<   cnd::size(4), 0b1100011::size(7), 0::size(1), l::size(1), 1::size(1),           d::size(9), 0b101100001::size(9)>>), do: [disasm_c(<<cnd::size(4)>>), "PUSHA",   iVal(l,d),     "",          ""       ]
  def disasm_instr(<<   cnd::size(4), 0b1100011::size(7), 0::size(1), l::size(1), 1::size(1),           d::size(9), 0b111100001::size(9)>>), do: [disasm_c(<<cnd::size(4)>>), "PUSHB",   iVal(l,d),     "",          ""       ]
  def disasm_instr(<<   cnd::size(4), 0b1100011::size(7), 0::size(1), l::size(1), i::size(1),           d::size(9),           s::size(9)>>), do: [disasm_c(<<cnd::size(4)>>), "WRLONG",  iVal(l,d),     iVal(i,s),   ""       ]
  def disasm_instr(<<   cnd::size(4), 0b1101011::size(7), c::size(1), 0::size(1), l::size(1),           d::size(9), 0b000000001::size(9)>>), do: [disasm_c(<<cnd::size(4)>>), "COGID",   iVal(l,d),     "",          wcz?(c,0)]
  def disasm_instr(<<   cnd::size(4), 0b1101011::size(7), 0::size(1), 0::size(1), l::size(1),           d::size(9), 0b000000011::size(9)>>), do: [disasm_c(<<cnd::size(4)>>), "COGSTOP", iVal(l,d),     "",          ""       ]

  ## OpCodes in thd format 4,7,1,20
  def disasm_instr(<<   cnd::size(4), 0b1101101::size(7), r::size(1),                                   a::size(20)                     >>), do: [disasm_c(<<cnd::size(4)>>), "CALL",    relhubpc(r,a), "",          ""       ]

  ## Invalid instructions are caught here
  def disasm_instr(_), do: "disasm_instr: WTF"










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
  def iVal(flag,addr), do: "#{ref?(flag)}#{hex(addr)}"
  def fnAbsAddr(addr), do: hex(addr)




end

