defmodule P2Testing.Disasm2 do
#   EEEE 0000000 CZI DDDDDDDDD SSSSSSSSS        ROR     D,S/#       {WC/WZ/WCZ}
  def disasmInstr(funct, addr, <<con::size(4), 0b0000000::size(7) ,c::size(1),z::size(1),i::size(1),d::size(9),s::size(9),>>), do: funct.(%{addr: addr,con: con, instr: "ROR", binary: <<c::size(1),z::size(1),i::size(1),d::size(9),s::size(9),>>})

#   EEEE 0000001 CZI DDDDDDDDD SSSSSSSSS        ROL     D,S/#       {WC/WZ/WCZ}
  def disasmInstr(funct, addr, <<con::size(4), 0b0000001::size(7) ,c::size(1),z::size(1),i::size(1),d::size(9),s::size(9),>>), do: funct.(%{addr: addr,con: con, instr: "ROL", binary: <<c::size(1),z::size(1),i::size(1),d::size(9),s::size(9),>>})

#   EEEE 0000010 CZI DDDDDDDDD SSSSSSSSS        SHR     D,S/#       {WC/WZ/WCZ}
  def disasmInstr(funct, addr, <<con::size(4), 0b0000010::size(7) ,c::size(1),z::size(1),i::size(1),d::size(9),s::size(9),>>), do: funct.(%{addr: addr,con: con, instr: "SHR", binary: <<c::size(1),z::size(1),i::size(1),d::size(9),s::size(9),>>})

#   EEEE 0000011 CZI DDDDDDDDD SSSSSSSSS        SHL     D,S/#       {WC/WZ/WCZ}
  def disasmInstr(funct, addr, <<con::size(4), 0b0000011::size(7) ,c::size(1),z::size(1),i::size(1),d::size(9),s::size(9),>>), do: funct.(%{addr: addr,con: con, instr: "SHL", binary: <<c::size(1),z::size(1),i::size(1),d::size(9),s::size(9),>>})

#   EEEE 0000100 CZI DDDDDDDDD SSSSSSSSS        RCR     D,S/#       {WC/WZ/WCZ}
  def disasmInstr(funct, addr, <<con::size(4), 0b0000100::size(7) ,c::size(1),z::size(1),i::size(1),d::size(9),s::size(9),>>), do: funct.(%{addr: addr,con: con, instr: "RCR", binary: <<c::size(1),z::size(1),i::size(1),d::size(9),s::size(9),>>})

#   EEEE 0000101 CZI DDDDDDDDD SSSSSSSSS        RCL     D,S/#       {WC/WZ/WCZ}
  def disasmInstr(funct, addr, <<con::size(4), 0b0000101::size(7) ,c::size(1),z::size(1),i::size(1),d::size(9),s::size(9),>>), do: funct.(%{addr: addr,con: con, instr: "RCL", binary: <<c::size(1),z::size(1),i::size(1),d::size(9),s::size(9),>>})

#   EEEE 0000110 CZI DDDDDDDDD SSSSSSSSS        SAR     D,S/#       {WC/WZ/WCZ}
  def disasmInstr(funct, addr, <<con::size(4), 0b0000110::size(7) ,c::size(1),z::size(1),i::size(1),d::size(9),s::size(9),>>), do: funct.(%{addr: addr,con: con, instr: "SAR", binary: <<c::size(1),z::size(1),i::size(1),d::size(9),s::size(9),>>})

#   EEEE 0000111 CZI DDDDDDDDD SSSSSSSSS        SAL     D,S/#       {WC/WZ/WCZ}
  def disasmInstr(funct, addr, <<con::size(4), 0b0000111::size(7) ,c::size(1),z::size(1),i::size(1),d::size(9),s::size(9),>>), do: funct.(%{addr: addr,con: con, instr: "SAL", binary: <<c::size(1),z::size(1),i::size(1),d::size(9),s::size(9),>>})

#   EEEE 0001000 CZI DDDDDDDDD SSSSSSSSS        ADD     D,S/#       {WC/WZ/WCZ}
  def disasmInstr(funct, addr, <<con::size(4), 0b0001000::size(7) ,c::size(1),z::size(1),i::size(1),d::size(9),s::size(9),>>), do: funct.(%{addr: addr,con: con, instr: "ADD", binary: <<c::size(1),z::size(1),i::size(1),d::size(9),s::size(9),>>})

#   EEEE 0001001 CZI DDDDDDDDD SSSSSSSSS        ADDX    D,S/#       {WC/WZ/WCZ}
  def disasmInstr(funct, addr, <<con::size(4), 0b0001001::size(7) ,c::size(1),z::size(1),i::size(1),d::size(9),s::size(9),>>), do: funct.(%{addr: addr,con: con, instr: "ADDX", binary: <<c::size(1),z::size(1),i::size(1),d::size(9),s::size(9),>>})

#   EEEE 0001010 CZI DDDDDDDDD SSSSSSSSS        ADDS    D,S/#       {WC/WZ/WCZ}
  def disasmInstr(funct, addr, <<con::size(4), 0b0001010::size(7) ,c::size(1),z::size(1),i::size(1),d::size(9),s::size(9),>>), do: funct.(%{addr: addr,con: con, instr: "ADDS", binary: <<c::size(1),z::size(1),i::size(1),d::size(9),s::size(9),>>})

#   EEEE 0001011 CZI DDDDDDDDD SSSSSSSSS        ADDSX   D,S/#       {WC/WZ/WCZ}
  def disasmInstr(funct, addr, <<con::size(4), 0b0001011::size(7) ,c::size(1),z::size(1),i::size(1),d::size(9),s::size(9),>>), do: funct.(%{addr: addr,con: con, instr: "ADDSX", binary: <<c::size(1),z::size(1),i::size(1),d::size(9),s::size(9),>>})

#   EEEE 0001100 CZI DDDDDDDDD SSSSSSSSS        SUB     D,S/#       {WC/WZ/WCZ}
  def disasmInstr(funct, addr, <<con::size(4), 0b0001100::size(7) ,c::size(1),z::size(1),i::size(1),d::size(9),s::size(9),>>), do: funct.(%{addr: addr,con: con, instr: "SUB", binary: <<c::size(1),z::size(1),i::size(1),d::size(9),s::size(9),>>})

#   EEEE 0001101 CZI DDDDDDDDD SSSSSSSSS        SUBX    D,S/#       {WC/WZ/WCZ}
  def disasmInstr(funct, addr, <<con::size(4), 0b0001101::size(7) ,c::size(1),z::size(1),i::size(1),d::size(9),s::size(9),>>), do: funct.(%{addr: addr,con: con, instr: "SUBX", binary: <<c::size(1),z::size(1),i::size(1),d::size(9),s::size(9),>>})

#   EEEE 0001110 CZI DDDDDDDDD SSSSSSSSS        SUBS    D,S/#       {WC/WZ/WCZ}
  def disasmInstr(funct, addr, <<con::size(4), 0b0001110::size(7) ,c::size(1),z::size(1),i::size(1),d::size(9),s::size(9),>>), do: funct.(%{addr: addr,con: con, instr: "SUBS", binary: <<c::size(1),z::size(1),i::size(1),d::size(9),s::size(9),>>})

#   EEEE 0001111 CZI DDDDDDDDD SSSSSSSSS        SUBSX   D,S/#       {WC/WZ/WCZ}
  def disasmInstr(funct, addr, <<con::size(4), 0b0001111::size(7) ,c::size(1),z::size(1),i::size(1),d::size(9),s::size(9),>>), do: funct.(%{addr: addr,con: con, instr: "SUBSX", binary: <<c::size(1),z::size(1),i::size(1),d::size(9),s::size(9),>>})

#   EEEE 0010000 CZI DDDDDDDDD SSSSSSSSS        CMP     D,S/#       {WC/WZ/WCZ}
  def disasmInstr(funct, addr, <<con::size(4), 0b0010000::size(7) ,c::size(1),z::size(1),i::size(1),d::size(9),s::size(9),>>), do: funct.(%{addr: addr,con: con, instr: "CMP", binary: <<c::size(1),z::size(1),i::size(1),d::size(9),s::size(9),>>})

#   EEEE 0010001 CZI DDDDDDDDD SSSSSSSSS        CMPX    D,S/#       {WC/WZ/WCZ}
  def disasmInstr(funct, addr, <<con::size(4), 0b0010001::size(7) ,c::size(1),z::size(1),i::size(1),d::size(9),s::size(9),>>), do: funct.(%{addr: addr,con: con, instr: "CMPX", binary: <<c::size(1),z::size(1),i::size(1),d::size(9),s::size(9),>>})

#   EEEE 0010010 CZI DDDDDDDDD SSSSSSSSS        CMPS    D,S/#       {WC/WZ/WCZ}
  def disasmInstr(funct, addr, <<con::size(4), 0b0010010::size(7) ,c::size(1),z::size(1),i::size(1),d::size(9),s::size(9),>>), do: funct.(%{addr: addr,con: con, instr: "CMPS", binary: <<c::size(1),z::size(1),i::size(1),d::size(9),s::size(9),>>})

#   EEEE 0010011 CZI DDDDDDDDD SSSSSSSSS        CMPSX   D,S/#       {WC/WZ/WCZ}
  def disasmInstr(funct, addr, <<con::size(4), 0b0010011::size(7) ,c::size(1),z::size(1),i::size(1),d::size(9),s::size(9),>>), do: funct.(%{addr: addr,con: con, instr: "CMPSX", binary: <<c::size(1),z::size(1),i::size(1),d::size(9),s::size(9),>>})

#   EEEE 0010100 CZI DDDDDDDDD SSSSSSSSS        CMPR    D,S/#       {WC/WZ/WCZ}
  def disasmInstr(funct, addr, <<con::size(4), 0b0010100::size(7) ,c::size(1),z::size(1),i::size(1),d::size(9),s::size(9),>>), do: funct.(%{addr: addr,con: con, instr: "CMPR", binary: <<c::size(1),z::size(1),i::size(1),d::size(9),s::size(9),>>})

#   EEEE 0010101 CZI DDDDDDDDD SSSSSSSSS        CMPM    D,S/#       {WC/WZ/WCZ}
  def disasmInstr(funct, addr, <<con::size(4), 0b0010101::size(7) ,c::size(1),z::size(1),i::size(1),d::size(9),s::size(9),>>), do: funct.(%{addr: addr,con: con, instr: "CMPM", binary: <<c::size(1),z::size(1),i::size(1),d::size(9),s::size(9),>>})

#   EEEE 0010110 CZI DDDDDDDDD SSSSSSSSS        SUBR    D,S/#       {WC/WZ/WCZ}
  def disasmInstr(funct, addr, <<con::size(4), 0b0010110::size(7) ,c::size(1),z::size(1),i::size(1),d::size(9),s::size(9),>>), do: funct.(%{addr: addr,con: con, instr: "SUBR", binary: <<c::size(1),z::size(1),i::size(1),d::size(9),s::size(9),>>})

#   EEEE 0010111 CZI DDDDDDDDD SSSSSSSSS        CMPSUB  D,S/#       {WC/WZ/WCZ}
  def disasmInstr(funct, addr, <<con::size(4), 0b0010111::size(7) ,c::size(1),z::size(1),i::size(1),d::size(9),s::size(9),>>), do: funct.(%{addr: addr,con: con, instr: "CMPSUB", binary: <<c::size(1),z::size(1),i::size(1),d::size(9),s::size(9),>>})

#   EEEE 0011000 CZI DDDDDDDDD SSSSSSSSS        FGE     D,S/#       {WC/WZ/WCZ}
  def disasmInstr(funct, addr, <<con::size(4), 0b0011000::size(7) ,c::size(1),z::size(1),i::size(1),d::size(9),s::size(9),>>), do: funct.(%{addr: addr,con: con, instr: "FGE", binary: <<c::size(1),z::size(1),i::size(1),d::size(9),s::size(9),>>})

#   EEEE 0011001 CZI DDDDDDDDD SSSSSSSSS        FLE     D,S/#       {WC/WZ/WCZ}
  def disasmInstr(funct, addr, <<con::size(4), 0b0011001::size(7) ,c::size(1),z::size(1),i::size(1),d::size(9),s::size(9),>>), do: funct.(%{addr: addr,con: con, instr: "FLE", binary: <<c::size(1),z::size(1),i::size(1),d::size(9),s::size(9),>>})

#   EEEE 0011010 CZI DDDDDDDDD SSSSSSSSS        FGES    D,S/#       {WC/WZ/WCZ}
  def disasmInstr(funct, addr, <<con::size(4), 0b0011010::size(7) ,c::size(1),z::size(1),i::size(1),d::size(9),s::size(9),>>), do: funct.(%{addr: addr,con: con, instr: "FGES", binary: <<c::size(1),z::size(1),i::size(1),d::size(9),s::size(9),>>})

#   EEEE 0011011 CZI DDDDDDDDD SSSSSSSSS        FLES    D,S/#       {WC/WZ/WCZ}
  def disasmInstr(funct, addr, <<con::size(4), 0b0011011::size(7) ,c::size(1),z::size(1),i::size(1),d::size(9),s::size(9),>>), do: funct.(%{addr: addr,con: con, instr: "FLES", binary: <<c::size(1),z::size(1),i::size(1),d::size(9),s::size(9),>>})

#   EEEE 0011100 CZI DDDDDDDDD SSSSSSSSS        SUMC    D,S/#       {WC/WZ/WCZ}
  def disasmInstr(funct, addr, <<con::size(4), 0b0011100::size(7) ,c::size(1),z::size(1),i::size(1),d::size(9),s::size(9),>>), do: funct.(%{addr: addr,con: con, instr: "SUMC", binary: <<c::size(1),z::size(1),i::size(1),d::size(9),s::size(9),>>})

#   EEEE 0011101 CZI DDDDDDDDD SSSSSSSSS        SUMNC   D,S/#       {WC/WZ/WCZ}
  def disasmInstr(funct, addr, <<con::size(4), 0b0011101::size(7) ,c::size(1),z::size(1),i::size(1),d::size(9),s::size(9),>>), do: funct.(%{addr: addr,con: con, instr: "SUMNC", binary: <<c::size(1),z::size(1),i::size(1),d::size(9),s::size(9),>>})

#   EEEE 0011110 CZI DDDDDDDDD SSSSSSSSS        SUMZ    D,S/#       {WC/WZ/WCZ}
  def disasmInstr(funct, addr, <<con::size(4), 0b0011110::size(7) ,c::size(1),z::size(1),i::size(1),d::size(9),s::size(9),>>), do: funct.(%{addr: addr,con: con, instr: "SUMZ", binary: <<c::size(1),z::size(1),i::size(1),d::size(9),s::size(9),>>})

#   EEEE 0011111 CZI DDDDDDDDD SSSSSSSSS        SUMNZ   D,S/#       {WC/WZ/WCZ}
  def disasmInstr(funct, addr, <<con::size(4), 0b0011111::size(7) ,c::size(1),z::size(1),i::size(1),d::size(9),s::size(9),>>), do: funct.(%{addr: addr,con: con, instr: "SUMNZ", binary: <<c::size(1),z::size(1),i::size(1),d::size(9),s::size(9),>>})

#   EEEE 0100000 CZI DDDDDDDDD SSSSSSSSS        TESTB   D,S/#       WC/WZ
  def disasmInstr(funct, addr, <<con::size(4), 0b0100000::size(7) ,c::size(1),z::size(1),i::size(1),d::size(9),s::size(9),>>), do: funct.(%{addr: addr,con: con, instr: "TESTB", binary: <<c::size(1),z::size(1),i::size(1),d::size(9),s::size(9),>>})

#   EEEE 0100001 CZI DDDDDDDDD SSSSSSSSS        TESTBN  D,S/#       WC/WZ
  def disasmInstr(funct, addr, <<con::size(4), 0b0100001::size(7) ,c::size(1),z::size(1),i::size(1),d::size(9),s::size(9),>>), do: funct.(%{addr: addr,con: con, instr: "TESTBN", binary: <<c::size(1),z::size(1),i::size(1),d::size(9),s::size(9),>>})

#   EEEE 0100010 CZI DDDDDDDDD SSSSSSSSS        TESTB   D,S/#       ANDC/ANDZ
  def disasmInstr(funct, addr, <<con::size(4), 0b0100010::size(7) ,c::size(1),z::size(1),i::size(1),d::size(9),s::size(9),>>), do: funct.(%{addr: addr,con: con, instr: "TESTB", binary: <<c::size(1),z::size(1),i::size(1),d::size(9),s::size(9),>>})

#   EEEE 0100011 CZI DDDDDDDDD SSSSSSSSS        TESTBN  D,S/#       ANDC/ANDZ
  def disasmInstr(funct, addr, <<con::size(4), 0b0100011::size(7) ,c::size(1),z::size(1),i::size(1),d::size(9),s::size(9),>>), do: funct.(%{addr: addr,con: con, instr: "TESTBN", binary: <<c::size(1),z::size(1),i::size(1),d::size(9),s::size(9),>>})

#   EEEE 0100100 CZI DDDDDDDDD SSSSSSSSS        TESTB   D,S/#       ORC/ORZ
  def disasmInstr(funct, addr, <<con::size(4), 0b0100100::size(7) ,c::size(1),z::size(1),i::size(1),d::size(9),s::size(9),>>), do: funct.(%{addr: addr,con: con, instr: "TESTB", binary: <<c::size(1),z::size(1),i::size(1),d::size(9),s::size(9),>>})

#   EEEE 0100101 CZI DDDDDDDDD SSSSSSSSS        TESTBN  D,S/#       ORC/ORZ
  def disasmInstr(funct, addr, <<con::size(4), 0b0100101::size(7) ,c::size(1),z::size(1),i::size(1),d::size(9),s::size(9),>>), do: funct.(%{addr: addr,con: con, instr: "TESTBN", binary: <<c::size(1),z::size(1),i::size(1),d::size(9),s::size(9),>>})

#   EEEE 0100110 CZI DDDDDDDDD SSSSSSSSS        TESTB   D,S/#       XORC/XORZ
  def disasmInstr(funct, addr, <<con::size(4), 0b0100110::size(7) ,c::size(1),z::size(1),i::size(1),d::size(9),s::size(9),>>), do: funct.(%{addr: addr,con: con, instr: "TESTB", binary: <<c::size(1),z::size(1),i::size(1),d::size(9),s::size(9),>>})

#   EEEE 0100111 CZI DDDDDDDDD SSSSSSSSS        TESTBN  D,S/#       XORC/XORZ
  def disasmInstr(funct, addr, <<con::size(4), 0b0100111::size(7) ,c::size(1),z::size(1),i::size(1),d::size(9),s::size(9),>>), do: funct.(%{addr: addr,con: con, instr: "TESTBN", binary: <<c::size(1),z::size(1),i::size(1),d::size(9),s::size(9),>>})

#   EEEE 0100000 CZI DDDDDDDDD SSSSSSSSS        BITL    D,S/#       {WCZ}
  def disasmInstr(funct, addr, <<con::size(4), 0b0100000::size(7) ,c::size(1),z::size(1),i::size(1),d::size(9),s::size(9),>>), do: funct.(%{addr: addr,con: con, instr: "BITL", binary: <<c::size(1),z::size(1),i::size(1),d::size(9),s::size(9),>>})

#   EEEE 0100001 CZI DDDDDDDDD SSSSSSSSS        BITH    D,S/#       {WCZ}
  def disasmInstr(funct, addr, <<con::size(4), 0b0100001::size(7) ,c::size(1),z::size(1),i::size(1),d::size(9),s::size(9),>>), do: funct.(%{addr: addr,con: con, instr: "BITH", binary: <<c::size(1),z::size(1),i::size(1),d::size(9),s::size(9),>>})

#   EEEE 0100010 CZI DDDDDDDDD SSSSSSSSS        BITC    D,S/#       {WCZ}
  def disasmInstr(funct, addr, <<con::size(4), 0b0100010::size(7) ,c::size(1),z::size(1),i::size(1),d::size(9),s::size(9),>>), do: funct.(%{addr: addr,con: con, instr: "BITC", binary: <<c::size(1),z::size(1),i::size(1),d::size(9),s::size(9),>>})

#   EEEE 0100011 CZI DDDDDDDDD SSSSSSSSS        BITNC   D,S/#       {WCZ}
  def disasmInstr(funct, addr, <<con::size(4), 0b0100011::size(7) ,c::size(1),z::size(1),i::size(1),d::size(9),s::size(9),>>), do: funct.(%{addr: addr,con: con, instr: "BITNC", binary: <<c::size(1),z::size(1),i::size(1),d::size(9),s::size(9),>>})

#   EEEE 0100100 CZI DDDDDDDDD SSSSSSSSS        BITZ    D,S/#       {WCZ}
  def disasmInstr(funct, addr, <<con::size(4), 0b0100100::size(7) ,c::size(1),z::size(1),i::size(1),d::size(9),s::size(9),>>), do: funct.(%{addr: addr,con: con, instr: "BITZ", binary: <<c::size(1),z::size(1),i::size(1),d::size(9),s::size(9),>>})

#   EEEE 0100101 CZI DDDDDDDDD SSSSSSSSS        BITNZ   D,S/#       {WCZ}
  def disasmInstr(funct, addr, <<con::size(4), 0b0100101::size(7) ,c::size(1),z::size(1),i::size(1),d::size(9),s::size(9),>>), do: funct.(%{addr: addr,con: con, instr: "BITNZ", binary: <<c::size(1),z::size(1),i::size(1),d::size(9),s::size(9),>>})

#   EEEE 0100110 CZI DDDDDDDDD SSSSSSSSS        BITRND  D,S/#       {WCZ}
  def disasmInstr(funct, addr, <<con::size(4), 0b0100110::size(7) ,c::size(1),z::size(1),i::size(1),d::size(9),s::size(9),>>), do: funct.(%{addr: addr,con: con, instr: "BITRND", binary: <<c::size(1),z::size(1),i::size(1),d::size(9),s::size(9),>>})

