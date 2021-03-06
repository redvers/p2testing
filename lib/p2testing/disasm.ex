require Logger
defmodule P2Testing.Disasm do
  def tfile do
     t = dfile("testops.bin")
     |> Enum.map(&map_wtfs/1)
     |> Enum.join("\n")
 
    File.write!("nopandjmp-disasm.dasm", t <> "\n")
  end
  def tfile(filename) do
    Logger.debug(filename)
     t = dfile(filename)
     |> Enum.map(&map_wtfs/1)
     |> Enum.join("\n")
 
    File.write!("#{filename}.dasm", t <> "\n")
  end

  def tsuite do
    File.ls!("verify/")
    |> Enum.sort
    |> Enum.reverse
    |> Enum.reject(fn(x) -> Regex.match?(~r/dasm$/, x) end)
    |> Enum.reject(fn(x) -> Regex.match?(~r/p2dump$/, x) end)
    |> Enum.reject(fn(x) -> Regex.match?(~r/spin2$/, x) end)
    |> Enum.reject(fn(x) -> Regex.match?(~r/lst$/, x) end)
    |> Enum.reject(fn(x) -> Regex.match?(~r/fpga$/, x) end)
    |> Enum.reject(fn(x) -> (x == "advanced") end)
    |> Enum.map(fn(x) -> tfile("verify/#{x}") end)
  end

  def d(<<s::size(32)>>) do
    <<c::size(4), i::size(7), cz::size(3), d::size(9), s::size(9)>> = <<s::size(32)>>
    ExPrintf.sprintf("%04b %07b %03b %09b %09b", [c,i,cz,d,s])
  end


  def map_wtfs(map = %{addr: addr, fullbin: <<fullbin::size(32)>>}) when is_map(map) do
    <<con::size(4), instr::size(7), czi::size(3), d::size(9), s::size(9)>> = <<fullbin::size(32)>>
    "#{P2Testing.DisasmCode.tohex4(addr)} #{P2Testing.DisasmCode.tohex8(fullbin)}              WTF # #{ExPrintf.sprintf("%04b %07b %03b %09b %09b", [con,instr,czi,d,s])} #{inspect(map)}"
  end
  def map_wtfs(binary) when is_binary(binary) do
    binary
  end



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
    asm = P2Testing.Disasm2.disasmInstr(&applydisassemble/1, addr, <<long::size(32)>>) |> IO.inspect
    dissassemble({rest, addr + 4}, [asm | acc])
  end
  def dissassemble({<<discard>>, addr}, acc) do
    Logger.debug("Discarding: #{inspect(discard)}")
    dissassemble({<<>>, addr + 4}, [ "DISCARDED: #{inspect(discard)}" | acc])
  end

  def applydisassemble(map=%{instr: "<empty>"}), do: apply(P2Testing.DisasmCode, :empty, [map])  # Reserved Word
  def applydisassemble(map=%{instr: "AND"}), do: apply(P2Testing.DisasmCode, :aand, [map])  # Reserved Word
  def applydisassemble(map=%{instr: "OR"}),  do: apply(P2Testing.DisasmCode, :oor, [map])   # Reserved Word
  def applydisassemble(map=%{instr: instr}) do
    funcname = instr
    |> String.downcase
    |> String.to_atom
    apply(P2Testing.DisasmCode, funcname, [map])
  end



# def disasm(<<conditional::size(4), instr::size(7), czi::size(3), a::size(9), b::size(9)>>, addr) do
#   {"#{:io_lib.format('~4.2.0b', [conditional])} " <>
#      "#{:io_lib.format('~7.2.0b', [instr])} " <>
#      "#{:io_lib.format('~3.2.0b', [czi])} " <>
#      "#{:io_lib.format('~9.2.0b', [a])} " <> "#{:io_lib.format('~9.2.0b', [b])}",
#     disasm_c(<<conditional::size(4)>>),
#    disasm_instr(addr, <<conditional::size(4), instr::size(7), czi::size(3), a::size(9), b::size(9)>>)}
# end






end