#   EEEE 0100111 CZI DDDDDDDDD SSSSSSSSS        BITNOT  D,S/#       {WCZ}
  def disasmInstr(funct, addr, <<con::size(4), 0b0100111::size(7) ,c::size(1),z::size(1),i::size(1),d::size(9),s::size(9),>>), do: funct.(%{addr: addr,con: con, instr: "BITNOT", binary: <<c::size(1),z::size(1),i::size(1),d::size(9),s::size(9),>>})

#   EEEE 0101000 CZI DDDDDDDDD SSSSSSSSS        AND     D,S/#       {WC/WZ/WCZ}
  def disasmInstr(funct, addr, <<con::size(4), 0b0101000::size(7) ,c::size(1),z::size(1),i::size(1),d::size(9),s::size(9),>>), do: funct.(%{addr: addr,con: con, instr: "AND", binary: <<c::size(1),z::size(1),i::size(1),d::size(9),s::size(9),>>})

#   EEEE 0101001 CZI DDDDDDDDD SSSSSSSSS        ANDN    D,S/#       {WC/WZ/WCZ}
  def disasmInstr(funct, addr, <<con::size(4), 0b0101001::size(7) ,c::size(1),z::size(1),i::size(1),d::size(9),s::size(9),>>), do: funct.(%{addr: addr,con: con, instr: "ANDN", binary: <<c::size(1),z::size(1),i::size(1),d::size(9),s::size(9),>>})

#   EEEE 0101010 CZI DDDDDDDDD SSSSSSSSS        OR      D,S/#       {WC/WZ/WCZ}
  def disasmInstr(funct, addr, <<con::size(4), 0b0101010::size(7) ,c::size(1),z::size(1),i::size(1),d::size(9),s::size(9),>>), do: funct.(%{addr: addr,con: con, instr: "OR", binary: <<c::size(1),z::size(1),i::size(1),d::size(9),s::size(9),>>})

#   EEEE 0101011 CZI DDDDDDDDD SSSSSSSSS        XOR     D,S/#       {WC/WZ/WCZ}
  def disasmInstr(funct, addr, <<con::size(4), 0b0101011::size(7) ,c::size(1),z::size(1),i::size(1),d::size(9),s::size(9),>>), do: funct.(%{addr: addr,con: con, instr: "XOR", binary: <<c::size(1),z::size(1),i::size(1),d::size(9),s::size(9),>>})

#   EEEE 0101100 CZI DDDDDDDDD SSSSSSSSS        MUXC    D,S/#       {WC/WZ/WCZ}
  def disasmInstr(funct, addr, <<con::size(4), 0b0101100::size(7) ,c::size(1),z::size(1),i::size(1),d::size(9),s::size(9),>>), do: funct.(%{addr: addr,con: con, instr: "MUXC", binary: <<c::size(1),z::size(1),i::size(1),d::size(9),s::size(9),>>})

#   EEEE 0101101 CZI DDDDDDDDD SSSSSSSSS        MUXNC   D,S/#       {WC/WZ/WCZ}
  def disasmInstr(funct, addr, <<con::size(4), 0b0101101::size(7) ,c::size(1),z::size(1),i::size(1),d::size(9),s::size(9),>>), do: funct.(%{addr: addr,con: con, instr: "MUXNC", binary: <<c::size(1),z::size(1),i::size(1),d::size(9),s::size(9),>>})

#   EEEE 0101110 CZI DDDDDDDDD SSSSSSSSS        MUXZ    D,S/#       {WC/WZ/WCZ}
  def disasmInstr(funct, addr, <<con::size(4), 0b0101110::size(7) ,c::size(1),z::size(1),i::size(1),d::size(9),s::size(9),>>), do: funct.(%{addr: addr,con: con, instr: "MUXZ", binary: <<c::size(1),z::size(1),i::size(1),d::size(9),s::size(9),>>})

#   EEEE 0101111 CZI DDDDDDDDD SSSSSSSSS        MUXNZ   D,S/#       {WC/WZ/WCZ}
  def disasmInstr(funct, addr, <<con::size(4), 0b0101111::size(7) ,c::size(1),z::size(1),i::size(1),d::size(9),s::size(9),>>), do: funct.(%{addr: addr,con: con, instr: "MUXNZ", binary: <<c::size(1),z::size(1),i::size(1),d::size(9),s::size(9),>>})

#   EEEE 0110000 CZI DDDDDDDDD SSSSSSSSS        MOV     D,S/#       {WC/WZ/WCZ}
  def disasmInstr(funct, addr, <<con::size(4), 0b0110000::size(7) ,c::size(1),z::size(1),i::size(1),d::size(9),s::size(9),>>), do: funct.(%{addr: addr,con: con, instr: "MOV", binary: <<c::size(1),z::size(1),i::size(1),d::size(9),s::size(9),>>})

#   EEEE 0110001 CZI DDDDDDDDD SSSSSSSSS        NOT     D,S/#       {WC/WZ/WCZ}
  def disasmInstr(funct, addr, <<con::size(4), 0b0110001::size(7) ,c::size(1),z::size(1),i::size(1),d::size(9),s::size(9),>>), do: funct.(%{addr: addr,con: con, instr: "NOT", binary: <<c::size(1),z::size(1),i::size(1),d::size(9),s::size(9),>>})

#   EEEE 0110010 CZI DDDDDDDDD SSSSSSSSS        ABS     D,S/#       {WC/WZ/WCZ}
  def disasmInstr(funct, addr, <<con::size(4), 0b0110010::size(7) ,c::size(1),z::size(1),i::size(1),d::size(9),s::size(9),>>), do: funct.(%{addr: addr,con: con, instr: "ABS", binary: <<c::size(1),z::size(1),i::size(1),d::size(9),s::size(9),>>})

#   EEEE 0110011 CZI DDDDDDDDD SSSSSSSSS        NEG     D,S/#       {WC/WZ/WCZ}
  def disasmInstr(funct, addr, <<con::size(4), 0b0110011::size(7) ,c::size(1),z::size(1),i::size(1),d::size(9),s::size(9),>>), do: funct.(%{addr: addr,con: con, instr: "NEG", binary: <<c::size(1),z::size(1),i::size(1),d::size(9),s::size(9),>>})

#   EEEE 0110100 CZI DDDDDDDDD SSSSSSSSS        NEGC    D,S/#       {WC/WZ/WCZ}
  def disasmInstr(funct, addr, <<con::size(4), 0b0110100::size(7) ,c::size(1),z::size(1),i::size(1),d::size(9),s::size(9),>>), do: funct.(%{addr: addr,con: con, instr: "NEGC", binary: <<c::size(1),z::size(1),i::size(1),d::size(9),s::size(9),>>})

#   EEEE 0110101 CZI DDDDDDDDD SSSSSSSSS        NEGNC   D,S/#       {WC/WZ/WCZ}
  def disasmInstr(funct, addr, <<con::size(4), 0b0110101::size(7) ,c::size(1),z::size(1),i::size(1),d::size(9),s::size(9),>>), do: funct.(%{addr: addr,con: con, instr: "NEGNC", binary: <<c::size(1),z::size(1),i::size(1),d::size(9),s::size(9),>>})

#   EEEE 0110110 CZI DDDDDDDDD SSSSSSSSS        NEGZ    D,S/#       {WC/WZ/WCZ}
  def disasmInstr(funct, addr, <<con::size(4), 0b0110110::size(7) ,c::size(1),z::size(1),i::size(1),d::size(9),s::size(9),>>), do: funct.(%{addr: addr,con: con, instr: "NEGZ", binary: <<c::size(1),z::size(1),i::size(1),d::size(9),s::size(9),>>})

#   EEEE 0110111 CZI DDDDDDDDD SSSSSSSSS        NEGNZ   D,S/#       {WC/WZ/WCZ}
  def disasmInstr(funct, addr, <<con::size(4), 0b0110111::size(7) ,c::size(1),z::size(1),i::size(1),d::size(9),s::size(9),>>), do: funct.(%{addr: addr,con: con, instr: "NEGNZ", binary: <<c::size(1),z::size(1),i::size(1),d::size(9),s::size(9),>>})

#   EEEE 0111000 CZI DDDDDDDDD SSSSSSSSS        INCMOD  D,S/#       {WC/WZ/WCZ}
  def disasmInstr(funct, addr, <<con::size(4), 0b0111000::size(7) ,c::size(1),z::size(1),i::size(1),d::size(9),s::size(9),>>), do: funct.(%{addr: addr,con: con, instr: "INCMOD", binary: <<c::size(1),z::size(1),i::size(1),d::size(9),s::size(9),>>})

#   EEEE 0111001 CZI DDDDDDDDD SSSSSSSSS        DECMOD  D,S/#       {WC/WZ/WCZ}
  def disasmInstr(funct, addr, <<con::size(4), 0b0111001::size(7) ,c::size(1),z::size(1),i::size(1),d::size(9),s::size(9),>>), do: funct.(%{addr: addr,con: con, instr: "DECMOD", binary: <<c::size(1),z::size(1),i::size(1),d::size(9),s::size(9),>>})

#   EEEE 0111010 CZI DDDDDDDDD SSSSSSSSS        ZEROX   D,S/#       {WC/WZ/WCZ}
  def disasmInstr(funct, addr, <<con::size(4), 0b0111010::size(7) ,c::size(1),z::size(1),i::size(1),d::size(9),s::size(9),>>), do: funct.(%{addr: addr,con: con, instr: "ZEROX", binary: <<c::size(1),z::size(1),i::size(1),d::size(9),s::size(9),>>})

#   EEEE 0111011 CZI DDDDDDDDD SSSSSSSSS        SIGNX   D,S/#       {WC/WZ/WCZ}
  def disasmInstr(funct, addr, <<con::size(4), 0b0111011::size(7) ,c::size(1),z::size(1),i::size(1),d::size(9),s::size(9),>>), do: funct.(%{addr: addr,con: con, instr: "SIGNX", binary: <<c::size(1),z::size(1),i::size(1),d::size(9),s::size(9),>>})

#   EEEE 0111100 CZI DDDDDDDDD SSSSSSSSS        ENCOD   D,S/#       {WC/WZ/WCZ}
  def disasmInstr(funct, addr, <<con::size(4), 0b0111100::size(7) ,c::size(1),z::size(1),i::size(1),d::size(9),s::size(9),>>), do: funct.(%{addr: addr,con: con, instr: "ENCOD", binary: <<c::size(1),z::size(1),i::size(1),d::size(9),s::size(9),>>})

#   EEEE 0111101 CZI DDDDDDDDD SSSSSSSSS        ONES    D,S/#       {WC/WZ/WCZ}
  def disasmInstr(funct, addr, <<con::size(4), 0b0111101::size(7) ,c::size(1),z::size(1),i::size(1),d::size(9),s::size(9),>>), do: funct.(%{addr: addr,con: con, instr: "ONES", binary: <<c::size(1),z::size(1),i::size(1),d::size(9),s::size(9),>>})

#   EEEE 0111110 CZI DDDDDDDDD SSSSSSSSS        TEST    D,S/#       {WC/WZ/WCZ}
  def disasmInstr(funct, addr, <<con::size(4), 0b0111110::size(7) ,c::size(1),z::size(1),i::size(1),d::size(9),s::size(9),>>), do: funct.(%{addr: addr,con: con, instr: "TEST", binary: <<c::size(1),z::size(1),i::size(1),d::size(9),s::size(9),>>})

#   EEEE 0111111 CZI DDDDDDDDD SSSSSSSSS        TESTN   D,S/#       {WC/WZ/WCZ}
  def disasmInstr(funct, addr, <<con::size(4), 0b0111111::size(7) ,c::size(1),z::size(1),i::size(1),d::size(9),s::size(9),>>), do: funct.(%{addr: addr,con: con, instr: "TESTN", binary: <<c::size(1),z::size(1),i::size(1),d::size(9),s::size(9),>>})

#   EEEE 100000N NNI DDDDDDDDD SSSSSSSSS        SETNIB  D,S/#,#N
  def disasmInstr(funct, addr, <<con::size(4), 0b100000::size(6) ,n::size(3),i::size(1),d::size(9),s::size(9),>>), do: funct.(%{addr: addr,con: con, instr: "SETNIB", binary: <<n::size(3),i::size(1),d::size(9),s::size(9),>>})

#   EEEE 100001N NNI DDDDDDDDD SSSSSSSSS        GETNIB  D,S/#,#N
  def disasmInstr(funct, addr, <<con::size(4), 0b100001::size(6) ,n::size(3),i::size(1),d::size(9),s::size(9),>>), do: funct.(%{addr: addr,con: con, instr: "GETNIB", binary: <<n::size(3),i::size(1),d::size(9),s::size(9),>>})

#   EEEE 100010N NNI DDDDDDDDD SSSSSSSSS        ROLNIB  D,S/#,#N
  def disasmInstr(funct, addr, <<con::size(4), 0b100010::size(6) ,n::size(3),i::size(1),d::size(9),s::size(9),>>), do: funct.(%{addr: addr,con: con, instr: "ROLNIB", binary: <<n::size(3),i::size(1),d::size(9),s::size(9),>>})

#   EEEE 1000110 NNI DDDDDDDDD SSSSSSSSS        SETBYTE D,S/#,#N
  def disasmInstr(funct, addr, <<con::size(4), 0b1000110::size(7) ,n::size(2),i::size(1),d::size(9),s::size(9),>>), do: funct.(%{addr: addr,con: con, instr: "SETBYTE", binary: <<n::size(2),i::size(1),d::size(9),s::size(9),>>})

#   EEEE 1000111 NNI DDDDDDDDD SSSSSSSSS        GETBYTE D,S/#,#N
  def disasmInstr(funct, addr, <<con::size(4), 0b1000111::size(7) ,n::size(2),i::size(1),d::size(9),s::size(9),>>), do: funct.(%{addr: addr,con: con, instr: "GETBYTE", binary: <<n::size(2),i::size(1),d::size(9),s::size(9),>>})

#   EEEE 1001000 NNI DDDDDDDDD SSSSSSSSS        ROLBYTE D,S/#,#N
  def disasmInstr(funct, addr, <<con::size(4), 0b1001000::size(7) ,n::size(2),i::size(1),d::size(9),s::size(9),>>), do: funct.(%{addr: addr,con: con, instr: "ROLBYTE", binary: <<n::size(2),i::size(1),d::size(9),s::size(9),>>})

#   EEEE 1001001 0NI DDDDDDDDD SSSSSSSSS        SETWORD D,S/#,#N
  def disasmInstr(funct, addr, <<con::size(4), 0b10010010::size(8) ,n::size(1),i::size(1),d::size(9),s::size(9),>>), do: funct.(%{addr: addr,con: con, instr: "SETWORD", binary: <<n::size(1),i::size(1),d::size(9),s::size(9),>>})

#   EEEE 1001001 1NI DDDDDDDDD SSSSSSSSS        GETWORD D,S/#,#N
  def disasmInstr(funct, addr, <<con::size(4), 0b10010011::size(8) ,n::size(1),i::size(1),d::size(9),s::size(9),>>), do: funct.(%{addr: addr,con: con, instr: "GETWORD", binary: <<n::size(1),i::size(1),d::size(9),s::size(9),>>})

#   EEEE 1001010 0NI DDDDDDDDD SSSSSSSSS        ROLWORD D,S/#,#N
  def disasmInstr(funct, addr, <<con::size(4), 0b10010100::size(8) ,n::size(1),i::size(1),d::size(9),s::size(9),>>), do: funct.(%{addr: addr,con: con, instr: "ROLWORD", binary: <<n::size(1),i::size(1),d::size(9),s::size(9),>>})

#   EEEE 1001010 10I DDDDDDDDD SSSSSSSSS        ALTSN   D,S/#
  def disasmInstr(funct, addr, <<con::size(4), 0b100101010::size(9) ,i::size(1),d::size(9),s::size(9),>>), do: funct.(%{addr: addr,con: con, instr: "ALTSN", binary: <<i::size(1),d::size(9),s::size(9),>>})

#   EEEE 1001010 11I DDDDDDDDD SSSSSSSSS        ALTGN   D,S/#
  def disasmInstr(funct, addr, <<con::size(4), 0b100101011::size(9) ,i::size(1),d::size(9),s::size(9),>>), do: funct.(%{addr: addr,con: con, instr: "ALTGN", binary: <<i::size(1),d::size(9),s::size(9),>>})

#   EEEE 1001011 00I DDDDDDDDD SSSSSSSSS        ALTSB   D,S/#
  def disasmInstr(funct, addr, <<con::size(4), 0b100101100::size(9) ,i::size(1),d::size(9),s::size(9),>>), do: funct.(%{addr: addr,con: con, instr: "ALTSB", binary: <<i::size(1),d::size(9),s::size(9),>>})

#   EEEE 1001011 01I DDDDDDDDD SSSSSSSSS        ALTGB   D,S/#
  def disasmInstr(funct, addr, <<con::size(4), 0b100101101::size(9) ,i::size(1),d::size(9),s::size(9),>>), do: funct.(%{addr: addr,con: con, instr: "ALTGB", binary: <<i::size(1),d::size(9),s::size(9),>>})

#   EEEE 1001011 10I DDDDDDDDD SSSSSSSSS        ALTSW   D,S/#
  def disasmInstr(funct, addr, <<con::size(4), 0b100101110::size(9) ,i::size(1),d::size(9),s::size(9),>>), do: funct.(%{addr: addr,con: con, instr: "ALTSW", binary: <<i::size(1),d::size(9),s::size(9),>>})

#   EEEE 1001011 11I DDDDDDDDD SSSSSSSSS        ALTGW   D,S/#
  def disasmInstr(funct, addr, <<con::size(4), 0b100101111::size(9) ,i::size(1),d::size(9),s::size(9),>>), do: funct.(%{addr: addr,con: con, instr: "ALTGW", binary: <<i::size(1),d::size(9),s::size(9),>>})

#   EEEE 1001100 00I DDDDDDDDD SSSSSSSSS        ALTR    D,S/#
  def disasmInstr(funct, addr, <<con::size(4), 0b100110000::size(9) ,i::size(1),d::size(9),s::size(9),>>), do: funct.(%{addr: addr,con: con, instr: "ALTR", binary: <<i::size(1),d::size(9),s::size(9),>>})

#   EEEE 1001100 01I DDDDDDDDD SSSSSSSSS        ALTD    D,S/#
  def disasmInstr(funct, addr, <<con::size(4), 0b100110001::size(9) ,i::size(1),d::size(9),s::size(9),>>), do: funct.(%{addr: addr,con: con, instr: "ALTD", binary: <<i::size(1),d::size(9),s::size(9),>>})

#   EEEE 1001100 10I DDDDDDDDD SSSSSSSSS        ALTS    D,S/#
  def disasmInstr(funct, addr, <<con::size(4), 0b100110010::size(9) ,i::size(1),d::size(9),s::size(9),>>), do: funct.(%{addr: addr,con: con, instr: "ALTS", binary: <<i::size(1),d::size(9),s::size(9),>>})

#   EEEE 1001100 11I DDDDDDDDD SSSSSSSSS        ALTB    D,S/#
  def disasmInstr(funct, addr, <<con::size(4), 0b100110011::size(9) ,i::size(1),d::size(9),s::size(9),>>), do: funct.(%{addr: addr,con: con, instr: "ALTB", binary: <<i::size(1),d::size(9),s::size(9),>>})

#   EEEE 1001101 00I DDDDDDDDD SSSSSSSSS        ALTI    D,S/#
  def disasmInstr(funct, addr, <<con::size(4), 0b100110100::size(9) ,i::size(1),d::size(9),s::size(9),>>), do: funct.(%{addr: addr,con: con, instr: "ALTI", binary: <<i::size(1),d::size(9),s::size(9),>>})

#   EEEE 1001101 01I DDDDDDDDD SSSSSSSSS        SETR    D,S/#
  def disasmInstr(funct, addr, <<con::size(4), 0b100110101::size(9) ,i::size(1),d::size(9),s::size(9),>>), do: funct.(%{addr: addr,con: con, instr: "SETR", binary: <<i::size(1),d::size(9),s::size(9),>>})

#   EEEE 1001101 10I DDDDDDDDD SSSSSSSSS        SETD    D,S/#
  def disasmInstr(funct, addr, <<con::size(4), 0b100110110::size(9) ,i::size(1),d::size(9),s::size(9),>>), do: funct.(%{addr: addr,con: con, instr: "SETD", binary: <<i::size(1),d::size(9),s::size(9),>>})

#   EEEE 1001101 11I DDDDDDDDD SSSSSSSSS        SETS    D,S/#
  def disasmInstr(funct, addr, <<con::size(4), 0b100110111::size(9) ,i::size(1),d::size(9),s::size(9),>>), do: funct.(%{addr: addr,con: con, instr: "SETS", binary: <<i::size(1),d::size(9),s::size(9),>>})

#   EEEE 1001110 00I DDDDDDDDD SSSSSSSSS        DECOD   D,S/#
  def disasmInstr(funct, addr, <<con::size(4), 0b100111000::size(9) ,i::size(1),d::size(9),s::size(9),>>), do: funct.(%{addr: addr,con: con, instr: "DECOD", binary: <<i::size(1),d::size(9),s::size(9),>>})

#   EEEE 1001110 01I DDDDDDDDD SSSSSSSSS        BMASK   D,S/#
  def disasmInstr(funct, addr, <<con::size(4), 0b100111001::size(9) ,i::size(1),d::size(9),s::size(9),>>), do: funct.(%{addr: addr,con: con, instr: "BMASK", binary: <<i::size(1),d::size(9),s::size(9),>>})

#   EEEE 1001110 10I DDDDDDDDD SSSSSSSSS        CRCBIT  D,S/#
  def disasmInstr(funct, addr, <<con::size(4), 0b100111010::size(9) ,i::size(1),d::size(9),s::size(9),>>), do: funct.(%{addr: addr,con: con, instr: "CRCBIT", binary: <<i::size(1),d::size(9),s::size(9),>>})

#   EEEE 1001110 11I DDDDDDDDD SSSSSSSSS        CRCNIB  D,S/#
  def disasmInstr(funct, addr, <<con::size(4), 0b100111011::size(9) ,i::size(1),d::size(9),s::size(9),>>), do: funct.(%{addr: addr,con: con, instr: "CRCNIB", binary: <<i::size(1),d::size(9),s::size(9),>>})

#   EEEE 1001111 00I DDDDDDDDD SSSSSSSSS        MUXNITS D,S/#
  def disasmInstr(funct, addr, <<con::size(4), 0b100111100::size(9) ,i::size(1),d::size(9),s::size(9),>>), do: funct.(%{addr: addr,con: con, instr: "MUXNITS", binary: <<i::size(1),d::size(9),s::size(9),>>})

#   EEEE 1001111 01I DDDDDDDDD SSSSSSSSS        MUXNIBS D,S/#
  def disasmInstr(funct, addr, <<con::size(4), 0b100111101::size(9) ,i::size(1),d::size(9),s::size(9),>>), do: funct.(%{addr: addr,con: con, instr: "MUXNIBS", binary: <<i::size(1),d::size(9),s::size(9),>>})

#   EEEE 1001111 10I DDDDDDDDD SSSSSSSSS        MUXQ    D,S/#
  def disasmInstr(funct, addr, <<con::size(4), 0b100111110::size(9) ,i::size(1),d::size(9),s::size(9),>>), do: funct.(%{addr: addr,con: con, instr: "MUXQ", binary: <<i::size(1),d::size(9),s::size(9),>>})

#   EEEE 1001111 11I DDDDDDDDD SSSSSSSSS        MOVBYTS D,S/#
  def disasmInstr(funct, addr, <<con::size(4), 0b100111111::size(9) ,i::size(1),d::size(9),s::size(9),>>), do: funct.(%{addr: addr,con: con, instr: "MOVBYTS", binary: <<i::size(1),d::size(9),s::size(9),>>})

#   EEEE 1010000 0ZI DDDDDDDDD SSSSSSSSS        MUL     D,S/#       {WZ}
  def disasmInstr(funct, addr, <<con::size(4), 0b10100000::size(8) ,z::size(1),i::size(1),d::size(9),s::size(9),>>), do: funct.(%{addr: addr,con: con, instr: "MUL", binary: <<z::size(1),i::size(1),d::size(9),s::size(9),>>})

#   EEEE 1010000 1ZI DDDDDDDDD SSSSSSSSS        MULS    D,S/#       {WZ}
  def disasmInstr(funct, addr, <<con::size(4), 0b10100001::size(8) ,z::size(1),i::size(1),d::size(9),s::size(9),>>), do: funct.(%{addr: addr,con: con, instr: "MULS", binary: <<z::size(1),i::size(1),d::size(9),s::size(9),>>})

#   EEEE 1010001 0ZI DDDDDDDDD SSSSSSSSS        SCA     D,S/#       {WZ}
  def disasmInstr(funct, addr, <<con::size(4), 0b10100010::size(8) ,z::size(1),i::size(1),d::size(9),s::size(9),>>), do: funct.(%{addr: addr,con: con, instr: "SCA", binary: <<z::size(1),i::size(1),d::size(9),s::size(9),>>})

#   EEEE 1010001 1ZI DDDDDDDDD SSSSSSSSS        SCAS    D,S/#       {WZ}
  def disasmInstr(funct, addr, <<con::size(4), 0b10100011::size(8) ,z::size(1),i::size(1),d::size(9),s::size(9),>>), do: funct.(%{addr: addr,con: con, instr: "SCAS", binary: <<z::size(1),i::size(1),d::size(9),s::size(9),>>})

#   EEEE 1010010 00I DDDDDDDDD SSSSSSSSS        ADDPIX  D,S/#
  def disasmInstr(funct, addr, <<con::size(4), 0b101001000::size(9) ,i::size(1),d::size(9),s::size(9),>>), do: funct.(%{addr: addr,con: con, instr: "ADDPIX", binary: <<i::size(1),d::size(9),s::size(9),>>})

#   EEEE 1010010 01I DDDDDDDDD SSSSSSSSS        MULPIX  D,S/#
  def disasmInstr(funct, addr, <<con::size(4), 0b101001001::size(9) ,i::size(1),d::size(9),s::size(9),>>), do: funct.(%{addr: addr,con: con, instr: "MULPIX", binary: <<i::size(1),d::size(9),s::size(9),>>})

#   EEEE 1010010 10I DDDDDDDDD SSSSSSSSS        BLNPIX  D,S/#
  def disasmInstr(funct, addr, <<con::size(4), 0b101001010::size(9) ,i::size(1),d::size(9),s::size(9),>>), do: funct.(%{addr: addr,con: con, instr: "BLNPIX", binary: <<i::size(1),d::size(9),s::size(9),>>})

#   EEEE 1010010 11I DDDDDDDDD SSSSSSSSS        MIXPIX  D,S/#
  def disasmInstr(funct, addr, <<con::size(4), 0b101001011::size(9) ,i::size(1),d::size(9),s::size(9),>>), do: funct.(%{addr: addr,con: con, instr: "MIXPIX", binary: <<i::size(1),d::size(9),s::size(9),>>})

#   EEEE 1010011 00I DDDDDDDDD SSSSSSSSS        ADDCT1  D,S/#
  def disasmInstr(funct, addr, <<con::size(4), 0b101001100::size(9) ,i::size(1),d::size(9),s::size(9),>>), do: funct.(%{addr: addr,con: con, instr: "ADDCT1", binary: <<i::size(1),d::size(9),s::size(9),>>})

#   EEEE 1010011 01I DDDDDDDDD SSSSSSSSS        ADDCT2  D,S/#
  def disasmInstr(funct, addr, <<con::size(4), 0b101001101::size(9) ,i::size(1),d::size(9),s::size(9),>>), do: funct.(%{addr: addr,con: con, instr: "ADDCT2", binary: <<i::size(1),d::size(9),s::size(9),>>})

#   EEEE 1010011 10I DDDDDDDDD SSSSSSSSS        ADDCT3  D,S/#
  def disasmInstr(funct, addr, <<con::size(4), 0b101001110::size(9) ,i::size(1),d::size(9),s::size(9),>>), do: funct.(%{addr: addr,con: con, instr: "ADDCT3", binary: <<i::size(1),d::size(9),s::size(9),>>})

#   EEEE 1010011 11I DDDDDDDDD SSSSSSSSS        WMLONG  D,S/#/PTRx
  def disasmInstr(funct, addr, <<con::size(4), 0b101001111::size(9) ,i::size(1),d::size(9),s::size(9),>>), do: funct.(%{addr: addr,con: con, instr: "WMLONG", binary: <<i::size(1),d::size(9),s::size(9),>>})

#   EEEE 1010100 C0I DDDDDDDDD SSSSSSSSS        RQPIN   D,S/#       {WC}
  def disasmInstr(funct, addr, <<con::size(4), 0b1010100::size(7) ,c::size(1),0b0::size(1),i::size(1),d::size(9),s::size(9),>>), do: funct.(%{addr: addr,con: con, instr: "RQPIN", binary: <<c::size(1),0b0::size(1),i::size(1),d::size(9),s::size(9),>>})

#   EEEE 1010100 C1I DDDDDDDDD SSSSSSSSS        RDPIN   D,S/#       {WC}
  def disasmInstr(funct, addr, <<con::size(4), 0b1010100::size(7) ,c::size(1),0b1::size(1),i::size(1),d::size(9),s::size(9),>>), do: funct.(%{addr: addr,con: con, instr: "RDPIN", binary: <<c::size(1),0b1::size(1),i::size(1),d::size(9),s::size(9),>>})

#   EEEE 1010101 CZI DDDDDDDDD SSSSSSSSS        RDLUT   D,S/#       {WC/WZ/WCZ}
  def disasmInstr(funct, addr, <<con::size(4), 0b1010101::size(7) ,c::size(1),z::size(1),i::size(1),d::size(9),s::size(9),>>), do: funct.(%{addr: addr,con: con, instr: "RDLUT", binary: <<c::size(1),z::size(1),i::size(1),d::size(9),s::size(9),>>})

#   EEEE 1010110 CZI DDDDDDDDD SSSSSSSSS        RDBYTE  D,S/#/PTRx  {WC/WZ/WCZ}
  def disasmInstr(funct, addr, <<con::size(4), 0b1010110::size(7) ,c::size(1),z::size(1),i::size(1),d::size(9),s::size(9),>>), do: funct.(%{addr: addr,con: con, instr: "RDBYTE", binary: <<c::size(1),z::size(1),i::size(1),d::size(9),s::size(9),>>})

#   EEEE 1010111 CZI DDDDDDDDD SSSSSSSSS        RDWORD  D,S/#/PTRx  {WC/WZ/WCZ}
  def disasmInstr(funct, addr, <<con::size(4), 0b1010111::size(7) ,c::size(1),z::size(1),i::size(1),d::size(9),s::size(9),>>), do: funct.(%{addr: addr,con: con, instr: "RDWORD", binary: <<c::size(1),z::size(1),i::size(1),d::size(9),s::size(9),>>})

#   EEEE 1011000 CZI DDDDDDDDD SSSSSSSSS        RDLONG  D,S/#/PTRx  {WC/WZ/WCZ}
  def disasmInstr(funct, addr, <<con::size(4), 0b1011000::size(7) ,c::size(1),z::size(1),i::size(1),d::size(9),s::size(9),>>), do: funct.(%{addr: addr,con: con, instr: "RDLONG", binary: <<c::size(1),z::size(1),i::size(1),d::size(9),s::size(9),>>})

#   EEEE 1011001 CZI DDDDDDDDD SSSSSSSSS        CALLD   D,S/#rel9   {WC/WZ/WCZ}
  def disasmInstr(funct, addr, <<con::size(4), 0b1011001::size(7) ,c::size(1),z::size(1),i::size(1),d::size(9),s::size(9),>>), do: funct.(%{addr: addr,con: con, instr: "CALLD", binary: <<c::size(1),z::size(1),i::size(1),d::size(9),s::size(9),>>})

#   EEEE 1011010 0LI DDDDDDDDD SSSSSSSSS        CALLPA  D/#,S/#rel9
  def disasmInstr(funct, addr, <<con::size(4), 0b10110100::size(8) ,l::size(1),i::size(1),d::size(9),s::size(9),>>), do: funct.(%{addr: addr,con: con, instr: "CALLPA", binary: <<l::size(1),i::size(1),d::size(9),s::size(9),>>})

#   EEEE 1011010 1LI DDDDDDDDD SSSSSSSSS        CALLPB  D/#,S/#rel9
  def disasmInstr(funct, addr, <<con::size(4), 0b10110101::size(8) ,l::size(1),i::size(1),d::size(9),s::size(9),>>), do: funct.(%{addr: addr,con: con, instr: "CALLPB", binary: <<l::size(1),i::size(1),d::size(9),s::size(9),>>})

#   EEEE 1011011 00I DDDDDDDDD SSSSSSSSS        DJZ     D,S/#rel9
  def disasmInstr(funct, addr, <<con::size(4), 0b101101100::size(9) ,i::size(1),d::size(9),s::size(9),>>), do: funct.(%{addr: addr,con: con, instr: "DJZ", binary: <<i::size(1),d::size(9),s::size(9),>>})

#   EEEE 1011011 01I DDDDDDDDD SSSSSSSSS        DJNZ    D,S/#rel9
  def disasmInstr(funct, addr, <<con::size(4), 0b101101101::size(9) ,i::size(1),d::size(9),s::size(9),>>), do: funct.(%{addr: addr,con: con, instr: "DJNZ", binary: <<i::size(1),d::size(9),s::size(9),>>})

#   EEEE 1011011 10I DDDDDDDDD SSSSSSSSS        DJF     D,S/#rel9
  def disasmInstr(funct, addr, <<con::size(4), 0b101101110::size(9) ,i::size(1),d::size(9),s::size(9),>>), do: funct.(%{addr: addr,con: con, instr: "DJF", binary: <<i::size(1),d::size(9),s::size(9),>>})

#   EEEE 1011011 11I DDDDDDDDD SSSSSSSSS        DJNF    D,S/#rel9
  def disasmInstr(funct, addr, <<con::size(4), 0b101101111::size(9) ,i::size(1),d::size(9),s::size(9),>>), do: funct.(%{addr: addr,con: con, instr: "DJNF", binary: <<i::size(1),d::size(9),s::size(9),>>})

#   EEEE 1011100 00I DDDDDDDDD SSSSSSSSS        IJZ     D,S/#rel9
  def disasmInstr(funct, addr, <<con::size(4), 0b101110000::size(9) ,i::size(1),d::size(9),s::size(9),>>), do: funct.(%{addr: addr,con: con, instr: "IJZ", binary: <<i::size(1),d::size(9),s::size(9),>>})

#   EEEE 1011100 01I DDDDDDDDD SSSSSSSSS        IJNZ    D,S/#rel9
  def disasmInstr(funct, addr, <<con::size(4), 0b101110001::size(9) ,i::size(1),d::size(9),s::size(9),>>), do: funct.(%{addr: addr,con: con, instr: "IJNZ", binary: <<i::size(1),d::size(9),s::size(9),>>})

#   EEEE 1011100 10I DDDDDDDDD SSSSSSSSS        TJZ     D,S/#rel9
  def disasmInstr(funct, addr, <<con::size(4), 0b101110010::size(9) ,i::size(1),d::size(9),s::size(9),>>), do: funct.(%{addr: addr,con: con, instr: "TJZ", binary: <<i::size(1),d::size(9),s::size(9),>>})

#   EEEE 1011100 11I DDDDDDDDD SSSSSSSSS        TJNZ    D,S/#rel9
  def disasmInstr(funct, addr, <<con::size(4), 0b101110011::size(9) ,i::size(1),d::size(9),s::size(9),>>), do: funct.(%{addr: addr,con: con, instr: "TJNZ", binary: <<i::size(1),d::size(9),s::size(9),>>})

#   EEEE 1011101 00I DDDDDDDDD SSSSSSSSS        TJF     D,S/#rel9
  def disasmInstr(funct, addr, <<con::size(4), 0b101110100::size(9) ,i::size(1),d::size(9),s::size(9),>>), do: funct.(%{addr: addr,con: con, instr: "TJF", binary: <<i::size(1),d::size(9),s::size(9),>>})

#   EEEE 1011101 01I DDDDDDDDD SSSSSSSSS        TJNF    D,S/#rel9
  def disasmInstr(funct, addr, <<con::size(4), 0b101110101::size(9) ,i::size(1),d::size(9),s::size(9),>>), do: funct.(%{addr: addr,con: con, instr: "TJNF", binary: <<i::size(1),d::size(9),s::size(9),>>})

#   EEEE 1011101 10I DDDDDDDDD SSSSSSSSS        TJS     D,S/#rel9
  def disasmInstr(funct, addr, <<con::size(4), 0b101110110::size(9) ,i::size(1),d::size(9),s::size(9),>>), do: funct.(%{addr: addr,con: con, instr: "TJS", binary: <<i::size(1),d::size(9),s::size(9),>>})

#   EEEE 1011101 11I DDDDDDDDD SSSSSSSSS        TJNS    D,S/#rel9
  def disasmInstr(funct, addr, <<con::size(4), 0b101110111::size(9) ,i::size(1),d::size(9),s::size(9),>>), do: funct.(%{addr: addr,con: con, instr: "TJNS", binary: <<i::size(1),d::size(9),s::size(9),>>})

#   EEEE 1011110 00I DDDDDDDDD SSSSSSSSS        TJV     D,S/#rel9
  def disasmInstr(funct, addr, <<con::size(4), 0b101111000::size(9) ,i::size(1),d::size(9),s::size(9),>>), do: funct.(%{addr: addr,con: con, instr: "TJV", binary: <<i::size(1),d::size(9),s::size(9),>>})

#   EEEE 1011110 01I 000000000 SSSSSSSSS        JINT    S/#rel9
  def disasmInstr(funct, addr, <<con::size(4), 0b101111001::size(9) ,i::size(1),0b000000000::size(9),s::size(9),>>), do: funct.(%{addr: addr,con: con, instr: "JINT", binary: <<i::size(1),0b000000000::size(9),s::size(9),>>})

#   EEEE 1011110 01I 000000001 SSSSSSSSS        JCT1    S/#rel9
  def disasmInstr(funct, addr, <<con::size(4), 0b101111001::size(9) ,i::size(1),0b00000000::size(8),0b1::size(1),s::size(9),>>), do: funct.(%{addr: addr,con: con, instr: "JCT1", binary: <<i::size(1),0b00000000::size(8),0b1::size(1),s::size(9),>>})

#   EEEE 1011110 01I 000000010 SSSSSSSSS        JCT2    S/#rel9
  def disasmInstr(funct, addr, <<con::size(4), 0b101111001::size(9) ,i::size(1),0b0000000::size(7),0b1::size(1),0b0::size(1),s::size(9),>>), do: funct.(%{addr: addr,con: con, instr: "JCT2", binary: <<i::size(1),0b0000000::size(7),0b1::size(1),0b0::size(1),s::size(9),>>})

#   EEEE 1011110 01I 000000011 SSSSSSSSS        JCT3    S/#rel9
  def disasmInstr(funct, addr, <<con::size(4), 0b101111001::size(9) ,i::size(1),0b0000000::size(7),0b11::size(2),s::size(9),>>), do: funct.(%{addr: addr,con: con, instr: "JCT3", binary: <<i::size(1),0b0000000::size(7),0b11::size(2),s::size(9),>>})

#   EEEE 1011110 01I 000000100 SSSSSSSSS        JSE1    S/#rel9
  def disasmInstr(funct, addr, <<con::size(4), 0b101111001::size(9) ,i::size(1),0b000000::size(6),0b1::size(1),0b00::size(2),s::size(9),>>), do: funct.(%{addr: addr,con: con, instr: "JSE1", binary: <<i::size(1),0b000000::size(6),0b1::size(1),0b00::size(2),s::size(9),>>})

#   EEEE 1011110 01I 000000101 SSSSSSSSS        JSE2    S/#rel9
  def disasmInstr(funct, addr, <<con::size(4), 0b101111001::size(9) ,i::size(1),0b000000::size(6),0b1::size(1),0b0::size(1),0b1::size(1),s::size(9),>>), do: funct.(%{addr: addr,con: con, instr: "JSE2", binary: <<i::size(1),0b000000::size(6),0b1::size(1),0b0::size(1),0b1::size(1),s::size(9),>>})

#   EEEE 1011110 01I 000000110 SSSSSSSSS        JSE3    S/#rel9
  def disasmInstr(funct, addr, <<con::size(4), 0b101111001::size(9) ,i::size(1),0b000000::size(6),0b11::size(2),0b0::size(1),s::size(9),>>), do: funct.(%{addr: addr,con: con, instr: "JSE3", binary: <<i::size(1),0b000000::size(6),0b11::size(2),0b0::size(1),s::size(9),>>})

#   EEEE 1011110 01I 000000111 SSSSSSSSS        JSE4    S/#rel9
  def disasmInstr(funct, addr, <<con::size(4), 0b101111001::size(9) ,i::size(1),0b000000::size(6),0b111::size(3),s::size(9),>>), do: funct.(%{addr: addr,con: con, instr: "JSE4", binary: <<i::size(1),0b000000::size(6),0b111::size(3),s::size(9),>>})

#   EEEE 1011110 01I 000001000 SSSSSSSSS        JPAT    S/#rel9
  def disasmInstr(funct, addr, <<con::size(4), 0b101111001::size(9) ,i::size(1),0b00000::size(5),0b1::size(1),0b000::size(3),s::size(9),>>), do: funct.(%{addr: addr,con: con, instr: "JPAT", binary: <<i::size(1),0b00000::size(5),0b1::size(1),0b000::size(3),s::size(9),>>})

#   EEEE 1011110 01I 000001001 SSSSSSSSS        JFBW    S/#rel9
  def disasmInstr(funct, addr, <<con::size(4), 0b101111001::size(9) ,i::size(1),0b00000::size(5),0b1::size(1),0b00::size(2),0b1::size(1),s::size(9),>>), do: funct.(%{addr: addr,con: con, instr: "JFBW", binary: <<i::size(1),0b00000::size(5),0b1::size(1),0b00::size(2),0b1::size(1),s::size(9),>>})

#   EEEE 1011110 01I 000001010 SSSSSSSSS        JXMT    S/#rel9
  def disasmInstr(funct, addr, <<con::size(4), 0b101111001::size(9) ,i::size(1),0b00000::size(5),0b1::size(1),0b0::size(1),0b1::size(1),0b0::size(1),s::size(9),>>), do: funct.(%{addr: addr,con: con, instr: "JXMT", binary: <<i::size(1),0b00000::size(5),0b1::size(1),0b0::size(1),0b1::size(1),0b0::size(1),s::size(9),>>})

#   EEEE 1011110 01I 000001011 SSSSSSSSS        JXFI    S/#rel9
  def disasmInstr(funct, addr, <<con::size(4), 0b101111001::size(9) ,i::size(1),0b00000::size(5),0b1::size(1),0b0::size(1),0b11::size(2),s::size(9),>>), do: funct.(%{addr: addr,con: con, instr: "JXFI", binary: <<i::size(1),0b00000::size(5),0b1::size(1),0b0::size(1),0b11::size(2),s::size(9),>>})

#   EEEE 1011110 01I 000001100 SSSSSSSSS        JXRO    S/#rel9
  def disasmInstr(funct, addr, <<con::size(4), 0b101111001::size(9) ,i::size(1),0b00000::size(5),0b11::size(2),0b00::size(2),s::size(9),>>), do: funct.(%{addr: addr,con: con, instr: "JXRO", binary: <<i::size(1),0b00000::size(5),0b11::size(2),0b00::size(2),s::size(9),>>})

#   EEEE 1011110 01I 000001101 SSSSSSSSS        JXRL    S/#rel9
  def disasmInstr(funct, addr, <<con::size(4), 0b101111001::size(9) ,i::size(1),0b00000::size(5),0b11::size(2),0b0::size(1),0b1::size(1),s::size(9),>>), do: funct.(%{addr: addr,con: con, instr: "JXRL", binary: <<i::size(1),0b00000::size(5),0b11::size(2),0b0::size(1),0b1::size(1),s::size(9),>>})