# 
#   def fline({addr, hex, {bitmap, [condition, opcode, "", "", ""]}}) do
#     ExPrintf.sprintf("%4s %8s %-12s %-7s ", [addr, hex, String.downcase(condition), String.downcase(opcode)])
#   end
#   def fline({addr, hex, {bitmap, [condition, opcode, arg1, "", ""]}}) do
#     ExPrintf.sprintf("%4s %8s %-12s %-7s %s", [addr, hex, String.downcase(condition), String.downcase(opcode), arg1])
#   end
#   def fline({addr, hex, {bitmap, [condition, opcode, arg1, arg2, ""]}}) do
#     ExPrintf.sprintf("%4s %8s %-12s %-7s %s, %s", [addr, hex, String.downcase(condition), String.downcase(opcode), arg1, arg2])
#   end
#   def fline({addr, hex, {bitmap, [condition, opcode, arg1, arg2, wcond]}}) do
#     ExPrintf.sprintf("%4s %8s %-12s %-7s %s, %s %s", [addr, hex, String.downcase(condition), String.downcase(opcode), arg1, arg2, String.downcase(wcond)])
#   end
#   def fline(a) do
#     "#{inspect(a)}"
#   end
# 
# 
# 
#   def disasm_c(<<0b0000::size(4)>>), do: "_RET_"
#   def disasm_c(<<0b0001::size(4)>>), do: "IF_NZ_AND_NC"
#   def disasm_c(<<0b0010::size(4)>>), do: "IF_Z_AND_NC"
#   def disasm_c(<<0b0011::size(4)>>), do: "IF_NC"
#   def disasm_c(<<0b0100::size(4)>>), do: "IF_NZ_AND_C"
#   def disasm_c(<<0b0101::size(4)>>), do: "IF_NZ"
#   def disasm_c(<<0b0110::size(4)>>), do: "IF_Z_NE_C"
#   def disasm_c(<<0b0111::size(4)>>), do: "IF_NZ_OR_NC"
#   def disasm_c(<<0b1000::size(4)>>), do: "IF_Z_AND_C"
#   def disasm_c(<<0b1001::size(4)>>), do: "IF_Z_EQ_C"
#   def disasm_c(<<0b1010::size(4)>>), do: "IF_Z"
#   def disasm_c(<<0b1011::size(4)>>), do: "IF_NZ_OR_C"
#   def disasm_c(<<0b1100::size(4)>>), do: "IF_C"
#   def disasm_c(<<0b1101::size(4)>>), do: "IF_Z_OR_NC"
#   def disasm_c(<<0b1110::size(4)>>), do: "IF_Z_OR_C"
#   def disasm_c(<<0b1111::size(4)>>), do: ""
# 
#   def ref?(0), do: ""
#   def ref?(1), do: "#"
#   def wcz?(0,0), do: ""
#   def wcz?(0,1), do: "WZ"
#   def wcz?(1,0), do: "WC"
#   def wcz?(1,1), do: "WCZ"
# 
#   def andcz?(0,0),  do: ""
#   def andcz?(0,1),  do: "ANDZ"
#   def andcz?(1,0),  do: "ANDC"
#   def andcz?(1,1),  do: "ANDCZERRR"
# 
#   def orcz?(0,0),  do: ""
#   def orcz?(0,1),  do: "ORZ"
#   def orcz?(1,0),  do: "ORC"
#   def orcz?(1,1),  do: "ORCZERRR"
# 
#   def xorcz?(0,0), do: ""
#   def xorcz?(0,1), do: "XORZ"
#   def xorcz?(1,0), do: "XORC"
#   def xorcz?(1,1), do: "XORERRR"
# 
#   #  def relhubpc(r,a),  do: "##{callr?(r)}#{hubpc(a)}"
#   def hubpc(a),  do: hex(div(a, 4) + 1)	## CHECK the theory behind div 4 plus 1
#   def fnAbsAddr(addr), do: hex(addr)
# 
# 
# 
# 
# end
# 
#   ## OpCodes in the format 4,7,1,1,1,9,9
#   #-                   0000                    0000000           0           0           0             000000000             000000000                                                NOP
#   def disasm_instr(_addr, <<0b0000::size(4), 0b0000000::size(7), 0::size(1), 0::size(1), 0::size(1), 0b000000000::size(9), 0b000000000::size(9)>>), do: ["",                         "NOP",     "",            "",          ""       ] #2
#   #-                   EEEE                    0000000           C           Z           I             DDDDDDDDD             SSSSSSSSS                                                ROR     D,{#}S   {WC/WZ/WCZ}
#   def disasm_instr(_addr, <<   cnd::size(4), 0b0000000::size(7), c::size(1), z::size(1), i::size(1),           d::size(9),           s::size(9)>>), do: [disasm_c(<<cnd::size(4)>>), "ROR",     iVal(0,d),     iVal(i,s),   wcz?(c,z)] #3
#   #-                   EEEE                    0000001           C           Z           I             DDDDDDDDD             SSSSSSSSS                                                ROL     D,{#}S   {WC/WZ/WCZ}
#   def disasm_instr(_addr, <<   cnd::size(4), 0b0000001::size(7), c::size(1), z::size(1), i::size(1),           d::size(9),           s::size(9)>>), do: [disasm_c(<<cnd::size(4)>>), "ROL",     iVal(0,d),     iVal(i,s),   wcz?(c,z)] #4
#   #-                   EEEE                    0000010           C           Z           I             DDDDDDDDD             SSSSSSSSS                                                SHR     D,{#}S   {WC/WZ/WCZ}
#   def disasm_instr(_addr, <<   cnd::size(4), 0b0000010::size(7), c::size(1), z::size(1), i::size(1),           d::size(9),           s::size(9)>>), do: [disasm_c(<<cnd::size(4)>>), "SHR",     iVal(0,d),     iVal(i,s),   wcz?(c,z)] #5
#   #-                   EEEE                    0000011           C           Z           I             DDDDDDDDD             SSSSSSSSS                                                SHL     D,{#}S   {WC/WZ/WCZ}
#   def disasm_instr(_addr, <<   cnd::size(4), 0b0000011::size(7), c::size(1), z::size(1), i::size(1),           d::size(9),           s::size(9)>>), do: [disasm_c(<<cnd::size(4)>>), "SHL",     iVal(0,d),     iVal(i,s),   wcz?(c,z)] #6
#   #-                   EEEE                    0000100           C           Z           I             DDDDDDDDD             SSSSSSSSS                                                RCR     D,{#}S   {WC/WZ/WCZ}
#   def disasm_instr(_addr, <<   cnd::size(4), 0b0000100::size(7), c::size(1), z::size(1), i::size(1),           d::size(9),           s::size(9)>>), do: [disasm_c(<<cnd::size(4)>>), "RCR",     iVal(0,d),     iVal(i,s),   wcz?(c,z)] #7
#   #-                   EEEE                    0000101           C           Z           I             DDDDDDDDD             SSSSSSSSS                                                RCL     D,{#}S   {WC/WZ/WCZ}
#   def disasm_instr(_addr, <<   cnd::size(4), 0b0000101::size(7), c::size(1), z::size(1), i::size(1),           d::size(9),           s::size(9)>>), do: [disasm_c(<<cnd::size(4)>>), "RCL",     iVal(0,d),     iVal(i,s),   wcz?(c,z)] #8
#   #-                   EEEE                    0000110           C           Z           I             DDDDDDDDD             SSSSSSSSS                                                SAR     D,{#}S   {WC/WZ/WCZ}
#   def disasm_instr(_addr, <<   cnd::size(4), 0b0000110::size(7), c::size(1), z::size(1), i::size(1),           d::size(9),           s::size(9)>>), do: [disasm_c(<<cnd::size(4)>>), "SAR",     iVal(0,d),     iVal(i,s),   wcz?(c,z)] #9
#   #-                   EEEE                    0000111           C           Z           I             DDDDDDDDD             SSSSSSSSS                                                SAL     D,{#}S   {WC/WZ/WCZ}
#   def disasm_instr(_addr, <<   cnd::size(4), 0b0000111::size(7), c::size(1), z::size(1), i::size(1),           d::size(9),           s::size(9)>>), do: [disasm_c(<<cnd::size(4)>>), "SAL",     iVal(0,d),     iVal(i,s),   wcz?(c,z)] #10
#   #-                   EEEE                    0001000           C           Z           I             DDDDDDDDD             SSSSSSSSS                                                ADD     D,{#}S   {WC/WZ/WCZ}
#   def disasm_instr(_addr, <<   cnd::size(4), 0b0001000::size(7), c::size(1), z::size(1), i::size(1),           d::size(9),           s::size(9)>>), do: [disasm_c(<<cnd::size(4)>>), "ADD",     iVal(0,d),     iVal(i,s),   wcz?(c,z)] #11
# 
# 
# 
#   #-                   EEEE                    0001001           C           Z           I             DDDDDDDDD             SSSSSSSSS                                                ADDX    D,{#}S   {WC/WZ/WCZ}
#   def disasm_instr(_addr, <<   cnd::size(4), 0b0001001::size(7), c::size(1), z::size(1), i::size(1),           d::size(9),           s::size(9)>>), do: [disasm_c(<<cnd::size(4)>>), "ADDX",    iVal(0,d),     iVal(i,s),   wcz?(c,z)] #12
#   #-                   EEEE                    0001010           C           Z           I             DDDDDDDDD             SSSSSSSSS                                                ADDS    D,{#}S   {WC/WZ/WCZ}
#   def disasm_instr(_addr, <<   cnd::size(4), 0b0001010::size(7), c::size(1), z::size(1), i::size(1),           d::size(9),           s::size(9)>>), do: [disasm_c(<<cnd::size(4)>>), "ADDS",    iVal(0,d),     iVal(i,s),   wcz?(c,z)] #13
#   #-                   EEEE                    0001011           C           Z           I             DDDDDDDDD             SSSSSSSSS                                                ADDSX   D,{#}S   {WC/WZ/WCZ}
#   def disasm_instr(_addr, <<   cnd::size(4), 0b0001011::size(7), c::size(1), z::size(1), i::size(1),           d::size(9),           s::size(9)>>), do: [disasm_c(<<cnd::size(4)>>), "ADDSX",   iVal(0,d),     iVal(i,s),   wcz?(c,z)] #14
#   #-                   EEEE                    0001100           C           Z           I             DDDDDDDDD             SSSSSSSSS                                                SUB     D,{#}S   {WC/WZ/WCZ}
#   def disasm_instr(_addr, <<   cnd::size(4), 0b0001100::size(7), c::size(1), z::size(1), i::size(1),           d::size(9),           s::size(9)>>), do: [disasm_c(<<cnd::size(4)>>), "SUB",     iVal(0,d),     iVal(i,s),   wcz?(c,z)] #15
#   #-                   EEEE                    0001101           C           Z           I             DDDDDDDDD             SSSSSSSSS                                                SUBX    D,{#}S   {WC/WZ/WCZ}
#   def disasm_instr(_addr, <<   cnd::size(4), 0b0001101::size(7), c::size(1), z::size(1), i::size(1),           d::size(9),           s::size(9)>>), do: [disasm_c(<<cnd::size(4)>>), "SUBX",    iVal(0,d),     iVal(i,s),   wcz?(c,z)] #16
#   #-                   EEEE                    0001110           C           Z           I             DDDDDDDDD             SSSSSSSSS                                                SUBS    D,{#}S   {WC/WZ/WCZ}
#   def disasm_instr(_addr, <<   cnd::size(4), 0b0001110::size(7), c::size(1), z::size(1), i::size(1),           d::size(9),           s::size(9)>>), do: [disasm_c(<<cnd::size(4)>>), "SUBS",    iVal(0,d),     iVal(i,s),   wcz?(c,z)] #17
#   #-                   EEEE                    0001111           C           Z           I             DDDDDDDDD             SSSSSSSSS                                                SUBSX   D,{#}S   {WC/WZ/WCZ}
#   def disasm_instr(_addr, <<   cnd::size(4), 0b0001111::size(7), c::size(1), z::size(1), i::size(1),           d::size(9),           s::size(9)>>), do: [disasm_c(<<cnd::size(4)>>), "SUBSX",   iVal(0,d),     iVal(i,s),   wcz?(c,z)] #18
# 
# 
# 
#   #-                   EEEE                    0010000           C           Z           I             DDDDDDDDD             SSSSSSSSS                                                CMP     D,{#}S   {WC/WZ/WCZ}
#   def disasm_instr(_addr, <<   cnd::size(4), 0b0010000::size(7), c::size(1), z::size(1), i::size(1),           d::size(9),           s::size(9)>>), do: [disasm_c(<<cnd::size(4)>>), "CMP",     iVal(0,d),     iVal(i,s),   wcz?(c,z)] #19
#   #-                   EEEE                    0010001           C           Z           I             DDDDDDDDD             SSSSSSSSS                                                CMPX    D,{#}S   {WC/WZ/WCZ}
#   def disasm_instr(_addr, <<   cnd::size(4), 0b0010001::size(7), c::size(1), z::size(1), i::size(1),           d::size(9),           s::size(9)>>), do: [disasm_c(<<cnd::size(4)>>), "CMPX",    iVal(0,d),     iVal(i,s),   wcz?(c,z)] #20
#   #-                   EEEE                    0010010           C           Z           I             DDDDDDDDD             SSSSSSSSS                                                CMPS    D,{#}S   {WC/WZ/WCZ}
#   def disasm_instr(_addr, <<   cnd::size(4), 0b0010010::size(7), c::size(1), z::size(1), i::size(1),           d::size(9),           s::size(9)>>), do: [disasm_c(<<cnd::size(4)>>), "CMPS",    iVal(0,d),     iVal(i,s),   wcz?(c,z)] #21
#   #-                   EEEE                    0010011           C           Z           I             DDDDDDDDD             SSSSSSSSS                                                CMPSX   D,{#}S   {WC/WZ/WCZ}
#   def disasm_instr(_addr, <<   cnd::size(4), 0b0010011::size(7), c::size(1), z::size(1), i::size(1),           d::size(9),           s::size(9)>>), do: [disasm_c(<<cnd::size(4)>>), "CMPSX",   iVal(0,d),     iVal(i,s),   wcz?(c,z)] #22
#   #-                   EEEE                    0010100           C           Z           I             DDDDDDDDD             SSSSSSSSS                                                CMPR    D,{#}S   {WC/WZ/WCZ}
#   def disasm_instr(_addr, <<   cnd::size(4), 0b0010100::size(7), c::size(1), z::size(1), i::size(1),           d::size(9),           s::size(9)>>), do: [disasm_c(<<cnd::size(4)>>), "CMPR",    iVal(0,d),     iVal(i,s),   wcz?(c,z)] #23
#   #-                   EEEE                    0010101           C           Z           I             DDDDDDDDD             SSSSSSSSS                                                CMPM    D,{#}S   {WC/WZ/WCZ}
#   def disasm_instr(_addr, <<   cnd::size(4), 0b0010101::size(7), c::size(1), z::size(1), i::size(1),           d::size(9),           s::size(9)>>), do: [disasm_c(<<cnd::size(4)>>), "CMPM",    iVal(0,d),     iVal(i,s),   wcz?(c,z)] #24
#   #-                   EEEE                    0010110           C           Z           I             DDDDDDDDD             SSSSSSSSS                                                SUBR    D,{#}S   {WC/WZ/WCZ}
#   def disasm_instr(_addr, <<   cnd::size(4), 0b0010110::size(7), c::size(1), z::size(1), i::size(1),           d::size(9),           s::size(9)>>), do: [disasm_c(<<cnd::size(4)>>), "SUBR",    iVal(0,d),     iVal(i,s),   wcz?(c,z)] #25
#   #-                   EEEE                    0010111           C           Z           I             DDDDDDDDD             SSSSSSSSS                                                CMPSUB  D,{#}S   {WC/WZ/WCZ}
#   def disasm_instr(_addr, <<   cnd::size(4), 0b0010111::size(7), c::size(1), z::size(1), i::size(1),           d::size(9),           s::size(9)>>), do: [disasm_c(<<cnd::size(4)>>), "CMPSUB",  iVal(0,d),     iVal(i,s),   wcz?(c,z)] #26
#   #-                   EEEE                    0011000           C           Z           I             DDDDDDDDD             SSSSSSSSS                                                FGE     D,{#}S   {WC/WZ/WCZ}
#   def disasm_instr(_addr, <<   cnd::size(4), 0b0011000::size(7), c::size(1), z::size(1), i::size(1),           d::size(9),           s::size(9)>>), do: [disasm_c(<<cnd::size(4)>>), "FGE",     iVal(0,d),     iVal(i,s),   wcz?(c,z)] #27
#   #-                   EEEE                    0011001           C           Z           I             DDDDDDDDD             SSSSSSSSS                                                FLE     D,{#}S   {WC/WZ/WCZ}
#   def disasm_instr(_addr, <<   cnd::size(4), 0b0011001::size(7), c::size(1), z::size(1), i::size(1),           d::size(9),           s::size(9)>>), do: [disasm_c(<<cnd::size(4)>>), "FLE",     iVal(0,d),     iVal(i,s),   wcz?(c,z)] #28
#   #-                   EEEE                    0011010           C           Z           I             DDDDDDDDD             SSSSSSSSS                                                FGES    D,{#}S   {WC/WZ/WCZ}
#   def disasm_instr(_addr, <<   cnd::size(4), 0b0011010::size(7), c::size(1), z::size(1), i::size(1),           d::size(9),           s::size(9)>>), do: [disasm_c(<<cnd::size(4)>>), "FGES",    iVal(0,d),     iVal(i,s),   wcz?(c,z)] #29
#   #-                   EEEE                    0011011           C           Z           I             DDDDDDDDD             SSSSSSSSS                                                FLES    D,{#}S   {WC/WZ/WCZ}
#   def disasm_instr(_addr, <<   cnd::size(4), 0b0011011::size(7), c::size(1), z::size(1), i::size(1),           d::size(9),           s::size(9)>>), do: [disasm_c(<<cnd::size(4)>>), "FLES",    iVal(0,d),     iVal(i,s),   wcz?(c,z)] #30
#   #-                   EEEE                    0011100           C           Z           I             DDDDDDDDD             SSSSSSSSS                                                SUMC    D,{#}S   {WC/WZ/WCZ}
#   def disasm_instr(_addr, <<   cnd::size(4), 0b0011100::size(7), c::size(1), z::size(1), i::size(1),           d::size(9),           s::size(9)>>), do: [disasm_c(<<cnd::size(4)>>), "SUMC",    iVal(0,d),     iVal(i,s),   wcz?(c,z)] #31
#   #-                   EEEE                    0011101           C           Z           I             DDDDDDDDD             SSSSSSSSS                                                SUMNC   D,{#}S   {WC/WZ/WCZ}
#   def disasm_instr(_addr, <<   cnd::size(4), 0b0011101::size(7), c::size(1), z::size(1), i::size(1),           d::size(9),           s::size(9)>>), do: [disasm_c(<<cnd::size(4)>>), "SUMNC",   iVal(0,d),     iVal(i,s),   wcz?(c,z)] #32
#   #-                   EEEE                    0011110           C           Z           I             DDDDDDDDD             SSSSSSSSS                                                SUMZ    D,{#}S   {WC/WZ/WCZ}
#   def disasm_instr(_addr, <<   cnd::size(4), 0b0011110::size(7), c::size(1), z::size(1), i::size(1),           d::size(9),           s::size(9)>>), do: [disasm_c(<<cnd::size(4)>>), "SUMZ",    iVal(0,d),     iVal(i,s),   wcz?(c,z)] #33
#   #-                   EEEE                    0011111           C           Z           I             DDDDDDDDD             SSSSSSSSS                                                SUMNZ   D,{#}S   {WC/WZ/WCZ}
#   def disasm_instr(_addr, <<   cnd::size(4), 0b0011111::size(7), c::size(1), z::size(1), i::size(1),           d::size(9),           s::size(9)>>), do: [disasm_c(<<cnd::size(4)>>), "SUMNZ",   iVal(0,d),     iVal(i,s),   wcz?(c,z)] #34
# 
# 
# 
#   ## If C == Z, then this block is selected.
#   #-                   EEEE                    0100000           C           Z           I             DDDDDDDDD             SSSSSSSSS                                                BITL    D,{#}S         {WCZ}
#   def disasm_instr(_addr, <<   cnd::size(4), 0b0100000::size(7), x::size(1), x::size(1), i::size(1),           d::size(9),           s::size(9)>>), do: [disasm_c(<<cnd::size(4)>>), "BITL",    iVal(0,d),     iVal(i,s),   wcz?(x,x)  ] #43
#   #-                   EEEE                    0100001           C           Z           I             DDDDDDDDD             SSSSSSSSS                                                BITH    D,{#}S         {WCZ}
#   def disasm_instr(_addr, <<   cnd::size(4), 0b0100001::size(7), x::size(1), x::size(1), i::size(1),           d::size(9),           s::size(9)>>), do: [disasm_c(<<cnd::size(4)>>), "BITH",    iVal(0,d),     iVal(i,s),   wcz?(x,x)  ] #44
#   #-                   EEEE                    0100010           C           Z           I             DDDDDDDDD             SSSSSSSSS                                                BITC    D,{#}S         {WCZ}
#   def disasm_instr(_addr, <<   cnd::size(4), 0b0100010::size(7), x::size(1), x::size(1), i::size(1),           d::size(9),           s::size(9)>>), do: [disasm_c(<<cnd::size(4)>>), "BITC",    iVal(0,d),     iVal(i,s),   wcz?(x,x)  ] #45
#   #-                   EEEE                    0100011           C           Z           I             DDDDDDDDD             SSSSSSSSS                                                BITNC   D,{#}S         {WCZ}
#   def disasm_instr(_addr, <<   cnd::size(4), 0b0100011::size(7), x::size(1), x::size(1), i::size(1),           d::size(9),           s::size(9)>>), do: [disasm_c(<<cnd::size(4)>>), "BITNC",   iVal(0,d),     iVal(i,s),   wcz?(x,x)  ] #46
#   #-                   EEEE                    0100100           C           Z           I             DDDDDDDDD             SSSSSSSSS                                                BITZ    D,{#}S         {WCZ}
#   def disasm_instr(_addr, <<   cnd::size(4), 0b0100100::size(7), x::size(1), x::size(1), i::size(1),           d::size(9),           s::size(9)>>), do: [disasm_c(<<cnd::size(4)>>), "BITZ",    iVal(0,d),     iVal(i,s),   wcz?(x,x)  ] #47
#   #-                   EEEE                    0100101           C           Z           I             DDDDDDDDD             SSSSSSSSS                                                BITNZ   D,{#}S         {WCZ}
#   def disasm_instr(_addr, <<   cnd::size(4), 0b0100101::size(7), x::size(1), x::size(1), i::size(1),           d::size(9),           s::size(9)>>), do: [disasm_c(<<cnd::size(4)>>), "BITNZ",   iVal(0,d),     iVal(i,s),   wcz?(x,x)  ] #48
#   #-                   EEEE                    0100110           C           Z           I             DDDDDDDDD             SSSSSSSSS                                                BITRND  D,{#}S         {WCZ}
#   def disasm_instr(_addr, <<   cnd::size(4), 0b0100110::size(7), x::size(1), x::size(1), i::size(1),           d::size(9),           s::size(9)>>), do: [disasm_c(<<cnd::size(4)>>), "BITRND",  iVal(0,d),     iVal(i,s),   wcz?(x,x)  ] #49
#   #-                   EEEE                    0100111           C           Z           I             DDDDDDDDD             SSSSSSSSS                                                BITNOT  D,{#}S         {WCZ}
#   def disasm_instr(_addr, <<   cnd::size(4), 0b0100111::size(7), x::size(1), x::size(1), i::size(1),           d::size(9),           s::size(9)>>), do: [disasm_c(<<cnd::size(4)>>), "BITNOT",  iVal(0,d),     iVal(i,s),   wcz?(x,x)  ] #50
# 
#   ## If C != Z, then this block is selected
#   #-                   EEEE                    0100000           C           Z           I             DDDDDDDDD             SSSSSSSSS                                                TESTB   D,{#}S         WC/WZ
#   def disasm_instr(_addr, <<   cnd::size(4), 0b0100000::size(7), c::size(1), z::size(1), i::size(1),           d::size(9),           s::size(9)>>), do: [disasm_c(<<cnd::size(4)>>), "TESTB",   iVal(0,d),     iVal(i,s),   wcz?(c,z)  ] #35
#   #-                   EEEE                    0100001           C           Z           I             DDDDDDDDD             SSSSSSSSS                                                TESTBN  D,{#}S         WC/WZ
#   def disasm_instr(_addr, <<   cnd::size(4), 0b0100001::size(7), c::size(1), z::size(1), i::size(1),           d::size(9),           s::size(9)>>), do: [disasm_c(<<cnd::size(4)>>), "TESTBN",  iVal(0,d),     iVal(i,s),   wcz?(c,z)  ] #36
#   #-                   EEEE                    0100010           C           Z           I             DDDDDDDDD             SSSSSSSSS                                                TESTB   D,{#}S     ANDC/ANDZ
#   def disasm_instr(_addr, <<   cnd::size(4), 0b0100010::size(7), c::size(1), z::size(1), i::size(1),           d::size(9),           s::size(9)>>), do: [disasm_c(<<cnd::size(4)>>), "TESTB",   iVal(0,d),     iVal(i,s),   andcz?(c,z)] #37
#   #-                   EEEE                    0100011           C           Z           I             DDDDDDDDD             SSSSSSSSS                                                TESTBN  D,{#}S     ANDC/ANDZ
#   def disasm_instr(_addr, <<   cnd::size(4), 0b0100011::size(7), c::size(1), z::size(1), i::size(1),           d::size(9),           s::size(9)>>), do: [disasm_c(<<cnd::size(4)>>), "TESTBN",  iVal(0,d),     iVal(i,s),   andcz?(c,z)] #38
#   #-                   EEEE                    0100100           C           Z           I             DDDDDDDDD             SSSSSSSSS                                                TESTB   D,{#}S       ORC/ORZ
#   def disasm_instr(_addr, <<   cnd::size(4), 0b0100100::size(7), c::size(1), z::size(1), i::size(1),           d::size(9),           s::size(9)>>), do: [disasm_c(<<cnd::size(4)>>), "TESTB",   iVal(0,d),     iVal(i,s),   orcz?(c,z) ] #39
#   #-                   EEEE                    0100101           C           Z           I             DDDDDDDDD             SSSSSSSSS                                                TESTBN  D,{#}S       ORC/ORZ
#   def disasm_instr(_addr, <<   cnd::size(4), 0b0100101::size(7), c::size(1), z::size(1), i::size(1),           d::size(9),           s::size(9)>>), do: [disasm_c(<<cnd::size(4)>>), "TESTBN",  iVal(0,d),     iVal(i,s),   orcz?(c,z) ] #40
#   #-                   EEEE                    0100110           C           Z           I             DDDDDDDDD             SSSSSSSSS                                                TESTB   D,{#}S     XORC/XORZ
#   def disasm_instr(_addr, <<   cnd::size(4), 0b0100110::size(7), c::size(1), z::size(1), i::size(1),           d::size(9),           s::size(9)>>), do: [disasm_c(<<cnd::size(4)>>), "TESTB",   iVal(0,d),     iVal(i,s),   xorcz?(c,z)] #41
#   #-                   EEEE                    0100111           C           Z           I             DDDDDDDDD             SSSSSSSSS                                                TESTBN  D,{#}S     XORC/XORZ
#   def disasm_instr(_addr, <<   cnd::size(4), 0b0100111::size(7), c::size(1), z::size(1), i::size(1),           d::size(9),           s::size(9)>>), do: [disasm_c(<<cnd::size(4)>>), "TESTBN",  iVal(0,d),     iVal(i,s),   xorcz?(c,z)] #42
# 
# 
# 
#   #-                   EEEE                    0101000           C           Z           I             DDDDDDDDD             SSSSSSSSS                                                AND     D,{#}S   {WC/WZ/WCZ}
#   def disasm_instr(_addr, <<   cnd::size(4), 0b0101000::size(7), c::size(1), z::size(1), i::size(1),           d::size(9),           s::size(9)>>), do: [disasm_c(<<cnd::size(4)>>), "AND",     iVal(0,d),     iVal(i,s),   wcz?(c,z)  ] #51
#   #-                   EEEE                    0101001           C           Z           I             DDDDDDDDD             SSSSSSSSS                                                ANDN    D,{#}S   {WC/WZ/WCZ}
#   def disasm_instr(_addr, <<   cnd::size(4), 0b0101001::size(7), c::size(1), z::size(1), i::size(1),           d::size(9),           s::size(9)>>), do: [disasm_c(<<cnd::size(4)>>), "ANDN",    iVal(0,d),     iVal(i,s),   wcz?(c,z)  ] #52
#   #-                   EEEE                    0101010           C           Z           I             DDDDDDDDD             SSSSSSSSS                                                OR      D,{#}S   {WC/WZ/WCZ}
#   def disasm_instr(_addr, <<   cnd::size(4), 0b0101010::size(7), c::size(1), z::size(1), i::size(1),           d::size(9),           s::size(9)>>), do: [disasm_c(<<cnd::size(4)>>), "OR",      iVal(0,d),     iVal(i,s),   wcz?(c,z)  ] #53
#   #-                   EEEE                    0101011           C           Z           I             DDDDDDDDD             SSSSSSSSS                                                XOR     D,{#}S   {WC/WZ/WCZ}
#   def disasm_instr(_addr, <<   cnd::size(4), 0b0101011::size(7), c::size(1), z::size(1), i::size(1),           d::size(9),           s::size(9)>>), do: [disasm_c(<<cnd::size(4)>>), "XOR",     iVal(0,d),     iVal(i,s),   wcz?(c,z)  ] #54
#   #-                   EEEE                    0101100           C           Z           I             DDDDDDDDD             SSSSSSSSS                                                MUXC    D,{#}S   {WC/WZ/WCZ}
#   def disasm_instr(_addr, <<   cnd::size(4), 0b0101100::size(7), c::size(1), z::size(1), i::size(1),           d::size(9),           s::size(9)>>), do: [disasm_c(<<cnd::size(4)>>), "MUXC",    iVal(0,d),     iVal(i,s),   wcz?(c,z)  ] #55
#   #-                   EEEE                    0101101           C           Z           I             DDDDDDDDD             SSSSSSSSS                                                MUXNC   D,{#}S   {WC/WZ/WCZ}
#   def disasm_instr(_addr, <<   cnd::size(4), 0b0101101::size(7), c::size(1), z::size(1), i::size(1),           d::size(9),           s::size(9)>>), do: [disasm_c(<<cnd::size(4)>>), "MUXNC",   iVal(0,d),     iVal(i,s),   wcz?(c,z)  ] #56
#   #-                   EEEE                    0101110           C           Z           I             DDDDDDDDD             SSSSSSSSS                                                MUXZ    D,{#}S   {WC/WZ/WCZ}
#   def disasm_instr(_addr, <<   cnd::size(4), 0b0101110::size(7), c::size(1), z::size(1), i::size(1),           d::size(9),           s::size(9)>>), do: [disasm_c(<<cnd::size(4)>>), "MUXZ",    iVal(0,d),     iVal(i,s),   wcz?(c,z)  ] #57
#   #-                   EEEE                    0101111           C           Z           I             DDDDDDDDD             SSSSSSSSS                                                MUXNZ   D,{#}S   {WC/WZ/WCZ}
#   def disasm_instr(_addr, <<   cnd::size(4), 0b0101111::size(7), c::size(1), z::size(1), i::size(1),           d::size(9),           s::size(9)>>), do: [disasm_c(<<cnd::size(4)>>), "MUXNZ",   iVal(0,d),     iVal(i,s),   wcz?(c,z)  ] #58
# 
# 
# 
#   #-                   EEEE                    0110000           C           Z           I             DDDDDDDDD             SSSSSSSSS                                                MOV     D,{#}S   {WC/WZ/WCZ}
#   def disasm_instr(_addr, <<   cnd::size(4), 0b0110000::size(7), c::size(1), z::size(1), i::size(1),           d::size(9),           s::size(9)>>), do: [disasm_c(<<cnd::size(4)>>), "MOV",     iVal(0,d),     iVal(i,s),   wcz?(c,z)] 
# 
# 
# 
#   ## Block includes I = 0 clauses
#   #-                   EEEE                    0110001           C           Z           0             DDDDDDDDD             DDDDDDDDD                                                NOT     D        {WC/WZ/WCZ}
# # def disasm_instr(_addr, <<   cnd::size(4), 0b0110001::size(7), c::size(1), z::size(1), 0::size(1),           d::size(9),           s::size(9)                     >>), do: [disasm_c(<<cnd::size(4)>>), "NOT",     iVal(0,d),          "",   wcz?(c,z)] 
#   #-                   EEEE                    0110001           C           Z           I             DDDDDDDDD             SSSSSSSSS                                                NOT     D,{#}S   {WC/WZ/WCZ}
#   def disasm_instr(_addr, <<   cnd::size(4), 0b0110001::size(7), c::size(1), z::size(1), i::size(1),           d::size(9),           s::size(9)>>), do: [disasm_c(<<cnd::size(4)>>), "NOT",     iVal(0,d),     iVal(i,s),   wcz?(c,z)] 
# 
#   #-                   EEEE                    0110010           C           Z           0             DDDDDDDDD             DDDDDDDDD                                                ABS     D        {WC/WZ/WCZ}
#   def disasm_instr(_addr, <<   cnd::size(4), 0b0110010::size(7), c::size(1), z::size(1), 0::size(1),           d::size(9),           s::size(9)>>), do: [disasm_c(<<cnd::size(4)>>), "ABS",     iVal(0,d),     iVal(0,d),   wcz?(c,z)] 
#   #-                   EEEE                    0110010           C           Z           I             DDDDDDDDD             SSSSSSSSS                                                ABS     D,{#}S   {WC/WZ/WCZ}
#   def disasm_instr(_addr, <<   cnd::size(4), 0b0110010::size(7), c::size(1), z::size(1), i::size(1),           d::size(9),           s::size(9)>>), do: [disasm_c(<<cnd::size(4)>>), "ABS",     iVal(0,d),     iVal(i,s),   wcz?(c,z)] 
# 
#   #-                   EEEE                    0110011           C           Z           0             DDDDDDDDD             DDDDDDDDD                                                NEG     D        {WC/WZ/WCZ}
# # def disasm_instr(_addr, <<   cnd::size(4), 0b0110011::size(7), c::size(1), z::size(1), 0::size(1),           d::size(9),           s::size(9)                     >>), do: [disasm_c(<<cnd::size(4)>>), "NEG",     iVal(0,d),          "",   wcz?(c,z)] 
#   #-                   EEEE                    0110011           C           Z           I             DDDDDDDDD             SSSSSSSSS                                                NEG     D,{#}S   {WC/WZ/WCZ}
#   def disasm_instr(_addr, <<   cnd::size(4), 0b0110011::size(7), c::size(1), z::size(1), i::size(1),           d::size(9),           s::size(9)>>), do: [disasm_c(<<cnd::size(4)>>), "NEG",     iVal(0,d),     iVal(i,s),   wcz?(c,z)] 
# 
#   #-                   EEEE                    0110100           C           Z           0             DDDDDDDDD             DDDDDDDDD                                                NEGC    D        {WC/WZ/WCZ}
# # def disasm_instr(_addr, <<   cnd::size(4), 0b0110100::size(7), c::size(1), z::size(1), 0::size(1),           d::size(9),           s::size(9)                     >>), do: [disasm_c(<<cnd::size(4)>>), "NEGC",     iVal(0,d),         "",   wcz?(c,z)] 
#   #-                   EEEE                    0110100           C           Z           I             DDDDDDDDD             SSSSSSSSS                                                NEGC    D,{#}S   {WC/WZ/WCZ}
#   def disasm_instr(_addr, <<   cnd::size(4), 0b0110100::size(7), c::size(1), z::size(1), i::size(1),           d::size(9),           s::size(9)>>), do: [disasm_c(<<cnd::size(4)>>), "NEGC",     iVal(0,d),     iVal(i,s),   wcz?(c,z)] 
# 
#   #-                   EEEE                    0110101           C           Z           0             DDDDDDDDD             DDDDDDDDD                                                NEGNC   D        {WC/WZ/WCZ}
# # def disasm_instr(_addr, <<   cnd::size(4), 0b0110101::size(7), c::size(1), z::size(1), 0::size(1),           d::size(9),           s::size(9)                     >>), do: [disasm_c(<<cnd::size(4)>>), "NEGNC",     iVal(0,d),        "",   wcz?(c,z)] 
#   #-                   EEEE                    0110101           C           Z           I             DDDDDDDDD             SSSSSSSSS                                                NEGNC   D,{#}S   {WC/WZ/WCZ}
#   def disasm_instr(_addr, <<   cnd::size(4), 0b0110101::size(7), c::size(1), z::size(1), i::size(1),           d::size(9),           s::size(9)>>), do: [disasm_c(<<cnd::size(4)>>), "NEGNC",     iVal(0,d),     iVal(i,s),   wcz?(c,z)] 
# 
#   #-                   EEEE                    0110110           C           Z           0             DDDDDDDDD             DDDDDDDDD                                                NEGZ    D        {WC/WZ/WCZ}
# # def disasm_instr(_addr, <<   cnd::size(4), 0b0110110::size(7), c::size(1), z::size(1), 0::size(1),           d::size(9),           s::size(9)                     >>), do: [disasm_c(<<cnd::size(4)>>), "NEGZ",     iVal(0,d),         "",   wcz?(c,z)] 
#   #-                   EEEE                    0110110           C           Z           I             DDDDDDDDD             SSSSSSSSS                                                NEGZ    D,{#}S   {WC/WZ/WCZ}
#   def disasm_instr(_addr, <<   cnd::size(4), 0b0110110::size(7), c::size(1), z::size(1), i::size(1),           d::size(9),           s::size(9)>>), do: [disasm_c(<<cnd::size(4)>>), "NEGZ",     iVal(0,d),     iVal(i,s),   wcz?(c,z)] 
# 
#   #-                   EEEE                    0110111           C           Z           0             DDDDDDDDD             DDDDDDDDD                                                NEGNZ   D        {WC/WZ/WCZ}
# # def disasm_instr(_addr, <<   cnd::size(4), 0b0110111::size(7), c::size(1), z::size(1), 0::size(1),           d::size(9),           s::size(9)                     >>), do: [disasm_c(<<cnd::size(4)>>), "NEGNZ",     iVal(0,d),        "",   wcz?(c,z)] 
#   #-                   EEEE                    0110111           C           Z           I             DDDDDDDDD             SSSSSSSSS                                                NEGNZ   D,{#}S   {WC/WZ/WCZ}
#   def disasm_instr(_addr, <<   cnd::size(4), 0b0110111::size(7), c::size(1), z::size(1), i::size(1),           d::size(9),           s::size(9)>>), do: [disasm_c(<<cnd::size(4)>>), "NEGNZ",     iVal(0,d),     iVal(i,s),   wcz?(c,z)] 
# 
#   #-                   EEEE                    0111000           C           Z           I             DDDDDDDDD             SSSSSSSSS                                                INCMOD  D,{#}S   {WC/WZ/WCZ}
#   def disasm_instr(_addr, <<   cnd::size(4), 0b0111000::size(7), c::size(1), z::size(1), i::size(1),           d::size(9),           s::size(9)>>), do: [disasm_c(<<cnd::size(4)>>), "INCMOD",     iVal(0,d),     iVal(i,s),   wcz?(c,z)] 
#   #-                   EEEE                    0111001           C           Z           I             DDDDDDDDD             SSSSSSSSS                                                DECMOD  D,{#}S   {WC/WZ/WCZ}
#   def disasm_instr(_addr, <<   cnd::size(4), 0b0111001::size(7), c::size(1), z::size(1), i::size(1),           d::size(9),           s::size(9)>>), do: [disasm_c(<<cnd::size(4)>>), "DECMOD",     iVal(0,d),     iVal(i,s),   wcz?(c,z)] 
#   #-                   EEEE                    0111010           C           Z           I             DDDDDDDDD             SSSSSSSSS                                                ZEROX   D,{#}S   {WC/WZ/WCZ}
#   def disasm_instr(_addr, <<   cnd::size(4), 0b0111010::size(7), c::size(1), z::size(1), i::size(1),           d::size(9),           s::size(9)>>), do: [disasm_c(<<cnd::size(4)>>), "ZEROX",     iVal(0,d),     iVal(i,s),   wcz?(c,z)] 
#   #-                   EEEE                    0111011           C           Z           I             DDDDDDDDD             SSSSSSSSS                                                SIGNX   D,{#}S   {WC/WZ/WCZ}
#   def disasm_instr(_addr, <<   cnd::size(4), 0b0111011::size(7), c::size(1), z::size(1), i::size(1),           d::size(9),           s::size(9)>>), do: [disasm_c(<<cnd::size(4)>>), "SIGNX",     iVal(0,d),     iVal(i,s),   wcz?(c,z)] 
# 
#   #-                   EEEE                    0111100           C           Z           0             DDDDDDDDD             DDDDDDDDD                                                ENCOD   D        {WC/WZ/WCZ}
# # def disasm_instr(_addr, <<   cnd::size(4), 0b0111100::size(7), c::size(1), z::size(1), 0::size(1),           d::size(9),           s::size(9)                     >>), do: [disasm_c(<<cnd::size(4)>>), "ENCOD",     iVal(0,d),        "",   wcz?(c,z)] 
#   #-                   EEEE                    0111100           C           Z           I             DDDDDDDDD             SSSSSSSSS                                                ENCOD   D,{#}S   {WC/WZ/WCZ}
#   def disasm_instr(_addr, <<   cnd::size(4), 0b0111100::size(7), c::size(1), z::size(1), i::size(1),           d::size(9),           s::size(9)>>), do: [disasm_c(<<cnd::size(4)>>), "ENCOD",     iVal(0,d),     iVal(i,s),   wcz?(c,z)] 
# 
#   #-                   EEEE                    0111101           C           Z           0             DDDDDDDDD             DDDDDDDDD                                                ONES    D        {WC/WZ/WCZ}
# # def disasm_instr(_addr, <<   cnd::size(4), 0b0111101::size(7), c::size(1), z::size(1), 0::size(1),           d::size(9),           s::size(9)                     >>), do: [disasm_c(<<cnd::size(4)>>), "ONES",     iVal(0,d),         "",   wcz?(c,z)] 
#   #-                   EEEE                    0111101           C           Z           I             DDDDDDDDD             SSSSSSSSS                                                ONES    D,{#}S   {WC/WZ/WCZ}
#   def disasm_instr(_addr, <<   cnd::size(4), 0b0111101::size(7), c::size(1), z::size(1), i::size(1),           d::size(9),           s::size(9)>>), do: [disasm_c(<<cnd::size(4)>>), "ONES",     iVal(0,d),     iVal(i,s),   wcz?(c,z)] 
# 
#   #-                   EEEE                    0111110           C           Z           0             DDDDDDDDD             DDDDDDDDD                                                TEST    D        {WC/WZ/WCZ}
# # def disasm_instr(_addr, <<   cnd::size(4), 0b0111110::size(7), c::size(1), z::size(1), 0::size(1),           d::size(9),           s::size(9)                     >>), do: [disasm_c(<<cnd::size(4)>>), "TEST",     iVal(0,d),         "",   wcz?(c,z)] 
#   #-                   EEEE                    0111110           C           Z           I             DDDDDDDDD             SSSSSSSSS                                                TEST    D,{#}S   {WC/WZ/WCZ}
#   def disasm_instr(_addr, <<   cnd::size(4), 0b0111110::size(7), c::size(1), z::size(1), i::size(1),           d::size(9),           s::size(9)>>), do: [disasm_c(<<cnd::size(4)>>), "TEST",     iVal(0,d),     iVal(i,s),   wcz?(c,z)] 
# 
#   #-                   EEEE                    0111111           C           Z           I             DDDDDDDDD             SSSSSSSSS                                                TESTN   D,{#}S   {WC/WZ/WCZ}
#   def disasm_instr(_addr, <<   cnd::size(4), 0b0111111::size(7), c::size(1), z::size(1), i::size(1),           d::size(9),           s::size(9)>>), do: [disasm_c(<<cnd::size(4)>>), "TESTN",     iVal(0,d),     iVal(i,s),   wcz?(c,z)] 
# 
# 
# 
# 
#   ## CALLD instructions - Note that Hard-Coded addresses have their own OPCODES
#   #-                   EEEE                    1011001           1           1           0             111110000             111110001                                                RESI3
#   def disasm_instr(_addr, <<   cnd::size(4), 0b1011001::size(7), 1::size(1), 1::size(1), 0::size(1), 0b111110000::size(9), 0b111110001::size(9)>>), do: [disasm_c(<<cnd::size(4)>>), "RESI3",   "",            "",          ""       ]
#   #-                   EEEE                    1011001           1           1           0             111110010             111110011                                                RESI2
#   def disasm_instr(_addr, <<   cnd::size(4), 0b1011001::size(7), 1::size(1), 1::size(1), 0::size(1), 0b111110010::size(9), 0b111110011::size(9)>>), do: [disasm_c(<<cnd::size(4)>>), "RESI2",   "",            "",          ""       ]
#   #-                   EEEE                    1011001           1           1           0             111110100             111110101                                                RESI1
#   def disasm_instr(_addr, <<   cnd::size(4), 0b1011001::size(7), 1::size(1), 1::size(1), 0::size(1), 0b111110100::size(9), 0b111110101::size(9)>>), do: [disasm_c(<<cnd::size(4)>>), "RESI1",   "",            "",          ""       ]
#   #-                   EEEE                    1011001           1           1           0             111111110             111111111                                                RESI0
#   def disasm_instr(_addr, <<   cnd::size(4), 0b1011001::size(7), 1::size(1), 1::size(1), 0::size(1), 0b111111110::size(9), 0b111111111::size(9)>>), do: [disasm_c(<<cnd::size(4)>>), "RESI0",   "",            "",          ""       ]
#   #-                   EEEE                    1011001           1           1           0             111111111             111110001                                                RETI3
#   def disasm_instr(_addr, <<   cnd::size(4), 0b1011001::size(7), 1::size(1), 1::size(1), 0::size(1), 0b111111111::size(9), 0b111110001::size(9)>>), do: [disasm_c(<<cnd::size(4)>>), "RETI3",   "",            "",          ""       ]
#   #-                   EEEE                    1011001           1           1           0             111111111             111110011                                                RETI2
#   def disasm_instr(_addr, <<   cnd::size(4), 0b1011001::size(7), 1::size(1), 1::size(1), 0::size(1), 0b111111111::size(9), 0b111110011::size(9)>>), do: [disasm_c(<<cnd::size(4)>>), "RETI2",   "",            "",          ""       ]
#   #-                   EEEE                    1011001           1           1           0             111111111             111110101                                                RETI1
#   def disasm_instr(_addr, <<   cnd::size(4), 0b1011001::size(7), 1::size(1), 1::size(1), 0::size(1), 0b111111111::size(9), 0b111110101::size(9)>>), do: [disasm_c(<<cnd::size(4)>>), "RETI1",   "",            "",          ""       ]
#   #-                   EEEE                    1011001           1           1           0             111111111             111111111                                                RETI0
#   def disasm_instr(_addr, <<   cnd::size(4), 0b1011001::size(7), 1::size(1), 1::size(1), 0::size(1), 0b111111111::size(9), 0b111111111::size(9)>>), do: [disasm_c(<<cnd::size(4)>>), "RETI0",   "",            "",          ""       ]
#   #-                   EEEE                    1011001           C           Z           I             DDDDDDDDD             SSSSSSSSS                                                CALLD   D,{#}S   {WC/WZ/WCZ}
#   def disasm_instr( addr, <<   cnd::size(4), 0b1011001::size(7), c::size(1), z::size(1), i::size(1),           d::size(9),           s::size(9)>>), do: [disasm_c(<<cnd::size(4)>>), "CALLD",   iVal(0,d),            il(addr,i,to_signed(<<s::size(9)>>)), ""]
# 
#   def to_signed(<<s::signed-size(9)>>), do: s
#   def to_signed20(<<s::signed-size(20)>>), do: s
# 
#   def il(addrr, flag,addr) when addrr < 0x400, do: "#{ref?(flag)}#{hex(addr)}"
#   def il(addrr, flag,addr), do: "#{ref?(flag)}#{callr?(flag, (addr*4)+4)}#{iVl(0,(addr*4)+4)}"
#   def il20(addrr, flag,addr) when addrr < 0x400, do: "#{ref?(flag)}#{hex(addr)}"
#   def il20(addrr, flag,addr), do: "#{ref?(flag)}#{callr?(flag, (addr*4)+4)}#{iVl(0,(addr)+4)}"
#   
# 
#   #-                   EEEE                    11100WW           R           A           A             AAAAAAAAA             AAAAAAAAA                                                CALLD   PA/PB/PTRA/PTRB,#A
#   def disasm_instr( addr, <<   cnd::size(4), 0b1110000::size(7), r::size(1), a::size(20)>>), do: [disasm_c(<<cnd::size(4)>>), "CALLD",   "$1f6", il20(addr,r,to_signed20(<<a::size(20)>>)),            ""]
#   def disasm_instr( addr, <<   cnd::size(4), 0b1110001::size(7), r::size(1), a::size(20)>>), do: [disasm_c(<<cnd::size(4)>>), "CALLG",   "x", jmpa(addr,r,a),            ""]
#   def disasm_instr( addr, <<   cnd::size(4), 0b1110011::size(7), 0::size(1), a::size(20)>>), do: [disasm_c(<<cnd::size(4)>>), "CALLD",   "$1f9", calla(addr,0,a),            ""]
#   def disasm_instr( addr, <<   cnd::size(4), 0b1110011::size(7), 1::size(1), a::size(20)>>), do: [disasm_c(<<cnd::size(4)>>), "CALLD",   "$1f9", calld(addr,1,a),            ""]
# 
#   def calld(addr,r,a) when abs(addr) < 0x400,  do: "##{callr?(r,a)}#{iVl(0,(div(a,4))+1)}"
#   def calld(addr,r,a),                    do: "##{callr?(r,a)}#{iVl(0,a+4)}"
# 
# 
# 
# 
# 
#   #-                   EEEE                    100000N           N           N           I             DDDDDDDDD             SSSSSSSSS                                                SETNIB  D,{#}S,#N
#   #def disasm_instr(_addr, <<   cnd::size(4), 0b101100::size(7),  n::size(3),             i::size(1),           d::size(9),           s::size(9)>>), do: [disasm_c(<<cnd::size(4)>>), "SETNIB",  iVal(0,d),     iVal(i,s),   wcz?(c,z)]
#   #-                   EEEE                    1000000           0           0           I             000000000             SSSSSSSSS                                                SETNIB  {#}S
#   #-                   EEEE                    100001N           N           N           I             DDDDDDDDD             SSSSSSSSS                                                GETNIB  D,{#}S,#N
#   #-                   EEEE                    1000010           0           0           0             DDDDDDDDD             000000000                                                GETNIB  D
#   #-                   EEEE                    100010N           N           N           I             DDDDDDDDD             SSSSSSSSS                                                ROLNIB  D,{#}S,#N
#   #-                   EEEE                    1000100           0           0           0             DDDDDDDDD             000000000                                                ROLNIB  D
#   #-                   EEEE                    1000110           N           N           I             DDDDDDDDD             SSSSSSSSS                                                SETBYTE D,{#}S,#N
#   #-                   EEEE                    1000110           0           0           I             000000000             SSSSSSSSS                                                SETBYTE {#}S
#   #-                   EEEE                    1000111           N           N           I             DDDDDDDDD             SSSSSSSSS                                                GETBYTE D,{#}S,#N
#   #-                   EEEE                    1000111           0           0           0             DDDDDDDDD             000000000                                                GETBYTE D
#   #-                   EEEE                    1001000           N           N           I             DDDDDDDDD             SSSSSSSSS                                                ROLBYTE D,{#}S,#N
#   #-                   EEEE                    1001000           0           0           0             DDDDDDDDD             000000000                                                ROLBYTE D
#   #-                   EEEE                    1001001           0           N           I             DDDDDDDDD             SSSSSSSSS                                                SETWORD D,{#}S,#N
#   #-                   EEEE                    1001001           0           0           I             000000000             SSSSSSSSS                                                SETWORD {#}S
#   #-                   EEEE                    1001001           1           N           I             DDDDDDDDD             SSSSSSSSS                                                GETWORD D,{#}S,#N
#   #-                   EEEE                    1001001           1           0           0             DDDDDDDDD             000000000                                                GETWORD D
#   #-                   EEEE                    1001010           0           N           I             DDDDDDDDD             SSSSSSSSS                                                ROLWORD D,{#}S,#N
#   #-                   EEEE                    1001010           0           0           0             DDDDDDDDD             000000000                                                ROLWORD D
#   #-                   EEEE                    1001010           1           0           I             DDDDDDDDD             SSSSSSSSS                                                ALTSN   D,{#}S
#   #-                   EEEE                    1001010           1           0           1             DDDDDDDDD             000000000                                                ALTSN   D
#   #-                   EEEE                    1001010           1           1           I             DDDDDDDDD             SSSSSSSSS                                                ALTGN   D,{#}S
#   #-                   EEEE                    1001010           1           1           1             DDDDDDDDD             000000000                                                ALTGN   D
#   #-                   EEEE                    1001011           0           0           I             DDDDDDDDD             SSSSSSSSS                                                ALTSB   D,{#}S
#   #-                   EEEE                    1001011           0           0           1             DDDDDDDDD             000000000                                                ALTSB   D
#   #-                   EEEE                    1001011           0           1           I             DDDDDDDDD             SSSSSSSSS                                                ALTGB   D,{#}S
#   #-                   EEEE                    1001011           0           1           1             DDDDDDDDD             000000000                                                ALTGB   D
#   #-                   EEEE                    1001011           1           0           I             DDDDDDDDD             SSSSSSSSS                                                ALTSW   D,{#}S
#   #-                   EEEE                    1001011           1           0           1             DDDDDDDDD             000000000                                                ALTSW   D
#   #-                   EEEE                    1001011           1           1           I             DDDDDDDDD             SSSSSSSSS                                                ALTGW   D,{#}S
#   #-                   EEEE                    1001011           1           1           1             DDDDDDDDD             000000000                                                ALTGW   D
#   #-                   EEEE                    1001100           0           0           I             DDDDDDDDD             SSSSSSSSS                                                ALTR    D,{#}S
#   #-                   EEEE                    1001100           0           0           1             DDDDDDDDD             000000000                                                ALTR    D
#   #-                   EEEE                    1001100           0           1           I             DDDDDDDDD             SSSSSSSSS                                                ALTD    D,{#}S
#   #-                   EEEE                    1001100           0           1           1             DDDDDDDDD             000000000                                                ALTD    D
#   #-                   EEEE                    1001100           1           0           I             DDDDDDDDD             SSSSSSSSS                                                ALTS    D,{#}S
#   #-                   EEEE                    1001100           1           0           1             DDDDDDDDD             000000000                                                ALTS    D
#   #-                   EEEE                    1001100           1           1           I             DDDDDDDDD             SSSSSSSSS                                                ALTB    D,{#}S
#   #-                   EEEE                    1001100           1           1           1             DDDDDDDDD             000000000                                                ALTB    D
#   #-                   EEEE                    1001101           0           0           I             DDDDDDDDD             SSSSSSSSS                                                ALTI    D,{#}S
#   #-                   EEEE                    1001101           0           0           1             DDDDDDDDD             101100100                                                ALTI    D
#   #-                   EEEE                    1001101           0           1           I             DDDDDDDDD             SSSSSSSSS                                                SETR    D,{#}S
#   #-                   EEEE                    1001101           1           0           I             DDDDDDDDD             SSSSSSSSS                                                SETD    D,{#}S
#   #-                   EEEE                    1001101           1           1           I             DDDDDDDDD             SSSSSSSSS                                                SETS    D,{#}S
#   #-                   EEEE                    1001110           0           0           I             DDDDDDDDD             SSSSSSSSS                                                DECOD   D,{#}S
#   #-                   EEEE                    1001110           0           0           0             DDDDDDDDD             DDDDDDDDD                                                DECOD   D
#   #-                   EEEE                    1001110           0           1           I             DDDDDDDDD             SSSSSSSSS                                                BMASK   D,{#}S
#   #-                   EEEE                    1001110           0           1           0             DDDDDDDDD             DDDDDDDDD                                                BMASK   D
#   #-                   EEEE                    1001110           1           0           I             DDDDDDDDD             SSSSSSSSS                                                CRCBIT  D,{#}S
#   #-                   EEEE                    1001110           1           1           I             DDDDDDDDD             SSSSSSSSS                                                CRCNIB  D,{#}S
#   #-                   EEEE                    1001111           0           0           I             DDDDDDDDD             SSSSSSSSS                                                MUXNITS D,{#}S
#   #-                   EEEE                    1001111           0           1           I             DDDDDDDDD             SSSSSSSSS                                                MUXNIBS D,{#}S
#   #-                   EEEE                    1001111           1           0           I             DDDDDDDDD             SSSSSSSSS                                                MUXQ    D,{#}S
#   #-                   EEEE                    1001111           1           1           I             DDDDDDDDD             SSSSSSSSS                                                MOVBYTS D,{#}S
#   #-                   EEEE                    1010000           0           Z           I             DDDDDDDDD             SSSSSSSSS                                                MUL     D,{#}S          {WZ}
#   #-                   EEEE                    1010000           1           Z           I             DDDDDDDDD             SSSSSSSSS                                                MULS    D,{#}S          {WZ}
#   #-                   EEEE                    1010001           0           Z           I             DDDDDDDDD             SSSSSSSSS                                                SCA     D,{#}S          {WZ}
#   #-                   EEEE                    1010001           1           Z           I             DDDDDDDDD             SSSSSSSSS                                                SCAS    D,{#}S          {WZ}
#   #-                   EEEE                    1010010           0           0           I             DDDDDDDDD             SSSSSSSSS                                                ADDPIX  D,{#}S
#   #-                   EEEE                    1010010           0           1           I             DDDDDDDDD             SSSSSSSSS                                                MULPIX  D,{#}S
#   #-                   EEEE                    1010010           1           0           I             DDDDDDDDD             SSSSSSSSS                                                BLNPIX  D,{#}S
#   #-                   EEEE                    1010010           1           1           I             DDDDDDDDD             SSSSSSSSS                                                MIXPIX  D,{#}S
#   #-                   EEEE                    1010011           0           0           I             DDDDDDDDD             SSSSSSSSS                                                ADDCT1  D,{#}S
#   #-                   EEEE                    1010011           0           1           I             DDDDDDDDD             SSSSSSSSS                                                ADDCT2  D,{#}S
#   #-                   EEEE                    1010011           1           0           I             DDDDDDDDD             SSSSSSSSS                                                ADDCT3  D,{#}S
#   #-                   EEEE                    1010011           1           1           I             DDDDDDDDD             SSSSSSSSS                                                WMLONG  D,{#}S/P
#   #-                   EEEE                    1010100           C           0           I             DDDDDDDDD             SSSSSSSSS                                                RQPIN   D,{#}S          {WC}
#   #-                   EEEE                    1010100           C           1           I             DDDDDDDDD             SSSSSSSSS                                                RDPIN   D,{#}S          {WC}
#   #-                   EEEE                    1010101           C           Z           I             DDDDDDDDD             SSSSSSSSS                                                RDLUT   D,{#}S   {WC/WZ/WCZ}
#   #-                   EEEE                    1010110           C           Z           I             DDDDDDDDD             SSSSSSSSS                                                RDBYTE  D,{#}S/P {WC/WZ/WCZ}
#   def disasm_instr(_addr, <<   cnd::size(4), 0b1010110::size(7), c::size(1), z::size(1), i::size(1),           d::size(9),           s::size(9)>>), do: [disasm_c(<<cnd::size(4)>>), "RDBYTE",     iVal(0,d),     iVal(i,s),   wcz?(c,z)] #4
#   #
#   #-                   EEEE                    1010111           C           Z           I             DDDDDDDDD             SSSSSSSSS                                                RDWORD  D,{#}S/P {WC/WZ/WCZ}
#   #-                   EEEE                    1011000           C           Z           I             DDDDDDDDD             SSSSSSSSS                                                RDLONG  D,{#}S/P {WC/WZ/WCZ}
#   ### Do I enable these?
#   #  def disasm_instr(_addr, <<   cnd::size(4), 0b1011000::size(7), c::size(1), z::size(1), 1::size(1),           d::size(9),           s::size(9)>>) when s > 0xff, do: [disasm_c(<<cnd::size(4)>>), "LONG",     iVal(0,d),   "#{s}",   wcz?(c,z)] #4
#   def disasm_instr(_addr, <<   cnd::size(4), 0b1011000::size(7), c::size(1), z::size(1), 0::size(1),           d::size(9),           s::size(9)>>), do: [disasm_c(<<cnd::size(4)>>), "RDLONG",     iVal(0,d),     iVal(0,s),   wcz?(c,z)] #4
#   def disasm_instr(addr, <<   cnd::size(4), 0b1011000::size(7), c::size(1), z::size(1), 1::size(1),           d::size(9),           s::size(9)>>), do: [disasm_c(<<cnd::size(4)>>), "RDLONG",     iVal(0,d),    "ptra[#{to_signed5(<<s::size(5)>>)}]", wcz?(c,z)]
#   def illl(addrr, flag,addr) when addrr < 0x400, do: "#{ref?(flag)}#{hex(addr)}"
#   def illl(addrr, flag,addr), do: "#{ref?(flag)}#{callr?(flag, (addr*4)+4)}#{iVl(0,(addr))}"
#   def to_signed5(<<s::signed-size(5)>>), do: s
#   #-                   EEEE                    1011000           C           Z           1             DDDDDDDDD             101011111                                                POPA    D        {WC/WZ/WCZ}
#   #-                   EEEE                    1011000           C           Z           1             DDDDDDDDD             111011111                                                POPB    D        {WC/WZ/WCZ}
#   #-                   EEEE                    1011010           0           L           I             DDDDDDDDD             SSSSSSSSS                                                CALLPA  {#}D,{#}S
#   #-                   EEEE                    1011010           1           L           I             DDDDDDDDD             SSSSSSSSS                                                CALLPB  {#}D,{#}S
#   #-                   EEEE                    1011011           0           0           I             DDDDDDDDD             SSSSSSSSS                                                DJZ     D,{#}S
#   #-                   EEEE                    1011011           0           1           I             DDDDDDDDD             SSSSSSSSS                                                DJNZ    D,{#}S
#   def disasm_instr( addr, <<   cnd::size(4), 0b1011011::size(7), c::size(1), 1::size(1), i::size(1),           d::size(9),           s::size(9)>>), do: [disasm_c(<<cnd::size(4)>>), "DJNZ",     iVal(0,d),     djnz(addr,i,to_signed(<<s::size(9)>>)+1),   ""] #4
#   def djnz(addrr, flag,addr) when addrr < 0x400, do: "#{ref?(flag)}$#{hex(addr)}"
#   def djnz(addrr, flag,addr), do: "#{ref?(flag)}#{callr?(flag, (addr*4)+4)}#{iVl(0,(addr*4))}"
# 
#   #-                   EEEE                    1011011           1           0           I             DDDDDDDDD             SSSSSSSSS                                                DJF     D,{#}S
#   #-                   EEEE                    1011011           1           1           I             DDDDDDDDD             SSSSSSSSS                                                DJNF    D,{#}S
#   #-                   EEEE                    1011100           0           0           I             DDDDDDDDD             SSSSSSSSS                                                IJZ     D,{#}S
#   #-                   EEEE                    1011100           0           1           I             DDDDDDDDD             SSSSSSSSS                                                IJNZ    D,{#}S
#   #-                   EEEE                    1011100           1           0           I             DDDDDDDDD             SSSSSSSSS                                                TJZ     D,{#}S
#   #-                   EEEE                    1011100           1           1           I             DDDDDDDDD             SSSSSSSSS                                                TJNZ    D,{#}S
#   #-                   EEEE                    1011101           0           0           I             DDDDDDDDD             SSSSSSSSS                                                TJF     D,{#}S
#   #-                   EEEE                    1011101           0           1           I             DDDDDDDDD             SSSSSSSSS                                                TJNF    D,{#}S
#   #-                   EEEE                    1011101           1           0           I             DDDDDDDDD             SSSSSSSSS                                                TJS     D,{#}S
#   #-                   EEEE                    1011101           1           1           I             DDDDDDDDD             SSSSSSSSS                                                TJNS    D,{#}S
#   #-                   EEEE                    1011110           0           0           I             DDDDDDDDD             SSSSSSSSS                                                TJV     D,{#}S
#   #-                   EEEE                    1011110           0           1           I             000000000             SSSSSSSSS                                                JINT    {#}S
#   #-                   EEEE                    1011110           0           1           I             000000001             SSSSSSSSS                                                JCT1    {#}S
#   #-                   EEEE                    1011110           0           1           I             000000010             SSSSSSSSS                                                JCT2    {#}S
#   #-                   EEEE                    1011110           0           1           I             000000011             SSSSSSSSS                                                JCT3    {#}S
#   #-                   EEEE                    1011110           0           1           I             000000100             SSSSSSSSS                                                JSE1    {#}S
#   #-                   EEEE                    1011110           0           1           I             000000101             SSSSSSSSS                                                JSE2    {#}S
#   #-                   EEEE                    1011110           0           1           I             000000110             SSSSSSSSS                                                JSE3    {#}S
#   #-                   EEEE                    1011110           0           1           I             000000111             SSSSSSSSS                                                JSE4    {#}S
#   #-                   EEEE                    1011110           0           1           I             000001000             SSSSSSSSS                                                JPAT    {#}S
#   #-                   EEEE                    1011110           0           1           I             000001001             SSSSSSSSS                                                JFBW    {#}S
#   #-                   EEEE                    1011110           0           1           I             000001010             SSSSSSSSS                                                JXMT    {#}S
#   #-                   EEEE                    1011110           0           1           I             000001011             SSSSSSSSS                                                JXFI    {#}S
#   #-                   EEEE                    1011110           0           1           I             000001100             SSSSSSSSS                                                JXRO    {#}S
#   #-                   EEEE                    1011110           0           1           I             000001101             SSSSSSSSS                                                JXRL    {#}S
#   #-                   EEEE                    1011110           0           1           I             000001110             SSSSSSSSS                                                JATN    {#}S
#   #-                   EEEE                    1011110           0           1           I             000001111             SSSSSSSSS                                                JQMT    {#}S
#   #-                   EEEE                    1011110           0           1           I             000010000             SSSSSSSSS                                                JNINT   {#}S
#   #-                   EEEE                    1011110           0           1           I             000010001             SSSSSSSSS                                                JNCT1   {#}S
#   #-                   EEEE                    1011110           0           1           I             000010010             SSSSSSSSS                                                JNCT2   {#}S
#   #-                   EEEE                    1011110           0           1           I             000010011             SSSSSSSSS                                                JNCT3   {#}S
#   #-                   EEEE                    1011110           0           1           I             000010100             SSSSSSSSS                                                JNSE1   {#}S
#   #-                   EEEE                    1011110           0           1           I             000010101             SSSSSSSSS                                                JNSE2   {#}S
#   #-                   EEEE                    1011110           0           1           I             000010110             SSSSSSSSS                                                JNSE3   {#}S
#   #-                   EEEE                    1011110           0           1           I             000010111             SSSSSSSSS                                                JNSE4   {#}S
#   #-                   EEEE                    1011110           0           1           I             000011000             SSSSSSSSS                                                JNPAT   {#}S
#   #-                   EEEE                    1011110           0           1           I             000011001             SSSSSSSSS                                                JNFBW   {#}S
#   #-                   EEEE                    1011110           0           1           I             000011010             SSSSSSSSS                                                JNXMT   {#}S
#   #-                   EEEE                    1011110           0           1           I             000011011             SSSSSSSSS                                                JNXFI   {#}S
#   #-                   EEEE                    1011110           0           1           I             000011100             SSSSSSSSS                                                JNXRO   {#}S
#   #-                   EEEE                    1011110           0           1           I             000011101             SSSSSSSSS                                                JNXRL   {#}S
#   #-                   EEEE                    1011110           0           1           I             000011110             SSSSSSSSS                                                JNATN   {#}S
#   #-                   EEEE                    1011110           0           1           I             000011111             SSSSSSSSS                                                JNQMT   {#}S
#   #-                   EEEE                    1011110           1           L           I             DDDDDDDDD             SSSSSSSSS                                                <empty> {#}D,{#}S
#   #-                   EEEE                    1011111           0           L           I             DDDDDDDDD             SSSSSSSSS                                                <empty> {#}D,{#}S
#   #-                   EEEE                    1011111           1           L           I             DDDDDDDDD             SSSSSSSSS                                                SETPAT  {#}D,{#}S
#   #-                   EEEE                    1100000           0           L           I             DDDDDDDDD             SSSSSSSSS                                                WRPIN   {#}D,{#}S
#   #-                   EEEE                    1100000           0           1           I             000000001             SSSSSSSSS                                                AKPIN   {#}S
#   #-                   EEEE                    1100000           1           L           I             DDDDDDDDD             SSSSSSSSS                                                WXPIN   {#}D,{#}S
#   #-                   EEEE                    1100001           0           L           I             DDDDDDDDD             SSSSSSSSS                                                WYPIN   {#}D,{#}S
#   #-                   EEEE                    1100001           1           L           I             DDDDDDDDD             SSSSSSSSS                                                WRLUT   {#}D,{#}S
#   #-                   EEEE                    1100010           0           L           I             DDDDDDDDD             SSSSSSSSS                                                WRBYTE  {#}D,{#}S/P
#   #-                   EEEE                    1100010           1           L           I             DDDDDDDDD             SSSSSSSSS                                                WRWORD  {#}D,{#}S/P
#   #-                   EEEE                    1100011           0           L           I             DDDDDDDDD             SSSSSSSSS                                                WRLONG  {#}D,{#}S/P
#   def disasm_instr(_addr, <<   cnd::size(4), 0b1100011::size(7), 0::size(1), l::size(1), i::size(1),           d::size(9),           s::size(9)>>), do: [disasm_c(<<cnd::size(4)>>), "WRLONG",  iVal(l,d),     iVal(i,s),   ""       ]
#   #-                   EEEE                    1100011           0           L           1             DDDDDDDDD             101100001                                                PUSHA   {#}D
#   def disasm_instr(_addr, <<   cnd::size(4), 0b1100011::size(7), 0::size(1), l::size(1), 1::size(1),           d::size(9), 0b101100001::size(9)>>), do: [disasm_c(<<cnd::size(4)>>), "PUSHA",   iVal(l,d),     "",          ""       ]
#   #-                   EEEE                    1100011           0           L           1             DDDDDDDDD             111100001                                                PUSHB   {#}D
#   def disasm_instr(_addr, <<   cnd::size(4), 0b1100011::size(7), 0::size(1), l::size(1), 1::size(1),           d::size(9), 0b111100001::size(9)>>), do: [disasm_c(<<cnd::size(4)>>), "PUSHB",   iVal(l,d),     "",          ""       ]
#   #-                   EEEE                    1100011           1           L           I             DDDDDDDDD             SSSSSSSSS                                                RDFAST  {#}D,{#}S
#   #-                   EEEE                    1100100           0           L           I             DDDDDDDDD             SSSSSSSSS                                                WRFAST  {#}D,{#}S
#   #-                   EEEE                    1100100           1           L           I             DDDDDDDDD             SSSSSSSSS                                                FBLOCK  {#}D,{#}S
#   #-                   EEEE                    1100101           0           L           I             DDDDDDDDD             SSSSSSSSS                                                XINIT   {#}D,{#}S
#   #-                   EEEE                    1100101           0           1           1             000000000             000000000                                                XSTOP
#   #-                   EEEE                    1100101           1           L           I             DDDDDDDDD             SSSSSSSSS                                                XZERO   {#}D,{#}S
#   #-                   EEEE                    1100110           0           L           I             DDDDDDDDD             SSSSSSSSS                                                XCONT   {#}D,{#}S
#   #-                   EEEE                    1100110           1           L           I             DDDDDDDDD             SSSSSSSSS                                                REP     {#}D,{#}S
#   #-                   EEEE                    1100111           C           L           I             DDDDDDDDD             SSSSSSSSS                                                COGINIT {#}D,{#}S       {WC}
#   def disasm_instr( addr, <<   cnd::size(4), 0b1100111::size(7), c::size(1), l::size(1), i::size(1),           d::size(9),           s::size(9)>>), do: [disasm_c(<<cnd::size(4)>>), "COGINIT",     qfrac(addr,0,d),     qfrac(addr,i,s),   ""] 
#   #-                   EEEE                    1101000           0           L           I             DDDDDDDDD             SSSSSSSSS                                                QMUL    {#}D,{#}S
#   #-                   EEEE                    1101000           1           L           I             DDDDDDDDD             SSSSSSSSS                                                QDIV    {#}D,{#}S
#   #-                   EEEE                    1101001           0           L           I             DDDDDDDDD             SSSSSSSSS                                                QFRAC   {#}D,{#}S
#   def disasm_instr( addr, <<   cnd::size(4), 0b1101001::size(7), 0::size(1), l::size(1), i::size(1),           d::size(9),           s::size(9)>>), do: [disasm_c(<<cnd::size(4)>>), "QFRAC",     qfrac(addr,0,d),     qfrac(addr,i,s),   ""] 
#   def qfrac(addr,r,a) when addr < 0x400,  do: "##{callr?(r,a)}#{iVl(0,(div(a,4))+1)}"
#   def qfrac(addr,r,a),                    do: "#{callr?(r,a)}#{iVl(0,a)}"
# 
#   #-                   EEEE                    1101001           1           L           I             DDDDDDDDD             SSSSSSSSS                                                QSQRT   {#}D,{#}S
#   #-                   EEEE                    1101010           0           L           I             DDDDDDDDD             SSSSSSSSS                                                QROTATE {#}D,{#}S
#   #-                   EEEE                    1101010           1           L           I             DDDDDDDDD             SSSSSSSSS                                                QVECTOR {#}D,{#}S
#   #-                   EEEE                    1101011           0           0           L             DDDDDDDDD             000000000                                                HUBSET  {#}D
#   #-                   EEEE                    1101011           C           0           L             DDDDDDDDD             000000001                                                COGID   {#}D            {WC}
#   def disasm_instr(_addr, <<   cnd::size(4), 0b1101011::size(7), c::size(1), 0::size(1), l::size(1),           d::size(9), 0b000000001::size(9)>>), do: [disasm_c(<<cnd::size(4)>>), "COGID",   iVal(l,d),     "",          wcz?(c,0)]
#   #-                   EEEE                    1101011           0           0           L             DDDDDDDDD             000000011                                                COGSTOP {#}D
#   def disasm_instr(_addr, <<   cnd::size(4), 0b1101011::size(7), 0::size(1), 0::size(1), l::size(1),           d::size(9), 0b000000011::size(9)>>), do: [disasm_c(<<cnd::size(4)>>), "COGSTOP", iVal(l,d),     "",          ""       ]
#   #-                   EEEE                    1101011           C           0           0             DDDDDDDDD             000000100                                                LOCKNEW D               {WC}
#   #-                   EEEE                    1101011           0           0           L             DDDDDDDDD             000000101                                                LOCKRET {#}D
#   #-                   EEEE                    1101011           C           0           L             DDDDDDDDD             000000110                                                LOCKTRY {#}D            {WC}
#   #-                   EEEE                    1101011           C           0           L             DDDDDDDDD             000000111                                                LOCKREL {#}D            {WC}
#   #-                   EEEE                    1101011           0           0           L             DDDDDDDDD             000001110                                                QLOG    {#}D
#   #-                   EEEE                    1101011           0           0           L             DDDDDDDDD             000001111                                                QEXP    {#}D
#   #-                   EEEE                    1101011           C           Z           0             DDDDDDDDD             000010000                                                RFBYTE  D        {WC/WZ/WCZ}
#   #-                   EEEE                    1101011           C           Z           0             DDDDDDDDD             000010001                                                RFWORD  D        {WC/WZ/WCZ}
#   #-                   EEEE                    1101011           C           Z           0             DDDDDDDDD             000010010                                                RFLONG  D        {WC/WZ/WCZ}
#   #-                   EEEE                    1101011           C           Z           0             DDDDDDDDD             000010011                                                RFVAR   D        {WC/WZ/WCZ}
#   #-                   EEEE                    1101011           C           Z           0             DDDDDDDDD             000010100                                                RFVARS  D        {WC/WZ/WCZ}
#   #-                   EEEE                    1101011           0           0           L             DDDDDDDDD             000010101                                                WFBYTE  {#}D
#   #-                   EEEE                    1101011           0           0           L             DDDDDDDDD             000010110                                                WFWORD  {#}D
#   #-                   EEEE                    1101011           0           0           L             DDDDDDDDD             000010111                                                WFLONG  {#}D
#   #-                   EEEE                    1101011           C           Z           0             DDDDDDDDD             000011000                                                GETQX   D        {WC/WZ/WCZ}
#   #-                   EEEE                    1101011           C           Z           0             DDDDDDDDD             000011001                                                GETQY   D        {WC/WZ/WCZ}
#   #-                   EEEE                    1101011           0           0           0             DDDDDDDDD             000011010                                                GETCT   D
#   #-                   EEEE                    1101011           C           Z           0             DDDDDDDDD             000011011                                                GETRND  D        {WC/WZ/WCZ}
#   #-                   EEEE                    1101011           C           Z           1             000000000             000011011                                                GETRND            WC/WZ/WCZ
#   #-                   EEEE                    1101011           0           0           L             DDDDDDDDD             000011100                                                SETDACS {#}D
#   #-                   EEEE                    1101011           0           0           L             DDDDDDDDD             000011101                                                SETXFRQ {#}D
#   #-                   EEEE                    1101011           0           0           0             DDDDDDDDD             000011110                                                GETXACC D
#   #-                   EEEE                    1101011           0           0           L             DDDDDDDDD             000011111                                                WAITX   {#}D     {WC/WZ/WCZ}
#   #-                   EEEE                    1101011           0           0           L             DDDDDDDDD             000100000                                                SETSE1  {#}D
#   #-                   EEEE                    1101011           0           0           L             DDDDDDDDD             000100001                                                SETSE2  {#}D
#   #-                   EEEE                    1101011           0           0           L             DDDDDDDDD             000100010                                                SETSE3  {#}D
#   #-                   EEEE                    1101011           0           0           L             DDDDDDDDD             000100011                                                SETSE4  {#}D
#   #-                   EEEE                    1101011           C           Z           0             000000000             000100100                                                POLLINT          {WC/WZ/WCZ}
#   #-                   EEEE                    1101011           C           Z           0             000000001             000100100                                                POLLCT1          {WC/WZ/WCZ}
#   #-                   EEEE                    1101011           C           Z           0             000000010             000100100                                                POLLCT2          {WC/WZ/WCZ}
#   #-                   EEEE                    1101011           C           Z           0             000000011             000100100                                                POLLCT3          {WC/WZ/WCZ}
#   #-                   EEEE                    1101011           C           Z           0             000000100             000100100                                                POLLSE1          {WC/WZ/WCZ}
#   #-                   EEEE                    1101011           C           Z           0             000000101             000100100                                                POLLSE2          {WC/WZ/WCZ}
#   #-                   EEEE                    1101011           C           Z           0             000000110             000100100                                                POLLSE3          {WC/WZ/WCZ}
#   #-                   EEEE                    1101011           C           Z           0             000000111             000100100                                                POLLSE4          {WC/WZ/WCZ}
#   #-                   EEEE                    1101011           C           Z           0             000001000             000100100                                                POLLPAT          {WC/WZ/WCZ}
#   #-                   EEEE                    1101011           C           Z           0             000001001             000100100                                                POLLFBW          {WC/WZ/WCZ}
#   #-                   EEEE                    1101011           C           Z           0             000001010             000100100                                                POLLXMT          {WC/WZ/WCZ}
#   #-                   EEEE                    1101011           C           Z           0             000001011             000100100                                                POLLXFI          {WC/WZ/WCZ}
#   #-                   EEEE                    1101011           C           Z           0             000001100             000100100                                                POLLXRO          {WC/WZ/WCZ}
#   #-                   EEEE                    1101011           C           Z           0             000001101             000100100                                                POLLXRL          {WC/WZ/WCZ}
#   #-                   EEEE                    1101011           C           Z           0             000001110             000100100                                                POLLATN          {WC/WZ/WCZ}
#   #-                   EEEE                    1101011           C           Z           0             000001111             000100100                                                POLLQMT          {WC/WZ/WCZ}
#   #-                   EEEE                    1101011           C           Z           0             000010000             000100100                                                WAITINT          {WC/WZ/WCZ}
#   #-                   EEEE                    1101011           C           Z           0             000010001             000100100                                                WAITCT1          {WC/WZ/WCZ}
#   #-                   EEEE                    1101011           C           Z           0             000010010             000100100                                                WAITCT2          {WC/WZ/WCZ}
#   #-                   EEEE                    1101011           C           Z           0             000010011             000100100                                                WAITCT3          {WC/WZ/WCZ}
#   #-                   EEEE                    1101011           C           Z           0             000010100             000100100                                                WAITSE1          {WC/WZ/WCZ}
#   #-                   EEEE                    1101011           C           Z           0             000010101             000100100                                                WAITSE2          {WC/WZ/WCZ}
#   #-                   EEEE                    1101011           C           Z           0             000010110             000100100                                                WAITSE3          {WC/WZ/WCZ}
#   #-                   EEEE                    1101011           C           Z           0             000010111             000100100                                                WAITSE4          {WC/WZ/WCZ}
#   #-                   EEEE                    1101011           C           Z           0             000011000             000100100                                                WAITPAT          {WC/WZ/WCZ}
#   #-                   EEEE                    1101011           C           Z           0             000011001             000100100                                                WAITFBW          {WC/WZ/WCZ}
#   #-                   EEEE                    1101011           C           Z           0             000011010             000100100                                                WAITXMT          {WC/WZ/WCZ}
#   #-                   EEEE                    1101011           C           Z           0             000011011             000100100                                                WAITXFI          {WC/WZ/WCZ}
#   #-                   EEEE                    1101011           C           Z           0             000011100             000100100                                                WAITXRO          {WC/WZ/WCZ}
#   #-                   EEEE                    1101011           C           Z           0             000011101             000100100                                                WAITXRL          {WC/WZ/WCZ}
#   #-                   EEEE                    1101011           C           Z           0             000011110             000100100                                                WAITATN          {WC/WZ/WCZ}
#   #-                   EEEE                    1101011           0           0           0             000100000             000100100                                                ALLOWI
#   #-                   EEEE                    1101011           0           0           0             000100001             000100100                                                STALLI
#   #-                   EEEE                    1101011           0           0           0             000100010             000100100                                                TRGINT1
#   #-                   EEEE                    1101011           0           0           0             000100011             000100100                                                TRGINT2
#   #-                   EEEE                    1101011           0           0           0             000100100             000100100                                                TRGINT3
#   #-                   EEEE                    1101011           0           0           0             000100101             000100100                                                NIXINT1
#   #-                   EEEE                    1101011           0           0           0             000100110             000100100                                                NIXINT2
#   #-                   EEEE                    1101011           0           0           0             000100111             000100100                                                NIXINT3
#   #-                   EEEE                    1101011           0           0           L             DDDDDDDDD             000100101                                                SETINT1 {#}D
#   #-                   EEEE                    1101011           0           0           L             DDDDDDDDD             000100110                                                SETINT2 {#}D
#   #-                   EEEE                    1101011           0           0           L             DDDDDDDDD             000100111                                                SETINT3 {#}D
#   #-                   EEEE                    1101011           0           0           L             DDDDDDDDD             000101000                                                SETQ    {#}D
#   #-                   EEEE                    1101011           0           0           L             DDDDDDDDD             000101001                                                SETQ2   {#}D
#   #-                   EEEE                    1101011           0           0           L             DDDDDDDDD             000101010                                                PUSH    {#}D
#   #-                   EEEE                    1101011           C           Z           0             DDDDDDDDD             000101011                                                POP     D        {WC/WZ/WCZ}
#   #-                   EEEE                    1101011           C           Z           0             DDDDDDDDD             000101101                                                CALL    D        {WC/WZ/WCZ}
#   #-                   EEEE                    1101011           C           Z           1             000000000             000101101                                                RET              {WC/WZ/WCZ}
#   def disasm_instr(_addr, <<   cnd::size(4), 0b1101011::size(7), c::size(1), z::size(1), 1::size(1), 0b000000000::size(9), 0b000101101::size(9)>>), do: [disasm_c(<<cnd::size(4)>>), "ret",     "",     "",   wcz?(c,z)] 
#   #-                   EEEE                    1101011           C           Z           0             DDDDDDDDD             000101110                                                CALLA   D        {WC/WZ/WCZ}
#   #-                   EEEE                    1101011           C           Z           1             000000000             000101110                                                RETA             {WC/WZ/WCZ}
#   #-                   EEEE                    1101011           C           Z           0             DDDDDDDDD             000101111                                                CALLB   D        {WC/WZ/WCZ}
#   #-                   EEEE                    1101011           C           Z           1             000000000             000101111                                                RETB             {WC/WZ/WCZ}
#   #-                   EEEE                    1101011           0           0           L             DDDDDDDDD             000110000                                                JMPREL  {#}D
#   #-                   EEEE                    1101011           0           0           L             DDDDDDDDD             000110001                                                SKIP    {#}D
#   #-                   EEEE                    1101011           0           0           L             DDDDDDDDD             000110010                                                SKIPF   {#}D
#   #-                   EEEE                    1101011           0           0           L             DDDDDDDDD             000110011                                                EXECF   {#}D
#   #-                   EEEE                    1101011           0           0           0             DDDDDDDDD             000110100                                                GETPTR  D
#   #-                   EEEE                    1101011           C           Z           0             DDDDDDDDD             000110101                                                GETBRK  D          WC/WZ/WCZ
#   #-                   EEEE                    1101011           0           0           L             DDDDDDDDD             000110101                                                COGBRK  {#}D
#   #-                   EEEE                    1101011           0           0           L             DDDDDDDDD             000110110                                                BRK     {#}D
#   #-                   EEEE                    1101011           0           0           L             DDDDDDDDD             000110111                                                SETLUTS {#}D
# ##EEEE        1101011 001 000000000 000110111	LUTSOFF
# ##EEEE        1101011 001 000000001 000110111	LUTSON
#   #-                   EEEE                    1101011           0           0           L             DDDDDDDDD             000111000                                                SETCY   {#}D
#   #-                   EEEE                    1101011           0           0           L             DDDDDDDDD             000111001                                                SETCI   {#}D
#   #-                   EEEE                    1101011           0           0           L             DDDDDDDDD             000111010                                                SETCQ   {#}D
#   #-                   EEEE                    1101011           0           0           L             DDDDDDDDD             000111011                                                SETCFRQ {#}D
#   #-                   EEEE                    1101011           0           0           L             DDDDDDDDD             000111100                                                SETCMOD {#}D
#   #-                   EEEE                    1101011           0           0           L             DDDDDDDDD             000111101                                                SETPIV  {#}D
#   #-                   EEEE                    1101011           0           0           L             DDDDDDDDD             000111110                                                SETPIX  {#}D
#   #-                   EEEE                    1101011           0           0           L             DDDDDDDDD             000111111                                                COGATN  {#}D
#   #-                   EEEE                    1101011           C           Z           L             DDDDDDDDD             001000000                                                TESTP   {#}D           WC/WZ
#   #-                   EEEE                    1101011           C           Z           L             DDDDDDDDD             001000001                                                TESTPN  {#}D           WC/WZ
#   #-                   EEEE                    1101011           C           Z           L             DDDDDDDDD             001000010                                                TESTP   {#}D       ANDC/ANDZ
#   #-                   EEEE                    1101011           C           Z           L             DDDDDDDDD             001000011                                                TESTPN  {#}D       ANDC/ANDZ
#   #-                   EEEE                    1101011           C           Z           L             DDDDDDDDD             001000100                                                TESTP   {#}D         ORC/ORZ
#   #-                   EEEE                    1101011           C           Z           L             DDDDDDDDD             001000101                                                TESTPN  {#}D         ORC/ORZ
#   #-                   EEEE                    1101011           C           Z           L             DDDDDDDDD             001000110                                                TESTP   {#}D       XORC/XORZ
#   #-                   EEEE                    1101011           C           Z           L             DDDDDDDDD             001000111                                                TESTPN  {#}D       XORC/XORZ
#   #-                   EEEE                    1101011           C           Z           L             DDDDDDDDD             001000000                                                DIRL    {#}D           {WCZ}
#   #-                   EEEE                    1101011           C           Z           L             DDDDDDDDD             001000001                                                DIRH    {#}D           {WCZ}
#   #-                   EEEE                    1101011           C           Z           L             DDDDDDDDD             001000010                                                DIRC    {#}D           {WCZ}
#   #-                   EEEE                    1101011           C           Z           L             DDDDDDDDD             001000011                                                DIRNC   {#}D           {WCZ}
#   #-                   EEEE                    1101011           C           Z           L             DDDDDDDDD             001000100                                                DIRZ    {#}D           {WCZ}
#   #-                   EEEE                    1101011           C           Z           L             DDDDDDDDD             001000101                                                DIRNZ   {#}D           {WCZ}
#   #-                   EEEE                    1101011           C           Z           L             DDDDDDDDD             001000110                                                DIRRND  {#}D           {WCZ}
#   #-                   EEEE                    1101011           C           Z           L             DDDDDDDDD             001000111                                                DIRNOT  {#}D           {WCZ}
#   #-                   EEEE                    1101011           C           Z           L             DDDDDDDDD             001001000                                                OUTL    {#}D           {WCZ}
#   #-                   EEEE                    1101011           C           Z           L             DDDDDDDDD             001001001                                                OUTH    {#}D           {WCZ}
#   #-                   EEEE                    1101011           C           Z           L             DDDDDDDDD             001001010                                                OUTC    {#}D           {WCZ}
#   #-                   EEEE                    1101011           C           Z           L             DDDDDDDDD             001001011                                                OUTNC   {#}D           {WCZ}
#   #-                   EEEE                    1101011           C           Z           L             DDDDDDDDD             001001100                                                OUTZ    {#}D           {WCZ}
#   #-                   EEEE                    1101011           C           Z           L             DDDDDDDDD             001001101                                                OUTNZ   {#}D           {WCZ}
#   #-                   EEEE                    1101011           C           Z           L             DDDDDDDDD             001001110                                                OUTRND  {#}D           {WCZ}
#   #-                   EEEE                    1101011           C           Z           L             DDDDDDDDD             001001111                                                OUTNOT  {#}D           {WCZ}
#   #-                   EEEE                    1101011           C           Z           L             DDDDDDDDD             001010000                                                FLTL    {#}D           {WCZ}
#   #-                   EEEE                    1101011           C           Z           L             DDDDDDDDD             001010001                                                FLTH    {#}D           {WCZ}
#   #-                   EEEE                    1101011           C           Z           L             DDDDDDDDD             001010010                                                FLTC    {#}D           {WCZ}
#   #-                   EEEE                    1101011           C           Z           L             DDDDDDDDD             001010011                                                FLTNC   {#}D           {WCZ}
#   #-                   EEEE                    1101011           C           Z           L             DDDDDDDDD             001010100                                                FLTZ    {#}D           {WCZ}
#   #-                   EEEE                    1101011           C           Z           L             DDDDDDDDD             001010101                                                FLTNZ   {#}D           {WCZ}
#   #-                   EEEE                    1101011           C           Z           L             DDDDDDDDD             001010110                                                FLTRND  {#}D           {WCZ}
#   #-                   EEEE                    1101011           C           Z           L             DDDDDDDDD             001010111                                                FLTNOT  {#}D           {WCZ}
#   #-                   EEEE                    1101011           C           Z           L             DDDDDDDDD             001011000                                                DRVL    {#}D           {WCZ}
#   #-                   EEEE                    1101011           C           Z           L             DDDDDDDDD             001011001                                                DRVH    {#}D           {WCZ}
#   #-                   EEEE                    1101011           C           Z           L             DDDDDDDDD             001011010                                                DRVC    {#}D           {WCZ}
#   #-                   EEEE                    1101011           C           Z           L             DDDDDDDDD             001011011                                                DRVNC   {#}D           {WCZ}
#   #-                   EEEE                    1101011           C           Z           L             DDDDDDDDD             001011100                                                DRVZ    {#}D           {WCZ}
#   #-                   EEEE                    1101011           C           Z           L             DDDDDDDDD             001011101                                                DRVNZ   {#}D           {WCZ}
#   #-                   EEEE                    1101011           C           Z           L             DDDDDDDDD             001011110                                                DRVRND  {#}D           {WCZ}
#   #-                   EEEE                    1101011           C           Z           L             DDDDDDDDD             001011111                                                DRVNOT  {#}D           {WCZ}
#   #-                   EEEE                    1101011           0           0           0             DDDDDDDDD             001100000                                                SPLITB  D
#   #-                   EEEE                    1101011           0           0           0             DDDDDDDDD             001100001                                                MERGEB  D
#   #-                   EEEE                    1101011           0           0           0             DDDDDDDDD             001100010                                                SPLITW  D
#   #-                   EEEE                    1101011           0           0           0             DDDDDDDDD             001100011                                                MERGEW  D
#   #-                   EEEE                    1101011           0           0           0             DDDDDDDDD             001100100                                                SEUSSF  D
#   #-                   EEEE                    1101011           0           0           0             DDDDDDDDD             001100101                                                SEUSSR  D
#   #-                   EEEE                    1101011           0           0           0             DDDDDDDDD             001100110                                                RGBSQZ  D
#   #-                   EEEE                    1101011           0           0           0             DDDDDDDDD             001100111                                                RGBEXP  D
#   #-                   EEEE                    1101011           0           0           0             DDDDDDDDD             001101000                                                XORO32  D
#   #-                   EEEE                    1101011           0           0           0             DDDDDDDDD             001101001                                                REV     D
#   #-                   EEEE                    1101011           C           Z           0             DDDDDDDDD             001101010                                                RCZR    D        {WC/WZ/WCZ}
#   #-                   EEEE                    1101011           C           Z           0             DDDDDDDDD             001101011                                                RCZL    D        {WC/WZ/WCZ}
#   #-                   EEEE                    1101011           0           0           0             DDDDDDDDD             001101100                                                WRC     D
#   #-                   EEEE                    1101011           0           0           0             DDDDDDDDD             001101101                                                WRNC    D
#   #-                   EEEE                    1101011           0           0           0             DDDDDDDDD             001101110                                                WRZ     D
#   #-                   EEEE                    1101011           0           0           0             DDDDDDDDD             001101111                                                WRNZ    D
#   #-                   EEEE                    1101011           C           Z           1             0cccczzzz             001101111                                                MODCZ   c,z      {WC/WZ/WCZ}
#   #-                   EEEE                    1101011           C           0           1             0cccc0000             001101111                                                MODC    c               {WC}
#   #-                   EEEE                    1101011           0           Z           1             00000zzzz             001101111                                                MODZ    z               {WZ}
# 
# 
# 
#   #-                   EEEE                    1101100           R           A           A             AAAAAAAAA             AAAAAAAAA                                                JMP     #A
#   def jmpa(addr,r,a) when addr < 0x400,   do: "##{callr?(r,a)}#{iVl(0,(div(a,4) + 1))}"
#   def jmpa(addr,r,a),                     do: "##{callr?(r,a)}#{iVl(0,a+4)}"
# 
#   def calla(addr,r,a) when addr < 0x400,  do: "##{callr?(r,a)}#{iVl(0,(div(a,4))+1)}"
#   def calla(addr,r,a),                    do: "#\\#{callr?(r,a)}#{iVl(0,a)}"
# 
#   def callr?(0,_), do: ""
#   def callr?(1,a) when a < 0, do: "$-"
#   def callr?(1,a), do: "$+"
# 
#   def iVl(flag,addr), do: "#{ref?(flag)}#{hex(abs(addr))}"
#   def iVal(flag,addr), do: "#{ref?(flag)}#{hex(addr)}"
# 
#   def hex(x) when abs(x) < 10, do: "#{:io_lib.format('~.16.0b', [x])}"
#   def hex(x),             do: "$#{:io_lib.format('~.16.0b', [x])}"
#   def disasm_instr(addr,  <<   cnd::size(4), 0b1101100::size(7), r::size(1), a::signed-size(20)>>),  do: [disasm_c(<<cnd::size(4)>>), "JMP",     jmpa(addr,r,a),     "",   ""] #4
#   #-                   EEEE                    1101011           C           Z           0             DDDDDDDDD             000101100                                                JMP     D        {WC/WZ/WCZ}
#   def disasm_instr(_addr, <<   cnd::size(4), 0b1101011::size(7), c::size(1), z::size(1), 0::size(1),           d::size(9), 0b000101100::size(9)>>), do: [disasm_c(<<cnd::size(4)>>), "JMP",     iVal(0,d),     "",   wcz?(c,z)] #4
# 
# 
# 
#   #-                   EEEE                    1101101           R           A           A             AAAAAAAAA             AAAAAAAAA                                                CALL    #A
#   #-                   EEEE                    1101110           R           A           A             AAAAAAAAA             AAAAAAAAA                                                CALLA   #A
#   #-                   EEEE                    1101111           R           A           A             AAAAAAAAA             AAAAAAAAA                                                CALLB   #A
#   #-                   EEEE                    11101WW           R           A           A             AAAAAAAAA             AAAAAAAAA                                                LOC     PA/PB/PTRA/PTRB,#A
#   #-                   EEEE                    11110NN           N           N           N             NNNNNNNNN             NNNNNNNNN                                                AUGS    #N
#   def disasm_instr(_addr, <<   cnd::size(4),   0b11110::size(5), d::size(23) >>), do: [disasm_c(<<cnd::size(4)>>), "AUGS",   "##{iVal(0,d)} << 9",     "",          ""       ]
#   #-                   EEEE                    11111NN           N           N           N             NNNNNNNNN             NNNNNNNNN                                                AUGD    #N
# 	
# 
# 
# 
# 
# 
# 
# 
# 
# 
# 
# 
# 
# 
#   ## OpCodes in thd format 4,7,1,20
#   def disasm_instr(addr,  <<   cnd::size(4), 0b1101101::size(7), r::size(1),                                   a::size(20)                     >>), do: [disasm_c(<<cnd::size(4)>>), "CALL",    calla(addr,r,a), "",          ""       ]
# 
#   ## Invalid instructions are caught here
#   def disasm_instr(_,x), do: "disasm_instr: #{inspect(x)}"
# 
# 