#   EEEE 1011110 01I 000001110 SSSSSSSSS        JATN    S/#rel9
  def disasmInstr(funct, addr, <<con::size(4), 0b101111001::size(9) ,i::size(1),0b00000::size(5),0b111::size(3),0b0::size(1),s::size(9),>>), do: funct.(%{addr: addr,con: con, instr: "JATN", binary: <<i::size(1),0b00000::size(5),0b111::size(3),0b0::size(1),s::size(9),>>})

#   EEEE 1011110 01I 000001111 SSSSSSSSS        JQMT    S/#rel9
  def disasmInstr(funct, addr, <<con::size(4), 0b101111001::size(9) ,i::size(1),0b00000::size(5),0b1111::size(4),s::size(9),>>), do: funct.(%{addr: addr,con: con, instr: "JQMT", binary: <<i::size(1),0b00000::size(5),0b1111::size(4),s::size(9),>>})

#   EEEE 1011110 01I 000010000 SSSSSSSSS        JNINT   S/#rel9
  def disasmInstr(funct, addr, <<con::size(4), 0b101111001::size(9) ,i::size(1),0b0000::size(4),0b1::size(1),0b0000::size(4),s::size(9),>>), do: funct.(%{addr: addr,con: con, instr: "JNINT", binary: <<i::size(1),0b0000::size(4),0b1::size(1),0b0000::size(4),s::size(9),>>})

#   EEEE 1011110 01I 000010001 SSSSSSSSS        JNCT1   S/#rel9
  def disasmInstr(funct, addr, <<con::size(4), 0b101111001::size(9) ,i::size(1),0b0000::size(4),0b1::size(1),0b000::size(3),0b1::size(1),s::size(9),>>), do: funct.(%{addr: addr,con: con, instr: "JNCT1", binary: <<i::size(1),0b0000::size(4),0b1::size(1),0b000::size(3),0b1::size(1),s::size(9),>>})

#   EEEE 1011110 01I 000010010 SSSSSSSSS        JNCT2   S/#rel9
  def disasmInstr(funct, addr, <<con::size(4), 0b101111001::size(9) ,i::size(1),0b0000::size(4),0b1::size(1),0b00::size(2),0b1::size(1),0b0::size(1),s::size(9),>>), do: funct.(%{addr: addr,con: con, instr: "JNCT2", binary: <<i::size(1),0b0000::size(4),0b1::size(1),0b00::size(2),0b1::size(1),0b0::size(1),s::size(9),>>})

#   EEEE 1011110 01I 000010011 SSSSSSSSS        JNCT3   S/#rel9
  def disasmInstr(funct, addr, <<con::size(4), 0b101111001::size(9) ,i::size(1),0b0000::size(4),0b1::size(1),0b00::size(2),0b11::size(2),s::size(9),>>), do: funct.(%{addr: addr,con: con, instr: "JNCT3", binary: <<i::size(1),0b0000::size(4),0b1::size(1),0b00::size(2),0b11::size(2),s::size(9),>>})

#   EEEE 1011110 01I 000010100 SSSSSSSSS        JNSE1   S/#rel9
  def disasmInstr(funct, addr, <<con::size(4), 0b101111001::size(9) ,i::size(1),0b0000::size(4),0b1::size(1),0b0::size(1),0b1::size(1),0b00::size(2),s::size(9),>>), do: funct.(%{addr: addr,con: con, instr: "JNSE1", binary: <<i::size(1),0b0000::size(4),0b1::size(1),0b0::size(1),0b1::size(1),0b00::size(2),s::size(9),>>})

#   EEEE 1011110 01I 000010101 SSSSSSSSS        JNSE2   S/#rel9
  def disasmInstr(funct, addr, <<con::size(4), 0b101111001::size(9) ,i::size(1),0b0000::size(4),0b1::size(1),0b0::size(1),0b1::size(1),0b0::size(1),0b1::size(1),s::size(9),>>), do: funct.(%{addr: addr,con: con, instr: "JNSE2", binary: <<i::size(1),0b0000::size(4),0b1::size(1),0b0::size(1),0b1::size(1),0b0::size(1),0b1::size(1),s::size(9),>>})

#   EEEE 1011110 01I 000010110 SSSSSSSSS        JNSE3   S/#rel9
  def disasmInstr(funct, addr, <<con::size(4), 0b101111001::size(9) ,i::size(1),0b0000::size(4),0b1::size(1),0b0::size(1),0b11::size(2),0b0::size(1),s::size(9),>>), do: funct.(%{addr: addr,con: con, instr: "JNSE3", binary: <<i::size(1),0b0000::size(4),0b1::size(1),0b0::size(1),0b11::size(2),0b0::size(1),s::size(9),>>})

#   EEEE 1011110 01I 000010111 SSSSSSSSS        JNSE4   S/#rel9
  def disasmInstr(funct, addr, <<con::size(4), 0b101111001::size(9) ,i::size(1),0b0000::size(4),0b1::size(1),0b0::size(1),0b111::size(3),s::size(9),>>), do: funct.(%{addr: addr,con: con, instr: "JNSE4", binary: <<i::size(1),0b0000::size(4),0b1::size(1),0b0::size(1),0b111::size(3),s::size(9),>>})

#   EEEE 1011110 01I 000011000 SSSSSSSSS        JNPAT   S/#rel9
  def disasmInstr(funct, addr, <<con::size(4), 0b101111001::size(9) ,i::size(1),0b0000::size(4),0b11::size(2),0b000::size(3),s::size(9),>>), do: funct.(%{addr: addr,con: con, instr: "JNPAT", binary: <<i::size(1),0b0000::size(4),0b11::size(2),0b000::size(3),s::size(9),>>})

#   EEEE 1011110 01I 000011001 SSSSSSSSS        JNFBW   S/#rel9
  def disasmInstr(funct, addr, <<con::size(4), 0b101111001::size(9) ,i::size(1),0b0000::size(4),0b11::size(2),0b00::size(2),0b1::size(1),s::size(9),>>), do: funct.(%{addr: addr,con: con, instr: "JNFBW", binary: <<i::size(1),0b0000::size(4),0b11::size(2),0b00::size(2),0b1::size(1),s::size(9),>>})

#   EEEE 1011110 01I 000011010 SSSSSSSSS        JNXMT   S/#rel9
  def disasmInstr(funct, addr, <<con::size(4), 0b101111001::size(9) ,i::size(1),0b0000::size(4),0b11::size(2),0b0::size(1),0b1::size(1),0b0::size(1),s::size(9),>>), do: funct.(%{addr: addr,con: con, instr: "JNXMT", binary: <<i::size(1),0b0000::size(4),0b11::size(2),0b0::size(1),0b1::size(1),0b0::size(1),s::size(9),>>})

#   EEEE 1011110 01I 000011011 SSSSSSSSS        JNXFI   S/#rel9
  def disasmInstr(funct, addr, <<con::size(4), 0b101111001::size(9) ,i::size(1),0b0000::size(4),0b11::size(2),0b0::size(1),0b11::size(2),s::size(9),>>), do: funct.(%{addr: addr,con: con, instr: "JNXFI", binary: <<i::size(1),0b0000::size(4),0b11::size(2),0b0::size(1),0b11::size(2),s::size(9),>>})

#   EEEE 1011110 01I 000011100 SSSSSSSSS        JNXRO   S/#rel9
  def disasmInstr(funct, addr, <<con::size(4), 0b101111001::size(9) ,i::size(1),0b0000::size(4),0b111::size(3),0b00::size(2),s::size(9),>>), do: funct.(%{addr: addr,con: con, instr: "JNXRO", binary: <<i::size(1),0b0000::size(4),0b111::size(3),0b00::size(2),s::size(9),>>})

#   EEEE 1011110 01I 000011101 SSSSSSSSS        JNXRL   S/#rel9
  def disasmInstr(funct, addr, <<con::size(4), 0b101111001::size(9) ,i::size(1),0b0000::size(4),0b111::size(3),0b0::size(1),0b1::size(1),s::size(9),>>), do: funct.(%{addr: addr,con: con, instr: "JNXRL", binary: <<i::size(1),0b0000::size(4),0b111::size(3),0b0::size(1),0b1::size(1),s::size(9),>>})

#   EEEE 1011110 01I 000011110 SSSSSSSSS        JNATN   S/#rel9
  def disasmInstr(funct, addr, <<con::size(4), 0b101111001::size(9) ,i::size(1),0b0000::size(4),0b1111::size(4),0b0::size(1),s::size(9),>>), do: funct.(%{addr: addr,con: con, instr: "JNATN", binary: <<i::size(1),0b0000::size(4),0b1111::size(4),0b0::size(1),s::size(9),>>})

#   EEEE 1011110 01I 000011111 SSSSSSSSS        JNQMT   S/#rel9
  def disasmInstr(funct, addr, <<con::size(4), 0b101111001::size(9) ,i::size(1),0b0000::size(4),0b11111::size(5),s::size(9),>>), do: funct.(%{addr: addr,con: con, instr: "JNQMT", binary: <<i::size(1),0b0000::size(4),0b11111::size(5),s::size(9),>>})

#   EEEE 1011110 1LI DDDDDDDDD SSSSSSSSS        <empty> D/#,S/#
  def disasmInstr(funct, addr, <<con::size(4), 0b10111101::size(8) ,l::size(1),i::size(1),d::size(9),s::size(9),>>), do: funct.(%{addr: addr,con: con, instr: "<empty>", binary: <<l::size(1),i::size(1),d::size(9),s::size(9),>>})

#   EEEE 1011111 0LI DDDDDDDDD SSSSSSSSS        <empty> D/#,S/#
  def disasmInstr(funct, addr, <<con::size(4), 0b10111110::size(8) ,l::size(1),i::size(1),d::size(9),s::size(9),>>), do: funct.(%{addr: addr,con: con, instr: "<empty>", binary: <<l::size(1),i::size(1),d::size(9),s::size(9),>>})

#   EEEE 1011111 1LI DDDDDDDDD SSSSSSSSS        SETPAT  D/#,S/#
  def disasmInstr(funct, addr, <<con::size(4), 0b10111111::size(8) ,l::size(1),i::size(1),d::size(9),s::size(9),>>), do: funct.(%{addr: addr,con: con, instr: "SETPAT", binary: <<l::size(1),i::size(1),d::size(9),s::size(9),>>})

#   EEEE 1100000 0LI DDDDDDDDD SSSSSSSSS        WRPIN   D/#,S/#
  def disasmInstr(funct, addr, <<con::size(4), 0b11000000::size(8) ,l::size(1),i::size(1),d::size(9),s::size(9),>>), do: funct.(%{addr: addr,con: con, instr: "WRPIN", binary: <<l::size(1),i::size(1),d::size(9),s::size(9),>>})

#   EEEE 1100000 1LI DDDDDDDDD SSSSSSSSS        WXPIN   D/#,S/#
  def disasmInstr(funct, addr, <<con::size(4), 0b11000001::size(8) ,l::size(1),i::size(1),d::size(9),s::size(9),>>), do: funct.(%{addr: addr,con: con, instr: "WXPIN", binary: <<l::size(1),i::size(1),d::size(9),s::size(9),>>})

#   EEEE 1100001 0LI DDDDDDDDD SSSSSSSSS        WYPIN   D/#,S/#
  def disasmInstr(funct, addr, <<con::size(4), 0b11000010::size(8) ,l::size(1),i::size(1),d::size(9),s::size(9),>>), do: funct.(%{addr: addr,con: con, instr: "WYPIN", binary: <<l::size(1),i::size(1),d::size(9),s::size(9),>>})

#   EEEE 1100001 1LI DDDDDDDDD SSSSSSSSS        WRLUT   D/#,S/#
  def disasmInstr(funct, addr, <<con::size(4), 0b11000011::size(8) ,l::size(1),i::size(1),d::size(9),s::size(9),>>), do: funct.(%{addr: addr,con: con, instr: "WRLUT", binary: <<l::size(1),i::size(1),d::size(9),s::size(9),>>})

#   EEEE 1100010 0LI DDDDDDDDD SSSSSSSSS        WRBYTE  D/#,S/#/PTRx
  def disasmInstr(funct, addr, <<con::size(4), 0b11000100::size(8) ,l::size(1),i::size(1),d::size(9),s::size(9),>>), do: funct.(%{addr: addr,con: con, instr: "WRBYTE", binary: <<l::size(1),i::size(1),d::size(9),s::size(9),>>})

#   EEEE 1100010 1LI DDDDDDDDD SSSSSSSSS        WRWORD  D/#,S/#/PTRx
  def disasmInstr(funct, addr, <<con::size(4), 0b11000101::size(8) ,l::size(1),i::size(1),d::size(9),s::size(9),>>), do: funct.(%{addr: addr,con: con, instr: "WRWORD", binary: <<l::size(1),i::size(1),d::size(9),s::size(9),>>})

#   EEEE 1100011 0LI DDDDDDDDD SSSSSSSSS        WRLONG  D/#,S/#/PTRx
  def disasmInstr(funct, addr, <<con::size(4), 0b11000110::size(8) ,l::size(1),i::size(1),d::size(9),s::size(9),>>), do: funct.(%{addr: addr,con: con, instr: "WRLONG", binary: <<l::size(1),i::size(1),d::size(9),s::size(9),>>})

#   EEEE 1100011 1LI DDDDDDDDD SSSSSSSSS        RDFAST  D/#,S/#
  def disasmInstr(funct, addr, <<con::size(4), 0b11000111::size(8) ,l::size(1),i::size(1),d::size(9),s::size(9),>>), do: funct.(%{addr: addr,con: con, instr: "RDFAST", binary: <<l::size(1),i::size(1),d::size(9),s::size(9),>>})

#   EEEE 1100100 0LI DDDDDDDDD SSSSSSSSS        WRFAST  D/#,S/#
  def disasmInstr(funct, addr, <<con::size(4), 0b11001000::size(8) ,l::size(1),i::size(1),d::size(9),s::size(9),>>), do: funct.(%{addr: addr,con: con, instr: "WRFAST", binary: <<l::size(1),i::size(1),d::size(9),s::size(9),>>})

#   EEEE 1100100 1LI DDDDDDDDD SSSSSSSSS        FBLOCK  D/#,S/#
  def disasmInstr(funct, addr, <<con::size(4), 0b11001001::size(8) ,l::size(1),i::size(1),d::size(9),s::size(9),>>), do: funct.(%{addr: addr,con: con, instr: "FBLOCK", binary: <<l::size(1),i::size(1),d::size(9),s::size(9),>>})

#   EEEE 1100101 0LI DDDDDDDDD SSSSSSSSS        XINIT   D/#,S/#
  def disasmInstr(funct, addr, <<con::size(4), 0b11001010::size(8) ,l::size(1),i::size(1),d::size(9),s::size(9),>>), do: funct.(%{addr: addr,con: con, instr: "XINIT", binary: <<l::size(1),i::size(1),d::size(9),s::size(9),>>})

#   EEEE 1100101 1LI DDDDDDDDD SSSSSSSSS        XZERO   D/#,S/#
  def disasmInstr(funct, addr, <<con::size(4), 0b11001011::size(8) ,l::size(1),i::size(1),d::size(9),s::size(9),>>), do: funct.(%{addr: addr,con: con, instr: "XZERO", binary: <<l::size(1),i::size(1),d::size(9),s::size(9),>>})

#   EEEE 1100110 0LI DDDDDDDDD SSSSSSSSS        XCONT   D/#,S/#
  def disasmInstr(funct, addr, <<con::size(4), 0b11001100::size(8) ,l::size(1),i::size(1),d::size(9),s::size(9),>>), do: funct.(%{addr: addr,con: con, instr: "XCONT", binary: <<l::size(1),i::size(1),d::size(9),s::size(9),>>})

#   EEEE 1100110 1LI DDDDDDDDD SSSSSSSSS        REP     D/#,S/#
  def disasmInstr(funct, addr, <<con::size(4), 0b11001101::size(8) ,l::size(1),i::size(1),d::size(9),s::size(9),>>), do: funct.(%{addr: addr,con: con, instr: "REP", binary: <<l::size(1),i::size(1),d::size(9),s::size(9),>>})

#   EEEE 1100111 CLI DDDDDDDDD SSSSSSSSS        COGINIT D/#,S/#     {WC}
  def disasmInstr(funct, addr, <<con::size(4), 0b1100111::size(7) ,c::size(1),l::size(1),i::size(1),d::size(9),s::size(9),>>), do: funct.(%{addr: addr,con: con, instr: "COGINIT", binary: <<c::size(1),l::size(1),i::size(1),d::size(9),s::size(9),>>})

#   EEEE 1101000 0LI DDDDDDDDD SSSSSSSSS        QMUL    D/#,S/#
  def disasmInstr(funct, addr, <<con::size(4), 0b11010000::size(8) ,l::size(1),i::size(1),d::size(9),s::size(9),>>), do: funct.(%{addr: addr,con: con, instr: "QMUL", binary: <<l::size(1),i::size(1),d::size(9),s::size(9),>>})

#   EEEE 1101000 1LI DDDDDDDDD SSSSSSSSS        QDIV    D/#,S/#
  def disasmInstr(funct, addr, <<con::size(4), 0b11010001::size(8) ,l::size(1),i::size(1),d::size(9),s::size(9),>>), do: funct.(%{addr: addr,con: con, instr: "QDIV", binary: <<l::size(1),i::size(1),d::size(9),s::size(9),>>})

#   EEEE 1101001 0LI DDDDDDDDD SSSSSSSSS        QFRAC   D/#,S/#
  def disasmInstr(funct, addr, <<con::size(4), 0b11010010::size(8) ,l::size(1),i::size(1),d::size(9),s::size(9),>>), do: funct.(%{addr: addr,con: con, instr: "QFRAC", binary: <<l::size(1),i::size(1),d::size(9),s::size(9),>>})

#   EEEE 1101001 1LI DDDDDDDDD SSSSSSSSS        QSQRT   D/#,S/#
  def disasmInstr(funct, addr, <<con::size(4), 0b11010011::size(8) ,l::size(1),i::size(1),d::size(9),s::size(9),>>), do: funct.(%{addr: addr,con: con, instr: "QSQRT", binary: <<l::size(1),i::size(1),d::size(9),s::size(9),>>})

#   EEEE 1101010 0LI DDDDDDDDD SSSSSSSSS        QROTATE D/#,S/#
  def disasmInstr(funct, addr, <<con::size(4), 0b11010100::size(8) ,l::size(1),i::size(1),d::size(9),s::size(9),>>), do: funct.(%{addr: addr,con: con, instr: "QROTATE", binary: <<l::size(1),i::size(1),d::size(9),s::size(9),>>})

#   EEEE 1101010 1LI DDDDDDDDD SSSSSSSSS        QVECTOR D/#,S/#
  def disasmInstr(funct, addr, <<con::size(4), 0b11010101::size(8) ,l::size(1),i::size(1),d::size(9),s::size(9),>>), do: funct.(%{addr: addr,con: con, instr: "QVECTOR", binary: <<l::size(1),i::size(1),d::size(9),s::size(9),>>})

#   EEEE 1101011 00L DDDDDDDDD 000000000        HUBSET  D/#
  def disasmInstr(funct, addr, <<con::size(4), 0b110101100::size(9) ,l::size(1),d::size(9),0b000000000::size(9),>>), do: funct.(%{addr: addr,con: con, instr: "HUBSET", binary: <<l::size(1),d::size(9),0b000000000::size(9),>>})

#   EEEE 1101011 C0L DDDDDDDDD 000000001        COGID   D/#         {WC}
  def disasmInstr(funct, addr, <<con::size(4), 0b1101011::size(7) ,c::size(1),0b0::size(1),l::size(1),d::size(9),0b00000000::size(8),0b1::size(1),>>), do: funct.(%{addr: addr,con: con, instr: "COGID", binary: <<c::size(1),0b0::size(1),l::size(1),d::size(9),0b00000000::size(8),0b1::size(1),>>})

#   EEEE 1101011 00L DDDDDDDDD 000000011        COGSTOP D/#
  def disasmInstr(funct, addr, <<con::size(4), 0b110101100::size(9) ,l::size(1),d::size(9),0b0000000::size(7),0b11::size(2),>>), do: funct.(%{addr: addr,con: con, instr: "COGSTOP", binary: <<l::size(1),d::size(9),0b0000000::size(7),0b11::size(2),>>})

#   EEEE 1101011 C00 DDDDDDDDD 000000100        LOCKNEW D           {WC}
  def disasmInstr(funct, addr, <<con::size(4), 0b1101011::size(7) ,c::size(1),0b00::size(2),d::size(9),0b000000::size(6),0b1::size(1),0b00::size(2),>>), do: funct.(%{addr: addr,con: con, instr: "LOCKNEW", binary: <<c::size(1),0b00::size(2),d::size(9),0b000000::size(6),0b1::size(1),0b00::size(2),>>})

#   EEEE 1101011 00L DDDDDDDDD 000000101        LOCKRET D/#
  def disasmInstr(funct, addr, <<con::size(4), 0b110101100::size(9) ,l::size(1),d::size(9),0b000000::size(6),0b1::size(1),0b0::size(1),0b1::size(1),>>), do: funct.(%{addr: addr,con: con, instr: "LOCKRET", binary: <<l::size(1),d::size(9),0b000000::size(6),0b1::size(1),0b0::size(1),0b1::size(1),>>})

#   EEEE 1101011 C0L DDDDDDDDD 000000110        LOCKTRY D/#         {WC}
  def disasmInstr(funct, addr, <<con::size(4), 0b1101011::size(7) ,c::size(1),0b0::size(1),l::size(1),d::size(9),0b000000::size(6),0b11::size(2),0b0::size(1),>>), do: funct.(%{addr: addr,con: con, instr: "LOCKTRY", binary: <<c::size(1),0b0::size(1),l::size(1),d::size(9),0b000000::size(6),0b11::size(2),0b0::size(1),>>})

#   EEEE 1101011 00L DDDDDDDDD 000000111        LOCKREL D/#         {WC}
  def disasmInstr(funct, addr, <<con::size(4), 0b110101100::size(9) ,l::size(1),d::size(9),0b000000::size(6),0b111::size(3),>>), do: funct.(%{addr: addr,con: con, instr: "LOCKREL", binary: <<l::size(1),d::size(9),0b000000::size(6),0b111::size(3),>>})

#   EEEE 1101011 00L DDDDDDDDD 000001110        QLOG    D/#
  def disasmInstr(funct, addr, <<con::size(4), 0b110101100::size(9) ,l::size(1),d::size(9),0b00000::size(5),0b111::size(3),0b0::size(1),>>), do: funct.(%{addr: addr,con: con, instr: "QLOG", binary: <<l::size(1),d::size(9),0b00000::size(5),0b111::size(3),0b0::size(1),>>})

#   EEEE 1101011 00L DDDDDDDDD 000001111        QEXP    D/#
  def disasmInstr(funct, addr, <<con::size(4), 0b110101100::size(9) ,l::size(1),d::size(9),0b00000::size(5),0b1111::size(4),>>), do: funct.(%{addr: addr,con: con, instr: "QEXP", binary: <<l::size(1),d::size(9),0b00000::size(5),0b1111::size(4),>>})

#   EEEE 1101011 CZ0 DDDDDDDDD 000010000        RFBYTE  D           {WC/WZ/WCZ}
  def disasmInstr(funct, addr, <<con::size(4), 0b1101011::size(7) ,c::size(1),z::size(1),0b0::size(1),d::size(9),0b0000::size(4),0b1::size(1),0b0000::size(4),>>), do: funct.(%{addr: addr,con: con, instr: "RFBYTE", binary: <<c::size(1),z::size(1),0b0::size(1),d::size(9),0b0000::size(4),0b1::size(1),0b0000::size(4),>>})

#   EEEE 1101011 CZ0 DDDDDDDDD 000010001        RFWORD  D           {WC/WZ/WCZ}
  def disasmInstr(funct, addr, <<con::size(4), 0b1101011::size(7) ,c::size(1),z::size(1),0b0::size(1),d::size(9),0b0000::size(4),0b1::size(1),0b000::size(3),0b1::size(1),>>), do: funct.(%{addr: addr,con: con, instr: "RFWORD", binary: <<c::size(1),z::size(1),0b0::size(1),d::size(9),0b0000::size(4),0b1::size(1),0b000::size(3),0b1::size(1),>>})

#   EEEE 1101011 CZ0 DDDDDDDDD 000010010        RFLONG  D           {WC/WZ/WCZ}
  def disasmInstr(funct, addr, <<con::size(4), 0b1101011::size(7) ,c::size(1),z::size(1),0b0::size(1),d::size(9),0b0000::size(4),0b1::size(1),0b00::size(2),0b1::size(1),0b0::size(1),>>), do: funct.(%{addr: addr,con: con, instr: "RFLONG", binary: <<c::size(1),z::size(1),0b0::size(1),d::size(9),0b0000::size(4),0b1::size(1),0b00::size(2),0b1::size(1),0b0::size(1),>>})

#   EEEE 1101011 CZ0 DDDDDDDDD 000010011        RFVAR   D           {WC/WZ/WCZ}
  def disasmInstr(funct, addr, <<con::size(4), 0b1101011::size(7) ,c::size(1),z::size(1),0b0::size(1),d::size(9),0b0000::size(4),0b1::size(1),0b00::size(2),0b11::size(2),>>), do: funct.(%{addr: addr,con: con, instr: "RFVAR", binary: <<c::size(1),z::size(1),0b0::size(1),d::size(9),0b0000::size(4),0b1::size(1),0b00::size(2),0b11::size(2),>>})

#   EEEE 1101011 CZ0 DDDDDDDDD 000010100        RFVARS  D           {WC/WZ/WCZ}
  def disasmInstr(funct, addr, <<con::size(4), 0b1101011::size(7) ,c::size(1),z::size(1),0b0::size(1),d::size(9),0b0000::size(4),0b1::size(1),0b0::size(1),0b1::size(1),0b00::size(2),>>), do: funct.(%{addr: addr,con: con, instr: "RFVARS", binary: <<c::size(1),z::size(1),0b0::size(1),d::size(9),0b0000::size(4),0b1::size(1),0b0::size(1),0b1::size(1),0b00::size(2),>>})

#   EEEE 1101011 00L DDDDDDDDD 000010101        WFBYTE  D/#
  def disasmInstr(funct, addr, <<con::size(4), 0b110101100::size(9) ,l::size(1),d::size(9),0b0000::size(4),0b1::size(1),0b0::size(1),0b1::size(1),0b0::size(1),0b1::size(1),>>), do: funct.(%{addr: addr,con: con, instr: "WFBYTE", binary: <<l::size(1),d::size(9),0b0000::size(4),0b1::size(1),0b0::size(1),0b1::size(1),0b0::size(1),0b1::size(1),>>})

#   EEEE 1101011 00L DDDDDDDDD 000010110        WFWORD  D/#
  def disasmInstr(funct, addr, <<con::size(4), 0b110101100::size(9) ,l::size(1),d::size(9),0b0000::size(4),0b1::size(1),0b0::size(1),0b11::size(2),0b0::size(1),>>), do: funct.(%{addr: addr,con: con, instr: "WFWORD", binary: <<l::size(1),d::size(9),0b0000::size(4),0b1::size(1),0b0::size(1),0b11::size(2),0b0::size(1),>>})

#   EEEE 1101011 00L DDDDDDDDD 000010111        WFLONG  D/#
  def disasmInstr(funct, addr, <<con::size(4), 0b110101100::size(9) ,l::size(1),d::size(9),0b0000::size(4),0b1::size(1),0b0::size(1),0b111::size(3),>>), do: funct.(%{addr: addr,con: con, instr: "WFLONG", binary: <<l::size(1),d::size(9),0b0000::size(4),0b1::size(1),0b0::size(1),0b111::size(3),>>})

#   EEEE 1101011 CZ0 DDDDDDDDD 000011000        GETQX   D           {WC/WZ/WCZ}
  def disasmInstr(funct, addr, <<con::size(4), 0b1101011::size(7) ,c::size(1),z::size(1),0b0::size(1),d::size(9),0b0000::size(4),0b11::size(2),0b000::size(3),>>), do: funct.(%{addr: addr,con: con, instr: "GETQX", binary: <<c::size(1),z::size(1),0b0::size(1),d::size(9),0b0000::size(4),0b11::size(2),0b000::size(3),>>})

#   EEEE 1101011 CZ0 DDDDDDDDD 000011001        GETQY   D           {WC/WZ/WCZ}
  def disasmInstr(funct, addr, <<con::size(4), 0b1101011::size(7) ,c::size(1),z::size(1),0b0::size(1),d::size(9),0b0000::size(4),0b11::size(2),0b00::size(2),0b1::size(1),>>), do: funct.(%{addr: addr,con: con, instr: "GETQY", binary: <<c::size(1),z::size(1),0b0::size(1),d::size(9),0b0000::size(4),0b11::size(2),0b00::size(2),0b1::size(1),>>})

#   EEEE 1101011 000 DDDDDDDDD 000011010        GETCT   D
  def disasmInstr(funct, addr, <<con::size(4), 0b1101011000::size(10) ,d::size(9),0b0000::size(4),0b11::size(2),0b0::size(1),0b1::size(1),0b0::size(1),>>), do: funct.(%{addr: addr,con: con, instr: "GETCT", binary: <<d::size(9),0b0000::size(4),0b11::size(2),0b0::size(1),0b1::size(1),0b0::size(1),>>})

#   EEEE 1101011 CZL DDDDDDDDD 000011011        GETRND  {D}         {WC/WZ/WCZ}
  def disasmInstr(funct, addr, <<con::size(4), 0b1101011::size(7) ,c::size(1),z::size(1),l::size(1),d::size(9),0b0000::size(4),0b11::size(2),0b0::size(1),0b11::size(2),>>), do: funct.(%{addr: addr,con: con, instr: "GETRND", binary: <<c::size(1),z::size(1),l::size(1),d::size(9),0b0000::size(4),0b11::size(2),0b0::size(1),0b11::size(2),>>})

#   EEEE 1101011 00L DDDDDDDDD 000011100        SETDACS D/#
  def disasmInstr(funct, addr, <<con::size(4), 0b110101100::size(9) ,l::size(1),d::size(9),0b0000::size(4),0b111::size(3),0b00::size(2),>>), do: funct.(%{addr: addr,con: con, instr: "SETDACS", binary: <<l::size(1),d::size(9),0b0000::size(4),0b111::size(3),0b00::size(2),>>})

#   EEEE 1101011 00L DDDDDDDDD 000011101        SETXFRQ D/#
  def disasmInstr(funct, addr, <<con::size(4), 0b110101100::size(9) ,l::size(1),d::size(9),0b0000::size(4),0b111::size(3),0b0::size(1),0b1::size(1),>>), do: funct.(%{addr: addr,con: con, instr: "SETXFRQ", binary: <<l::size(1),d::size(9),0b0000::size(4),0b111::size(3),0b0::size(1),0b1::size(1),>>})

#   EEEE 1101011 000 DDDDDDDDD 000011110        GETXACC D
  def disasmInstr(funct, addr, <<con::size(4), 0b1101011000::size(10) ,d::size(9),0b0000::size(4),0b1111::size(4),0b0::size(1),>>), do: funct.(%{addr: addr,con: con, instr: "GETXACC", binary: <<d::size(9),0b0000::size(4),0b1111::size(4),0b0::size(1),>>})

#   EEEE 1101011 CZL DDDDDDDDD 000011111        WAITX   D/#         {WC/WZ/WCZ}
  def disasmInstr(funct, addr, <<con::size(4), 0b1101011::size(7) ,c::size(1),z::size(1),l::size(1),d::size(9),0b0000::size(4),0b11111::size(5),>>), do: funct.(%{addr: addr,con: con, instr: "WAITX", binary: <<c::size(1),z::size(1),l::size(1),d::size(9),0b0000::size(4),0b11111::size(5),>>})

#   EEEE 1101011 00L DDDDDDDDD 000100000        SETSE1  D/#
  def disasmInstr(funct, addr, <<con::size(4), 0b110101100::size(9) ,l::size(1),d::size(9),0b000::size(3),0b1::size(1),0b00000::size(5),>>), do: funct.(%{addr: addr,con: con, instr: "SETSE1", binary: <<l::size(1),d::size(9),0b000::size(3),0b1::size(1),0b00000::size(5),>>})

#   EEEE 1101011 00L DDDDDDDDD 000100001        SETSE2  D/#
  def disasmInstr(funct, addr, <<con::size(4), 0b110101100::size(9) ,l::size(1),d::size(9),0b000::size(3),0b1::size(1),0b0000::size(4),0b1::size(1),>>), do: funct.(%{addr: addr,con: con, instr: "SETSE2", binary: <<l::size(1),d::size(9),0b000::size(3),0b1::size(1),0b0000::size(4),0b1::size(1),>>})

#   EEEE 1101011 00L DDDDDDDDD 000100010        SETSE3  D/#
  def disasmInstr(funct, addr, <<con::size(4), 0b110101100::size(9) ,l::size(1),d::size(9),0b000::size(3),0b1::size(1),0b000::size(3),0b1::size(1),0b0::size(1),>>), do: funct.(%{addr: addr,con: con, instr: "SETSE3", binary: <<l::size(1),d::size(9),0b000::size(3),0b1::size(1),0b000::size(3),0b1::size(1),0b0::size(1),>>})

#   EEEE 1101011 00L DDDDDDDDD 000100011        SETSE4  D/#
  def disasmInstr(funct, addr, <<con::size(4), 0b110101100::size(9) ,l::size(1),d::size(9),0b000::size(3),0b1::size(1),0b000::size(3),0b11::size(2),>>), do: funct.(%{addr: addr,con: con, instr: "SETSE4", binary: <<l::size(1),d::size(9),0b000::size(3),0b1::size(1),0b000::size(3),0b11::size(2),>>})

#   EEEE 1101011 CZ0 000000000 000100100        POLLINT             {WC/WZ/WCZ}
  def disasmInstr(funct, addr, <<con::size(4), 0b1101011::size(7) ,c::size(1),z::size(1),0b0000000000000::size(13),0b1::size(1),0b00::size(2),0b1::size(1),0b00::size(2),>>), do: funct.(%{addr: addr,con: con, instr: "POLLINT", binary: <<c::size(1),z::size(1),0b0000000000000::size(13),0b1::size(1),0b00::size(2),0b1::size(1),0b00::size(2),>>})

#   EEEE 1101011 CZ0 000000001 000100100        POLLCT1             {WC/WZ/WCZ}
  def disasmInstr(funct, addr, <<con::size(4), 0b1101011::size(7) ,c::size(1),z::size(1),0b000000000::size(9),0b1::size(1),0b000::size(3),0b1::size(1),0b00::size(2),0b1::size(1),0b00::size(2),>>), do: funct.(%{addr: addr,con: con, instr: "POLLCT1", binary: <<c::size(1),z::size(1),0b000000000::size(9),0b1::size(1),0b000::size(3),0b1::size(1),0b00::size(2),0b1::size(1),0b00::size(2),>>})

#   EEEE 1101011 CZ0 000000010 000100100        POLLCT2             {WC/WZ/WCZ}
  def disasmInstr(funct, addr, <<con::size(4), 0b1101011::size(7) ,c::size(1),z::size(1),0b00000000::size(8),0b1::size(1),0b0000::size(4),0b1::size(1),0b00::size(2),0b1::size(1),0b00::size(2),>>), do: funct.(%{addr: addr,con: con, instr: "POLLCT2", binary: <<c::size(1),z::size(1),0b00000000::size(8),0b1::size(1),0b0000::size(4),0b1::size(1),0b00::size(2),0b1::size(1),0b00::size(2),>>})

#   EEEE 1101011 CZ0 000000011 000100100        POLLCT3             {WC/WZ/WCZ}
  def disasmInstr(funct, addr, <<con::size(4), 0b1101011::size(7) ,c::size(1),z::size(1),0b00000000::size(8),0b11::size(2),0b000::size(3),0b1::size(1),0b00::size(2),0b1::size(1),0b00::size(2),>>), do: funct.(%{addr: addr,con: con, instr: "POLLCT3", binary: <<c::size(1),z::size(1),0b00000000::size(8),0b11::size(2),0b000::size(3),0b1::size(1),0b00::size(2),0b1::size(1),0b00::size(2),>>})

#   EEEE 1101011 CZ0 000000100 000100100        POLLSE1             {WC/WZ/WCZ}
  def disasmInstr(funct, addr, <<con::size(4), 0b1101011::size(7) ,c::size(1),z::size(1),0b0000000::size(7),0b1::size(1),0b00000::size(5),0b1::size(1),0b00::size(2),0b1::size(1),0b00::size(2),>>), do: funct.(%{addr: addr,con: con, instr: "POLLSE1", binary: <<c::size(1),z::size(1),0b0000000::size(7),0b1::size(1),0b00000::size(5),0b1::size(1),0b00::size(2),0b1::size(1),0b00::size(2),>>})

#   EEEE 1101011 CZ0 000000101 000100100        POLLSE2             {WC/WZ/WCZ}
  def disasmInstr(funct, addr, <<con::size(4), 0b1101011::size(7) ,c::size(1),z::size(1),0b0000000::size(7),0b1::size(1),0b0::size(1),0b1::size(1),0b000::size(3),0b1::size(1),0b00::size(2),0b1::size(1),0b00::size(2),>>), do: funct.(%{addr: addr,con: con, instr: "POLLSE2", binary: <<c::size(1),z::size(1),0b0000000::size(7),0b1::size(1),0b0::size(1),0b1::size(1),0b000::size(3),0b1::size(1),0b00::size(2),0b1::size(1),0b00::size(2),>>})

#   EEEE 1101011 CZ0 000000110 000100100        POLLSE3             {WC/WZ/WCZ}
  def disasmInstr(funct, addr, <<con::size(4), 0b1101011::size(7) ,c::size(1),z::size(1),0b0000000::size(7),0b11::size(2),0b0000::size(4),0b1::size(1),0b00::size(2),0b1::size(1),0b00::size(2),>>), do: funct.(%{addr: addr,con: con, instr: "POLLSE3", binary: <<c::size(1),z::size(1),0b0000000::size(7),0b11::size(2),0b0000::size(4),0b1::size(1),0b00::size(2),0b1::size(1),0b00::size(2),>>})

#   EEEE 1101011 CZ0 000000111 000100100        POLLSE4             {WC/WZ/WCZ}
  def disasmInstr(funct, addr, <<con::size(4), 0b1101011::size(7) ,c::size(1),z::size(1),0b0000000::size(7),0b111::size(3),0b000::size(3),0b1::size(1),0b00::size(2),0b1::size(1),0b00::size(2),>>), do: funct.(%{addr: addr,con: con, instr: "POLLSE4", binary: <<c::size(1),z::size(1),0b0000000::size(7),0b111::size(3),0b000::size(3),0b1::size(1),0b00::size(2),0b1::size(1),0b00::size(2),>>})

#   EEEE 1101011 CZ0 000001000 000100100        POLLPAT             {WC/WZ/WCZ}
  def disasmInstr(funct, addr, <<con::size(4), 0b1101011::size(7) ,c::size(1),z::size(1),0b000000::size(6),0b1::size(1),0b000000::size(6),0b1::size(1),0b00::size(2),0b1::size(1),0b00::size(2),>>), do: funct.(%{addr: addr,con: con, instr: "POLLPAT", binary: <<c::size(1),z::size(1),0b000000::size(6),0b1::size(1),0b000000::size(6),0b1::size(1),0b00::size(2),0b1::size(1),0b00::size(2),>>})

#   EEEE 1101011 CZ0 000001001 000100100        POLLFBW             {WC/WZ/WCZ}
  def disasmInstr(funct, addr, <<con::size(4), 0b1101011::size(7) ,c::size(1),z::size(1),0b000000::size(6),0b1::size(1),0b00::size(2),0b1::size(1),0b000::size(3),0b1::size(1),0b00::size(2),0b1::size(1),0b00::size(2),>>), do: funct.(%{addr: addr,con: con, instr: "POLLFBW", binary: <<c::size(1),z::size(1),0b000000::size(6),0b1::size(1),0b00::size(2),0b1::size(1),0b000::size(3),0b1::size(1),0b00::size(2),0b1::size(1),0b00::size(2),>>})

#   EEEE 1101011 CZ0 000001010 000100100        POLLXMT             {WC/WZ/WCZ}
  def disasmInstr(funct, addr, <<con::size(4), 0b1101011::size(7) ,c::size(1),z::size(1),0b000000::size(6),0b1::size(1),0b0::size(1),0b1::size(1),0b0000::size(4),0b1::size(1),0b00::size(2),0b1::size(1),0b00::size(2),>>), do: funct.(%{addr: addr,con: con, instr: "POLLXMT", binary: <<c::size(1),z::size(1),0b000000::size(6),0b1::size(1),0b0::size(1),0b1::size(1),0b0000::size(4),0b1::size(1),0b00::size(2),0b1::size(1),0b00::size(2),>>})

#   EEEE 1101011 CZ0 000001011 000100100        POLLXFI             {WC/WZ/WCZ}
  def disasmInstr(funct, addr, <<con::size(4), 0b1101011::size(7) ,c::size(1),z::size(1),0b000000::size(6),0b1::size(1),0b0::size(1),0b11::size(2),0b000::size(3),0b1::size(1),0b00::size(2),0b1::size(1),0b00::size(2),>>), do: funct.(%{addr: addr,con: con, instr: "POLLXFI", binary: <<c::size(1),z::size(1),0b000000::size(6),0b1::size(1),0b0::size(1),0b11::size(2),0b000::size(3),0b1::size(1),0b00::size(2),0b1::size(1),0b00::size(2),>>})

#   EEEE 1101011 CZ0 000001100 000100100        POLLXRO             {WC/WZ/WCZ}
  def disasmInstr(funct, addr, <<con::size(4), 0b1101011::size(7) ,c::size(1),z::size(1),0b000000::size(6),0b11::size(2),0b00000::size(5),0b1::size(1),0b00::size(2),0b1::size(1),0b00::size(2),>>), do: funct.(%{addr: addr,con: con, instr: "POLLXRO", binary: <<c::size(1),z::size(1),0b000000::size(6),0b11::size(2),0b00000::size(5),0b1::size(1),0b00::size(2),0b1::size(1),0b00::size(2),>>})

#   EEEE 1101011 CZ0 000001101 000100100        POLLXRL             {WC/WZ/WCZ}
  def disasmInstr(funct, addr, <<con::size(4), 0b1101011::size(7) ,c::size(1),z::size(1),0b000000::size(6),0b11::size(2),0b0::size(1),0b1::size(1),0b000::size(3),0b1::size(1),0b00::size(2),0b1::size(1),0b00::size(2),>>), do: funct.(%{addr: addr,con: con, instr: "POLLXRL", binary: <<c::size(1),z::size(1),0b000000::size(6),0b11::size(2),0b0::size(1),0b1::size(1),0b000::size(3),0b1::size(1),0b00::size(2),0b1::size(1),0b00::size(2),>>})

#   EEEE 1101011 CZ0 000001110 000100100        POLLATN             {WC/WZ/WCZ}
  def disasmInstr(funct, addr, <<con::size(4), 0b1101011::size(7) ,c::size(1),z::size(1),0b000000::size(6),0b111::size(3),0b0000::size(4),0b1::size(1),0b00::size(2),0b1::size(1),0b00::size(2),>>), do: funct.(%{addr: addr,con: con, instr: "POLLATN", binary: <<c::size(1),z::size(1),0b000000::size(6),0b111::size(3),0b0000::size(4),0b1::size(1),0b00::size(2),0b1::size(1),0b00::size(2),>>})

#   EEEE 1101011 CZ0 000001111 000100100        POLLQMT             {WC/WZ/WCZ}
  def disasmInstr(funct, addr, <<con::size(4), 0b1101011::size(7) ,c::size(1),z::size(1),0b000000::size(6),0b1111::size(4),0b000::size(3),0b1::size(1),0b00::size(2),0b1::size(1),0b00::size(2),>>), do: funct.(%{addr: addr,con: con, instr: "POLLQMT", binary: <<c::size(1),z::size(1),0b000000::size(6),0b1111::size(4),0b000::size(3),0b1::size(1),0b00::size(2),0b1::size(1),0b00::size(2),>>})

#   EEEE 1101011 CZ0 000010000 000100100        WAITINT             {WC/WZ/WCZ}
  def disasmInstr(funct, addr, <<con::size(4), 0b1101011::size(7) ,c::size(1),z::size(1),0b00000::size(5),0b1::size(1),0b0000000::size(7),0b1::size(1),0b00::size(2),0b1::size(1),0b00::size(2),>>), do: funct.(%{addr: addr,con: con, instr: "WAITINT", binary: <<c::size(1),z::size(1),0b00000::size(5),0b1::size(1),0b0000000::size(7),0b1::size(1),0b00::size(2),0b1::size(1),0b00::size(2),>>})

#   EEEE 1101011 CZ0 000010001 000100100        WAITCT1             {WC/WZ/WCZ}
  def disasmInstr(funct, addr, <<con::size(4), 0b1101011::size(7) ,c::size(1),z::size(1),0b00000::size(5),0b1::size(1),0b000::size(3),0b1::size(1),0b000::size(3),0b1::size(1),0b00::size(2),0b1::size(1),0b00::size(2),>>), do: funct.(%{addr: addr,con: con, instr: "WAITCT1", binary: <<c::size(1),z::size(1),0b00000::size(5),0b1::size(1),0b000::size(3),0b1::size(1),0b000::size(3),0b1::size(1),0b00::size(2),0b1::size(1),0b00::size(2),>>})

#   EEEE 1101011 CZ0 000010010 000100100        WAITCT2             {WC/WZ/WCZ}
  def disasmInstr(funct, addr, <<con::size(4), 0b1101011::size(7) ,c::size(1),z::size(1),0b00000::size(5),0b1::size(1),0b00::size(2),0b1::size(1),0b0000::size(4),0b1::size(1),0b00::size(2),0b1::size(1),0b00::size(2),>>), do: funct.(%{addr: addr,con: con, instr: "WAITCT2", binary: <<c::size(1),z::size(1),0b00000::size(5),0b1::size(1),0b00::size(2),0b1::size(1),0b0000::size(4),0b1::size(1),0b00::size(2),0b1::size(1),0b00::size(2),>>})

#   EEEE 1101011 CZ0 000010011 000100100        WAITCT3             {WC/WZ/WCZ}
  def disasmInstr(funct, addr, <<con::size(4), 0b1101011::size(7) ,c::size(1),z::size(1),0b00000::size(5),0b1::size(1),0b00::size(2),0b11::size(2),0b000::size(3),0b1::size(1),0b00::size(2),0b1::size(1),0b00::size(2),>>), do: funct.(%{addr: addr,con: con, instr: "WAITCT3", binary: <<c::size(1),z::size(1),0b00000::size(5),0b1::size(1),0b00::size(2),0b11::size(2),0b000::size(3),0b1::size(1),0b00::size(2),0b1::size(1),0b00::size(2),>>})

#   EEEE 1101011 CZ0 000010100 000100100        WAITSE1             {WC/WZ/WCZ}
  def disasmInstr(funct, addr, <<con::size(4), 0b1101011::size(7) ,c::size(1),z::size(1),0b00000::size(5),0b1::size(1),0b0::size(1),0b1::size(1),0b00000::size(5),0b1::size(1),0b00::size(2),0b1::size(1),0b00::size(2),>>), do: funct.(%{addr: addr,con: con, instr: "WAITSE1", binary: <<c::size(1),z::size(1),0b00000::size(5),0b1::size(1),0b0::size(1),0b1::size(1),0b00000::size(5),0b1::size(1),0b00::size(2),0b1::size(1),0b00::size(2),>>})

#   EEEE 1101011 CZ0 000010101 000100100        WAITSE2             {WC/WZ/WCZ}
  def disasmInstr(funct, addr, <<con::size(4), 0b1101011::size(7) ,c::size(1),z::size(1),0b00000::size(5),0b1::size(1),0b0::size(1),0b1::size(1),0b0::size(1),0b1::size(1),0b000::size(3),0b1::size(1),0b00::size(2),0b1::size(1),0b00::size(2),>>), do: funct.(%{addr: addr,con: con, instr: "WAITSE2", binary: <<c::size(1),z::size(1),0b00000::size(5),0b1::size(1),0b0::size(1),0b1::size(1),0b0::size(1),0b1::size(1),0b000::size(3),0b1::size(1),0b00::size(2),0b1::size(1),0b00::size(2),>>})

#   EEEE 1101011 CZ0 000010110 000100100        WAITSE3             {WC/WZ/WCZ}
  def disasmInstr(funct, addr, <<con::size(4), 0b1101011::size(7) ,c::size(1),z::size(1),0b00000::size(5),0b1::size(1),0b0::size(1),0b11::size(2),0b0000::size(4),0b1::size(1),0b00::size(2),0b1::size(1),0b00::size(2),>>), do: funct.(%{addr: addr,con: con, instr: "WAITSE3", binary: <<c::size(1),z::size(1),0b00000::size(5),0b1::size(1),0b0::size(1),0b11::size(2),0b0000::size(4),0b1::size(1),0b00::size(2),0b1::size(1),0b00::size(2),>>})

#   EEEE 1101011 CZ0 000010111 000100100        WAITSE4             {WC/WZ/WCZ}
  def disasmInstr(funct, addr, <<con::size(4), 0b1101011::size(7) ,c::size(1),z::size(1),0b00000::size(5),0b1::size(1),0b0::size(1),0b111::size(3),0b000::size(3),0b1::size(1),0b00::size(2),0b1::size(1),0b00::size(2),>>), do: funct.(%{addr: addr,con: con, instr: "WAITSE4", binary: <<c::size(1),z::size(1),0b00000::size(5),0b1::size(1),0b0::size(1),0b111::size(3),0b000::size(3),0b1::size(1),0b00::size(2),0b1::size(1),0b00::size(2),>>})

#   EEEE 1101011 CZ0 000011000 000100100        WAITPAT             {WC/WZ/WCZ}
  def disasmInstr(funct, addr, <<con::size(4), 0b1101011::size(7) ,c::size(1),z::size(1),0b00000::size(5),0b11::size(2),0b000000::size(6),0b1::size(1),0b00::size(2),0b1::size(1),0b00::size(2),>>), do: funct.(%{addr: addr,con: con, instr: "WAITPAT", binary: <<c::size(1),z::size(1),0b00000::size(5),0b11::size(2),0b000000::size(6),0b1::size(1),0b00::size(2),0b1::size(1),0b00::size(2),>>})

#   EEEE 1101011 CZ0 000011001 000100100        WAITFBW             {WC/WZ/WCZ}
  def disasmInstr(funct, addr, <<con::size(4), 0b1101011::size(7) ,c::size(1),z::size(1),0b00000::size(5),0b11::size(2),0b00::size(2),0b1::size(1),0b000::size(3),0b1::size(1),0b00::size(2),0b1::size(1),0b00::size(2),>>), do: funct.(%{addr: addr,con: con, instr: "WAITFBW", binary: <<c::size(1),z::size(1),0b00000::size(5),0b11::size(2),0b00::size(2),0b1::size(1),0b000::size(3),0b1::size(1),0b00::size(2),0b1::size(1),0b00::size(2),>>})

#   EEEE 1101011 CZ0 000011010 000100100        WAITXMT             {WC/WZ/WCZ}
  def disasmInstr(funct, addr, <<con::size(4), 0b1101011::size(7) ,c::size(1),z::size(1),0b00000::size(5),0b11::size(2),0b0::size(1),0b1::size(1),0b0000::size(4),0b1::size(1),0b00::size(2),0b1::size(1),0b00::size(2),>>), do: funct.(%{addr: addr,con: con, instr: "WAITXMT", binary: <<c::size(1),z::size(1),0b00000::size(5),0b11::size(2),0b0::size(1),0b1::size(1),0b0000::size(4),0b1::size(1),0b00::size(2),0b1::size(1),0b00::size(2),>>})

#   EEEE 1101011 CZ0 000011011 000100100        WAITXFI             {WC/WZ/WCZ}
  def disasmInstr(funct, addr, <<con::size(4), 0b1101011::size(7) ,c::size(1),z::size(1),0b00000::size(5),0b11::size(2),0b0::size(1),0b11::size(2),0b000::size(3),0b1::size(1),0b00::size(2),0b1::size(1),0b00::size(2),>>), do: funct.(%{addr: addr,con: con, instr: "WAITXFI", binary: <<c::size(1),z::size(1),0b00000::size(5),0b11::size(2),0b0::size(1),0b11::size(2),0b000::size(3),0b1::size(1),0b00::size(2),0b1::size(1),0b00::size(2),>>})

#   EEEE 1101011 CZ0 000011100 000100100        WAITXRO             {WC/WZ/WCZ}
  def disasmInstr(funct, addr, <<con::size(4), 0b1101011::size(7) ,c::size(1),z::size(1),0b00000::size(5),0b111::size(3),0b00000::size(5),0b1::size(1),0b00::size(2),0b1::size(1),0b00::size(2),>>), do: funct.(%{addr: addr,con: con, instr: "WAITXRO", binary: <<c::size(1),z::size(1),0b00000::size(5),0b111::size(3),0b00000::size(5),0b1::size(1),0b00::size(2),0b1::size(1),0b00::size(2),>>})

#   EEEE 1101011 CZ0 000011101 000100100        WAITXRL             {WC/WZ/WCZ}
  def disasmInstr(funct, addr, <<con::size(4), 0b1101011::size(7) ,c::size(1),z::size(1),0b00000::size(5),0b111::size(3),0b0::size(1),0b1::size(1),0b000::size(3),0b1::size(1),0b00::size(2),0b1::size(1),0b00::size(2),>>), do: funct.(%{addr: addr,con: con, instr: "WAITXRL", binary: <<c::size(1),z::size(1),0b00000::size(5),0b111::size(3),0b0::size(1),0b1::size(1),0b000::size(3),0b1::size(1),0b00::size(2),0b1::size(1),0b00::size(2),>>})

#   EEEE 1101011 CZ0 000011110 000100100        WAITATN             {WC/WZ/WCZ}
  def disasmInstr(funct, addr, <<con::size(4), 0b1101011::size(7) ,c::size(1),z::size(1),0b00000::size(5),0b1111::size(4),0b0000::size(4),0b1::size(1),0b00::size(2),0b1::size(1),0b00::size(2),>>), do: funct.(%{addr: addr,con: con, instr: "WAITATN", binary: <<c::size(1),z::size(1),0b00000::size(5),0b1111::size(4),0b0000::size(4),0b1::size(1),0b00::size(2),0b1::size(1),0b00::size(2),>>})

#   EEEE 1101011 000 000100000 000100100        ALLOWI
  def disasmInstr(funct, addr, <<con::size(4), 0b110101100000010000000010010::size(27) ,0b0::size(1),>>), do: funct.(%{addr: addr,con: con, instr: "ALLOWI", binary: <<0b0::size(1),>>})

#   EEEE 1101011 000 000100001 000100100        STALLI
  def disasmInstr(funct, addr, <<con::size(4), 0b110101100000010000100010010::size(27) ,0b0::size(1),>>), do: funct.(%{addr: addr,con: con, instr: "STALLI", binary: <<0b0::size(1),>>})

#   EEEE 1101011 000 000100010 000100100        TRGINT1
  def disasmInstr(funct, addr, <<con::size(4), 0b110101100000010001000010010::size(27) ,0b0::size(1),>>), do: funct.(%{addr: addr,con: con, instr: "TRGINT1", binary: <<0b0::size(1),>>})

#   EEEE 1101011 000 000100011 000100100        TRGINT2
  def disasmInstr(funct, addr, <<con::size(4), 0b110101100000010001100010010::size(27) ,0b0::size(1),>>), do: funct.(%{addr: addr,con: con, instr: "TRGINT2", binary: <<0b0::size(1),>>})

#   EEEE 1101011 000 000100100 000100100        TRGINT3
  def disasmInstr(funct, addr, <<con::size(4), 0b110101100000010010000010010::size(27) ,0b0::size(1),>>), do: funct.(%{addr: addr,con: con, instr: "TRGINT3", binary: <<0b0::size(1),>>})

#   EEEE 1101011 000 000100101 000100100        NIXINT1
  def disasmInstr(funct, addr, <<con::size(4), 0b110101100000010010100010010::size(27) ,0b0::size(1),>>), do: funct.(%{addr: addr,con: con, instr: "NIXINT1", binary: <<0b0::size(1),>>})

#   EEEE 1101011 000 000100110 000100100        NIXINT2
  def disasmInstr(funct, addr, <<con::size(4), 0b110101100000010011000010010::size(27) ,0b0::size(1),>>), do: funct.(%{addr: addr,con: con, instr: "NIXINT2", binary: <<0b0::size(1),>>})

#   EEEE 1101011 000 000100111 000100100        NIXINT3
  def disasmInstr(funct, addr, <<con::size(4), 0b110101100000010011100010010::size(27) ,0b0::size(1),>>), do: funct.(%{addr: addr,con: con, instr: "NIXINT3", binary: <<0b0::size(1),>>})

#   EEEE 1101011 00L DDDDDDDDD 000100101        SETINT1 D/#
  def disasmInstr(funct, addr, <<con::size(4), 0b110101100::size(9) ,l::size(1),d::size(9),0b000::size(3),0b1::size(1),0b00::size(2),0b1::size(1),0b0::size(1),0b1::size(1),>>), do: funct.(%{addr: addr,con: con, instr: "SETINT1", binary: <<l::size(1),d::size(9),0b000::size(3),0b1::size(1),0b00::size(2),0b1::size(1),0b0::size(1),0b1::size(1),>>})

#   EEEE 1101011 00L DDDDDDDDD 000100110        SETINT2 D/#
  def disasmInstr(funct, addr, <<con::size(4), 0b110101100::size(9) ,l::size(1),d::size(9),0b000::size(3),0b1::size(1),0b00::size(2),0b11::size(2),0b0::size(1),>>), do: funct.(%{addr: addr,con: con, instr: "SETINT2", binary: <<l::size(1),d::size(9),0b000::size(3),0b1::size(1),0b00::size(2),0b11::size(2),0b0::size(1),>>})

#   EEEE 1101011 00L DDDDDDDDD 000100111        SETINT3 D/#
  def disasmInstr(funct, addr, <<con::size(4), 0b110101100::size(9) ,l::size(1),d::size(9),0b000::size(3),0b1::size(1),0b00::size(2),0b111::size(3),>>), do: funct.(%{addr: addr,con: con, instr: "SETINT3", binary: <<l::size(1),d::size(9),0b000::size(3),0b1::size(1),0b00::size(2),0b111::size(3),>>})

#   EEEE 1101011 00L DDDDDDDDD 000101000        SETQ    D/#
  def disasmInstr(funct, addr, <<con::size(4), 0b110101100::size(9) ,l::size(1),d::size(9),0b000::size(3),0b1::size(1),0b0::size(1),0b1::size(1),0b000::size(3),>>), do: funct.(%{addr: addr,con: con, instr: "SETQ", binary: <<l::size(1),d::size(9),0b000::size(3),0b1::size(1),0b0::size(1),0b1::size(1),0b000::size(3),>>})

#   EEEE 1101011 00L DDDDDDDDD 000101001        SETQ2   D/#
  def disasmInstr(funct, addr, <<con::size(4), 0b110101100::size(9) ,l::size(1),d::size(9),0b000::size(3),0b1::size(1),0b0::size(1),0b1::size(1),0b00::size(2),0b1::size(1),>>), do: funct.(%{addr: addr,con: con, instr: "SETQ2", binary: <<l::size(1),d::size(9),0b000::size(3),0b1::size(1),0b0::size(1),0b1::size(1),0b00::size(2),0b1::size(1),>>})

#   EEEE 1101011 00L DDDDDDDDD 000101010        PUSH    D/#
  def disasmInstr(funct, addr, <<con::size(4), 0b110101100::size(9) ,l::size(1),d::size(9),0b000::size(3),0b1::size(1),0b0::size(1),0b1::size(1),0b0::size(1),0b1::size(1),0b0::size(1),>>), do: funct.(%{addr: addr,con: con, instr: "PUSH", binary: <<l::size(1),d::size(9),0b000::size(3),0b1::size(1),0b0::size(1),0b1::size(1),0b0::size(1),0b1::size(1),0b0::size(1),>>})

#   EEEE 1101011 CZ0 DDDDDDDDD 000101011        POP     D           {WC/WZ/WCZ}
  def disasmInstr(funct, addr, <<con::size(4), 0b1101011::size(7) ,c::size(1),z::size(1),0b0::size(1),d::size(9),0b000::size(3),0b1::size(1),0b0::size(1),0b1::size(1),0b0::size(1),0b11::size(2),>>), do: funct.(%{addr: addr,con: con, instr: "POP", binary: <<c::size(1),z::size(1),0b0::size(1),d::size(9),0b000::size(3),0b1::size(1),0b0::size(1),0b1::size(1),0b0::size(1),0b11::size(2),>>})

#   EEEE 1101011 CZ0 DDDDDDDDD 000101100        JMP     D           {WC/WZ/WCZ}
  def disasmInstr(funct, addr, <<con::size(4), 0b1101011::size(7) ,c::size(1),z::size(1),0b0::size(1),d::size(9),0b000::size(3),0b1::size(1),0b0::size(1),0b11::size(2),0b00::size(2),>>), do: funct.(%{addr: addr,con: con, instr: "JMP", binary: <<c::size(1),z::size(1),0b0::size(1),d::size(9),0b000::size(3),0b1::size(1),0b0::size(1),0b11::size(2),0b00::size(2),>>})

#   EEEE 1101011 CZ0 DDDDDDDDD 000101101        CALL    D           {WC/WZ/WCZ}
  def disasmInstr(funct, addr, <<con::size(4), 0b1101011::size(7) ,c::size(1),z::size(1),0b0::size(1),d::size(9),0b000::size(3),0b1::size(1),0b0::size(1),0b11::size(2),0b0::size(1),0b1::size(1),>>), do: funct.(%{addr: addr,con: con, instr: "CALL", binary: <<c::size(1),z::size(1),0b0::size(1),d::size(9),0b000::size(3),0b1::size(1),0b0::size(1),0b11::size(2),0b0::size(1),0b1::size(1),>>})

#   EEEE 1101011 CZ1 000000000 000101101        RET                 {WC/WZ/WCZ}
  def disasmInstr(funct, addr, <<con::size(4), 0b1101011::size(7) ,c::size(1),z::size(1),0b1::size(1),0b000000000000::size(12),0b1::size(1),0b0::size(1),0b11::size(2),0b0::size(1),0b1::size(1),>>), do: funct.(%{addr: addr,con: con, instr: "RET", binary: <<c::size(1),z::size(1),0b1::size(1),0b000000000000::size(12),0b1::size(1),0b0::size(1),0b11::size(2),0b0::size(1),0b1::size(1),>>})

#   EEEE 1101011 CZ0 DDDDDDDDD 000101110        CALLA   D           {WC/WZ/WCZ}
  def disasmInstr(funct, addr, <<con::size(4), 0b1101011::size(7) ,c::size(1),z::size(1),0b0::size(1),d::size(9),0b000::size(3),0b1::size(1),0b0::size(1),0b111::size(3),0b0::size(1),>>), do: funct.(%{addr: addr,con: con, instr: "CALLA", binary: <<c::size(1),z::size(1),0b0::size(1),d::size(9),0b000::size(3),0b1::size(1),0b0::size(1),0b111::size(3),0b0::size(1),>>})

#   EEEE 1101011 CZ1 000000000 000101110        RETA                {WC/WZ/WCZ}
  def disasmInstr(funct, addr, <<con::size(4), 0b1101011::size(7) ,c::size(1),z::size(1),0b1::size(1),0b000000000000::size(12),0b1::size(1),0b0::size(1),0b111::size(3),0b0::size(1),>>), do: funct.(%{addr: addr,con: con, instr: "RETA", binary: <<c::size(1),z::size(1),0b1::size(1),0b000000000000::size(12),0b1::size(1),0b0::size(1),0b111::size(3),0b0::size(1),>>})

#   EEEE 1101011 CZ0 DDDDDDDDD 000101111        CALLB   D           {WC/WZ/WCZ}
  def disasmInstr(funct, addr, <<con::size(4), 0b1101011::size(7) ,c::size(1),z::size(1),0b0::size(1),d::size(9),0b000::size(3),0b1::size(1),0b0::size(1),0b1111::size(4),>>), do: funct.(%{addr: addr,con: con, instr: "CALLB", binary: <<c::size(1),z::size(1),0b0::size(1),d::size(9),0b000::size(3),0b1::size(1),0b0::size(1),0b1111::size(4),>>})

#   EEEE 1101011 CZ1 000000000 000101111        RETB                {WC/WZ/WCZ}
  def disasmInstr(funct, addr, <<con::size(4), 0b1101011::size(7) ,c::size(1),z::size(1),0b1::size(1),0b000000000000::size(12),0b1::size(1),0b0::size(1),0b1111::size(4),>>), do: funct.(%{addr: addr,con: con, instr: "RETB", binary: <<c::size(1),z::size(1),0b1::size(1),0b000000000000::size(12),0b1::size(1),0b0::size(1),0b1111::size(4),>>})

#   EEEE 1101011 00L DDDDDDDDD 000110000        JMPREL  D/#
  def disasmInstr(funct, addr, <<con::size(4), 0b110101100::size(9) ,l::size(1),d::size(9),0b000::size(3),0b11::size(2),0b0000::size(4),>>), do: funct.(%{addr: addr,con: con, instr: "JMPREL", binary: <<l::size(1),d::size(9),0b000::size(3),0b11::size(2),0b0000::size(4),>>})

#   EEEE 1101011 00L DDDDDDDDD 000110001        SKIP    D/#
  def disasmInstr(funct, addr, <<con::size(4), 0b110101100::size(9) ,l::size(1),d::size(9),0b000::size(3),0b11::size(2),0b000::size(3),0b1::size(1),>>), do: funct.(%{addr: addr,con: con, instr: "SKIP", binary: <<l::size(1),d::size(9),0b000::size(3),0b11::size(2),0b000::size(3),0b1::size(1),>>})

#   EEEE 1101011 00L DDDDDDDDD 000110010        SKIPF   D/#
  def disasmInstr(funct, addr, <<con::size(4), 0b110101100::size(9) ,l::size(1),d::size(9),0b000::size(3),0b11::size(2),0b00::size(2),0b1::size(1),0b0::size(1),>>), do: funct.(%{addr: addr,con: con, instr: "SKIPF", binary: <<l::size(1),d::size(9),0b000::size(3),0b11::size(2),0b00::size(2),0b1::size(1),0b0::size(1),>>})

#   EEEE 1101011 00L DDDDDDDDD 000110011        EXECF   D/#
  def disasmInstr(funct, addr, <<con::size(4), 0b110101100::size(9) ,l::size(1),d::size(9),0b000::size(3),0b11::size(2),0b00::size(2),0b11::size(2),>>), do: funct.(%{addr: addr,con: con, instr: "EXECF", binary: <<l::size(1),d::size(9),0b000::size(3),0b11::size(2),0b00::size(2),0b11::size(2),>>})

#   EEEE 1101011 000 DDDDDDDDD 000110100        GETPTR  D
  def disasmInstr(funct, addr, <<con::size(4), 0b1101011000::size(10) ,d::size(9),0b000::size(3),0b11::size(2),0b0::size(1),0b1::size(1),0b00::size(2),>>), do: funct.(%{addr: addr,con: con, instr: "GETPTR", binary: <<d::size(9),0b000::size(3),0b11::size(2),0b0::size(1),0b1::size(1),0b00::size(2),>>})

#   EEEE 1101011 CZ0 DDDDDDDDD 000110101        GETBRK  D           {WC/WZ/WCZ}
  def disasmInstr(funct, addr, <<con::size(4), 0b1101011::size(7) ,c::size(1),z::size(1),0b0::size(1),d::size(9),0b000::size(3),0b11::size(2),0b0::size(1),0b1::size(1),0b0::size(1),0b1::size(1),>>), do: funct.(%{addr: addr,con: con, instr: "GETBRK", binary: <<c::size(1),z::size(1),0b0::size(1),d::size(9),0b000::size(3),0b11::size(2),0b0::size(1),0b1::size(1),0b0::size(1),0b1::size(1),>>})

#   EEEE 1101011 00L DDDDDDDDD 000110101        COGBRK  D
  def disasmInstr(funct, addr, <<con::size(4), 0b110101100::size(9) ,l::size(1),d::size(9),0b000::size(3),0b11::size(2),0b0::size(1),0b1::size(1),0b0::size(1),0b1::size(1),>>), do: funct.(%{addr: addr,con: con, instr: "COGBRK", binary: <<l::size(1),d::size(9),0b000::size(3),0b11::size(2),0b0::size(1),0b1::size(1),0b0::size(1),0b1::size(1),>>})

#   EEEE 1101011 00L DDDDDDDDD 000110110        BRK     D/#
  def disasmInstr(funct, addr, <<con::size(4), 0b110101100::size(9) ,l::size(1),d::size(9),0b000::size(3),0b11::size(2),0b0::size(1),0b11::size(2),0b0::size(1),>>), do: funct.(%{addr: addr,con: con, instr: "BRK", binary: <<l::size(1),d::size(9),0b000::size(3),0b11::size(2),0b0::size(1),0b11::size(2),0b0::size(1),>>})

#   EEEE 1101011 00L DDDDDDDDD 000110111        SETLUTS D/#
  def disasmInstr(funct, addr, <<con::size(4), 0b110101100::size(9) ,l::size(1),d::size(9),0b000::size(3),0b11::size(2),0b0::size(1),0b111::size(3),>>), do: funct.(%{addr: addr,con: con, instr: "SETLUTS", binary: <<l::size(1),d::size(9),0b000::size(3),0b11::size(2),0b0::size(1),0b111::size(3),>>})

#   EEEE 1101011 00L DDDDDDDDD 000111000        SETCY   D/#
  def disasmInstr(funct, addr, <<con::size(4), 0b110101100::size(9) ,l::size(1),d::size(9),0b000::size(3),0b111::size(3),0b000::size(3),>>), do: funct.(%{addr: addr,con: con, instr: "SETCY", binary: <<l::size(1),d::size(9),0b000::size(3),0b111::size(3),0b000::size(3),>>})

#   EEEE 1101011 00L DDDDDDDDD 000111001        SETCI   D/#
  def disasmInstr(funct, addr, <<con::size(4), 0b110101100::size(9) ,l::size(1),d::size(9),0b000::size(3),0b111::size(3),0b00::size(2),0b1::size(1),>>), do: funct.(%{addr: addr,con: con, instr: "SETCI", binary: <<l::size(1),d::size(9),0b000::size(3),0b111::size(3),0b00::size(2),0b1::size(1),>>})

#   EEEE 1101011 00L DDDDDDDDD 000111010        SETCQ   D/#
  def disasmInstr(funct, addr, <<con::size(4), 0b110101100::size(9) ,l::size(1),d::size(9),0b000::size(3),0b111::size(3),0b0::size(1),0b1::size(1),0b0::size(1),>>), do: funct.(%{addr: addr,con: con, instr: "SETCQ", binary: <<l::size(1),d::size(9),0b000::size(3),0b111::size(3),0b0::size(1),0b1::size(1),0b0::size(1),>>})

#   EEEE 1101011 00L DDDDDDDDD 000111011        SETCFRQ D/#
  def disasmInstr(funct, addr, <<con::size(4), 0b110101100::size(9) ,l::size(1),d::size(9),0b000::size(3),0b111::size(3),0b0::size(1),0b11::size(2),>>), do: funct.(%{addr: addr,con: con, instr: "SETCFRQ", binary: <<l::size(1),d::size(9),0b000::size(3),0b111::size(3),0b0::size(1),0b11::size(2),>>})

#   EEEE 1101011 00L DDDDDDDDD 000111100        SETCMOD D/#
  def disasmInstr(funct, addr, <<con::size(4), 0b110101100::size(9) ,l::size(1),d::size(9),0b000::size(3),0b1111::size(4),0b00::size(2),>>), do: funct.(%{addr: addr,con: con, instr: "SETCMOD", binary: <<l::size(1),d::size(9),0b000::size(3),0b1111::size(4),0b00::size(2),>>})

#   EEEE 1101011 00L DDDDDDDDD 000111101        SETPIV  D/#
  def disasmInstr(funct, addr, <<con::size(4), 0b110101100::size(9) ,l::size(1),d::size(9),0b000::size(3),0b1111::size(4),0b0::size(1),0b1::size(1),>>), do: funct.(%{addr: addr,con: con, instr: "SETPIV", binary: <<l::size(1),d::size(9),0b000::size(3),0b1111::size(4),0b0::size(1),0b1::size(1),>>})

#   EEEE 1101011 00L DDDDDDDDD 000111110        SETPIX  D/#
  def disasmInstr(funct, addr, <<con::size(4), 0b110101100::size(9) ,l::size(1),d::size(9),0b000::size(3),0b11111::size(5),0b0::size(1),>>), do: funct.(%{addr: addr,con: con, instr: "SETPIX", binary: <<l::size(1),d::size(9),0b000::size(3),0b11111::size(5),0b0::size(1),>>})

#   EEEE 1101011 00L DDDDDDDDD 000111111        COGATN  D/#
  def disasmInstr(funct, addr, <<con::size(4), 0b110101100::size(9) ,l::size(1),d::size(9),0b000::size(3),0b111111::size(6),>>), do: funct.(%{addr: addr,con: con, instr: "COGATN", binary: <<l::size(1),d::size(9),0b000::size(3),0b111111::size(6),>>})

#   EEEE 1101011 CZL DDDDDDDDD 001000000        TESTP   D/#         WC/WZ
  def disasmInstr(funct, addr, <<con::size(4), 0b1101011::size(7) ,c::size(1),z::size(1),l::size(1),d::size(9),0b00::size(2),0b1::size(1),0b000000::size(6),>>), do: funct.(%{addr: addr,con: con, instr: "TESTP", binary: <<c::size(1),z::size(1),l::size(1),d::size(9),0b00::size(2),0b1::size(1),0b000000::size(6),>>})

#   EEEE 1101011 CZL DDDDDDDDD 001000001        TESTPN  D/#         WC/WZ
  def disasmInstr(funct, addr, <<con::size(4), 0b1101011::size(7) ,c::size(1),z::size(1),l::size(1),d::size(9),0b00::size(2),0b1::size(1),0b00000::size(5),0b1::size(1),>>), do: funct.(%{addr: addr,con: con, instr: "TESTPN", binary: <<c::size(1),z::size(1),l::size(1),d::size(9),0b00::size(2),0b1::size(1),0b00000::size(5),0b1::size(1),>>})

#   EEEE 1101011 CZL DDDDDDDDD 001000010        TESTP   D/#         ANDC/ANDZ
  def disasmInstr(funct, addr, <<con::size(4), 0b1101011::size(7) ,c::size(1),z::size(1),l::size(1),d::size(9),0b00::size(2),0b1::size(1),0b0000::size(4),0b1::size(1),0b0::size(1),>>), do: funct.(%{addr: addr,con: con, instr: "TESTP", binary: <<c::size(1),z::size(1),l::size(1),d::size(9),0b00::size(2),0b1::size(1),0b0000::size(4),0b1::size(1),0b0::size(1),>>})

#   EEEE 1101011 CZL DDDDDDDDD 001000011        TESTPN  D/#         ANDC/ANDZ
  def disasmInstr(funct, addr, <<con::size(4), 0b1101011::size(7) ,c::size(1),z::size(1),l::size(1),d::size(9),0b00::size(2),0b1::size(1),0b0000::size(4),0b11::size(2),>>), do: funct.(%{addr: addr,con: con, instr: "TESTPN", binary: <<c::size(1),z::size(1),l::size(1),d::size(9),0b00::size(2),0b1::size(1),0b0000::size(4),0b11::size(2),>>})

#   EEEE 1101011 CZL DDDDDDDDD 001000100        TESTP   D/#         ORC/ORZ
  def disasmInstr(funct, addr, <<con::size(4), 0b1101011::size(7) ,c::size(1),z::size(1),l::size(1),d::size(9),0b00::size(2),0b1::size(1),0b000::size(3),0b1::size(1),0b00::size(2),>>), do: funct.(%{addr: addr,con: con, instr: "TESTP", binary: <<c::size(1),z::size(1),l::size(1),d::size(9),0b00::size(2),0b1::size(1),0b000::size(3),0b1::size(1),0b00::size(2),>>})

#   EEEE 1101011 CZL DDDDDDDDD 001000101        TESTPN  D/#         ORC/ORZ
  def disasmInstr(funct, addr, <<con::size(4), 0b1101011::size(7) ,c::size(1),z::size(1),l::size(1),d::size(9),0b00::size(2),0b1::size(1),0b000::size(3),0b1::size(1),0b0::size(1),0b1::size(1),>>), do: funct.(%{addr: addr,con: con, instr: "TESTPN", binary: <<c::size(1),z::size(1),l::size(1),d::size(9),0b00::size(2),0b1::size(1),0b000::size(3),0b1::size(1),0b0::size(1),0b1::size(1),>>})

#   EEEE 1101011 CZL DDDDDDDDD 001000110        TESTP   D/#         XORC/XORZ
  def disasmInstr(funct, addr, <<con::size(4), 0b1101011::size(7) ,c::size(1),z::size(1),l::size(1),d::size(9),0b00::size(2),0b1::size(1),0b000::size(3),0b11::size(2),0b0::size(1),>>), do: funct.(%{addr: addr,con: con, instr: "TESTP", binary: <<c::size(1),z::size(1),l::size(1),d::size(9),0b00::size(2),0b1::size(1),0b000::size(3),0b11::size(2),0b0::size(1),>>})

#   EEEE 1101011 CZL DDDDDDDDD 001000111        TESTPN  D/#         XORC/XORZ
  def disasmInstr(funct, addr, <<con::size(4), 0b1101011::size(7) ,c::size(1),z::size(1),l::size(1),d::size(9),0b00::size(2),0b1::size(1),0b000::size(3),0b111::size(3),>>), do: funct.(%{addr: addr,con: con, instr: "TESTPN", binary: <<c::size(1),z::size(1),l::size(1),d::size(9),0b00::size(2),0b1::size(1),0b000::size(3),0b111::size(3),>>})

#   EEEE 1101011 CZL DDDDDDDDD 001000000        DIRL    D/#         {WCZ}
  def disasmInstr(funct, addr, <<con::size(4), 0b1101011::size(7) ,c::size(1),z::size(1),l::size(1),d::size(9),0b00::size(2),0b1::size(1),0b000000::size(6),>>), do: funct.(%{addr: addr,con: con, instr: "DIRL", binary: <<c::size(1),z::size(1),l::size(1),d::size(9),0b00::size(2),0b1::size(1),0b000000::size(6),>>})

#   EEEE 1101011 CZL DDDDDDDDD 001000001        DIRH    D/#         {WCZ}
  def disasmInstr(funct, addr, <<con::size(4), 0b1101011::size(7) ,c::size(1),z::size(1),l::size(1),d::size(9),0b00::size(2),0b1::size(1),0b00000::size(5),0b1::size(1),>>), do: funct.(%{addr: addr,con: con, instr: "DIRH", binary: <<c::size(1),z::size(1),l::size(1),d::size(9),0b00::size(2),0b1::size(1),0b00000::size(5),0b1::size(1),>>})

#   EEEE 1101011 CZL DDDDDDDDD 001000010        DIRC    D/#         {WCZ}
  def disasmInstr(funct, addr, <<con::size(4), 0b1101011::size(7) ,c::size(1),z::size(1),l::size(1),d::size(9),0b00::size(2),0b1::size(1),0b0000::size(4),0b1::size(1),0b0::size(1),>>), do: funct.(%{addr: addr,con: con, instr: "DIRC", binary: <<c::size(1),z::size(1),l::size(1),d::size(9),0b00::size(2),0b1::size(1),0b0000::size(4),0b1::size(1),0b0::size(1),>>})

#   EEEE 1101011 CZL DDDDDDDDD 001000011        DIRNC   D/#         {WCZ}
  def disasmInstr(funct, addr, <<con::size(4), 0b1101011::size(7) ,c::size(1),z::size(1),l::size(1),d::size(9),0b00::size(2),0b1::size(1),0b0000::size(4),0b11::size(2),>>), do: funct.(%{addr: addr,con: con, instr: "DIRNC", binary: <<c::size(1),z::size(1),l::size(1),d::size(9),0b00::size(2),0b1::size(1),0b0000::size(4),0b11::size(2),>>})

#   EEEE 1101011 CZL DDDDDDDDD 001000100        DIRZ    D/#         {WCZ}
  def disasmInstr(funct, addr, <<con::size(4), 0b1101011::size(7) ,c::size(1),z::size(1),l::size(1),d::size(9),0b00::size(2),0b1::size(1),0b000::size(3),0b1::size(1),0b00::size(2),>>), do: funct.(%{addr: addr,con: con, instr: "DIRZ", binary: <<c::size(1),z::size(1),l::size(1),d::size(9),0b00::size(2),0b1::size(1),0b000::size(3),0b1::size(1),0b00::size(2),>>})

#   EEEE 1101011 CZL DDDDDDDDD 001000101        DIRNZ   D/#         {WCZ}
  def disasmInstr(funct, addr, <<con::size(4), 0b1101011::size(7) ,c::size(1),z::size(1),l::size(1),d::size(9),0b00::size(2),0b1::size(1),0b000::size(3),0b1::size(1),0b0::size(1),0b1::size(1),>>), do: funct.(%{addr: addr,con: con, instr: "DIRNZ", binary: <<c::size(1),z::size(1),l::size(1),d::size(9),0b00::size(2),0b1::size(1),0b000::size(3),0b1::size(1),0b0::size(1),0b1::size(1),>>})

#   EEEE 1101011 CZL DDDDDDDDD 001000110        DIRRND  D/#         {WCZ}
  def disasmInstr(funct, addr, <<con::size(4), 0b1101011::size(7) ,c::size(1),z::size(1),l::size(1),d::size(9),0b00::size(2),0b1::size(1),0b000::size(3),0b11::size(2),0b0::size(1),>>), do: funct.(%{addr: addr,con: con, instr: "DIRRND", binary: <<c::size(1),z::size(1),l::size(1),d::size(9),0b00::size(2),0b1::size(1),0b000::size(3),0b11::size(2),0b0::size(1),>>})

#   EEEE 1101011 CZL DDDDDDDDD 001000111        DIRNOT  D/#         {WCZ}
  def disasmInstr(funct, addr, <<con::size(4), 0b1101011::size(7) ,c::size(1),z::size(1),l::size(1),d::size(9),0b00::size(2),0b1::size(1),0b000::size(3),0b111::size(3),>>), do: funct.(%{addr: addr,con: con, instr: "DIRNOT", binary: <<c::size(1),z::size(1),l::size(1),d::size(9),0b00::size(2),0b1::size(1),0b000::size(3),0b111::size(3),>>})

#   EEEE 1101011 CZL DDDDDDDDD 001001000        OUTL    D/#         {WCZ}
  def disasmInstr(funct, addr, <<con::size(4), 0b1101011::size(7) ,c::size(1),z::size(1),l::size(1),d::size(9),0b00::size(2),0b1::size(1),0b00::size(2),0b1::size(1),0b000::size(3),>>), do: funct.(%{addr: addr,con: con, instr: "OUTL", binary: <<c::size(1),z::size(1),l::size(1),d::size(9),0b00::size(2),0b1::size(1),0b00::size(2),0b1::size(1),0b000::size(3),>>})

#   EEEE 1101011 CZL DDDDDDDDD 001001001        OUTH    D/#         {WCZ}
  def disasmInstr(funct, addr, <<con::size(4), 0b1101011::size(7) ,c::size(1),z::size(1),l::size(1),d::size(9),0b00::size(2),0b1::size(1),0b00::size(2),0b1::size(1),0b00::size(2),0b1::size(1),>>), do: funct.(%{addr: addr,con: con, instr: "OUTH", binary: <<c::size(1),z::size(1),l::size(1),d::size(9),0b00::size(2),0b1::size(1),0b00::size(2),0b1::size(1),0b00::size(2),0b1::size(1),>>})

#   EEEE 1101011 CZL DDDDDDDDD 001001010        OUTC    D/#         {WCZ}
  def disasmInstr(funct, addr, <<con::size(4), 0b1101011::size(7) ,c::size(1),z::size(1),l::size(1),d::size(9),0b00::size(2),0b1::size(1),0b00::size(2),0b1::size(1),0b0::size(1),0b1::size(1),0b0::size(1),>>), do: funct.(%{addr: addr,con: con, instr: "OUTC", binary: <<c::size(1),z::size(1),l::size(1),d::size(9),0b00::size(2),0b1::size(1),0b00::size(2),0b1::size(1),0b0::size(1),0b1::size(1),0b0::size(1),>>})

#   EEEE 1101011 CZL DDDDDDDDD 001001011        OUTNC   D/#         {WCZ}
  def disasmInstr(funct, addr, <<con::size(4), 0b1101011::size(7) ,c::size(1),z::size(1),l::size(1),d::size(9),0b00::size(2),0b1::size(1),0b00::size(2),0b1::size(1),0b0::size(1),0b11::size(2),>>), do: funct.(%{addr: addr,con: con, instr: "OUTNC", binary: <<c::size(1),z::size(1),l::size(1),d::size(9),0b00::size(2),0b1::size(1),0b00::size(2),0b1::size(1),0b0::size(1),0b11::size(2),>>})

#   EEEE 1101011 CZL DDDDDDDDD 001001100        OUTZ    D/#         {WCZ}
  def disasmInstr(funct, addr, <<con::size(4), 0b1101011::size(7) ,c::size(1),z::size(1),l::size(1),d::size(9),0b00::size(2),0b1::size(1),0b00::size(2),0b11::size(2),0b00::size(2),>>), do: funct.(%{addr: addr,con: con, instr: "OUTZ", binary: <<c::size(1),z::size(1),l::size(1),d::size(9),0b00::size(2),0b1::size(1),0b00::size(2),0b11::size(2),0b00::size(2),>>})

#   EEEE 1101011 CZL DDDDDDDDD 001001101        OUTNZ   D/#         {WCZ}
  def disasmInstr(funct, addr, <<con::size(4), 0b1101011::size(7) ,c::size(1),z::size(1),l::size(1),d::size(9),0b00::size(2),0b1::size(1),0b00::size(2),0b11::size(2),0b0::size(1),0b1::size(1),>>), do: funct.(%{addr: addr,con: con, instr: "OUTNZ", binary: <<c::size(1),z::size(1),l::size(1),d::size(9),0b00::size(2),0b1::size(1),0b00::size(2),0b11::size(2),0b0::size(1),0b1::size(1),>>})

#   EEEE 1101011 CZL DDDDDDDDD 001001110        OUTRND  D/#         {WCZ}
  def disasmInstr(funct, addr, <<con::size(4), 0b1101011::size(7) ,c::size(1),z::size(1),l::size(1),d::size(9),0b00::size(2),0b1::size(1),0b00::size(2),0b111::size(3),0b0::size(1),>>), do: funct.(%{addr: addr,con: con, instr: "OUTRND", binary: <<c::size(1),z::size(1),l::size(1),d::size(9),0b00::size(2),0b1::size(1),0b00::size(2),0b111::size(3),0b0::size(1),>>})

#   EEEE 1101011 CZL DDDDDDDDD 001001111        OUTNOT  D/#         {WCZ}
  def disasmInstr(funct, addr, <<con::size(4), 0b1101011::size(7) ,c::size(1),z::size(1),l::size(1),d::size(9),0b00::size(2),0b1::size(1),0b00::size(2),0b1111::size(4),>>), do: funct.(%{addr: addr,con: con, instr: "OUTNOT", binary: <<c::size(1),z::size(1),l::size(1),d::size(9),0b00::size(2),0b1::size(1),0b00::size(2),0b1111::size(4),>>})

#   EEEE 1101011 CZL DDDDDDDDD 001010000        FLTL    D/#         {WCZ}
  def disasmInstr(funct, addr, <<con::size(4), 0b1101011::size(7) ,c::size(1),z::size(1),l::size(1),d::size(9),0b00::size(2),0b1::size(1),0b0::size(1),0b1::size(1),0b0000::size(4),>>), do: funct.(%{addr: addr,con: con, instr: "FLTL", binary: <<c::size(1),z::size(1),l::size(1),d::size(9),0b00::size(2),0b1::size(1),0b0::size(1),0b1::size(1),0b0000::size(4),>>})

#   EEEE 1101011 CZL DDDDDDDDD 001010001        FLTH    D/#         {WCZ}
  def disasmInstr(funct, addr, <<con::size(4), 0b1101011::size(7) ,c::size(1),z::size(1),l::size(1),d::size(9),0b00::size(2),0b1::size(1),0b0::size(1),0b1::size(1),0b000::size(3),0b1::size(1),>>), do: funct.(%{addr: addr,con: con, instr: "FLTH", binary: <<c::size(1),z::size(1),l::size(1),d::size(9),0b00::size(2),0b1::size(1),0b0::size(1),0b1::size(1),0b000::size(3),0b1::size(1),>>})

#   EEEE 1101011 CZL DDDDDDDDD 001010010        FLTC    D/#         {WCZ}
  def disasmInstr(funct, addr, <<con::size(4), 0b1101011::size(7) ,c::size(1),z::size(1),l::size(1),d::size(9),0b00::size(2),0b1::size(1),0b0::size(1),0b1::size(1),0b00::size(2),0b1::size(1),0b0::size(1),>>), do: funct.(%{addr: addr,con: con, instr: "FLTC", binary: <<c::size(1),z::size(1),l::size(1),d::size(9),0b00::size(2),0b1::size(1),0b0::size(1),0b1::size(1),0b00::size(2),0b1::size(1),0b0::size(1),>>})

#   EEEE 1101011 CZL DDDDDDDDD 001010011        FLTNC   D/#         {WCZ}
  def disasmInstr(funct, addr, <<con::size(4), 0b1101011::size(7) ,c::size(1),z::size(1),l::size(1),d::size(9),0b00::size(2),0b1::size(1),0b0::size(1),0b1::size(1),0b00::size(2),0b11::size(2),>>), do: funct.(%{addr: addr,con: con, instr: "FLTNC", binary: <<c::size(1),z::size(1),l::size(1),d::size(9),0b00::size(2),0b1::size(1),0b0::size(1),0b1::size(1),0b00::size(2),0b11::size(2),>>})

#   EEEE 1101011 CZL DDDDDDDDD 001010100        FLTZ    D/#         {WCZ}
  def disasmInstr(funct, addr, <<con::size(4), 0b1101011::size(7) ,c::size(1),z::size(1),l::size(1),d::size(9),0b00::size(2),0b1::size(1),0b0::size(1),0b1::size(1),0b0::size(1),0b1::size(1),0b00::size(2),>>), do: funct.(%{addr: addr,con: con, instr: "FLTZ", binary: <<c::size(1),z::size(1),l::size(1),d::size(9),0b00::size(2),0b1::size(1),0b0::size(1),0b1::size(1),0b0::size(1),0b1::size(1),0b00::size(2),>>})

#   EEEE 1101011 CZL DDDDDDDDD 001010101        FLTNZ   D/#         {WCZ}
  def disasmInstr(funct, addr, <<con::size(4), 0b1101011::size(7) ,c::size(1),z::size(1),l::size(1),d::size(9),0b00::size(2),0b1::size(1),0b0::size(1),0b1::size(1),0b0::size(1),0b1::size(1),0b0::size(1),0b1::size(1),>>), do: funct.(%{addr: addr,con: con, instr: "FLTNZ", binary: <<c::size(1),z::size(1),l::size(1),d::size(9),0b00::size(2),0b1::size(1),0b0::size(1),0b1::size(1),0b0::size(1),0b1::size(1),0b0::size(1),0b1::size(1),>>})

#   EEEE 1101011 CZL DDDDDDDDD 001010110        FLTRND  D/#         {WCZ}
  def disasmInstr(funct, addr, <<con::size(4), 0b1101011::size(7) ,c::size(1),z::size(1),l::size(1),d::size(9),0b00::size(2),0b1::size(1),0b0::size(1),0b1::size(1),0b0::size(1),0b11::size(2),0b0::size(1),>>), do: funct.(%{addr: addr,con: con, instr: "FLTRND", binary: <<c::size(1),z::size(1),l::size(1),d::size(9),0b00::size(2),0b1::size(1),0b0::size(1),0b1::size(1),0b0::size(1),0b11::size(2),0b0::size(1),>>})

#   EEEE 1101011 CZL DDDDDDDDD 001010111        FLTNOT  D/#         {WCZ}
  def disasmInstr(funct, addr, <<con::size(4), 0b1101011::size(7) ,c::size(1),z::size(1),l::size(1),d::size(9),0b00::size(2),0b1::size(1),0b0::size(1),0b1::size(1),0b0::size(1),0b111::size(3),>>), do: funct.(%{addr: addr,con: con, instr: "FLTNOT", binary: <<c::size(1),z::size(1),l::size(1),d::size(9),0b00::size(2),0b1::size(1),0b0::size(1),0b1::size(1),0b0::size(1),0b111::size(3),>>})

#   EEEE 1101011 CZL DDDDDDDDD 001011000        DRVL    D/#         {WCZ}
  def disasmInstr(funct, addr, <<con::size(4), 0b1101011::size(7) ,c::size(1),z::size(1),l::size(1),d::size(9),0b00::size(2),0b1::size(1),0b0::size(1),0b11::size(2),0b000::size(3),>>), do: funct.(%{addr: addr,con: con, instr: "DRVL", binary: <<c::size(1),z::size(1),l::size(1),d::size(9),0b00::size(2),0b1::size(1),0b0::size(1),0b11::size(2),0b000::size(3),>>})

#   EEEE 1101011 CZL DDDDDDDDD 001011001        DRVH    D/#         {WCZ}
  def disasmInstr(funct, addr, <<con::size(4), 0b1101011::size(7) ,c::size(1),z::size(1),l::size(1),d::size(9),0b00::size(2),0b1::size(1),0b0::size(1),0b11::size(2),0b00::size(2),0b1::size(1),>>), do: funct.(%{addr: addr,con: con, instr: "DRVH", binary: <<c::size(1),z::size(1),l::size(1),d::size(9),0b00::size(2),0b1::size(1),0b0::size(1),0b11::size(2),0b00::size(2),0b1::size(1),>>})

#   EEEE 1101011 CZL DDDDDDDDD 001011010        DRVC    D/#         {WCZ}
  def disasmInstr(funct, addr, <<con::size(4), 0b1101011::size(7) ,c::size(1),z::size(1),l::size(1),d::size(9),0b00::size(2),0b1::size(1),0b0::size(1),0b11::size(2),0b0::size(1),0b1::size(1),0b0::size(1),>>), do: funct.(%{addr: addr,con: con, instr: "DRVC", binary: <<c::size(1),z::size(1),l::size(1),d::size(9),0b00::size(2),0b1::size(1),0b0::size(1),0b11::size(2),0b0::size(1),0b1::size(1),0b0::size(1),>>})

#   EEEE 1101011 CZL DDDDDDDDD 001011011        DRVNC   D/#         {WCZ}
  def disasmInstr(funct, addr, <<con::size(4), 0b1101011::size(7) ,c::size(1),z::size(1),l::size(1),d::size(9),0b00::size(2),0b1::size(1),0b0::size(1),0b11::size(2),0b0::size(1),0b11::size(2),>>), do: funct.(%{addr: addr,con: con, instr: "DRVNC", binary: <<c::size(1),z::size(1),l::size(1),d::size(9),0b00::size(2),0b1::size(1),0b0::size(1),0b11::size(2),0b0::size(1),0b11::size(2),>>})

#   EEEE 1101011 CZL DDDDDDDDD 001011100        DRVZ    D/#         {WCZ}
  def disasmInstr(funct, addr, <<con::size(4), 0b1101011::size(7) ,c::size(1),z::size(1),l::size(1),d::size(9),0b00::size(2),0b1::size(1),0b0::size(1),0b111::size(3),0b00::size(2),>>), do: funct.(%{addr: addr,con: con, instr: "DRVZ", binary: <<c::size(1),z::size(1),l::size(1),d::size(9),0b00::size(2),0b1::size(1),0b0::size(1),0b111::size(3),0b00::size(2),>>})

#   EEEE 1101011 CZL DDDDDDDDD 001011101        DRVNZ   D/#         {WCZ}
  def disasmInstr(funct, addr, <<con::size(4), 0b1101011::size(7) ,c::size(1),z::size(1),l::size(1),d::size(9),0b00::size(2),0b1::size(1),0b0::size(1),0b111::size(3),0b0::size(1),0b1::size(1),>>), do: funct.(%{addr: addr,con: con, instr: "DRVNZ", binary: <<c::size(1),z::size(1),l::size(1),d::size(9),0b00::size(2),0b1::size(1),0b0::size(1),0b111::size(3),0b0::size(1),0b1::size(1),>>})

#   EEEE 1101011 CZL DDDDDDDDD 001011110        DRVRND  D/#         {WCZ}
  def disasmInstr(funct, addr, <<con::size(4), 0b1101011::size(7) ,c::size(1),z::size(1),l::size(1),d::size(9),0b00::size(2),0b1::size(1),0b0::size(1),0b1111::size(4),0b0::size(1),>>), do: funct.(%{addr: addr,con: con, instr: "DRVRND", binary: <<c::size(1),z::size(1),l::size(1),d::size(9),0b00::size(2),0b1::size(1),0b0::size(1),0b1111::size(4),0b0::size(1),>>})

#   EEEE 1101011 CZL DDDDDDDDD 001011111        DRVNOT  D/#         {WCZ}
  def disasmInstr(funct, addr, <<con::size(4), 0b1101011::size(7) ,c::size(1),z::size(1),l::size(1),d::size(9),0b00::size(2),0b1::size(1),0b0::size(1),0b11111::size(5),>>), do: funct.(%{addr: addr,con: con, instr: "DRVNOT", binary: <<c::size(1),z::size(1),l::size(1),d::size(9),0b00::size(2),0b1::size(1),0b0::size(1),0b11111::size(5),>>})

#   EEEE 1101011 000 DDDDDDDDD 001100000        SPLITB  D
  def disasmInstr(funct, addr, <<con::size(4), 0b1101011000::size(10) ,d::size(9),0b00::size(2),0b11::size(2),0b00000::size(5),>>), do: funct.(%{addr: addr,con: con, instr: "SPLITB", binary: <<d::size(9),0b00::size(2),0b11::size(2),0b00000::size(5),>>})

#   EEEE 1101011 000 DDDDDDDDD 001100001        MERGEB  D
  def disasmInstr(funct, addr, <<con::size(4), 0b1101011000::size(10) ,d::size(9),0b00::size(2),0b11::size(2),0b0000::size(4),0b1::size(1),>>), do: funct.(%{addr: addr,con: con, instr: "MERGEB", binary: <<d::size(9),0b00::size(2),0b11::size(2),0b0000::size(4),0b1::size(1),>>})

#   EEEE 1101011 000 DDDDDDDDD 001100010        SPLITW  D
  def disasmInstr(funct, addr, <<con::size(4), 0b1101011000::size(10) ,d::size(9),0b00::size(2),0b11::size(2),0b000::size(3),0b1::size(1),0b0::size(1),>>), do: funct.(%{addr: addr,con: con, instr: "SPLITW", binary: <<d::size(9),0b00::size(2),0b11::size(2),0b000::size(3),0b1::size(1),0b0::size(1),>>})

#   EEEE 1101011 000 DDDDDDDDD 001100011        MERGEW  D
  def disasmInstr(funct, addr, <<con::size(4), 0b1101011000::size(10) ,d::size(9),0b00::size(2),0b11::size(2),0b000::size(3),0b11::size(2),>>), do: funct.(%{addr: addr,con: con, instr: "MERGEW", binary: <<d::size(9),0b00::size(2),0b11::size(2),0b000::size(3),0b11::size(2),>>})

#   EEEE 1101011 000 DDDDDDDDD 001100100        SEUSSF  D
  def disasmInstr(funct, addr, <<con::size(4), 0b1101011000::size(10) ,d::size(9),0b00::size(2),0b11::size(2),0b00::size(2),0b1::size(1),0b00::size(2),>>), do: funct.(%{addr: addr,con: con, instr: "SEUSSF", binary: <<d::size(9),0b00::size(2),0b11::size(2),0b00::size(2),0b1::size(1),0b00::size(2),>>})

#   EEEE 1101011 000 DDDDDDDDD 001100101        SEUSSR  D
  def disasmInstr(funct, addr, <<con::size(4), 0b1101011000::size(10) ,d::size(9),0b00::size(2),0b11::size(2),0b00::size(2),0b1::size(1),0b0::size(1),0b1::size(1),>>), do: funct.(%{addr: addr,con: con, instr: "SEUSSR", binary: <<d::size(9),0b00::size(2),0b11::size(2),0b00::size(2),0b1::size(1),0b0::size(1),0b1::size(1),>>})

#   EEEE 1101011 000 DDDDDDDDD 001100110        RGBSQZ  D
  def disasmInstr(funct, addr, <<con::size(4), 0b1101011000::size(10) ,d::size(9),0b00::size(2),0b11::size(2),0b00::size(2),0b11::size(2),0b0::size(1),>>), do: funct.(%{addr: addr,con: con, instr: "RGBSQZ", binary: <<d::size(9),0b00::size(2),0b11::size(2),0b00::size(2),0b11::size(2),0b0::size(1),>>})

#   EEEE 1101011 000 DDDDDDDDD 001100111        RGBEXP  D
  def disasmInstr(funct, addr, <<con::size(4), 0b1101011000::size(10) ,d::size(9),0b00::size(2),0b11::size(2),0b00::size(2),0b111::size(3),>>), do: funct.(%{addr: addr,con: con, instr: "RGBEXP", binary: <<d::size(9),0b00::size(2),0b11::size(2),0b00::size(2),0b111::size(3),>>})

#   EEEE 1101011 000 DDDDDDDDD 001101000        XORO32  D
  def disasmInstr(funct, addr, <<con::size(4), 0b1101011000::size(10) ,d::size(9),0b00::size(2),0b11::size(2),0b0::size(1),0b1::size(1),0b000::size(3),>>), do: funct.(%{addr: addr,con: con, instr: "XORO32", binary: <<d::size(9),0b00::size(2),0b11::size(2),0b0::size(1),0b1::size(1),0b000::size(3),>>})

#   EEEE 1101011 000 DDDDDDDDD 001101001        REV     D
  def disasmInstr(funct, addr, <<con::size(4), 0b1101011000::size(10) ,d::size(9),0b00::size(2),0b11::size(2),0b0::size(1),0b1::size(1),0b00::size(2),0b1::size(1),>>), do: funct.(%{addr: addr,con: con, instr: "REV", binary: <<d::size(9),0b00::size(2),0b11::size(2),0b0::size(1),0b1::size(1),0b00::size(2),0b1::size(1),>>})

#   EEEE 1101011 CZ0 DDDDDDDDD 001101010        RCZR    D           {WC/WZ/WCZ}
  def disasmInstr(funct, addr, <<con::size(4), 0b1101011::size(7) ,c::size(1),z::size(1),0b0::size(1),d::size(9),0b00::size(2),0b11::size(2),0b0::size(1),0b1::size(1),0b0::size(1),0b1::size(1),0b0::size(1),>>), do: funct.(%{addr: addr,con: con, instr: "RCZR", binary: <<c::size(1),z::size(1),0b0::size(1),d::size(9),0b00::size(2),0b11::size(2),0b0::size(1),0b1::size(1),0b0::size(1),0b1::size(1),0b0::size(1),>>})

#   EEEE 1101011 CZ0 DDDDDDDDD 001101011        RCZL    D           {WC/WZ/WCZ}
  def disasmInstr(funct, addr, <<con::size(4), 0b1101011::size(7) ,c::size(1),z::size(1),0b0::size(1),d::size(9),0b00::size(2),0b11::size(2),0b0::size(1),0b1::size(1),0b0::size(1),0b11::size(2),>>), do: funct.(%{addr: addr,con: con, instr: "RCZL", binary: <<c::size(1),z::size(1),0b0::size(1),d::size(9),0b00::size(2),0b11::size(2),0b0::size(1),0b1::size(1),0b0::size(1),0b11::size(2),>>})

#   EEEE 1101011 000 DDDDDDDDD 001101100        WRC     D
  def disasmInstr(funct, addr, <<con::size(4), 0b1101011000::size(10) ,d::size(9),0b00::size(2),0b11::size(2),0b0::size(1),0b11::size(2),0b00::size(2),>>), do: funct.(%{addr: addr,con: con, instr: "WRC", binary: <<d::size(9),0b00::size(2),0b11::size(2),0b0::size(1),0b11::size(2),0b00::size(2),>>})

#   EEEE 1101011 000 DDDDDDDDD 001101101        WRNC    D
  def disasmInstr(funct, addr, <<con::size(4), 0b1101011000::size(10) ,d::size(9),0b00::size(2),0b11::size(2),0b0::size(1),0b11::size(2),0b0::size(1),0b1::size(1),>>), do: funct.(%{addr: addr,con: con, instr: "WRNC", binary: <<d::size(9),0b00::size(2),0b11::size(2),0b0::size(1),0b11::size(2),0b0::size(1),0b1::size(1),>>})

#   EEEE 1101011 000 DDDDDDDDD 001101110        WRZ     D
  def disasmInstr(funct, addr, <<con::size(4), 0b1101011000::size(10) ,d::size(9),0b00::size(2),0b11::size(2),0b0::size(1),0b111::size(3),0b0::size(1),>>), do: funct.(%{addr: addr,con: con, instr: "WRZ", binary: <<d::size(9),0b00::size(2),0b11::size(2),0b0::size(1),0b111::size(3),0b0::size(1),>>})

#   EEEE 1101011 000 DDDDDDDDD 001101111        WRNZ    D
  def disasmInstr(funct, addr, <<con::size(4), 0b1101011000::size(10) ,d::size(9),0b00::size(2),0b11::size(2),0b0::size(1),0b1111::size(4),>>), do: funct.(%{addr: addr,con: con, instr: "WRNZ", binary: <<d::size(9),0b00::size(2),0b11::size(2),0b0::size(1),0b1111::size(4),>>})

#   EEEE 1101011 CZ1 0cccczzzz 001101111        MODCZ   c,z         {WC/WZ/WCZ}
  def disasmInstr(funct, addr, <<con::size(4), 0b1101011::size(7) ,c::size(1),z::size(1),0b1::size(1),0b0::size(1),c::size(4),z::size(4),0b00::size(2),0b11::size(2),0b0::size(1),0b1111::size(4),>>), do: funct.(%{addr: addr,con: con, instr: "MODCZ", binary: <<c::size(1),z::size(1),0b1::size(1),0b0::size(1),c::size(4),z::size(4),0b00::size(2),0b11::size(2),0b0::size(1),0b1111::size(4),>>})

#   EEEE 1101100 RAA AAAAAAAAA AAAAAAAAA        JMP     #abs/#rel
  def disasmInstr(funct, addr, <<con::size(4), 0b1101100::size(7) ,r::size(1),a::size(20),>>), do: funct.(%{addr: addr,con: con, instr: "JMP", binary: <<r::size(1),a::size(20),>>})

#   EEEE 1101101 RAA AAAAAAAAA AAAAAAAAA        CALL    #abs/#rel
  def disasmInstr(funct, addr, <<con::size(4), 0b1101101::size(7) ,r::size(1),a::size(20),>>), do: funct.(%{addr: addr,con: con, instr: "CALL", binary: <<r::size(1),a::size(20),>>})

#   EEEE 1101110 RAA AAAAAAAAA AAAAAAAAA        CALLA   #abs/#rel
  def disasmInstr(funct, addr, <<con::size(4), 0b1101110::size(7) ,r::size(1),a::size(20),>>), do: funct.(%{addr: addr,con: con, instr: "CALLA", binary: <<r::size(1),a::size(20),>>})

#   EEEE 1101111 RAA AAAAAAAAA AAAAAAAAA        CALLB   #abs/#rel
  def disasmInstr(funct, addr, <<con::size(4), 0b1101111::size(7) ,r::size(1),a::size(20),>>), do: funct.(%{addr: addr,con: con, instr: "CALLB", binary: <<r::size(1),a::size(20),>>})

#   EEEE 11100WW RAA AAAAAAAAA AAAAAAAAA        CALLD   reg,#abs/#rel
  def disasmInstr(funct, addr, <<con::size(4), 0b11100::size(5) ,w::size(2),r::size(1),a::size(20),>>), do: funct.(%{addr: addr,con: con, instr: "CALLD", binary: <<w::size(2),r::size(1),a::size(20),>>})

#   EEEE 11101WW RAA AAAAAAAAA AAAAAAAAA        LOC     reg,#abs/#rel
  def disasmInstr(funct, addr, <<con::size(4), 0b11101::size(5) ,w::size(2),r::size(1),a::size(20),>>), do: funct.(%{addr: addr,con: con, instr: "LOC", binary: <<w::size(2),r::size(1),a::size(20),>>})

#   EEEE 11110NN NNN NNNNNNNNN NNNNNNNNN        AUGS    #23bits
  def disasmInstr(funct, addr, <<con::size(4), 0b11110::size(5) ,n::size(23),>>), do: funct.(%{addr: addr,con: con, instr: "AUGS", binary: <<n::size(23),>>})

#   EEEE 11111NN NNN NNNNNNNNN NNNNNNNNN        AUGD    #23bits
  def disasmInstr(funct, addr, <<con::size(4), 0b11111::size(5) ,n::size(23),>>), do: funct.(%{addr: addr,con: con, instr: "AUGD", binary: <<n::size(23),>>})
end
