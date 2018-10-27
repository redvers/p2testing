defmodule P2Testing.DisasmCode do

  def    empty(all), do: IO.inspect(all)
#                                           EEEE 0000000 CZI DDDDDDDDD SSSSSSSSS        ROR     D,S/#       {WC/WZ/WCZ}
  def    ror(all=%{addr: addr, con: con, instr: "ROR",    vars: {c,z,i,d,s}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s, %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"ror",tohex(0,d),"#{imm?(i)}#{tohex(0,s)}#{wcz?(c,z)}"])

#                                           EEEE 0000001 CZI DDDDDDDDD SSSSSSSSS        ROL     D,S/#       {WC/WZ/WCZ}
  def    rol(all=%{addr: addr, con: con, instr: "ROL",    vars: {c,z,i,d,s}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s, %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"rol",tohex(0,d),"#{imm?(i)}#{tohex(0,s)}#{wcz?(c,z)}"])

#                                           EEEE 0000010 CZI DDDDDDDDD SSSSSSSSS        SHR     D,S/#       {WC/WZ/WCZ}
  def    shr(all=%{addr: addr, con: con, instr: "SHR",    vars: {c,z,i,d,s}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s, %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"shr",tohex(0,d),"#{imm?(i)}#{tohex(0,s)}#{wcz?(c,z)}"])

#                                           EEEE 0000011 CZI DDDDDDDDD SSSSSSSSS        SHL     D,S/#       {WC/WZ/WCZ}
  def    shl(all=%{addr: addr, con: con, instr: "SHL",    vars: {c,z,i,d,s}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s, %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"shl",tohex(0,d),"#{imm?(i)}#{tohex(0,s)}#{wcz?(c,z)}"])

#                                           EEEE 0000100 CZI DDDDDDDDD SSSSSSSSS        RCR     D,S/#       {WC/WZ/WCZ}
  def    rcr(all=%{addr: addr, con: con, instr: "RCR",    vars: {c,z,i,d,s}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s, %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"rcr",tohex(0,d),"#{imm?(i)}#{tohex(0,s)}#{wcz?(c,z)}"])

#                                           EEEE 0000101 CZI DDDDDDDDD SSSSSSSSS        RCL     D,S/#       {WC/WZ/WCZ}
  def    rcl(all=%{addr: addr, con: con, instr: "RCL",    vars: {c,z,i,d,s}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s, %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"rcl",tohex(0,d),"#{imm?(i)}#{tohex(0,s)}#{wcz?(c,z)}"])

#                                           EEEE 0000110 CZI DDDDDDDDD SSSSSSSSS        SAR     D,S/#       {WC/WZ/WCZ}
  def    sar(all=%{addr: addr, con: con, instr: "SAR",    vars: {c,z,i,d,s}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s, %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"sar",tohex(0,d),"#{imm?(i)}#{tohex(0,s)}#{wcz?(c,z)}"])

#                                           EEEE 0000111 CZI DDDDDDDDD SSSSSSSSS        SAL     D,S/#       {WC/WZ/WCZ}
  def    sal(all=%{addr: addr, con: con, instr: "SAL",    vars: {c,z,i,d,s}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s, %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"sal",tohex(0,d),"#{imm?(i)}#{tohex(0,s)}#{wcz?(c,z)}"])

#                                           EEEE 0001000 CZI DDDDDDDDD SSSSSSSSS        ADD     D,S/#       {WC/WZ/WCZ}
  def    add(all=%{addr: addr, con: con, instr: "ADD",    vars: {c,z,i,d,s}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s, %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"add",tohex(0,d),"#{imm?(i)}#{tohex(0,s)}#{wcz?(c,z)}"])

#                                           EEEE 0001001 CZI DDDDDDDDD SSSSSSSSS        ADDX    D,S/#       {WC/WZ/WCZ}
  def   addx(all=%{addr: addr, con: con, instr: "ADDX",   vars: {c,z,i,d,s}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s, %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"addx",tohex(0,d),"#{imm?(i)}#{tohex(0,s)}#{wcz?(c,z)}"])

#                                           EEEE 0001010 CZI DDDDDDDDD SSSSSSSSS        ADDS    D,S/#       {WC/WZ/WCZ}
  def   adds(all=%{addr: addr, con: con, instr: "ADDS",   vars: {c,z,i,d,s}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s, %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"adds",tohex(0,d),"#{imm?(i)}#{tohex(0,s)}#{wcz?(c,z)}"])

#                                           EEEE 0001011 CZI DDDDDDDDD SSSSSSSSS        ADDSX   D,S/#       {WC/WZ/WCZ}
  def  addsx(all=%{addr: addr, con: con, instr: "ADDSX",  vars: {c,z,i,d,s}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s, %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"addsx",tohex(0,d),"#{imm?(i)}#{tohex(0,s)}#{wcz?(c,z)}"])

#                                           EEEE 0001100 CZI DDDDDDDDD SSSSSSSSS        SUB     D,S/#       {WC/WZ/WCZ}
  def    sub(all=%{addr: addr, con: con, instr: "SUB",    vars: {c,z,i,d,s}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s, %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"sub",tohex(0,d),"#{imm?(i)}#{tohex(0,s)}#{wcz?(c,z)}"])

#                                           EEEE 0001101 CZI DDDDDDDDD SSSSSSSSS        SUBX    D,S/#       {WC/WZ/WCZ}
  def   subx(all=%{addr: addr, con: con, instr: "SUBX",   vars: {c,z,i,d,s}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s, %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"subx",tohex(0,d),"#{imm?(i)}#{tohex(0,s)}#{wcz?(c,z)}"])

#                                           EEEE 0001110 CZI DDDDDDDDD SSSSSSSSS        SUBS    D,S/#       {WC/WZ/WCZ}
  def   subs(all=%{addr: addr, con: con, instr: "SUBS",   vars: {c,z,i,d,s}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s, %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"subs",tohex(0,d),"#{imm?(i)}#{tohex(0,s)}#{wcz?(c,z)}"])

#                                           EEEE 0001111 CZI DDDDDDDDD SSSSSSSSS        SUBSX   D,S/#       {WC/WZ/WCZ}
  def  subsx(all=%{addr: addr, con: con, instr: "SUBSX",  vars: {c,z,i,d,s}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s, %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"subsx",tohex(0,d),"#{imm?(i)}#{tohex(0,s)}#{wcz?(c,z)}"])

#                                           EEEE 0010000 CZI DDDDDDDDD SSSSSSSSS        CMP     D,S/#       {WC/WZ/WCZ}
  def    cmp(all=%{addr: addr, con: con, instr: "CMP",    vars: {c,z,i,d,s}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s, %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"cmp",tohex(0,d),"#{imm?(i)}#{tohex(0,s)}#{wcz?(c,z)}"])

#                                           EEEE 0010001 CZI DDDDDDDDD SSSSSSSSS        CMPX    D,S/#       {WC/WZ/WCZ}
  def   cmpx(all=%{addr: addr, con: con, instr: "CMPX",   vars: {c,z,i,d,s}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s, %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"cmpx",tohex(0,d),"#{imm?(i)}#{tohex(0,s)}#{wcz?(c,z)}"])

#                                           EEEE 0010010 CZI DDDDDDDDD SSSSSSSSS        CMPS    D,S/#       {WC/WZ/WCZ}
  def   cmps(all=%{addr: addr, con: con, instr: "CMPS",   vars: {c,z,i,d,s}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s, %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"cmps",tohex(0,d),"#{imm?(i)}#{tohex(0,s)}#{wcz?(c,z)}"])

#                                           EEEE 0010011 CZI DDDDDDDDD SSSSSSSSS        CMPSX   D,S/#       {WC/WZ/WCZ}
  def  cmpsx(all=%{addr: addr, con: con, instr: "CMPSX",  vars: {c,z,i,d,s}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s, %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"cmpsx",tohex(0,d),"#{imm?(i)}#{tohex(0,s)}#{wcz?(c,z)}"])

#                                           EEEE 0010100 CZI DDDDDDDDD SSSSSSSSS        CMPR    D,S/#       {WC/WZ/WCZ}
  def   cmpr(all=%{addr: addr, con: con, instr: "CMPR",   vars: {c,z,i,d,s}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s, %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"cmpr",tohex(0,d),"#{imm?(i)}#{tohex(0,s)}#{wcz?(c,z)}"])

#                                           EEEE 0010101 CZI DDDDDDDDD SSSSSSSSS        CMPM    D,S/#       {WC/WZ/WCZ}
  def   cmpm(all=%{addr: addr, con: con, instr: "CMPM",   vars: {c,z,i,d,s}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s, %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"cmpm",tohex(0,d),"#{imm?(i)}#{tohex(0,s)}#{wcz?(c,z)}"])

#                                           EEEE 0010110 CZI DDDDDDDDD SSSSSSSSS        SUBR    D,S/#       {WC/WZ/WCZ}
  def   subr(all=%{addr: addr, con: con, instr: "SUBR",   vars: {c,z,i,d,s}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s, %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"subr",tohex(0,d),"#{imm?(i)}#{tohex(0,s)}#{wcz?(c,z)}"])

#                                           EEEE 0010111 CZI DDDDDDDDD SSSSSSSSS        CMPSUB  D,S/#       {WC/WZ/WCZ}
  def cmpsub(all=%{addr: addr, con: con, instr: "CMPSUB", vars: {c,z,i,d,s}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s, %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"cmpsub",tohex(0,d),"#{imm?(i)}#{tohex(0,s)}#{wcz?(c,z)}"])

#                                           EEEE 0011000 CZI DDDDDDDDD SSSSSSSSS        FGE     D,S/#       {WC/WZ/WCZ}
  def    fge(all=%{addr: addr, con: con, instr: "FGE",    vars: {c,z,i,d,s}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s, %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"fge",tohex(0,d),"#{imm?(i)}#{tohex(0,s)}#{wcz?(c,z)}"])

#                                           EEEE 0011001 CZI DDDDDDDDD SSSSSSSSS        FLE     D,S/#       {WC/WZ/WCZ}
  def    fle(all=%{addr: addr, con: con, instr: "FLE",    vars: {c,z,i,d,s}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s, %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"fle",tohex(0,d),"#{imm?(i)}#{tohex(0,s)}#{wcz?(c,z)}"])

#                                           EEEE 0011010 CZI DDDDDDDDD SSSSSSSSS        FGES    D,S/#       {WC/WZ/WCZ}
  def   fges(all=%{addr: addr, con: con, instr: "FGES",   vars: {c,z,i,d,s}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s, %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"fges",tohex(0,d),"#{imm?(i)}#{tohex(0,s)}#{wcz?(c,z)}"])

#                                           EEEE 0011011 CZI DDDDDDDDD SSSSSSSSS        FLES    D,S/#       {WC/WZ/WCZ}
  def   fles(all=%{addr: addr, con: con, instr: "FLES",   vars: {c,z,i,d,s}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s, %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"fles",tohex(0,d),"#{imm?(i)}#{tohex(0,s)}#{wcz?(c,z)}"])

#                                           EEEE 0011100 CZI DDDDDDDDD SSSSSSSSS        SUMC    D,S/#       {WC/WZ/WCZ}
  def   sumc(all=%{addr: addr, con: con, instr: "SUMC",   vars: {c,z,i,d,s}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s, %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"sumc",tohex(0,d),"#{imm?(i)}#{tohex(0,s)}#{wcz?(c,z)}"])

#                                           EEEE 0011101 CZI DDDDDDDDD SSSSSSSSS        SUMNC   D,S/#       {WC/WZ/WCZ}
  def  sumnc(all=%{addr: addr, con: con, instr: "SUMNC",  vars: {c,z,i,d,s}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s, %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"sumnc",tohex(0,d),"#{imm?(i)}#{tohex(0,s)}#{wcz?(c,z)}"])

#                                           EEEE 0011110 CZI DDDDDDDDD SSSSSSSSS        SUMZ    D,S/#       {WC/WZ/WCZ}
  def   sumz(all=%{addr: addr, con: con, instr: "SUMZ",   vars: {c,z,i,d,s}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s, %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"sumz",tohex(0,d),"#{imm?(i)}#{tohex(0,s)}#{wcz?(c,z)}"])
 
#                                           EEEE 0011111 CZI DDDDDDDDD SSSSSSSSS        SUMNZ   D,S/#       {WC/WZ/WCZ}
  def  sumnz(all=%{addr: addr, con: con, instr: "SUMNZ",  vars: {c,z,i,d,s}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s, %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"sumnz",tohex(0,d),"#{imm?(i)}#{tohex(0,s)}#{wcz?(c,z)}"])

#                                           EEEE 0100000 CcI DDDDDDDDD SSSSSSSSS        BITL    D,S/#       {WCZ}
  def   bitl(all=%{addr: addr, con: con, instr: "BITL",   vars: {c,c,i,d,s}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s, %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"bitl",tohex(0,d),"#{imm?(i)}#{tohex(0,s)}#{wcz?(c,c)}"])

#                                           EEEE 0100000 CZI DDDDDDDDD SSSSSSSSS        TESTB   D,S/#       WC/WZ
  def  testb(all=%{addr: addr, con: con, instr: "TESTB",  vars: {0b0100000,c,z,i,d,s}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s, %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"testb",tohex(0,d),"#{imm?(i)}#{tohex(0,s)}#{wcz?(c,z)}"])

#                                           EEEE 0100001 CcI DDDDDDDDD SSSSSSSSS        BITH    D,S/#       {WCZ}
  def   bith(all=%{addr: addr, con: con, instr: "BITH",   vars: {c,c,i,d,s}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s, %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"bith",tohex(0,d),"#{imm?(i)}#{tohex(0,s)}#{wcz?(c,c)}"])

#                                           EEEE 0100001 CZI DDDDDDDDD SSSSSSSSS        TESTBN  D,S/#       WC/WZ
  def testbn(all=%{addr: addr, con: con, instr: "TESTBN", vars: {0b0100001,c,z,i,d,s}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s, %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"testbn",tohex(0,d),"#{imm?(i)}#{tohex(0,s)}#{wcz?(c,z)}"])

#                                           EEEE 0100010 CcI DDDDDDDDD SSSSSSSSS        BITC    D,S/#       {WCZ}
  def   bitc(all=%{addr: addr, con: con, instr: "BITC",   vars: {c,c,i,d,s}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s, %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"bitc",tohex(0,d),"#{imm?(i)}#{tohex(0,s)}#{wcz?(c,c)}"])

#                                           EEEE 0100010 CZI DDDDDDDDD SSSSSSSSS        TESTB   D,S/#       ANDC/ANDZ
  def  testb(all=%{addr: addr, con: con, instr: "TESTB",  vars: {0b0100010,0,1,i,d,s}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s, %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"testb",tohex(0,d),"#{imm?(i)}#{tohex(0,s)} andz"])
  def  testb(all=%{addr: addr, con: con, instr: "TESTB",  vars: {0b0100010,1,0,i,d,s}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s, %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"testb",tohex(0,d),"#{imm?(i)}#{tohex(0,s)} andc"])

#                                           EEEE 0100011 CcI DDDDDDDDD SSSSSSSSS        BITNC   D,S/#       {WCZ}
  def  bitnc(all=%{addr: addr, con: con, instr: "BITNC",  vars: {c,c,i,d,s}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s, %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"bitnc",tohex(0,d),"#{imm?(i)}#{tohex(0,s)}#{wcz?(c,c)}"])

#                                           EEEE 0100011 CZI DDDDDDDDD SSSSSSSSS        TESTBN  D,S/#       ANDC/ANDZ
  def testbn(all=%{addr: addr, con: con, instr: "TESTBN", vars: {0b0100011,0,1,i,d,s}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s, %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"testbn",tohex(0,d),"#{imm?(i)}#{tohex(0,s)} andz"])
  def testbn(all=%{addr: addr, con: con, instr: "TESTBN", vars: {0b0100011,1,0,i,d,s}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s, %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"testbn",tohex(0,d),"#{imm?(i)}#{tohex(0,s)} andc"])

#                                           EEEE 0100100 CcI DDDDDDDDD SSSSSSSSS        BITZ    D,S/#       {WCZ}
  def   bitz(all=%{addr: addr, con: con, instr: "BITZ",   vars: {c,c,i,d,s}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s, %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"bitz",tohex(0,d),"#{imm?(i)}#{tohex(0,s)}#{wcz?(c,c)}"])

#                                           EEEE 0100100 CZI DDDDDDDDD SSSSSSSSS        TESTB   D,S/#       ORC/ORZ
  def  testb(all=%{addr: addr, con: con, instr: "TESTB",  vars: {0b0100100,0,1,i,d,s}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s, %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"testb",tohex(0,d),"#{imm?(i)}#{tohex(0,s)} orz"])
  def  testb(all=%{addr: addr, con: con, instr: "TESTB",  vars: {0b0100100,1,0,i,d,s}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s, %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"testb",tohex(0,d),"#{imm?(i)}#{tohex(0,s)} orc"])

#                                           EEEE 0100101 CcI DDDDDDDDD SSSSSSSSS        BITNZ   D,S/#       {WCZ}
  def  bitnz(all=%{addr: addr, con: con, instr: "BITNZ",  vars: {c,c,i,d,s}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s, %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"bitnz",tohex(0,d),"#{imm?(i)}#{tohex(0,s)}#{wcz?(c,c)}"])

#                                           EEEE 0100101 CZI DDDDDDDDD SSSSSSSSS        TESTBN  D,S/#       ORC/ORZ
  def testbn(all=%{addr: addr, con: con, instr: "TESTBN", vars: {0b0100101,0,1,i,d,s}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s, %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"testbn",tohex(0,d),"#{imm?(i)}#{tohex(0,s)} orz"])
  def testbn(all=%{addr: addr, con: con, instr: "TESTBN", vars: {0b0100101,1,0,i,d,s}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s, %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"testbn",tohex(0,d),"#{imm?(i)}#{tohex(0,s)} orc"])

#                                           EEEE 0100110 CcI DDDDDDDDD SSSSSSSSS        BITRND  D,S/#       {WCZ}
  def bitrnd(all=%{addr: addr, con: con, instr: "BITRND", vars: {c,c,i,d,s}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s, %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"bitrnd",tohex(0,d),"#{imm?(i)}#{tohex(0,s)}#{wcz?(c,c)}"])

#                                           EEEE 0100110 CZI DDDDDDDDD SSSSSSSSS        TESTB   D,S/#       XORC/XORZ
  def  testb(all=%{addr: addr, con: con, instr: "TESTB",  vars: {0b0100110,0,1,i,d,s}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s, %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"testb",tohex(0,d),"#{imm?(i)}#{tohex(0,s)} xorz"])
  def  testb(all=%{addr: addr, con: con, instr: "TESTB",  vars: {0b0100110,1,0,i,d,s}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s, %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"testb",tohex(0,d),"#{imm?(i)}#{tohex(0,s)} xorc"])

#                                           EEEE 0100111 CcI DDDDDDDDD SSSSSSSSS        BITNOT  D,S/#       {WCZ}
  def bitnot(all=%{addr: addr, con: con, instr: "BITNOT", vars: {c,c,i,d,s}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s, %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"bitnot",tohex(0,d),"#{imm?(i)}#{tohex(0,s)}#{wcz?(c,c)}"])

#                                           EEEE 0100111 CZI DDDDDDDDD SSSSSSSSS        TESTBN  D,S/#       XORC/XORZ
  def testbn(all=%{addr: addr, con: con, instr: "TESTBN", vars: {0b0100111,0,1,i,d,s}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s, %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"testbn",tohex(0,d),"#{imm?(i)}#{tohex(0,s)} xorz"])
  def testbn(all=%{addr: addr, con: con, instr: "TESTBN", vars: {0b0100111,1,0,i,d,s}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s, %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"testbn",tohex(0,d),"#{imm?(i)}#{tohex(0,s)} xorc"])

#                                           EEEE 0101000 CZI DDDDDDDDD SSSSSSSSS        AND     D,S/#       {WC/WZ/WCZ}
  def   aand(all=%{addr: addr, con: con, instr: "AND",    vars: {c,z,i,d,s}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s, %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"and",tohex(0,d),"#{imm?(i)}#{tohex(0,s)}#{wcz?(c,z)}"])

#                                           EEEE 0101001 CZI DDDDDDDDD SSSSSSSSS        ANDN    D,S/#       {WC/WZ/WCZ}
  def   andn(all=%{addr: addr, con: con, instr: "ANDN",   vars: {c,z,i,d,s}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s, %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"andn",tohex(0,d),"#{imm?(i)}#{tohex(0,s)}#{wcz?(c,z)}"])

#                                           EEEE 0101010 CZI DDDDDDDDD SSSSSSSSS        OR      D,S/#       {WC/WZ/WCZ}
  def    oor(all=%{addr: addr, con: con, instr: "OR",     vars: {c,z,i,d,s}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s, %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"or",tohex(0,d),"#{imm?(i)}#{tohex(0,s)}#{wcz?(c,z)}"])

#                                           EEEE 0101011 CZI DDDDDDDDD SSSSSSSSS        XOR     D,S/#       {WC/WZ/WCZ}
  def    xor(all=%{addr: addr, con: con, instr: "XOR",    vars: {c,z,i,d,s}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s, %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"xor",tohex(0,d),"#{imm?(i)}#{tohex(0,s)}#{wcz?(c,z)}"])

#                                           EEEE 0101100 CZI DDDDDDDDD SSSSSSSSS        MUXC    D,S/#       {WC/WZ/WCZ}
  def   muxc(all=%{addr: addr, con: con, instr: "MUXC",   vars: {c,z,i,d,s}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s, %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"muxc",tohex(0,d),"#{imm?(i)}#{tohex(0,s)}#{wcz?(c,z)}"])

#                                           EEEE 0101101 CZI DDDDDDDDD SSSSSSSSS        MUXNC   D,S/#       {WC/WZ/WCZ}
  def  muxnc(all=%{addr: addr, con: con, instr: "MUXNC",  vars: {c,z,i,d,s}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s, %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"muxnc",tohex(0,d),"#{imm?(i)}#{tohex(0,s)}#{wcz?(c,z)}"])

#                                           EEEE 0101110 CZI DDDDDDDDD SSSSSSSSS        MUXZ    D,S/#       {WC/WZ/WCZ}
  def   muxz(all=%{addr: addr, con: con, instr: "MUXZ",   vars: {c,z,i,d,s}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s, %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"muxz",tohex(0,d),"#{imm?(i)}#{tohex(0,s)}#{wcz?(c,z)}"])

#                                           EEEE 0101111 CZI DDDDDDDDD SSSSSSSSS        MUXNZ   D,S/#       {WC/WZ/WCZ}
  def  muxnz(all=%{addr: addr, con: con, instr: "MUXNZ",  vars: {c,z,i,d,s}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s, %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"muxnz",tohex(0,d),"#{imm?(i)}#{tohex(0,s)}#{wcz?(c,z)}"])

#                                           EEEE 0110000 CZI DDDDDDDDD SSSSSSSSS        MOV     D,S/#       {WC/WZ/WCZ}
  def    mov(all=%{addr: addr, con: con, instr: "MOV",    vars: {c,z,i,d,s}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s, %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"mov",tohex(0,d),"#{imm?(i)}#{tohex(0,s)}#{wcz?(c,z)}"])

#                                           EEEE 0110001 CZI DDDDDDDDD SSSSSSSSS        NOT     D,S/#       {WC/WZ/WCZ}
  def    not(all=%{addr: addr, con: con, instr: "NOT",    vars: {c,z,i,d,s}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s, %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"not",tohex(0,d),"#{imm?(i)}#{tohex(0,s)}#{wcz?(c,z)}"])

#                                           EEEE 0110010 CZI DDDDDDDDD SSSSSSSSS        ABS     D,S/#       {WC/WZ/WCZ}
  def    abs(all=%{addr: addr, con: con, instr: "ABS",    vars: {c,z,i,d,s}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s, %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"abs",tohex(0,d),"#{imm?(i)}#{tohex(0,s)}#{wcz?(c,z)}"])

#                                           EEEE 0110011 CZI DDDDDDDDD SSSSSSSSS        NEG     D,S/#       {WC/WZ/WCZ}
  def    neg(all=%{addr: addr, con: con, instr: "NEG",    vars: {c,z,i,d,s}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s, %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"neg",tohex(0,d),"#{imm?(i)}#{tohex(0,s)}#{wcz?(c,z)}"])

#                                           EEEE 0110100 CZI DDDDDDDDD SSSSSSSSS        NEGC    D,S/#       {WC/WZ/WCZ}
  def   negc(all=%{addr: addr, con: con, instr: "NEGC",   vars: {c,z,i,d,s}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s, %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"negc",tohex(0,d),"#{imm?(i)}#{tohex(0,s)}#{wcz?(c,z)}"])

#                                           EEEE 0110101 CZI DDDDDDDDD SSSSSSSSS        NEGNC   D,S/#       {WC/WZ/WCZ}
  def  negnc(all=%{addr: addr, con: con, instr: "NEGNC",  vars: {c,z,i,d,s}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s, %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"negnc",tohex(0,d),"#{imm?(i)}#{tohex(0,s)}#{wcz?(c,z)}"])

#                                           EEEE 0110110 CZI DDDDDDDDD SSSSSSSSS        NEGZ    D,S/#       {WC/WZ/WCZ}
  def   negz(all=%{addr: addr, con: con, instr: "NEGZ",   vars: {c,z,i,d,s}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s, %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"negz",tohex(0,d),"#{imm?(i)}#{tohex(0,s)}#{wcz?(c,z)}"])

#                                           EEEE 0110111 CZI DDDDDDDDD SSSSSSSSS        NEGNZ   D,S/#       {WC/WZ/WCZ}
  def  negnz(all=%{addr: addr, con: con, instr: "NEGNZ",  vars: {c,z,i,d,s}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s, %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"negnz",tohex(0,d),"#{imm?(i)}#{tohex(0,s)}#{wcz?(c,z)}"])

#                                           EEEE 0111000 CZI DDDDDDDDD SSSSSSSSS        INCMOD  D,S/#       {WC/WZ/WCZ}
  def incmod(all=%{addr: addr, con: con, instr: "INCMOD", vars: {c,z,i,d,s}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s, %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"incmod",tohex(0,d),"#{imm?(i)}#{tohex(0,s)}#{wcz?(c,z)}"])

#                                           EEEE 0111001 CZI DDDDDDDDD SSSSSSSSS        DECMOD  D,S/#       {WC/WZ/WCZ}
  def decmod(all=%{addr: addr, con: con, instr: "DECMOD", vars: {c,z,i,d,s}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s, %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"decmod",tohex(0,d),"#{imm?(i)}#{tohex(0,s)}#{wcz?(c,z)}"])

#                                           EEEE 0111010 CZI DDDDDDDDD SSSSSSSSS        ZEROX   D,S/#       {WC/WZ/WCZ}
  def  zerox(all=%{addr: addr, con: con, instr: "ZEROX",  vars: {c,z,i,d,s}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s, %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"zerox",tohex(0,d),"#{imm?(i)}#{tohex(0,s)}#{wcz?(c,z)}"])

#                                           EEEE 0111011 CZI DDDDDDDDD SSSSSSSSS        SIGNX   D,S/#       {WC/WZ/WCZ}
  def  signx(all=%{addr: addr, con: con, instr: "SIGNX",  vars: {c,z,i,d,s}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s, %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"signx",tohex(0,d),"#{imm?(i)}#{tohex(0,s)}#{wcz?(c,z)}"])

#                                           EEEE 0111100 CZI DDDDDDDDD SSSSSSSSS        ENCOD   D,S/#       {WC/WZ/WCZ}
  def  encod(all=%{addr: addr, con: con, instr: "ENCOD",  vars: {c,z,i,d,s}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s, %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"encod",tohex(0,d),"#{imm?(i)}#{tohex(0,s)}#{wcz?(c,z)}"])

#                                           EEEE 0111101 CZI DDDDDDDDD SSSSSSSSS        ONES    D,S/#       {WC/WZ/WCZ}
  def   ones(all=%{addr: addr, con: con, instr: "ONES",  vars: {c,z,i,d,s}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s, %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"ones",tohex(0,d),"#{imm?(i)}#{tohex(0,s)}#{wcz?(c,z)}"])

#                                           EEEE 0111110 CZI DDDDDDDDD SSSSSSSSS        TEST    D,S/#       {WC/WZ/WCZ}
  def   test(all=%{addr: addr, con: con, instr: "TEST",  vars: {c,z,i,d,s}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s, %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"test",tohex(0,d),"#{imm?(i)}#{tohex(0,s)}#{wcz?(c,z)}"])

#                                           EEEE 0111111 CZI DDDDDDDDD SSSSSSSSS        TESTN   D,S/#       {WC/WZ/WCZ}
  def  testn(all=%{addr: addr, con: con, instr: "TESTN", vars: {c,z,i,d,s}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s, %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"testn",tohex(0,d),"#{imm?(i)}#{tohex(0,s)}#{wcz?(c,z)}"])

#                                           EEEE 100000N NNI DDDDDDDDD SSSSSSSSS        SETNIB  D,S/#,#N
  def setnib(all=%{addr: addr, con: con, instr: "SETNIB", vars: {n,i,d,s}, fullbin: <<fullbin::size(32)>>}), do: 
  ExPrintf.sprintf("%04x %08x %-12s %-7s %s, %s, %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"setnib",tohex(0,d),"#{imm?(i)}#{tohex(0,s)}","##{tohex(0,n)}"])

#                                           EEEE 100001N NNI DDDDDDDDD SSSSSSSSS        GETNIB  D,S/#,#N
  def getnib(all=%{addr: addr, con: con, instr: "GETNIB", vars: {n,i,d,s}, fullbin: <<fullbin::size(32)>>}), do: 
  ExPrintf.sprintf("%04x %08x %-12s %-7s %s, %s, %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"getnib",tohex(0,d),"#{imm?(i)}#{tohex(0,s)}","##{tohex(0,n)}"])

#                                           EEEE 100010N NNI DDDDDDDDD SSSSSSSSS        ROLNIB  D,S/#,#N
  def rolnib(all=%{addr: addr, con: con, instr: "ROLNIB", vars: {n,i,d,s}, fullbin: <<fullbin::size(32)>>}), do:
  ExPrintf.sprintf("%04x %08x %-12s %-7s %s, %s, %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"rolnib",tohex(0,d),"#{imm?(i)}#{tohex(0,s)}","##{tohex(0,n)}"])

#                                           EEEE 1000110 NNI DDDDDDDDD SSSSSSSSS        SETBYTE D,S/#,#N
  def setbyte(all=%{addr: addr, con: con, instr: "SETBYTE", vars: {n,i,d,s}, fullbin: <<fullbin::size(32)>>}), do:
  ExPrintf.sprintf("%04x %08x %-12s %-7s %s, %s, %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"setbyte",tohex(0,d),"#{imm?(i)}#{tohex(0,s)}","##{tohex(0,n)}"])

#                                           EEEE 1000111 NNI DDDDDDDDD SSSSSSSSS        GETBYTE D,S/#,#N
  def getbyte(all=%{addr: addr, con: con, instr: "GETBYTE", vars: {n,i,d,s}, fullbin: <<fullbin::size(32)>>}), do:
  ExPrintf.sprintf("%04x %08x %-12s %-7s %s, %s, %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"getbyte",tohex(0,d),"#{imm?(i)}#{tohex(0,s)}","##{tohex(0,n)}"])

#                                           EEEE 1001000 NNI DDDDDDDDD SSSSSSSSS        ROLBYTE D,S/#,#N
  def rolbyte(all=%{addr: addr, con: con, instr: "ROLBYTE", vars: {n,i,d,s}, fullbin: <<fullbin::size(32)>>}), do: 
  ExPrintf.sprintf("%04x %08x %-12s %-7s %s, %s, %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"rolbyte",tohex(0,d),"#{imm?(i)}#{tohex(0,s)}","##{tohex(0,n)}"])

#                                           EEEE 1001001 0NI DDDDDDDDD SSSSSSSSS        SETWORD D,S/#,#N
  def setword(all=%{addr: addr, con: con, instr: "SETWORD", vars: {n,i,d,s}, fullbin: <<fullbin::size(32)>>}), do:
  ExPrintf.sprintf("%04x %08x %-12s %-7s %s, %s, %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"setword",tohex(0,d),"#{imm?(i)}#{tohex(0,s)}","##{tohex(0,n)}"])

#                                           EEEE 1001001 1NI DDDDDDDDD SSSSSSSSS        GETWORD D,S/#,#N
  def getword(all=%{addr: addr, con: con, instr: "GETWORD", vars: {n,i,d,s}, fullbin: <<fullbin::size(32)>>}), do:
  ExPrintf.sprintf("%04x %08x %-12s %-7s %s, %s, %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"getword",tohex(0,d),"#{imm?(i)}#{tohex(0,s)}","##{tohex(0,n)}"])

#                                           EEEE 1001010 0NI DDDDDDDDD SSSSSSSSS        ROLWORD D,S/#,#N
  def rolword(all=%{addr: addr, con: con, instr: "ROLWORD", vars: {n,i,d,s}, fullbin: <<fullbin::size(32)>>}), do:
  ExPrintf.sprintf("%04x %08x %-12s %-7s %s, %s, %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"rolword",tohex(0,d),"#{imm?(i)}#{tohex(0,s)}","##{tohex(0,n)}"])

#                                           EEEE 1001010 10I DDDDDDDDD SSSSSSSSS        ALTSN   D,S/#
  def altsn(all=%{addr: addr, con: con, instr: "ALTSN", vars: {i,d,s}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s, %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"altsn",tohex(0,d),"#{imm?(i)}#{tohex(0,s)}"])

#                                           EEEE 1001010 11I DDDDDDDDD SSSSSSSSS        ALTGN   D,S/#
  def altgn(all=%{addr: addr, con: con, instr: "ALTGN", vars: {i,d,s}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s, %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"altgn",tohex(0,d),"#{imm?(i)}#{tohex(0,s)}"])

#                                           EEEE 1001011 00I DDDDDDDDD SSSSSSSSS        ALTSB   D,S/#
  def altsb(all=%{addr: addr, con: con, instr: "ALTSB", vars: {i,d,s}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s, %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"altsb",tohex(0,d),"#{imm?(i)}#{tohex(0,s)}"])

#                                           EEEE 1001011 01I DDDDDDDDD SSSSSSSSS        ALTGB   D,S/#
  def altgb(all=%{addr: addr, con: con, instr: "ALTGB", vars: {i,d,s}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s, %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"altgb",tohex(0,d),"#{imm?(i)}#{tohex(0,s)}"])

#                                           EEEE 1001011 10I DDDDDDDDD SSSSSSSSS        ALTSW   D,S/#
  def altsw(all=%{addr: addr, con: con, instr: "ALTSW", vars: {i,d,s}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s, %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"altsw",tohex(0,d),"#{imm?(i)}#{tohex(0,s)}"])

#                                           EEEE 1001011 11I DDDDDDDDD SSSSSSSSS        ALTGW   D,S/#
  def altgw(all=%{addr: addr, con: con, instr: "ALTGW", vars: {i,d,s}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s, %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"altgw",tohex(0,d),"#{imm?(i)}#{tohex(0,s)}"])

#                                           EEEE 1001100 00I DDDDDDDDD SSSSSSSSS        ALTR    D,S/#
  def altr(all=%{addr: addr, con: con, instr: "ALTR", vars: {i,d,s}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s, %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"altr",tohex(0,d),"#{imm?(i)}#{tohex(0,s)}"])

#                                           EEEE 1001100 01I DDDDDDDDD SSSSSSSSS        ALTD    D,S/#
  def altd(all=%{addr: addr, con: con, instr: "ALTD", vars: {i,d,s}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s, %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"altd",tohex(0,d),"#{imm?(i)}#{tohex(0,s)}"])

#                                           EEEE 1001100 10I DDDDDDDDD SSSSSSSSS        ALTS    D,S/#
  def alts(all=%{addr: addr, con: con, instr: "ALTS", vars: {i,d,s}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s, %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"alts",tohex(0,d),"#{imm?(i)}#{tohex(0,s)}"])

#                                           EEEE 1001100 11I DDDDDDDDD SSSSSSSSS        ALTB    D,S/#
  def altb(all=%{addr: addr, con: con, instr: "ALTB", vars: {i,d,s}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s, %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"altb",tohex(0,d),"#{imm?(i)}#{tohex(0,s)}"])

#                                           EEEE 1001101 00I DDDDDDDDD SSSSSSSSS        ALTI    D,S/#
  def alti(all=%{addr: addr, con: con, instr: "ALTI", vars: {i,d,s}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s, %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"alti",tohex(0,d),"#{imm?(i)}#{tohex(0,s)}"])

#                                           EEEE 1001101 01I DDDDDDDDD SSSSSSSSS        SETR    D,S/#
  def setr(all=%{addr: addr, con: con, instr: "SETR", vars: {i,d,s}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s, %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"setr",tohex(0,d),"#{imm?(i)}#{tohex(0,s)}"])

#                                           EEEE 1001101 10I DDDDDDDDD SSSSSSSSS        SETD    D,S/#
  def setd(all=%{addr: addr, con: con, instr: "SETD", vars: {i,d,s}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s, %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"setd",tohex(0,d),"#{imm?(i)}#{tohex(0,s)}"])

#                                           EEEE 1001101 11I DDDDDDDDD SSSSSSSSS        SETS    D,S/#
  def sets(all=%{addr: addr, con: con, instr: "SETS", vars: {i,d,s}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s, %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"sets",tohex(0,d),"#{imm?(i)}#{tohex(0,s)}"])

#                                           EEEE 1001110 00I DDDDDDDDD SSSSSSSSS        DECOD   D,S/#
  def decod(all=%{addr: addr, con: con, instr: "DECOD", vars: {i,d,s}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s, %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"decod",tohex(0,d),"#{imm?(i)}#{tohex(0,s)}"])

#                                           EEEE 1001110 01I DDDDDDDDD SSSSSSSSS        BMASK   D,S/#
  def bmask(all=%{addr: addr, con: con, instr: "BMASK", vars: {i,d,s}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s, %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"bmask",tohex(0,d),"#{imm?(i)}#{tohex(0,s)}"])

#                                           EEEE 1001110 10I DDDDDDDDD SSSSSSSSS        CRCBIT  D,S/#
  def crcbit(all=%{addr: addr, con: con, instr: "CRCBIT", vars: {i,d,s}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s, %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"crcbit",tohex(0,d),"#{imm?(i)}#{tohex(0,s)}"])

#                                           EEEE 1001110 11I DDDDDDDDD SSSSSSSSS        CRCNIB  D,S/#
  def crcnib(all=%{addr: addr, con: con, instr: "CRCNIB", vars: {i,d,s}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s, %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"crcnib",tohex(0,d),"#{imm?(i)}#{tohex(0,s)}"])

#                                           EEEE 1001111 00I DDDDDDDDD SSSSSSSSS        MUXNITS D,S/#
  def muxnits(all=%{addr: addr, con: con, instr: "MUXNITS", vars: {i,d,s}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s, %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"muxnits",tohex(0,d),"#{imm?(i)}#{tohex(0,s)}"])

#                                           EEEE 1001111 01I DDDDDDDDD SSSSSSSSS        MUXNIBS D,S/#
  def muxnibs(all=%{addr: addr, con: con, instr: "MUXNIBS", vars: {i,d,s}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s, %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"muxnibs",tohex(0,d),"#{imm?(i)}#{tohex(0,s)}"])

#                                           EEEE 1001111 10I DDDDDDDDD SSSSSSSSS        MUXQ    D,S/#
  def muxq(all=%{addr: addr, con: con, instr: "MUXQ", vars: {i,d,s}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s, %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"muxq",tohex(0,d),"#{imm?(i)}#{tohex(0,s)}"])

#                                           EEEE 1001111 11I DDDDDDDDD SSSSSSSSS        MOVBYTS D,S/#
  def movbyts(all=%{addr: addr, con: con, instr: "MOVBYTS", vars: {i,d,s}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s, %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"movbyts",tohex(0,d),"#{imm?(i)}#{tohex(0,s)}"])

#                                           EEEE 1010000 0ZI DDDDDDDDD SSSSSSSSS        MUL     D,S/#       {WZ}
  def mul(all=%{addr: addr, con: con, instr: "MUL", vars: {z,i,d,s}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s, %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"mul",tohex(0,d),"#{imm?(i)}#{tohex(0,s)}#{wcz?(0,z)}"])

#                                           EEEE 1010000 1ZI DDDDDDDDD SSSSSSSSS        MULS    D,S/#       {WZ}
  def muls(all=%{addr: addr, con: con, instr: "MULS", vars: {z,i,d,s}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s, %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"muls",tohex(0,d),"#{imm?(i)}#{tohex(0,s)}#{wcz?(0,z)}"])

#                                           EEEE 1010001 0ZI DDDDDDDDD SSSSSSSSS        SCA     D,S/#       {WZ}
  def sca(all=%{addr: addr, con: con, instr: "SCA", vars: {z,i,d,s}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s, %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"sca",tohex(0,d),"#{imm?(i)}#{tohex(0,s)}#{wcz?(0,z)}"])

#                                           EEEE 1010001 1ZI DDDDDDDDD SSSSSSSSS        SCAS    D,S/#       {WZ}
  def scas(all=%{addr: addr, con: con, instr: "SCAS", vars: {z,i,d,s}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s, %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"scas",tohex(0,d),"#{imm?(i)}#{tohex(0,s)}#{wcz?(0,z)}"])

#                                           EEEE 1010010 00I DDDDDDDDD SSSSSSSSS        ADDPIX  D,S/#
  def addpix(all=%{addr: addr, con: con, instr: "ADDPIX", vars: {i,d,s}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s, %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"addpix",tohex(0,d),"#{imm?(i)}#{tohex(0,s)}"])

#                                           EEEE 1010010 01I DDDDDDDDD SSSSSSSSS        MULPIX  D,S/#
  def mulpix(all=%{addr: addr, con: con, instr: "MULPIX", vars: {i,d,s}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s, %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"mulpix",tohex(0,d),"#{imm?(i)}#{tohex(0,s)}"])

#                                           EEEE 1010010 10I DDDDDDDDD SSSSSSSSS        BLNPIX  D,S/#
  def blnpix(all=%{addr: addr, con: con, instr: "BLNPIX", vars: {i,d,s}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s, %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"blnpix",tohex(0,d),"#{imm?(i)}#{tohex(0,s)}"])

#                                           EEEE 1010010 11I DDDDDDDDD SSSSSSSSS        MIXPIX  D,S/#
  def mixpix(all=%{addr: addr, con: con, instr: "MIXPIX", vars: {i,d,s}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s, %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"mixpix",tohex(0,d),"#{imm?(i)}#{tohex(0,s)}"])

#                                           EEEE 1010011 00I DDDDDDDDD SSSSSSSSS        ADDCT1  D,S/#
  def addct1(all=%{addr: addr, con: con, instr: "ADDCT1", vars: {i,d,s}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s, %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"addct1",tohex(0,d),"#{imm?(i)}#{tohex(0,s)}"])

#                                           EEEE 1010011 01I DDDDDDDDD SSSSSSSSS        ADDCT2  D,S/#
  def addct2(all=%{addr: addr, con: con, instr: "ADDCT2", vars: {i,d,s}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s, %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"addct2",tohex(0,d),"#{imm?(i)}#{tohex(0,s)}"])

#                                           EEEE 1010011 10I DDDDDDDDD SSSSSSSSS        ADDCT3  D,S/#
  def addct3(all=%{addr: addr, con: con, instr: "ADDCT3", vars: {i,d,s}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s, %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"addct3",tohex(0,d),"#{imm?(i)}#{tohex(0,s)}"])

#                                           EEEE 1010011 11I DDDDDDDDD SSSSSSSSS        WMLONG  D,S/#/PTRx
  def wmlong(all=%{addr: addr, con: con, instr: "WMLONG", vars: {i,d,s}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s, %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"wmlong",tohex(0,d),"#{imm?(i)}#{tohex(0,s)}"])

#                                           EEEE 1010100 C0I DDDDDDDDD SSSSSSSSS        RQPIN   D,S/#       {WC}
  def rqpin(all=%{addr: addr, con: con, instr: "RQPIN", vars: {c,<< 0b0::size(1) >>,i,d,s}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s, %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"rqpin",tohex(0,d),"#{imm?(i)}#{tohex(0,s)}#{wcz?(c,0)}"])

#                                           EEEE 1010100 C1I DDDDDDDDD SSSSSSSSS        RDPIN   D,S/#       {WC}
  def rdpin(all=%{addr: addr, con: con, instr: "RDPIN", vars: {c,<< 0b1::size(1) >>,i,d,s}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s, %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"rdpin",tohex(0,d),"#{imm?(i)}#{tohex(0,s)}#{wcz?(c,0)}"])

#                                           EEEE 1010101 CZI DDDDDDDDD SSSSSSSSS        RDLUT   D,S/#       {WC/WZ/WCZ}
  def rdlut(all=%{addr: addr, con: con, instr: "RDLUT", vars: {c,z,i,d,s}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s, %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"rdlut",tohex(0,d),"#{imm?(i)}#{tohex(0,s)}#{wcz?(c,z)}"])

#                                           EEEE 1010110 CZI DDDDDDDDD SSSSSSSSS        RDBYTE  D,S/#/PTRx  {WC/WZ/WCZ}
  def rdbyte(all=%{addr: addr, con: con, instr: "RDBYTE", vars: {c,z,i,d,s}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s, %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"rdbyte",tohex(0,d),"#{wrlongdecode(i,<<s::size(9)>>)}#{wcz?(c,z)}"])

#                                           EEEE 1010111 CZI DDDDDDDDD SSSSSSSSS        RDWORD  D,S/#/PTRx  {WC/WZ/WCZ}
  def rdword(all=%{addr: addr, con: con, instr: "RDWORD", vars: {c,z,i,d,s}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s, %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"rdword",tohex(0,d),"#{wrlongdecode(i,<<s::size(9)>>)}#{wcz?(c,z)}"])

#                                           EEEE 1011000 CZI DDDDDDDDD SSSSSSSSS        RDLONG  D,S/#/PTRx  {WC/WZ/WCZ}
  def rdlong(all=%{addr: addr, con: con, instr: "RDLONG", vars: {c,z,i,d,s}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s, %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"rdlong",tohex(0,d),"#{wrlongdecode(i,<<s::size(9)>>)}#{wcz?(c,z)}"])

#                                           EEEE 1011001 CZI DDDDDDDDD SSSSSSSSS        CALLD   D,S/#rel9   {WC/WZ/WCZ}
  def calld(all=%{addr: addr, con: con, instr: "CALLD", vars: {c,z,i,d,s}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s, %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"calld",tohex(0,d),"#{imm?(i)}#{tohex(0,s)}#{wcz?(c,z)}"])

#                                           EEEE 1011010 0LI DDDDDDDDD SSSSSSSSS        CALLPA  D/#,S/#rel9
  def callpa(all=%{addr: addr, con: con, instr: "CALLPA", vars: {l,i,d,s}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s, %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"callpa","#{imm?(l)}#{tohex(0,d)}","#{imm?(i)}#{tohex(0,s)}"])

#                                           EEEE 1011010 1LI DDDDDDDDD SSSSSSSSS        CALLPB  D/#,S/#rel9
  def callpb(all=%{addr: addr, con: con, instr: "CALLPB", vars: {l,i,d,s}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s, %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"callpb","#{imm?(l)}#{tohex(0,d)}","#{imm?(i)}#{tohex(0,s)}"])

#                                           EEEE 1011011 00I DDDDDDDDD SSSSSSSSS        DJZ     D,S/#rel9
  def djz(all=%{addr: addr, con: con, instr: "DJZ", vars: {i,d,s}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s, %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"djz",tohex(0,d),"#{imm?(i)}#{tohex(0,s)}"])

#                                           EEEE 1011011 01I DDDDDDDDD SSSSSSSSS        DJNZ    D,S/#rel9
  def djnz(all=%{addr: addr, con: con, instr: "DJNZ", vars: {0,d,s}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s, %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"djnz",tohex(0,d),tohex(0,s)])
  ## Probably needs to be refactored as logic is backwards between this and JMP
  def djnz(all=%{addr: addr, con: con, instr: "DJNZ", vars: {1,d,s}, fullbin: <<fullbin::size(32)>>}) when addr < 0x400, do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s, %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"djnz",tohex(0,d),relToPC(0x500, s+1, 1)])
  def djnz(all=%{addr: addr, con: con, instr: "DJNZ", vars: {1,d,s}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s, %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"djnz",tohex(0,d),relToPC(0x0, s, 1)])

#                                           EEEE 1011011 10I DDDDDDDDD SSSSSSSSS        DJF     D,S/#rel9
  def djf(all=%{addr: addr, con: con, instr: "DJF", vars: {i,d,s}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s, %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"djf",tohex(0,d),"#{imm?(i)}#{tohex(0,s)}"])

#                                           EEEE 1011011 11I DDDDDDDDD SSSSSSSSS        DJNF    D,S/#rel9
  def djnf(all=%{addr: addr, con: con, instr: "DJNF", vars: {i,d,s}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s, %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"djnf",tohex(0,d),"#{imm?(i)}$#{tohex(0,castSigned9(s+1))}"])

#                                           EEEE 1011100 00I DDDDDDDDD SSSSSSSSS        IJZ     D,S/#rel9
  def ijz(all=%{addr: addr, con: con, instr: "IJZ", vars: {i,d,s}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s, %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"ijz",tohex(0,d),"#{imm?(i)}#{tohex(0,s)}"])

#                                           EEEE 1011100 01I DDDDDDDDD SSSSSSSSS        IJNZ    D,S/#rel9
  def ijnz(all=%{addr: addr, con: con, instr: "IJNZ", vars: {i,d,s}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s, %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"ijnz",tohex(0,d),"#{imm?(i)}#{tohex(0,s)}"])

#                                           EEEE 1011100 10I DDDDDDDDD SSSSSSSSS        TJZ     D,S/#rel9
  def tjz(all=%{addr: addr, con: con, instr: "TJZ", vars: {i,d,s}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s, %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"tjz",tohex(0,d),"#{imm?(i)}#{tohex(0,s)}"])

#                                           EEEE 1011100 11I DDDDDDDDD SSSSSSSSS        TJNZ    D,S/#rel9
  def tjnz(all=%{addr: addr, con: con, instr: "TJNZ", vars: {i,d,s}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s, %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"tjnz",tohex(0,d),"#{imm?(i)}#{tohex(0,s)}"])

#                                           EEEE 1011101 00I DDDDDDDDD SSSSSSSSS        TJF     D,S/#rel9
  def tjf(all=%{addr: addr, con: con, instr: "TJF", vars: {i,d,s}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s, %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"tjf",tohex(0,d),"#{imm?(i)}#{tohex(0,s)}"])

#                                           EEEE 1011101 01I DDDDDDDDD SSSSSSSSS        TJNF    D,S/#rel9
  def tjnf(all=%{addr: addr, con: con, instr: "TJNF", vars: {i,d,s}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s, %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"tjnf",tohex(0,d),"#{imm?(i)}#{tohex(0,s)}"])

#                                           EEEE 1011101 10I DDDDDDDDD SSSSSSSSS        TJS     D,S/#rel9
  def tjs(all=%{addr: addr, con: con, instr: "TJS", vars: {i,d,s}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s, %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"tjs",tohex(0,d),"#{imm?(i)}#{tohex(0,s)}"])

#                                           EEEE 1011101 11I DDDDDDDDD SSSSSSSSS        TJNS    D,S/#rel9
  def tjns(all=%{addr: addr, con: con, instr: "TJNS", vars: {i,d,s}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s, %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"tjns",tohex(0,d),"#{imm?(i)}#{tohex(0,s)}"])

#                                           EEEE 1011110 00I DDDDDDDDD SSSSSSSSS        TJV     D,S/#rel9
  def tjv(all=%{addr: addr, con: con, instr: "TJV", vars: {i,d,s}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s, %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"tjv",tohex(0,d),"#{imm?(i)}#{tohex(0,s)}"])

#                                           EEEE 1011110 01I 000000000 SSSSSSSSS        JINT    S/#rel9
  def jint(all=%{addr: addr, con: con, instr: "JINT", vars: {i,<< 0b000000000::size(9) >>,s}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"jint","#{imm?(i)}$#{tohex(0,castSigned9(s+1))}"])

#                                           EEEE 1011110 01I 000000001 SSSSSSSSS        JCT1    S/#rel9
  def jct1(all=%{addr: addr, con: con, instr: "JCT1", vars: {i,<< 0b00000000::size(8) >>,<< 0b1::size(1) >>,s}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"jct1","#{imm?(i)}$#{tohex(0,castSigned9(s+1))}"])

#                                           EEEE 1011110 01I 000000010 SSSSSSSSS        JCT2    S/#rel9
  def jct2(all=%{addr: addr, con: con, instr: "JCT2", vars: {i,<< 0b0000000::size(7) >>,<< 0b1::size(1) >>,<< 0b0::size(1) >>,s}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"jct2","#{imm?(i)}$#{tohex(0,castSigned9(s+1))}"])

#                                           EEEE 1011110 01I 000000011 SSSSSSSSS        JCT3    S/#rel9
  def jct3(all=%{addr: addr, con: con, instr: "JCT3", vars: {i,<< 0b0000000::size(7) >>,<< 0b11::size(2) >>,s}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"jct3","#{imm?(i)}$#{tohex(0,castSigned9(s+1))}"])

#                                           EEEE 1011110 01I 000000100 SSSSSSSSS        JSE1    S/#rel9
  def jse1(all=%{addr: addr, con: con, instr: "JSE1", vars: {i,<< 0b000000::size(6) >>,<< 0b1::size(1) >>,<< 0b00::size(2) >>,s}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"jse1","#{imm?(i)}$#{tohex(0,castSigned9(s+1))}"])

#                                           EEEE 1011110 01I 000000101 SSSSSSSSS        JSE2    S/#rel9
  def jse2(all=%{addr: addr, con: con, instr: "JSE2", vars: {i,<< 0b000000::size(6) >>,<< 0b1::size(1) >>,<< 0b0::size(1) >>,<< 0b1::size(1) >>,s}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"jse2","#{imm?(i)}$#{tohex(0,castSigned9(s+1))}"])

#                                           EEEE 1011110 01I 000000110 SSSSSSSSS        JSE3    S/#rel9
  def jse3(all=%{addr: addr, con: con, instr: "JSE3", vars: {i,<< 0b000000::size(6) >>,<< 0b11::size(2) >>,<< 0b0::size(1) >>,s}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"jse3","#{imm?(i)}$#{tohex(0,castSigned9(s+1))}"])

#                                           EEEE 1011110 01I 000000111 SSSSSSSSS        JSE4    S/#rel9
  def jse4(all=%{addr: addr, con: con, instr: "JSE4", vars: {i,<< 0b000000::size(6) >>,<< 0b111::size(3) >>,s}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"jse4","#{imm?(i)}$#{tohex(0,castSigned9(s+1))}"])

#                                           EEEE 1011110 01I 000001000 SSSSSSSSS        JPAT    S/#rel9
  def jpat(all=%{addr: addr, con: con, instr: "JPAT", vars: {i,<< 0b00000::size(5) >>,<< 0b1::size(1) >>,<< 0b000::size(3) >>,s}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"jpat","#{imm?(i)}$#{tohex(0,castSigned9(s+1))}"])

#                                           EEEE 1011110 01I 000001001 SSSSSSSSS        JFBW    S/#rel9
  def jfbw(all=%{addr: addr, con: con, instr: "JFBW", vars: {i,<< 0b00000::size(5) >>,<< 0b1::size(1) >>,<< 0b00::size(2) >>,<< 0b1::size(1) >>,s}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"jfbw","#{imm?(i)}$#{tohex(0,castSigned9(s+1))}"])

#                                           EEEE 1011110 01I 000001010 SSSSSSSSS        JXMT    S/#rel9
  def jxmt(all=%{addr: addr, con: con, instr: "JXMT", vars: {i,<< 0b00000::size(5) >>,<< 0b1::size(1) >>,<< 0b0::size(1) >>,<< 0b1::size(1) >>,<< 0b0::size(1) >>,s}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"jxmt","#{imm?(i)}$#{tohex(0,castSigned9(s+1))}"])

#                                           EEEE 1011110 01I 000001011 SSSSSSSSS        JXFI    S/#rel9
  def jxfi(all=%{addr: addr, con: con, instr: "JXFI", vars: {i,<< 0b00000::size(5) >>,<< 0b1::size(1) >>,<< 0b0::size(1) >>,<< 0b11::size(2) >>,s}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"jxfi","#{imm?(i)}$#{tohex(0,castSigned9(s+1))}"])

#                                           EEEE 1011110 01I 000001100 SSSSSSSSS        JXRO    S/#rel9
  def jxro(all=%{addr: addr, con: con, instr: "JXRO", vars: {i,<< 0b00000::size(5) >>,<< 0b11::size(2) >>,<< 0b00::size(2) >>,s}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"jxro","#{imm?(i)}$#{tohex(0,castSigned9(s+1))}"])

#                                           EEEE 1011110 01I 000001101 SSSSSSSSS        JXRL    S/#rel9
  def jxrl(all=%{addr: addr, con: con, instr: "JXRL", vars: {i,<< 0b00000::size(5) >>,<< 0b11::size(2) >>,<< 0b0::size(1) >>,<< 0b1::size(1) >>,s}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"jxrl","#{imm?(i)}$#{tohex(0,castSigned9(s+1))}"])

#                                           EEEE 1011110 01I 000001110 SSSSSSSSS        JATN    S/#rel9
  def jatn(all=%{addr: addr, con: con, instr: "JATN", vars: {i,<< 0b00000::size(5) >>,<< 0b111::size(3) >>,<< 0b0::size(1) >>,s}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"jatn","#{imm?(i)}$#{tohex(0,castSigned9(s+1))}"])

#                                           EEEE 1011110 01I 000001111 SSSSSSSSS        JQMT    S/#rel9
  def jqmt(all=%{addr: addr, con: con, instr: "JQMT", vars: {i,<< 0b00000::size(5) >>,<< 0b1111::size(4) >>,s}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"jqmt","#{imm?(i)}$#{tohex(0,castSigned9(s+1))}"])

#                                           EEEE 1011110 01I 000010000 SSSSSSSSS        JNINT   S/#rel9
  def jnint(all=%{addr: addr, con: con, instr: "JNINT", vars: {i,<< 0b0000::size(4) >>,<< 0b1::size(1) >>,<< 0b0000::size(4) >>,s}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"jnint","#{imm?(i)}$#{tohex(0,castSigned9(s+1))}"])

#                                           EEEE 1011110 01I 000010001 SSSSSSSSS        JNCT1   S/#rel9
  def jnct1(all=%{addr: addr, con: con, instr: "JNCT1", vars: {i,<< 0b0000::size(4) >>,<< 0b1::size(1) >>,<< 0b000::size(3) >>,<< 0b1::size(1) >>,s}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"jnct1","#{imm?(i)}$#{tohex(0,castSigned9(s+1))}"])

#                                           EEEE 1011110 01I 000010010 SSSSSSSSS        JNCT2   S/#rel9
  def jnct2(all=%{addr: addr, con: con, instr: "JNCT2", vars: {i,<< 0b0000::size(4) >>,<< 0b1::size(1) >>,<< 0b00::size(2) >>,<< 0b1::size(1) >>,<< 0b0::size(1) >>,s}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"jnct2","#{imm?(i)}$#{tohex(0,castSigned9(s+1))}"])

#                                           EEEE 1011110 01I 000010011 SSSSSSSSS        JNCT3   S/#rel9
  def jnct3(all=%{addr: addr, con: con, instr: "JNCT3", vars: {i,<< 0b0000::size(4) >>,<< 0b1::size(1) >>,<< 0b00::size(2) >>,<< 0b11::size(2) >>,s}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"jnct3","#{imm?(i)}$#{tohex(0,castSigned9(s+1))}"])

#                                           EEEE 1011110 01I 000010100 SSSSSSSSS        JNSE1   S/#rel9
  def jnse1(all=%{addr: addr, con: con, instr: "JNSE1", vars: {i,<< 0b0000::size(4) >>,<< 0b1::size(1) >>,<< 0b0::size(1) >>,<< 0b1::size(1) >>,<< 0b00::size(2) >>,s}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"jnse1","#{imm?(i)}$#{tohex(0,castSigned9(s+1))}"])

#                                           EEEE 1011110 01I 000010101 SSSSSSSSS        JNSE2   S/#rel9
  def jnse2(all=%{addr: addr, con: con, instr: "JNSE2", vars: {i,<< 0b0000::size(4) >>,<< 0b1::size(1) >>,<< 0b0::size(1) >>,<< 0b1::size(1) >>,<< 0b0::size(1) >>,<< 0b1::size(1) >>,s}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"jnse2","#{imm?(i)}$#{tohex(0,castSigned9(s+1))}"])

#                                           EEEE 1011110 01I 000010110 SSSSSSSSS        JNSE3   S/#rel9
  def jnse3(all=%{addr: addr, con: con, instr: "JNSE3", vars: {i,<< 0b0000::size(4) >>,<< 0b1::size(1) >>,<< 0b0::size(1) >>,<< 0b11::size(2) >>,<< 0b0::size(1) >>,s}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"jnse3","#{imm?(i)}$#{tohex(0,castSigned9(s+1))}"])

#                                           EEEE 1011110 01I 000010111 SSSSSSSSS        JNSE4   S/#rel9
  def jnse4(all=%{addr: addr, con: con, instr: "JNSE4", vars: {i,<< 0b0000::size(4) >>,<< 0b1::size(1) >>,<< 0b0::size(1) >>,<< 0b111::size(3) >>,s}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"jnse4","#{imm?(i)}$#{tohex(0,castSigned9(s+1))}"])

#                                           EEEE 1011110 01I 000011000 SSSSSSSSS        JNPAT   S/#rel9
  def jnpat(all=%{addr: addr, con: con, instr: "JNPAT", vars: {i,<< 0b0000::size(4) >>,<< 0b11::size(2) >>,<< 0b000::size(3) >>,s}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"jnpat","#{imm?(i)}$#{tohex(0,castSigned9(s+1))}"])

#                                           EEEE 1011110 01I 000011001 SSSSSSSSS        JNFBW   S/#rel9
  def jnfbw(all=%{addr: addr, con: con, instr: "JNFBW", vars: {i,<< 0b0000::size(4) >>,<< 0b11::size(2) >>,<< 0b00::size(2) >>,<< 0b1::size(1) >>,s}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"jnfbw","#{imm?(i)}$#{tohex(0,castSigned9(s+1))}"])

#                                           EEEE 1011110 01I 000011010 SSSSSSSSS        JNXMT   S/#rel9
  def jnxmt(all=%{addr: addr, con: con, instr: "JNXMT", vars: {i,<< 0b0000::size(4) >>,<< 0b11::size(2) >>,<< 0b0::size(1) >>,<< 0b1::size(1) >>,<< 0b0::size(1) >>,s}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"jnxmt","#{imm?(i)}$#{tohex(0,castSigned9(s+1))}"])

#                                           EEEE 1011110 01I 000011011 SSSSSSSSS        JNXFI   S/#rel9
  def jnxfi(all=%{addr: addr, con: con, instr: "JNXFI", vars: {i,<< 0b0000::size(4) >>,<< 0b11::size(2) >>,<< 0b0::size(1) >>,<< 0b11::size(2) >>,s}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"jnxfi","#{imm?(i)}$#{tohex(0,castSigned9(s+1))}"])

#                                           EEEE 1011110 01I 000011100 SSSSSSSSS        JNXRO   S/#rel9
  def jnxro(all=%{addr: addr, con: con, instr: "JNXRO", vars: {i,<< 0b0000::size(4) >>,<< 0b111::size(3) >>,<< 0b00::size(2) >>,s}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"jnxro","#{imm?(i)}$#{tohex(0,castSigned9(s+1))}"])

#                                           EEEE 1011110 01I 000011101 SSSSSSSSS        JNXRL   S/#rel9
  def jnxrl(all=%{addr: addr, con: con, instr: "JNXRL", vars: {i,<< 0b0000::size(4) >>,<< 0b111::size(3) >>,<< 0b0::size(1) >>,<< 0b1::size(1) >>,s}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"jnxrl","#{imm?(i)}$#{tohex(0,castSigned9(s+1))}"])

#                                           EEEE 1011110 01I 000011110 SSSSSSSSS        JNATN   S/#rel9
  def jnatn(all=%{addr: addr, con: con, instr: "JNATN", vars: {i,<< 0b0000::size(4) >>,<< 0b1111::size(4) >>,<< 0b0::size(1) >>,s}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"jnatn","#{imm?(i)}$#{tohex(0,castSigned9(s+1))}"])

#                                           EEEE 1011110 01I 000011111 SSSSSSSSS        JNQMT   S/#rel9
  def jnqmt(all=%{addr: addr, con: con, instr: "JNQMT", vars: {i,<< 0b0000::size(4) >>,<< 0b11111::size(5) >>,s}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"jnqmt","#{imm?(i)}$#{tohex(0,castSigned9(s+1))}"])

#                                           EEEE 1011111 1LI DDDDDDDDD SSSSSSSSS        SETPAT  D/#,S/#
  def setpat(all=%{addr: addr, con: con, instr: "SETPAT", vars: {l,i,d,s}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s, %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"setpat","#{imm?(l)}#{tohex(0,d)}","#{imm?(i)}#{tohex(0,s)}"])

#                                           EEEE 1100000 0LI DDDDDDDDD SSSSSSSSS        WRPIN   D/#,S/#
  def wrpin(all=%{addr: addr, con: con, instr: "WRPIN", vars: {l,i,d,s}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s, %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"wrpin","#{imm?(l)}#{tohex(0,d)}","#{imm?(i)}#{tohex(0,s)}"])

#                                           EEEE 1100000 1LI DDDDDDDDD SSSSSSSSS        WXPIN   D/#,S/#
  def wxpin(all=%{addr: addr, con: con, instr: "WXPIN", vars: {l,i,d,s}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s, %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"wxpin","#{imm?(l)}#{tohex(0,d)}","#{imm?(i)}#{tohex(0,s)}"])

#                                           EEEE 1100001 0LI DDDDDDDDD SSSSSSSSS        WYPIN   D/#,S/#
  def wypin(all=%{addr: addr, con: con, instr: "WYPIN", vars: {l,i,d,s}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s, %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"wypin","#{imm?(l)}#{tohex(0,d)}","#{imm?(i)}#{tohex(0,s)}"])

#                                           EEEE 1100001 1LI DDDDDDDDD SSSSSSSSS        WRLUT   D/#,S/#
  def wrlut(all=%{addr: addr, con: con, instr: "WRLUT", vars: {l,i,d,s}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s, %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"wrlut","#{imm?(l)}#{tohex(0,d)}","#{imm?(i)}#{tohex(0,s)}"])

#                                           EEEE 1100010 0LI DDDDDDDDD SSSSSSSSS        WRBYTE  D/#,S/#/PTRx
def wrbyte(all=%{addr: addr, con: con, instr: "WRBYTE", vars: {l,i,d,s}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s, %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"wrbyte","#{imm?(l)}#{tohex(0,d)}","#{wrlongdecode(i,<<s::size(9)>>)}"])

#                                           EEEE 1100010 1LI DDDDDDDDD SSSSSSSSS        WRWORD  D/#,S/#/PTRx
  def wrword(all=%{addr: addr, con: con, instr: "WRWORD", vars: {l,i,d,s}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s, %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"wrword","#{imm?(l)}#{tohex(0,d)}","#{wrlongdecode(i,<<s::size(9)>>)}"])

#                                           EEEE 1100011 0LI DDDDDDDDD SSSSSSSSS        WRLONG  D/#,S/#/PTRx
#  def wrlong(all=%{addr: addr, con: con, instr: "WRLONG", vars: {l,i,d,s}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s, %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"wrlong","#{imm?(l)}#{tohex(0,d)}","#{imm?(i)}#{tohex(0,s)}"])
  def wrlong(all=%{addr: addr, con: con, instr: "WRLONG", vars: {l,i,d,s}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s, %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"wrlong","#{imm?(l)}#{tohex(0,d)}","#{wrlongdecode(i,<<s::size(9)>>)}"])

  def wrlongdecode(i,<<0b100000000::size(9)>>), do: "ptra"   #     PTRA              'use PTRA
  def wrlongdecode(i,<<0b110000000::size(9)>>), do: "ptrb"   #     PTRB              'use PTRB
  def wrlongdecode(i,<<0b101100001::size(9)>>), do: "ptra++" #     PTRA++            'use PTRA,                PTRA += SCALE
  def wrlongdecode(i,<<0b111100001::size(9)>>), do: "ptrb++" #     PTRB++            'use PTRB,                PTRB += SCALE
  def wrlongdecode(i,<<0b101111111::size(9)>>), do: "ptra--" #     PTRA--            'use PTRA,                PTRA -= SCALE
  def wrlongdecode(i,<<0b111111111::size(9)>>), do: "ptrb--" #     PTRB--            'use PTRB,                PTRB -= SCALE
  def wrlongdecode(i,<<0b101000001::size(9)>>), do: "++ptra" #     ++PTRA            'use PTRA + SCALE,        PTRA += SCALE
  def wrlongdecode(i,<<0b111000001::size(9)>>), do: "++ptrb" #     ++PTRB            'use PTRB + SCALE,        PTRB += SCALE
  def wrlongdecode(i,<<0b101011111::size(9)>>), do: "--ptra" #     --PTRA            'use PTRA - SCALE,        PTRA -= SCALE
  def wrlongdecode(i,<<0b111011111::size(9)>>), do: "--ptrb" #     --PTRB            'use PTRB - SCALE,        PTRB -= SCALE

  def wrlongdecode(i,<<0b1000::size(4), n::signed-size(5)>>), do: "ptra[#{n}]" #      PTRA[INDEX]       'use PTRA + INDEX*SCALE
  def wrlongdecode(i,<<0b1100::size(4), n::signed-size(5)>>), do: "ptrb[#{n}]" #      PTRB[INDEX]       'use PTRB + INDEX*SCALE
  def wrlongdecode(i,<<0b1011::size(4), n::signed-size(5)>>) when n >= 0, do: "ptra++[#{n}]" #      PTRA++[INDEX]     'use PTRA,                PTRA += INDEX*SCALE
  def wrlongdecode(i,<<0b1111::size(4), n::signed-size(5)>>) when n >= 0, do: "ptrb++[#{n}]" #      PTRB++[INDEX]     'use PTRB,                PTRB += INDEX*SCALE
  def wrlongdecode(i,<<0b1011::size(4), n::signed-size(5)>>), do: "ptra--[#{:erlang.abs(n)}]" #      PTRA--[INDEX]     'use PTRA,                PTRA -= INDEX*SCALE
  def wrlongdecode(i,<<0b1111::size(4), n::signed-size(5)>>), do: "ptrb--[#{:erlang.abs(n)}]" #      PTRB--[INDEX]     'use PTRB,                PTRB -= INDEX*SCALE
  def wrlongdecode(i,<<0b1010::size(4), n::signed-size(5)>>) when n >= 0, do: "++ptra[#{n}]" #      ++PTRA[INDEX]     'use PTRA + INDEX*SCALE,  PTRA += INDEX*SCALE
  def wrlongdecode(i,<<0b1110::size(4), n::signed-size(5)>>) when n >= 0, do: "++ptrb[#{n}]" #      ++PTRB[INDEX]     'use PTRB + INDEX*SCALE,  PTRB += INDEX*SCALE
  def wrlongdecode(i,<<0b1010::size(4), n::signed-size(5)>>), do: "--ptra[#{:erlang.abs(n)}]" #      --PTRA[INDEX]     'use PTRA - INDEX*SCALE,  PTRA -= INDEX*SCALE
  def wrlongdecode(i,<<0b1110::size(4), n::signed-size(5)>>), do: "--ptrb[#{:erlang.abs(n)}]" #      --PTRB[INDEX]     'use PTRB - INDEX*SCALE,  PTRB -= INDEX*SCALE
  def wrlongdecode(i,<<s::size(9)>>), do: "#{imm?(i)}#{tohex(0, s)}" #      --PTRB[INDEX]     'use PTRB - INDEX*SCALE,  PTRB -= INDEX*SCALE






#                                           EEEE 1100011 1LI DDDDDDDDD SSSSSSSSS        RDFAST  D/#,S/#
  def rdfast(all=%{addr: addr, con: con, instr: "RDFAST", vars: {l,i,d,s}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s, %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"rdfast","#{imm?(l)}#{tohex(0,d)}","#{imm?(i)}#{tohex(0,s)}"])

#                                           EEEE 1100100 0LI DDDDDDDDD SSSSSSSSS        WRFAST  D/#,S/#
  def wrfast(all=%{addr: addr, con: con, instr: "WRFAST", vars: {l,i,d,s}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s, %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"wrfast","#{imm?(l)}#{tohex(0,d)}","#{imm?(i)}#{tohex(0,s)}"])

#                                           EEEE 1100100 1LI DDDDDDDDD SSSSSSSSS        FBLOCK  D/#,S/#
  def fblock(all=%{addr: addr, con: con, instr: "FBLOCK", vars: {l,i,d,s}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s, %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"fblock","#{imm?(l)}#{tohex(0,d)}","#{imm?(i)}#{tohex(0,s)}"])

#                                           EEEE 1100101 0LI DDDDDDDDD SSSSSSSSS        XINIT   D/#,S/#
  def xinit(all=%{addr: addr, con: con, instr: "XINIT", vars: {l,i,d,s}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s, %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"xinit","#{imm?(l)}#{tohex(0,d)}","#{imm?(i)}#{tohex(0,s)}"])

#                                           EEEE 1100101 1LI DDDDDDDDD SSSSSSSSS        XZERO   D/#,S/#
  def xzero(all=%{addr: addr, con: con, instr: "XZERO", vars: {l,i,d,s}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s, %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"xzero","#{imm?(l)}#{tohex(0,d)}","#{imm?(i)}#{tohex(0,s)}"])

#                                           EEEE 1100110 0LI DDDDDDDDD SSSSSSSSS        XCONT   D/#,S/#
  def xcont(all=%{addr: addr, con: con, instr: "XCONT", vars: {l,i,d,s}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s, %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"xcont","#{imm?(l)}#{tohex(0,d)}","#{imm?(i)}#{tohex(0,s)}"])

#                                           EEEE 1100110 1LI DDDDDDDDD SSSSSSSSS        REP     D/#,S/#
  def rep(all=%{addr: addr, con: con, instr: "REP", vars: {l,i,d,s}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s, %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"rep","#{imm?(l)}#{tohex(0,d)}","#{imm?(i)}#{tohex(0,s)}"])

#                                           EEEE 1100111 CLI DDDDDDDDD SSSSSSSSS        COGINIT D/#,S/#     {WC}
  def coginit(all=%{addr: addr, con: con, instr: "COGINIT", vars: {c,l,i,d,s}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s, %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"coginit","#{imm?(l)}#{tohex(0,d)}","#{imm?(i)}#{tohex(0,s)}#{wcz?(c,0)}"])

#                                           EEEE 1101000 0LI DDDDDDDDD SSSSSSSSS        QMUL    D/#,S/#
  def qmul(all=%{addr: addr, con: con, instr: "QMUL", vars: {l,i,d,s}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s, %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"qmul","#{imm?(l)}#{tohex(0,d)}","#{imm?(i)}#{tohex(0,s)}"])

#                                           EEEE 1101000 1LI DDDDDDDDD SSSSSSSSS        QDIV    D/#,S/#
  def qdiv(all=%{addr: addr, con: con, instr: "QDIV", vars: {l,i,d,s}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s, %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"qdiv","#{imm?(l)}#{tohex(0,d)}","#{imm?(i)}#{tohex(0,s)}"])

#                                           EEEE 1101001 0LI DDDDDDDDD SSSSSSSSS        QFRAC   D/#,S/#
  def qfrac(all=%{addr: addr, con: con, instr: "QFRAC", vars: {l,i,d,s}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s, %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"qfrac","#{imm?(l)}#{tohex(0,d)}","#{imm?(i)}#{tohex(0,s)}"])

#                                           EEEE 1101001 1LI DDDDDDDDD SSSSSSSSS        QSQRT   D/#,S/#
  def qsqrt(all=%{addr: addr, con: con, instr: "QSQRT", vars: {l,i,d,s}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s, %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"qsqrt","#{imm?(l)}#{tohex(0,d)}","#{imm?(i)}#{tohex(0,s)}"])

#                                           EEEE 1101010 0LI DDDDDDDDD SSSSSSSSS        QROTATE D/#,S/#
  def qrotate(all=%{addr: addr, con: con, instr: "QROTATE", vars: {l,i,d,s}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s, %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"qrotate","#{imm?(l)}#{tohex(0,d)}","#{imm?(i)}#{tohex(0,s)}"])

#                                           EEEE 1101010 1LI DDDDDDDDD SSSSSSSSS        QVECTOR D/#,S/#
  def qvector(all=%{addr: addr, con: con, instr: "QVECTOR", vars: {l,i,d,s}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s, %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"qvector","#{imm?(l)}#{tohex(0,d)}","#{imm?(i)}#{tohex(0,s)}"])

#                                           EEEE 1101011 00L DDDDDDDDD 000000000        HUBSET  D/#
  def hubset(all=%{addr: addr, con: con, instr: "HUBSET", vars: {l,d,<< 0b000000000::size(9) >>}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"hubset","#{imm?(l)}#{tohex(0,d)}"])

#                                           EEEE 1101011 C0L DDDDDDDDD 000000001        COGID   D/#         {WC}
  def cogid(all=%{addr: addr, con: con, instr: "COGID", vars: {c,<< 0b0::size(1) >>,l,d,<< 0b00000000::size(8) >>,<< 0b1::size(1) >>}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"cogid","#{imm?(l)}#{tohex(0,d)}#{wcz?(c,0)}"])

#                                           EEEE 1101011 00L DDDDDDDDD 000000011        COGSTOP D/#
  def cogstop(all=%{addr: addr, con: con, instr: "COGSTOP", vars: {l,d,<< 0b0000000::size(7) >>,<< 0b11::size(2) >>}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"cogstop","#{imm?(l)}#{tohex(0,d)}"])


#                                           EEEE 1101011 C00 DDDDDDDDD 000000100        LOCKNEW D           {WC}
  def locknew(all=%{addr: addr, con: con, instr: "LOCKNEW", vars: {c,<< 0b00::size(2) >>,d,<< 0b000000::size(6) >>,<< 0b1::size(1) >>,<< 0b00::size(2) >>}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s%s", [addr,fullbin,disasm_c(<<con::size(4)>>),"locknew","#{tohex(0,d)}","#{wcz?(c,0)}"])

#                                           EEEE 1101011 00L DDDDDDDDD 000000101        LOCKRET D/#
  def lockret(all=%{addr: addr, con: con, instr: "LOCKRET", vars: {l,d,<< 0b000000::size(6) >>,<< 0b1::size(1) >>,<< 0b0::size(1) >>,<< 0b1::size(1) >>}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"lockret","#{imm?(l)}#{tohex(0,d)}"])

#                                           EEEE 1101011 C0L DDDDDDDDD 000000110        LOCKTRY D/#         {WC}
  def locktry(all=%{addr: addr, con: con, instr: "LOCKTRY", vars: {c,<< 0b0::size(1) >>,l,d,<< 0b000000::size(6) >>,<< 0b11::size(2) >>,<< 0b0::size(1) >>}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s%s", [addr,fullbin,disasm_c(<<con::size(4)>>),"locktry","#{imm?(l)}#{tohex(0,d)}","#{wcz?(c,0)}"])

#                                           EEEE 1101011 00L DDDDDDDDD 000000111        LOCKREL D/#         {WC}
  def lockrel(all=%{addr: addr, con: con, instr: "LOCKREL", vars: {c,l,d,<< 0b000000::size(6) >>,<< 0b111::size(3) >>}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s%s", [addr,fullbin,disasm_c(<<con::size(4)>>),"lockrel","#{imm?(l)}#{tohex(0,d)}","#{wcz?(c,0)}"])

#                                           EEEE 1101011 00L DDDDDDDDD 000001110        QLOG    D/#
  def qlog(all=%{addr: addr, con: con, instr: "QLOG", vars: {l,d,<< 0b00000::size(5) >>,<< 0b111::size(3) >>,<< 0b0::size(1) >>}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"qlog","#{imm?(l)}#{tohex(0,d)}"])

#                                           EEEE 1101011 00L DDDDDDDDD 000001111        QEXP    D/#
  def qexp(all=%{addr: addr, con: con, instr: "QEXP", vars: {l,d,<< 0b00000::size(5) >>,<< 0b1111::size(4) >>}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"qexp","#{imm?(l)}#{tohex(0,d)}"])

#                                           EEEE 1101011 CZ0 DDDDDDDDD 000010000        RFBYTE  D           {WC/WZ/WCZ}
  def rfbyte(all=%{addr: addr, con: con, instr: "RFBYTE", vars: {c,z,<< 0b0::size(1) >>,d,<< 0b0000::size(4) >>,<< 0b1::size(1) >>,<< 0b0000::size(4) >>}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s%s", [addr,fullbin,disasm_c(<<con::size(4)>>),"rfbyte","#{tohex(0,d)}","#{wcz?(c,z)}"])

#                                           EEEE 1101011 CZ0 DDDDDDDDD 000010001        RFWORD  D           {WC/WZ/WCZ}
  def rfword(all=%{addr: addr, con: con, instr: "RFWORD", vars: {c,z,<< 0b0::size(1) >>,d,<< 0b0000::size(4) >>,<< 0b1::size(1) >>,<< 0b000::size(3) >>,<< 0b1::size(1) >>}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s%s", [addr,fullbin,disasm_c(<<con::size(4)>>),"rfword","#{tohex(0,d)}","#{wcz?(c,z)}"])

#                                           EEEE 1101011 CZ0 DDDDDDDDD 000010010        RFLONG  D           {WC/WZ/WCZ}
  def rflong(all=%{addr: addr, con: con, instr: "RFLONG", vars: {c,z,<< 0b0::size(1) >>,d,<< 0b0000::size(4) >>,<< 0b1::size(1) >>,<< 0b00::size(2) >>,<< 0b1::size(1) >>,<< 0b0::size(1) >>}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s%s", [addr,fullbin,disasm_c(<<con::size(4)>>),"rflong","#{tohex(0,d)}","#{wcz?(c,z)}"])

#                                           EEEE 1101011 CZ0 DDDDDDDDD 000010011        RFVAR   D           {WC/WZ/WCZ}
  def rfvar(all=%{addr: addr, con: con, instr: "RFVAR", vars: {c,z,<< 0b0::size(1) >>,d,<< 0b0000::size(4) >>,<< 0b1::size(1) >>,<< 0b00::size(2) >>,<< 0b11::size(2) >>}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s%s", [addr,fullbin,disasm_c(<<con::size(4)>>),"rfvar","#{tohex(0,d)}","#{wcz?(c,z)}"])

#                                           EEEE 1101011 CZ0 DDDDDDDDD 000010100        RFVARS  D           {WC/WZ/WCZ}
  def rfvars(all=%{addr: addr, con: con, instr: "RFVARS", vars: {c,z,<< 0b0::size(1) >>,d,<< 0b0000::size(4) >>,<< 0b1::size(1) >>,<< 0b0::size(1) >>,<< 0b1::size(1) >>,<< 0b00::size(2) >>}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s%s", [addr,fullbin,disasm_c(<<con::size(4)>>),"rfvars","#{tohex(0,d)}","#{wcz?(c,z)}"])

#                                           EEEE 1101011 00L DDDDDDDDD 000010101        WFBYTE  D/#
  def wfbyte(all=%{addr: addr, con: con, instr: "WFBYTE", vars: {l,d,<< 0b0000::size(4) >>,<< 0b1::size(1) >>,<< 0b0::size(1) >>,<< 0b1::size(1) >>,<< 0b0::size(1) >>,<< 0b1::size(1) >>}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"wfbyte","#{imm?(l)}#{tohex(0,d)}"])

#                                           EEEE 1101011 00L DDDDDDDDD 000010110        WFWORD  D/#
  def wfword(all=%{addr: addr, con: con, instr: "WFWORD", vars: {l,d,<< 0b0000::size(4) >>,<< 0b1::size(1) >>,<< 0b0::size(1) >>,<< 0b11::size(2) >>,<< 0b0::size(1) >>}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"wfword","#{imm?(l)}#{tohex(0,d)}"])

#                                           EEEE 1101011 00L DDDDDDDDD 000010111        WFLONG  D/#
  def wflong(all=%{addr: addr, con: con, instr: "WFLONG", vars: {l,d,<< 0b0000::size(4) >>,<< 0b1::size(1) >>,<< 0b0::size(1) >>,<< 0b111::size(3) >>}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"wflong","#{imm?(l)}#{tohex(0,d)}"])

#                                           EEEE 1101011 CZ0 DDDDDDDDD 000011000        GETQX   D           {WC/WZ/WCZ}
  def getqx(all=%{addr: addr, con: con, instr: "GETQX", vars: {c,z,<< 0b0::size(1) >>,d,<< 0b0000::size(4) >>,<< 0b11::size(2) >>,<< 0b000::size(3) >>}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s%s", [addr,fullbin,disasm_c(<<con::size(4)>>),"getqx","#{tohex(0,d)}","#{wcz?(c,z)}"])

#                                           EEEE 1101011 CZ0 DDDDDDDDD 000011001        GETQY   D           {WC/WZ/WCZ}
  def getqy(all=%{addr: addr, con: con, instr: "GETQY", vars: {c,z,<< 0b0::size(1) >>,d,<< 0b0000::size(4) >>,<< 0b11::size(2) >>,<< 0b00::size(2) >>,<< 0b1::size(1) >>}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s%s", [addr,fullbin,disasm_c(<<con::size(4)>>),"getqy","#{tohex(0,d)}","#{wcz?(c,z)}"])

#                                           EEEE 1101011 000 DDDDDDDDD 000011010        GETCT   D
  def getct(all=%{addr: addr, con: con, instr: "GETCT", vars: {d,<< 0b0000::size(4) >>,<< 0b11::size(2) >>,<< 0b0::size(1) >>,<< 0b1::size(1) >>,<< 0b0::size(1) >>}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"getct","#{tohex(0,d)}"])

#                                           EEEE 1101011 CZL DDDDDDDDD 000011011        GETRND  {D}         {WC/WZ/WCZ}
  def getrnd(all=%{addr: addr, con: con, instr: "GETRND", vars: {c,z,l,d,<< 0b0000::size(4) >>,<< 0b11::size(2) >>,<< 0b0::size(1) >>,<< 0b11::size(2) >>}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"getrnd","#{imm?(l)}#{tohex(0,d)}#{wcz?(c,z)}"])

#                                           EEEE 1101011 00L DDDDDDDDD 000011100        SETDACS D/#
  def setdacs(all=%{addr: addr, con: con, instr: "SETDACS", vars: {l,d,<< 0b0000::size(4) >>,<< 0b111::size(3) >>,<< 0b00::size(2) >>}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s%s", [addr,fullbin,disasm_c(<<con::size(4)>>),"setdacs","#{imm?(l)}#{tohex(0,d)}",""])

#                                           EEEE 1101011 00L DDDDDDDDD 000011101        SETXFRQ D/#
  def setxfrq(all=%{addr: addr, con: con, instr: "SETXFRQ", vars: {l,d,<< 0b0000::size(4) >>,<< 0b111::size(3) >>,<< 0b0::size(1) >>,<< 0b1::size(1) >>}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"setxfrq","#{imm?(l)}#{tohex(0,d)}"])

#                                           EEEE 1101011 000 DDDDDDDDD 000011110        GETXACC D
  def getxacc(all=%{addr: addr, con: con, instr: "GETXACC", vars: {d,<< 0b0000::size(4) >>,<< 0b1111::size(4) >>,<< 0b0::size(1) >>}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"getxacc","#{tohex(0,d)}"])

#                                           EEEE 1101011 CZL DDDDDDDDD 000011111        WAITX   D/#         {WC/WZ/WCZ}
  def waitx(all=%{addr: addr, con: con, instr: "WAITX", vars: {c,z,l,d,<< 0b0000::size(4) >>,<< 0b11111::size(5) >>}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"waitx","#{imm?(l)}#{tohex(0,d)}#{wcz?(c,z)}"])

#                                           EEEE 1101011 00L DDDDDDDDD 000100000        SETSE1  D/#
  def setse1(all=%{addr: addr, con: con, instr: "SETSE1", vars: {l,d,<< 0b000::size(3) >>,<< 0b1::size(1) >>,<< 0b00000::size(5) >>}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s%s", [addr,fullbin,disasm_c(<<con::size(4)>>),"setse1","#{imm?(l)}#{tohex(0,d)}",""])

#                                           EEEE 1101011 00L DDDDDDDDD 000100001        SETSE2  D/#
  def setse2(all=%{addr: addr, con: con, instr: "SETSE2", vars: {l,d,<< 0b000::size(3) >>,<< 0b1::size(1) >>,<< 0b0000::size(4) >>,<< 0b1::size(1) >>}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s%s", [addr,fullbin,disasm_c(<<con::size(4)>>),"setse2","#{imm?(l)}#{tohex(0,d)}",""])
#                                           EEEE 1101011 00L DDDDDDDDD 000100010        SETSE3  D/#
  def setse3(all=%{addr: addr, con: con, instr: "SETSE3", vars: {l,d,<< 0b000::size(3) >>,<< 0b1::size(1) >>,<< 0b000::size(3) >>,<< 0b1::size(1) >>,<< 0b0::size(1) >>}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s%s", [addr,fullbin,disasm_c(<<con::size(4)>>),"setse3","#{imm?(l)}#{tohex(0,d)}",""])

#                                           EEEE 1101011 00L DDDDDDDDD 000100011        SETSE4  D/#
  def setse4(all=%{addr: addr, con: con, instr: "SETSE4", vars: {l,d,<< 0b000::size(3) >>,<< 0b1::size(1) >>,<< 0b000::size(3) >>,<< 0b11::size(2) >>}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s%s", [addr,fullbin,disasm_c(<<con::size(4)>>),"setse4","#{imm?(l)}#{tohex(0,d)}",""])

#                                           EEEE 1101011 CZ0 000000000 000100100        POLLINT             {WC/WZ/WCZ}
  def pollint(all=%{addr: addr, con: con, instr: "POLLINT", vars: {c,z,<< 0b0000000000000::size(13) >>,<< 0b1::size(1) >>,<< 0b00::size(2) >>,<< 0b1::size(1) >>,<< 0b00::size(2) >>}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s%s", [addr,fullbin,disasm_c(<<con::size(4)>>),"pollint","","#{wcz?(c,z)}"])

#                                           EEEE 1101011 CZ0 000000001 000100100        POLLCT1             {WC/WZ/WCZ}
  def pollct1(all=%{addr: addr, con: con, instr: "POLLCT1", vars: {c,z,<< 0b000000000::size(9) >>,<< 0b1::size(1) >>,<< 0b000::size(3) >>,<< 0b1::size(1) >>,<< 0b00::size(2) >>,<< 0b1::size(1) >>,<< 0b00::size(2) >>}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s%s", [addr,fullbin,disasm_c(<<con::size(4)>>),"pollct1","","#{wcz?(c,z)}"])

#                                           EEEE 1101011 CZ0 000000010 000100100        POLLCT2             {WC/WZ/WCZ}
  def pollct2(all=%{addr: addr, con: con, instr: "POLLCT2", vars: {c,z,<< 0b00000000::size(8) >>,<< 0b1::size(1) >>,<< 0b0000::size(4) >>,<< 0b1::size(1) >>,<< 0b00::size(2) >>,<< 0b1::size(1) >>,<< 0b00::size(2) >>}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s%s", [addr,fullbin,disasm_c(<<con::size(4)>>),"pollct2","","#{wcz?(c,z)}"])

#                                           EEEE 1101011 CZ0 000000011 000100100        POLLCT3             {WC/WZ/WCZ}
  def pollct3(all=%{addr: addr, con: con, instr: "POLLCT3", vars: {c,z,<< 0b00000000::size(8) >>,<< 0b11::size(2) >>,<< 0b000::size(3) >>,<< 0b1::size(1) >>,<< 0b00::size(2) >>,<< 0b1::size(1) >>,<< 0b00::size(2) >>}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s%s", [addr,fullbin,disasm_c(<<con::size(4)>>),"pollct3","","#{wcz?(c,z)}"])

#                                           EEEE 1101011 CZ0 000000100 000100100        POLLSE1             {WC/WZ/WCZ}
  def pollse1(all=%{addr: addr, con: con, instr: "POLLSE1", vars: {c,z,<< 0b0000000::size(7) >>,<< 0b1::size(1) >>,<< 0b00000::size(5) >>,<< 0b1::size(1) >>,<< 0b00::size(2) >>,<< 0b1::size(1) >>,<< 0b00::size(2) >>}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s%s", [addr,fullbin,disasm_c(<<con::size(4)>>),"pollse1","","#{wcz?(c,z)}"])

#                                           EEEE 1101011 CZ0 000000101 000100100        POLLSE2             {WC/WZ/WCZ}
  def pollse2(all=%{addr: addr, con: con, instr: "POLLSE2", vars: {c,z,<< 0b0000000::size(7) >>,<< 0b1::size(1) >>,<< 0b0::size(1) >>,<< 0b1::size(1) >>,<< 0b000::size(3) >>,<< 0b1::size(1) >>,<< 0b00::size(2) >>,<< 0b1::size(1) >>,<< 0b00::size(2) >>}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s%s", [addr,fullbin,disasm_c(<<con::size(4)>>),"pollse2","","#{wcz?(c,z)}"])

#                                           EEEE 1101011 CZ0 000000110 000100100        POLLSE3             {WC/WZ/WCZ}
  def pollse3(all=%{addr: addr, con: con, instr: "POLLSE3", vars: {c,z,<< 0b0000000::size(7) >>,<< 0b11::size(2) >>,<< 0b0000::size(4) >>,<< 0b1::size(1) >>,<< 0b00::size(2) >>,<< 0b1::size(1) >>,<< 0b00::size(2) >>}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s%s", [addr,fullbin,disasm_c(<<con::size(4)>>),"pollse3","","#{wcz?(c,z)}"])

#                                           EEEE 1101011 CZ0 000000111 000100100        POLLSE4             {WC/WZ/WCZ}
  def pollse4(all=%{addr: addr, con: con, instr: "POLLSE4", vars: {c,z,<< 0b0000000::size(7) >>,<< 0b111::size(3) >>,<< 0b000::size(3) >>,<< 0b1::size(1) >>,<< 0b00::size(2) >>,<< 0b1::size(1) >>,<< 0b00::size(2) >>}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s%s", [addr,fullbin,disasm_c(<<con::size(4)>>),"pollse4","","#{wcz?(c,z)}"])

#                                           EEEE 1101011 CZ0 000001000 000100100        POLLPAT             {WC/WZ/WCZ}
  def pollpat(all=%{addr: addr, con: con, instr: "POLLPAT", vars: {c,z,<< 0b000000::size(6) >>,<< 0b1::size(1) >>,<< 0b000000::size(6) >>,<< 0b1::size(1) >>,<< 0b00::size(2) >>,<< 0b1::size(1) >>,<< 0b00::size(2) >>}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s%s", [addr,fullbin,disasm_c(<<con::size(4)>>),"pollpat","","#{wcz?(c,z)}"])

#                                           EEEE 1101011 CZ0 000001001 000100100        POLLFBW             {WC/WZ/WCZ}
  def pollfbw(all=%{addr: addr, con: con, instr: "POLLFBW", vars: {c,z,<< 0b000000::size(6) >>,<< 0b1::size(1) >>,<< 0b00::size(2) >>,<< 0b1::size(1) >>,<< 0b000::size(3) >>,<< 0b1::size(1) >>,<< 0b00::size(2) >>,<< 0b1::size(1) >>,<< 0b00::size(2) >>}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s%s", [addr,fullbin,disasm_c(<<con::size(4)>>),"pollfbw","","#{wcz?(c,z)}"])

#                                           EEEE 1101011 CZ0 000001010 000100100        POLLXMT             {WC/WZ/WCZ}
  def pollxmt(all=%{addr: addr, con: con, instr: "POLLXMT", vars: {c,z,<< 0b000000::size(6) >>,<< 0b1::size(1) >>,<< 0b0::size(1) >>,<< 0b1::size(1) >>,<< 0b0000::size(4) >>,<< 0b1::size(1) >>,<< 0b00::size(2) >>,<< 0b1::size(1) >>,<< 0b00::size(2) >>}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s%s", [addr,fullbin,disasm_c(<<con::size(4)>>),"pollxmt","","#{wcz?(c,z)}"])

#                                           EEEE 1101011 CZ0 000001011 000100100        POLLXFI             {WC/WZ/WCZ}
  def pollxfi(all=%{addr: addr, con: con, instr: "POLLXFI", vars: {c,z,<< 0b000000::size(6) >>,<< 0b1::size(1) >>,<< 0b0::size(1) >>,<< 0b11::size(2) >>,<< 0b000::size(3) >>,<< 0b1::size(1) >>,<< 0b00::size(2) >>,<< 0b1::size(1) >>,<< 0b00::size(2) >>}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s%s", [addr,fullbin,disasm_c(<<con::size(4)>>),"pollxfi","","#{wcz?(c,z)}"])

#                                           EEEE 1101011 CZ0 000001100 000100100        POLLXRO             {WC/WZ/WCZ}
  def pollxro(all=%{addr: addr, con: con, instr: "POLLXRO", vars: {c,z,<< 0b000000::size(6) >>,<< 0b11::size(2) >>,<< 0b00000::size(5) >>,<< 0b1::size(1) >>,<< 0b00::size(2) >>,<< 0b1::size(1) >>,<< 0b00::size(2) >>}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s%s", [addr,fullbin,disasm_c(<<con::size(4)>>),"pollxro","","#{wcz?(c,z)}"])

#                                           EEEE 1101011 CZ0 000001101 000100100        POLLXRL             {WC/WZ/WCZ}
  def pollxrl(all=%{addr: addr, con: con, instr: "POLLXRL", vars: {c,z,<< 0b000000::size(6) >>,<< 0b11::size(2) >>,<< 0b0::size(1) >>,<< 0b1::size(1) >>,<< 0b000::size(3) >>,<< 0b1::size(1) >>,<< 0b00::size(2) >>,<< 0b1::size(1) >>,<< 0b00::size(2) >>}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s%s", [addr,fullbin,disasm_c(<<con::size(4)>>),"pollxrl","","#{wcz?(c,z)}"])

#                                           EEEE 1101011 CZ0 000001110 000100100        POLLATN             {WC/WZ/WCZ}
  def pollatn(all=%{addr: addr, con: con, instr: "POLLATN", vars: {c,z,<< 0b000000::size(6) >>,<< 0b111::size(3) >>,<< 0b0000::size(4) >>,<< 0b1::size(1) >>,<< 0b00::size(2) >>,<< 0b1::size(1) >>,<< 0b00::size(2) >>}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s%s", [addr,fullbin,disasm_c(<<con::size(4)>>),"pollatn","","#{wcz?(c,z)}"])

#                                           EEEE 1101011 CZ0 000001111 000100100        POLLQMT             {WC/WZ/WCZ}
  def pollqmt(all=%{addr: addr, con: con, instr: "POLLQMT", vars: {c,z,<< 0b000000::size(6) >>,<< 0b1111::size(4) >>,<< 0b000::size(3) >>,<< 0b1::size(1) >>,<< 0b00::size(2) >>,<< 0b1::size(1) >>,<< 0b00::size(2) >>}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s%s", [addr,fullbin,disasm_c(<<con::size(4)>>),"pollqmt","","#{wcz?(c,z)}"])

#                                           EEEE 1101011 CZ0 000010000 000100100        WAITINT             {WC/WZ/WCZ}
  def waitint(all=%{addr: addr, con: con, instr: "WAITINT", vars: {c,z,<< 0b00000::size(5) >>,<< 0b1::size(1) >>,<< 0b0000000::size(7) >>,<< 0b1::size(1) >>,<< 0b00::size(2) >>,<< 0b1::size(1) >>,<< 0b00::size(2) >>}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s%s", [addr,fullbin,disasm_c(<<con::size(4)>>),"waitint","","#{wcz?(c,z)}"])

#                                           EEEE 1101011 CZ0 000010001 000100100        WAITCT1             {WC/WZ/WCZ}
  def waitct1(all=%{addr: addr, con: con, instr: "WAITCT1", vars: {c,z,<< 0b00000::size(5) >>,<< 0b1::size(1) >>,<< 0b000::size(3) >>,<< 0b1::size(1) >>,<< 0b000::size(3) >>,<< 0b1::size(1) >>,<< 0b00::size(2) >>,<< 0b1::size(1) >>,<< 0b00::size(2) >>}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s%s", [addr,fullbin,disasm_c(<<con::size(4)>>),"waitct1","","#{wcz?(c,z)}"])

#                                           EEEE 1101011 CZ0 000010010 000100100        WAITCT2             {WC/WZ/WCZ}
  def waitct2(all=%{addr: addr, con: con, instr: "WAITCT2", vars: {c,z,<< 0b00000::size(5) >>,<< 0b1::size(1) >>,<< 0b00::size(2) >>,<< 0b1::size(1) >>,<< 0b0000::size(4) >>,<< 0b1::size(1) >>,<< 0b00::size(2) >>,<< 0b1::size(1) >>,<< 0b00::size(2) >>}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s%s", [addr,fullbin,disasm_c(<<con::size(4)>>),"waitct2","","#{wcz?(c,z)}"])

#                                           EEEE 1101011 CZ0 000010011 000100100        WAITCT3             {WC/WZ/WCZ}
  def waitct3(all=%{addr: addr, con: con, instr: "WAITCT3", vars: {c,z,<< 0b00000::size(5) >>,<< 0b1::size(1) >>,<< 0b00::size(2) >>,<< 0b11::size(2) >>,<< 0b000::size(3) >>,<< 0b1::size(1) >>,<< 0b00::size(2) >>,<< 0b1::size(1) >>,<< 0b00::size(2) >>}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s%s", [addr,fullbin,disasm_c(<<con::size(4)>>),"waitct3","","#{wcz?(c,z)}"])

#                                           EEEE 1101011 CZ0 000010100 000100100        WAITSE1             {WC/WZ/WCZ}
  def waitse1(all=%{addr: addr, con: con, instr: "WAITSE1", vars: {c,z,<< 0b00000::size(5) >>,<< 0b1::size(1) >>,<< 0b0::size(1) >>,<< 0b1::size(1) >>,<< 0b00000::size(5) >>,<< 0b1::size(1) >>,<< 0b00::size(2) >>,<< 0b1::size(1) >>,<< 0b00::size(2) >>}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s%s", [addr,fullbin,disasm_c(<<con::size(4)>>),"waitse1","","#{wcz?(c,z)}"])

#                                           EEEE 1101011 CZ0 000010101 000100100        WAITSE2             {WC/WZ/WCZ}
  def waitse2(all=%{addr: addr, con: con, instr: "WAITSE2", vars: {c,z,<< 0b00000::size(5) >>,<< 0b1::size(1) >>,<< 0b0::size(1) >>,<< 0b1::size(1) >>,<< 0b0::size(1) >>,<< 0b1::size(1) >>,<< 0b000::size(3) >>,<< 0b1::size(1) >>,<< 0b00::size(2) >>,<< 0b1::size(1) >>,<< 0b00::size(2) >>}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s%s", [addr,fullbin,disasm_c(<<con::size(4)>>),"waitse2","","#{wcz?(c,z)}"])

#                                           EEEE 1101011 CZ0 000010110 000100100        WAITSE3             {WC/WZ/WCZ}
  def waitse3(all=%{addr: addr, con: con, instr: "WAITSE3", vars: {c,z,<< 0b00000::size(5) >>,<< 0b1::size(1) >>,<< 0b0::size(1) >>,<< 0b11::size(2) >>,<< 0b0000::size(4) >>,<< 0b1::size(1) >>,<< 0b00::size(2) >>,<< 0b1::size(1) >>,<< 0b00::size(2) >>}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s%s", [addr,fullbin,disasm_c(<<con::size(4)>>),"waitse3","","#{wcz?(c,z)}"])

#                                           EEEE 1101011 CZ0 000010111 000100100        WAITSE4             {WC/WZ/WCZ}
  def waitse4(all=%{addr: addr, con: con, instr: "WAITSE4", vars: {c,z,<< 0b00000::size(5) >>,<< 0b1::size(1) >>,<< 0b0::size(1) >>,<< 0b111::size(3) >>,<< 0b000::size(3) >>,<< 0b1::size(1) >>,<< 0b00::size(2) >>,<< 0b1::size(1) >>,<< 0b00::size(2) >>}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s%s", [addr,fullbin,disasm_c(<<con::size(4)>>),"waitse4","","#{wcz?(c,z)}"])

#                                           EEEE 1101011 CZ0 000011000 000100100        WAITPAT             {WC/WZ/WCZ}
  def waitpat(all=%{addr: addr, con: con, instr: "WAITPAT", vars: {c,z,<< 0b00000::size(5) >>,<< 0b11::size(2) >>,<< 0b000000::size(6) >>,<< 0b1::size(1) >>,<< 0b00::size(2) >>,<< 0b1::size(1) >>,<< 0b00::size(2) >>}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s%s", [addr,fullbin,disasm_c(<<con::size(4)>>),"waitpat","","#{wcz?(c,z)}"])

#                                           EEEE 1101011 CZ0 000011001 000100100        WAITFBW             {WC/WZ/WCZ}
  def waitfbw(all=%{addr: addr, con: con, instr: "WAITFBW", vars: {c,z,<< 0b00000::size(5) >>,<< 0b11::size(2) >>,<< 0b00::size(2) >>,<< 0b1::size(1) >>,<< 0b000::size(3) >>,<< 0b1::size(1) >>,<< 0b00::size(2) >>,<< 0b1::size(1) >>,<< 0b00::size(2) >>}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s%s", [addr,fullbin,disasm_c(<<con::size(4)>>),"waitfbw","","#{wcz?(c,z)}"])

#                                           EEEE 1101011 CZ0 000011010 000100100        WAITXMT             {WC/WZ/WCZ}
  def waitxmt(all=%{addr: addr, con: con, instr: "WAITXMT", vars: {c,z,<< 0b00000::size(5) >>,<< 0b11::size(2) >>,<< 0b0::size(1) >>,<< 0b1::size(1) >>,<< 0b0000::size(4) >>,<< 0b1::size(1) >>,<< 0b00::size(2) >>,<< 0b1::size(1) >>,<< 0b00::size(2) >>}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s%s", [addr,fullbin,disasm_c(<<con::size(4)>>),"waitxmt","","#{wcz?(c,z)}"])

#                                           EEEE 1101011 CZ0 000011011 000100100        WAITXFI             {WC/WZ/WCZ}
  def waitxfi(all=%{addr: addr, con: con, instr: "WAITXFI", vars: {c,z,<< 0b00000::size(5) >>,<< 0b11::size(2) >>,<< 0b0::size(1) >>,<< 0b11::size(2) >>,<< 0b000::size(3) >>,<< 0b1::size(1) >>,<< 0b00::size(2) >>,<< 0b1::size(1) >>,<< 0b00::size(2) >>}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s%s", [addr,fullbin,disasm_c(<<con::size(4)>>),"waitxfi","","#{wcz?(c,z)}"])

#                                           EEEE 1101011 CZ0 000011100 000100100        WAITXRO             {WC/WZ/WCZ}
  def waitxro(all=%{addr: addr, con: con, instr: "WAITXRO", vars: {c,z,<< 0b00000::size(5) >>,<< 0b111::size(3) >>,<< 0b00000::size(5) >>,<< 0b1::size(1) >>,<< 0b00::size(2) >>,<< 0b1::size(1) >>,<< 0b00::size(2) >>}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s%s", [addr,fullbin,disasm_c(<<con::size(4)>>),"waitxro","","#{wcz?(c,z)}"])

#                                           EEEE 1101011 CZ0 000011101 000100100        WAITXRL             {WC/WZ/WCZ}
  def waitxrl(all=%{addr: addr, con: con, instr: "WAITXRL", vars: {c,z,<< 0b00000::size(5) >>,<< 0b111::size(3) >>,<< 0b0::size(1) >>,<< 0b1::size(1) >>,<< 0b000::size(3) >>,<< 0b1::size(1) >>,<< 0b00::size(2) >>,<< 0b1::size(1) >>,<< 0b00::size(2) >>}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s%s", [addr,fullbin,disasm_c(<<con::size(4)>>),"waitxrl","","#{wcz?(c,z)}"])

#                                           EEEE 1101011 CZ0 000011110 000100100        WAITATN             {WC/WZ/WCZ}
  def waitatn(all=%{addr: addr, con: con, instr: "WAITATN", vars: {c,z,<< 0b00000::size(5) >>,<< 0b1111::size(4) >>,<< 0b0000::size(4) >>,<< 0b1::size(1) >>,<< 0b00::size(2) >>,<< 0b1::size(1) >>,<< 0b00::size(2) >>}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s%s", [addr,fullbin,disasm_c(<<con::size(4)>>),"waitatn","","#{wcz?(c,z)}"])

#                                           EEEE 1101011 000 000100000 000100100        ALLOWI
  def allowi(all=%{addr: addr, con: con, instr: "ALLOWI", vars: {<< 0b0::size(1) >>}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s ", [addr,fullbin,disasm_c(<<con::size(4)>>),"allowi"])

#                                           EEEE 1101011 000 000100001 000100100        STALLI
  def stalli(all=%{addr: addr, con: con, instr: "STALLI", vars: {<< 0b0::size(1) >>}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s ", [addr,fullbin,disasm_c(<<con::size(4)>>),"stalli"])

#                                           EEEE 1101011 000 000100010 000100100        TRGINT1
  def trgint1(all=%{addr: addr, con: con, instr: "TRGINT1", vars: {<< 0b0::size(1) >>}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s", [addr,fullbin,disasm_c(<<con::size(4)>>),"trgint1"])

#                                           EEEE 1101011 000 000100011 000100100        TRGINT2
  def trgint2(all=%{addr: addr, con: con, instr: "TRGINT2", vars: {<< 0b0::size(1) >>}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s", [addr,fullbin,disasm_c(<<con::size(4)>>),"trgint2"])

#                                           EEEE 1101011 000 000100100 000100100        TRGINT3
  def trgint3(all=%{addr: addr, con: con, instr: "TRGINT3", vars: {<< 0b0::size(1) >>}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s", [addr,fullbin,disasm_c(<<con::size(4)>>),"trgint3"])

#                                           EEEE 1101011 000 000100101 000100100        NIXINT1
  def nixint1(all=%{addr: addr, con: con, instr: "NIXINT1", vars: {<< 0b0::size(1) >>}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s", [addr,fullbin,disasm_c(<<con::size(4)>>),"nixint1"])

#                                           EEEE 1101011 000 000100110 000100100        NIXINT2
  def nixint2(all=%{addr: addr, con: con, instr: "NIXINT2", vars: {<< 0b0::size(1) >>}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s", [addr,fullbin,disasm_c(<<con::size(4)>>),"nixint2"])

#                                           EEEE 1101011 000 000100111 000100100        NIXINT3
  def nixint3(all=%{addr: addr, con: con, instr: "NIXINT3", vars: {<< 0b0::size(1) >>}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s", [addr,fullbin,disasm_c(<<con::size(4)>>),"nixint3"])

#                                           EEEE 1101011 00L DDDDDDDDD 000100101        SETINT1 D/#
  def setint1(all=%{addr: addr, con: con, instr: "SETINT1", vars: {l,d,<< 0b000::size(3) >>,<< 0b1::size(1) >>,<< 0b00::size(2) >>,<< 0b1::size(1) >>,<< 0b0::size(1) >>,<< 0b1::size(1) >>}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s%s", [addr,fullbin,disasm_c(<<con::size(4)>>),"setint1","#{imm?(l)}#{tohex(0,d)}",""])

#                                           EEEE 1101011 00L DDDDDDDDD 000100110        SETINT2 D/#
  def setint2(all=%{addr: addr, con: con, instr: "SETINT2", vars: {l,d,<< 0b000::size(3) >>,<< 0b1::size(1) >>,<< 0b00::size(2) >>,<< 0b11::size(2) >>,<< 0b0::size(1) >>}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s%s", [addr,fullbin,disasm_c(<<con::size(4)>>),"setint2","#{imm?(l)}#{tohex(0,d)}",""])

#                                           EEEE 1101011 00L DDDDDDDDD 000100111        SETINT3 D/#
  def setint3(all=%{addr: addr, con: con, instr: "SETINT3", vars: {l,d,<< 0b000::size(3) >>,<< 0b1::size(1) >>,<< 0b00::size(2) >>,<< 0b111::size(3) >>}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s%s", [addr,fullbin,disasm_c(<<con::size(4)>>),"setint3","#{imm?(l)}#{tohex(0,d)}",""])

#                                           EEEE 1101011 00L DDDDDDDDD 000101000        SETQ    D/#
  def setq(all=%{addr: addr, con: con, instr: "SETQ", vars: {l,d,<< 0b000::size(3) >>,<< 0b1::size(1) >>,<< 0b0::size(1) >>,<< 0b1::size(1) >>,<< 0b000::size(3) >>}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"setq","#{imm?(l)}#{tohex(0,d)}"])


#                                           EEEE 1101011 00L DDDDDDDDD 000101001        SETQ2   D/#
  def setq2(all=%{addr: addr, con: con, instr: "SETQ2", vars: {l,d,<< 0b000::size(3) >>,<< 0b1::size(1) >>,<< 0b0::size(1) >>,<< 0b1::size(1) >>,<< 0b00::size(2) >>,<< 0b1::size(1) >>}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"setq2","#{imm?(l)}#{tohex(0,d)}"])

#                                           EEEE 1101011 00L DDDDDDDDD 000101010        PUSH    D/#
  def push(all=%{addr: addr, con: con, instr: "PUSH", vars: {l,d,<< 0b000::size(3) >>,<< 0b1::size(1) >>,<< 0b0::size(1) >>,<< 0b1::size(1) >>,<< 0b0::size(1) >>,<< 0b1::size(1) >>,<< 0b0::size(1) >>}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"push","#{imm?(l)}#{tohex(0,d)}"])

#                                           EEEE 1101011 CZ0 DDDDDDDDD 000101011        POP     D           {WC/WZ/WCZ}
  def pop(all=%{addr: addr, con: con, instr: "POP", vars: {c,z,<< 0b0::size(1) >>,d,<< 0b000::size(3) >>,<< 0b1::size(1) >>,<< 0b0::size(1) >>,<< 0b1::size(1) >>,<< 0b0::size(1) >>,<< 0b11::size(2) >>}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"pop","#{tohex(0,d)}#{wcz?(c,z)}"])

#                                           EEEE 1101011 CZ0 DDDDDDDDD 000101100        JMP     D           {WC/WZ/WCZ}
  def jmp(all=%{addr: addr, con: con, instr: "JMP", vars: {c,z,<< 0b0::size(1) >>,d,<< 0b000::size(3) >>,<< 0b1::size(1) >>,<< 0b0::size(1) >>,<< 0b11::size(2) >>,<< 0b00::size(2) >>}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"jmp","#{tohex(0,d)}#{wcz?(c,z)}"])

#                                           EEEE 1101011 CZ0 DDDDDDDDD 000101101        CALL    D           {WC/WZ/WCZ}
  def call(all=%{addr: addr, con: con, instr: "CALL", vars: {c,z,<< 0b0::size(1) >>,d,<< 0b000::size(3) >>,<< 0b1::size(1) >>,<< 0b0::size(1) >>,<< 0b11::size(2) >>,<< 0b0::size(1) >>,<< 0b1::size(1) >>}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"call","#{tohex(0,d)}#{wcz?(c,z)}"])

#                                           EEEE 1101011 CZ1 000000000 000101101        RET                 {WC/WZ/WCZ}
  def ret(all=%{addr: addr, con: con, instr: "RET", vars: {c,z,<< 0b1::size(1) >>,<< 0b000000000000::size(12) >>,<< 0b1::size(1) >>,<< 0b0::size(1) >>,<< 0b11::size(2) >>,<< 0b0::size(1) >>,<< 0b1::size(1) >>}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"ret",wcz?(c,z)])

#                                           EEEE 1101011 CZ0 DDDDDDDDD 000101110        CALLA   D           {WC/WZ/WCZ}
  def calla(all=%{addr: addr, con: con, instr: "CALLA", vars: {c,z,<< 0b0::size(1) >>,d,<< 0b000::size(3) >>,<< 0b1::size(1) >>,<< 0b0::size(1) >>,<< 0b111::size(3) >>,<< 0b0::size(1) >>}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"calla","#{tohex(0,d)}#{wcz?(c,z)}"])

#                                           EEEE 1101011 CZ1 000000000 000101110        RETA                {WC/WZ/WCZ}
  def reta(all=%{addr: addr, con: con, instr: "RETA", vars: {c,z,<< 0b1::size(1) >>,<< 0b000000000000::size(12) >>,<< 0b1::size(1) >>,<< 0b0::size(1) >>,<< 0b111::size(3) >>,<< 0b0::size(1) >>}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"reta","#{wcz?(c,z)}"])

#                                           EEEE 1101011 CZ0 DDDDDDDDD 000101111        CALLB   D           {WC/WZ/WCZ}
  def callb(all=%{addr: addr, con: con, instr: "CALLB", vars: {c,z,<< 0b0::size(1) >>,d,<< 0b000::size(3) >>,<< 0b1::size(1) >>,<< 0b0::size(1) >>,<< 0b1111::size(4) >>}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"callb","#{tohex(0,d)}#{wcz?(c,z)}"])

#                                           EEEE 1101011 CZ1 000000000 000101111        RETB                {WC/WZ/WCZ}
  def retb(all=%{addr: addr, con: con, instr: "RETB", vars: {c,z,<< 0b1::size(1) >>,<< 0b000000000000::size(12) >>,<< 0b1::size(1) >>,<< 0b0::size(1) >>,<< 0b1111::size(4) >>}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"retb","#{wcz?(c,z)}"])

#                                           EEEE 1101011 00L DDDDDDDDD 000110000        JMPREL  D/#
  def jmprel(all=%{addr: addr, con: con, instr: "JMPREL", vars: {l,d,<< 0b000::size(3) >>,<< 0b11::size(2) >>,<< 0b0000::size(4) >>}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"jmprel","#{imm?(l)}#{tohex(0,d)}"])

#                                           EEEE 1101011 00L DDDDDDDDD 000110001        SKIP    D/#
  def skip(all=%{addr: addr, con: con, instr: "SKIP", vars: {l,d,<< 0b000::size(3) >>,<< 0b11::size(2) >>,<< 0b000::size(3) >>,<< 0b1::size(1) >>}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"skip","#{imm?(l)}#{tohex(0,d)}"])

#                                           EEEE 1101011 00L DDDDDDDDD 000110010        SKIPF   D/#
  def skipf(all=%{addr: addr, con: con, instr: "SKIPF", vars: {l,d,<< 0b000::size(3) >>,<< 0b11::size(2) >>,<< 0b00::size(2) >>,<< 0b1::size(1) >>,<< 0b0::size(1) >>}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"skipf","#{imm?(l)}#{tohex(0,d)}"])

#                                           EEEE 1101011 00L DDDDDDDDD 000110011        EXECF   D/#
  def execf(all=%{addr: addr, con: con, instr: "EXECF", vars: {l,d,<< 0b000::size(3) >>,<< 0b11::size(2) >>,<< 0b00::size(2) >>,<< 0b11::size(2) >>}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"execf","#{imm?(l)}#{tohex(0,d)}"])

#                                           EEEE 1101011 000 DDDDDDDDD 000110100        GETPTR  D
  def getptr(all=%{addr: addr, con: con, instr: "GETPTR", vars: {d,<< 0b000::size(3) >>,<< 0b11::size(2) >>,<< 0b0::size(1) >>,<< 0b1::size(1) >>,<< 0b00::size(2) >>}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"getptr","#{tohex(0,d)}"])

#                                           EEEE 1101011 CZ0 DDDDDDDDD 000110101        GETBRK  D           {WC/WZ/WCZ}
def getbrk(all=%{addr: addr, con: con, instr: "GETBRK", vars: {c,z,<< 0b0::size(1) >>,d,<< 0b000::size(3) >>,<< 0b11::size(2) >>,<< 0b0::size(1) >>,<< 0b1::size(1) >>,<< 0b0::size(1) >>,<< 0b1::size(1) >>}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"getbrk","#{tohex(0,d)}#{wcz?(c,z)}"])

#                                           EEEE 1101011 00L DDDDDDDDD 000110101        COGBRK  D
  def cogbrk(all=%{addr: addr, con: con, instr: "COGBRK", vars: {l,d,<< 0b000::size(3) >>,<< 0b11::size(2) >>,<< 0b0::size(1) >>,<< 0b1::size(1) >>,<< 0b0::size(1) >>,<< 0b1::size(1) >>}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"cogbrk","#{imm?(l)}#{tohex(0,d)}"])

#                                           EEEE 1101011 00L DDDDDDDDD 000110110        BRK     D/#
  def brk(all=%{addr: addr, con: con, instr: "BRK", vars: {l,d,<< 0b000::size(3) >>,<< 0b11::size(2) >>,<< 0b0::size(1) >>,<< 0b11::size(2) >>,<< 0b0::size(1) >>}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"brk","#{imm?(l)}#{tohex(0,d)}"])

#                                           EEEE 1101011 00L DDDDDDDDD 000110111        SETLUTS D/#
  def setluts(all=%{addr: addr, con: con, instr: "SETLUTS", vars: {l,d,<< 0b000::size(3) >>,<< 0b11::size(2) >>,<< 0b0::size(1) >>,<< 0b111::size(3) >>}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"setluts","#{imm?(l)}#{tohex(0,d)}"])

#                                           EEEE 1101011 00L DDDDDDDDD 000111000        SETCY   D/#
  def setcy(all=%{addr: addr, con: con, instr: "SETCY", vars: {l,d,<< 0b000::size(3) >>,<< 0b111::size(3) >>,<< 0b000::size(3) >>}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"setcy","#{imm?(l)}#{tohex(0,d)}"])

#                                           EEEE 1101011 00L DDDDDDDDD 000111001        SETCI   D/#
  def setci(all=%{addr: addr, con: con, instr: "SETCI", vars: {l,d,<< 0b000::size(3) >>,<< 0b111::size(3) >>,<< 0b00::size(2) >>,<< 0b1::size(1) >>}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"setci","#{imm?(l)}#{tohex(0,d)}"])

#                                           EEEE 1101011 00L DDDDDDDDD 000111010        SETCQ   D/#
  def setcq(all=%{addr: addr, con: con, instr: "SETCQ", vars: {l,d,<< 0b000::size(3) >>,<< 0b111::size(3) >>,<< 0b0::size(1) >>,<< 0b1::size(1) >>,<< 0b0::size(1) >>}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"setcq","#{imm?(l)}#{tohex(0,d)}"])

#                                           EEEE 1101011 00L DDDDDDDDD 000111011        SETCFRQ D/#
  def setcfrq(all=%{addr: addr, con: con, instr: "SETCFRQ", vars: {l,d,<< 0b000::size(3) >>,<< 0b111::size(3) >>,<< 0b0::size(1) >>,<< 0b11::size(2) >>}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"setcfrq","#{imm?(l)}#{tohex(0,d)}"])

#                                           EEEE 1101011 00L DDDDDDDDD 000111100        SETCMOD D/#
  def setcmod(all=%{addr: addr, con: con, instr: "SETCMOD", vars: {l,d,<< 0b000::size(3) >>,<< 0b1111::size(4) >>,<< 0b00::size(2) >>}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"setcmod","#{imm?(l)}#{tohex(0,d)}"])

#                                           EEEE 1101011 00L DDDDDDDDD 000111101        SETPIV  D/#
  def setpiv(all=%{addr: addr, con: con, instr: "SETPIV", vars: {l,d,<< 0b000::size(3) >>,<< 0b1111::size(4) >>,<< 0b0::size(1) >>,<< 0b1::size(1) >>}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"setpiv","#{imm?(l)}#{tohex(0,d)}"])

#                                           EEEE 1101011 00L DDDDDDDDD 000111110        SETPIX  D/#
  def setpix(all=%{addr: addr, con: con, instr: "SETPIX", vars: {l,d,<< 0b000::size(3) >>,<< 0b11111::size(5) >>,<< 0b0::size(1) >>}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"setpix","#{imm?(l)}#{tohex(0,d)}"])

#                                           EEEE 1101011 00L DDDDDDDDD 000111111        COGATN  D/#
  def cogatn(all=%{addr: addr, con: con, instr: "COGATN", vars: {l,d,<< 0b000::size(3) >>,<< 0b111111::size(6) >>}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"cogatn","#{imm?(l)}#{tohex(0,d)}"])

#                                           EEEE 1101011 CcL DDDDDDDDD 001000000        DIRL    D/#         {WCZ}
  def dirl(all=%{addr: addr, con: con, instr: "DIRL", vars: {c,c,l,d,<< 0b00::size(2) >>,<< 0b1::size(1) >>,<< 0b000000::size(6) >>}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"dirl","#{imm?(l)}#{tohex(0,d)}#{wcz?(c,c)}"])

#                                           EEEE 1101011 CZL DDDDDDDDD 001000000        TESTP   D/#         WC/WZ
  def testp(all=%{addr: addr, con: con, instr: "TESTP", vars: {0,1,l,d,<< 0b00::size(2) >>,<< 0b1::size(1) >>,<< 0b000000::size(6) >>}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"testp","#{imm?(l)}#{tohex(0,d)} wz"])
  def testp(all=%{addr: addr, con: con, instr: "TESTP", vars: {1,0,l,d,<< 0b00::size(2) >>,<< 0b1::size(1) >>,<< 0b000000::size(6) >>}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"testp","#{imm?(l)}#{tohex(0,d)} wc"])

#                                           EEEE 1101011 CcL DDDDDDDDD 001000001        DIRH    D/#         {WCZ}
  def dirh(all=%{addr: addr, con: con, instr: "DIRH", vars: {c,c,l,d,<< 0b00::size(2) >>,<< 0b1::size(1) >>,<< 0b00000::size(5) >>,<< 0b1::size(1) >>}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"dirh","#{imm?(l)}#{tohex(0,d)}#{wcz?(c,c)}"])

#                                           EEEE 1101011 CZL DDDDDDDDD 001000001        TESTPN  D/#         WC/WZ
  def testpn(all=%{addr: addr, con: con, instr: "TESTPN", vars: {0,1,l,d,<< 0b00::size(2) >>,<< 0b1::size(1) >>,<< 0b00000::size(5) >>,<< 0b1::size(1) >>}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"testpn","#{imm?(l)}#{tohex(0,d)} wz"])
  def testpn(all=%{addr: addr, con: con, instr: "TESTPN", vars: {1,0,l,d,<< 0b00::size(2) >>,<< 0b1::size(1) >>,<< 0b00000::size(5) >>,<< 0b1::size(1) >>}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"testpn","#{imm?(l)}#{tohex(0,d)} wc"])

#                                           EEEE 1101011 CcL DDDDDDDDD 001000010        DIRC    D/#         {WCZ}
  def dirc(all=%{addr: addr, con: con, instr: "DIRC", vars: {c,c,l,d,<< 0b00::size(2) >>,<< 0b1::size(1) >>,<< 0b0000::size(4) >>,<< 0b1::size(1) >>,<< 0b0::size(1) >>}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"dirc","#{imm?(l)}#{tohex(0,d)}#{wcz?(c,c)}"])

#                                           EEEE 1101011 CZL DDDDDDDDD 001000010        TESTP   D/#         ANDC/ANDZ
  def testp(all=%{addr: addr, con: con, instr: "TESTP", vars: {0,1,l,d,<< 0b00::size(2) >>,<< 0b1::size(1) >>,<< 0b0000::size(4) >>,<< 0b1::size(1) >>,<< 0b0::size(1) >>}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"testp","#{imm?(l)}#{tohex(0,d)} andz"])
  def testp(all=%{addr: addr, con: con, instr: "TESTP", vars: {1,0,l,d,<< 0b00::size(2) >>,<< 0b1::size(1) >>,<< 0b0000::size(4) >>,<< 0b1::size(1) >>,<< 0b0::size(1) >>}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"testp","#{imm?(l)}#{tohex(0,d)} andc"])

#                                           EEEE 1101011 CcL DDDDDDDDD 001000011        DIRNC   D/#         {WCZ}
  def dirnc(all=%{addr: addr, con: con, instr: "DIRNC", vars: {c,c,l,d,<< 0b00::size(2) >>,<< 0b1::size(1) >>,<< 0b0000::size(4) >>,<< 0b11::size(2) >>}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"dirnc","#{imm?(l)}#{tohex(0,d)}#{wcz?(c,c)}"])

#                                           EEEE 1101011 CZL DDDDDDDDD 001000011        TESTPN  D/#         ANDC/ANDZ
  def testpn(all=%{addr: addr, con: con, instr: "TESTPN", vars: {0,1,l,d,<< 0b00::size(2) >>,<< 0b1::size(1) >>,<< 0b0000::size(4) >>,<< 0b11::size(2) >>}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"testpn","#{imm?(l)}#{tohex(0,d)} andz"])
  def testpn(all=%{addr: addr, con: con, instr: "TESTPN", vars: {1,0,l,d,<< 0b00::size(2) >>,<< 0b1::size(1) >>,<< 0b0000::size(4) >>,<< 0b11::size(2) >>}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"testpn","#{imm?(l)}#{tohex(0,d)} andc"])

#                                           EEEE 1101011 CcL DDDDDDDDD 001000100        DIRZ    D/#         {WCZ}
  def dirz(all=%{addr: addr, con: con, instr: "DIRZ", vars: {c,c,l,d,<< 0b00::size(2) >>,<< 0b1::size(1) >>,<< 0b000::size(3) >>,<< 0b1::size(1) >>,<< 0b00::size(2) >>}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"dirz","#{imm?(l)}#{tohex(0,d)}#{wcz?(c,c)}"])

#                                           EEEE 1101011 CZL DDDDDDDDD 001000100        TESTP   D/#         ORC/ORZ
  def testp(all=%{addr: addr, con: con, instr: "TESTP", vars: {0,1,l,d,<< 0b00::size(2) >>,<< 0b1::size(1) >>,<< 0b000::size(3) >>,<< 0b1::size(1) >>,<< 0b00::size(2) >>}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"testp","#{imm?(l)}#{tohex(0,d)} orz"])
  def testp(all=%{addr: addr, con: con, instr: "TESTP", vars: {1,0,l,d,<< 0b00::size(2) >>,<< 0b1::size(1) >>,<< 0b000::size(3) >>,<< 0b1::size(1) >>,<< 0b00::size(2) >>}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"testp","#{imm?(l)}#{tohex(0,d)} orc"])

#                                           EEEE 1101011 CcL DDDDDDDDD 001000101        DIRNZ   D/#         {WCZ}
  def dirnz(all=%{addr: addr, con: con, instr: "DIRNZ", vars: {c,c,l,d,<< 0b00::size(2) >>,<< 0b1::size(1) >>,<< 0b000::size(3) >>,<< 0b1::size(1) >>,<< 0b0::size(1) >>,<< 0b1::size(1) >>}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"dirnz","#{imm?(l)}#{tohex(0,d)}#{wcz?(c,c)}"])

#                                           EEEE 1101011 CZL DDDDDDDDD 001000101        TESTPN  D/#         ORC/ORZ
  def testpn(all=%{addr: addr, con: con, instr: "TESTPN", vars: {0,1,l,d,<< 0b00::size(2) >>,<< 0b1::size(1) >>,<< 0b000::size(3) >>,<< 0b1::size(1) >>,<< 0b0::size(1) >>,<< 0b1::size(1) >>}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"testpn","#{imm?(l)}#{tohex(0,d)} orz"])
  def testpn(all=%{addr: addr, con: con, instr: "TESTPN", vars: {1,0,l,d,<< 0b00::size(2) >>,<< 0b1::size(1) >>,<< 0b000::size(3) >>,<< 0b1::size(1) >>,<< 0b0::size(1) >>,<< 0b1::size(1) >>}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"testpn","#{imm?(l)}#{tohex(0,d)} orc"])

#                                           EEEE 1101011 CcL DDDDDDDDD 001000110        DIRRND  D/#         {WCZ}
  def dirrnd(all=%{addr: addr, con: con, instr: "DIRRND", vars: {c,c,l,d,<< 0b00::size(2) >>,<< 0b1::size(1) >>,<< 0b000::size(3) >>,<< 0b11::size(2) >>,<< 0b0::size(1) >>}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"dirrnd","#{imm?(l)}#{tohex(0,d)}#{wcz?(c,c)}"])

#                                           EEEE 1101011 CZL DDDDDDDDD 001000110        TESTP   D/#         XORC/XORZ
  def testp(all=%{addr: addr, con: con, instr: "TESTP", vars: {0,1,l,d,<< 0b00::size(2) >>,<< 0b1::size(1) >>,<< 0b000::size(3) >>,<< 0b11::size(2) >>,<< 0b0::size(1) >>}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"testp","#{imm?(l)}#{tohex(0,d)} xorz"])
  def testp(all=%{addr: addr, con: con, instr: "TESTP", vars: {1,0,l,d,<< 0b00::size(2) >>,<< 0b1::size(1) >>,<< 0b000::size(3) >>,<< 0b11::size(2) >>,<< 0b0::size(1) >>}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"testp","#{imm?(l)}#{tohex(0,d)} xorc"])

#                                           EEEE 1101011 CcL DDDDDDDDD 001000111        DIRNOT  D/#         {WCZ}
  def dirnot(all=%{addr: addr, con: con, instr: "DIRNOT", vars: {c,c,l,d,<< 0b00::size(2) >>,<< 0b1::size(1) >>,<< 0b000::size(3) >>,<< 0b111::size(3) >>}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"dirnot","#{imm?(l)}#{tohex(0,d)}#{wcz?(c,c)}"])

#                                           EEEE 1101011 CZL DDDDDDDDD 001000111        TESTPN  D/#         XORC/XORZ
  def testpn(all=%{addr: addr, con: con, instr: "TESTPN", vars: {0,1,l,d,<< 0b00::size(2) >>,<< 0b1::size(1) >>,<< 0b000::size(3) >>,<< 0b111::size(3) >>}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"testpn","#{imm?(l)}#{tohex(0,d)} xorz"])
  def testpn(all=%{addr: addr, con: con, instr: "TESTPN", vars: {1,0,l,d,<< 0b00::size(2) >>,<< 0b1::size(1) >>,<< 0b000::size(3) >>,<< 0b111::size(3) >>}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"testpn","#{imm?(l)}#{tohex(0,d)} xorc"])

#                                           EEEE 1101011 CZL DDDDDDDDD 001001000        OUTL    D/#         {WCZ}
  def outl(all=%{addr: addr, con: con, instr: "OUTL", vars: {c,z,l,d,<< 0b00::size(2) >>,<< 0b1::size(1) >>,<< 0b00::size(2) >>,<< 0b1::size(1) >>,<< 0b000::size(3) >>}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"outl","#{imm?(l)}#{tohex(0,d)}#{wcz?(c,z)}"])

#                                           EEEE 1101011 CZL DDDDDDDDD 001001001        OUTH    D/#         {WCZ}
  def outh(all=%{addr: addr, con: con, instr: "OUTH", vars: {c,z,l,d,<< 0b00::size(2) >>,<< 0b1::size(1) >>,<< 0b00::size(2) >>,<< 0b1::size(1) >>,<< 0b00::size(2) >>,<< 0b1::size(1) >>}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"outh","#{imm?(l)}#{tohex(0,d)}#{wcz?(c,z)}"])

#                                           EEEE 1101011 CZL DDDDDDDDD 001001010        OUTC    D/#         {WCZ}
  def outc(all=%{addr: addr, con: con, instr: "OUTC", vars: {c,z,l,d,<< 0b00::size(2) >>,<< 0b1::size(1) >>,<< 0b00::size(2) >>,<< 0b1::size(1) >>,<< 0b0::size(1) >>,<< 0b1::size(1) >>,<< 0b0::size(1) >>}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"outc","#{imm?(l)}#{tohex(0,d)}#{wcz?(c,z)}"])

#                                           EEEE 1101011 CZL DDDDDDDDD 001001011        OUTNC   D/#         {WCZ}
  def outnc(all=%{addr: addr, con: con, instr: "OUTNC", vars: {c,z,l,d,<< 0b00::size(2) >>,<< 0b1::size(1) >>,<< 0b00::size(2) >>,<< 0b1::size(1) >>,<< 0b0::size(1) >>,<< 0b11::size(2) >>}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"outnc","#{imm?(l)}#{tohex(0,d)}#{wcz?(c,z)}"])

#                                           EEEE 1101011 CZL DDDDDDDDD 001001100        OUTZ    D/#         {WCZ}
  def outz(all=%{addr: addr, con: con, instr: "OUTZ", vars: {c,z,l,d,<< 0b00::size(2) >>,<< 0b1::size(1) >>,<< 0b00::size(2) >>,<< 0b11::size(2) >>,<< 0b00::size(2) >>}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"outz","#{imm?(l)}#{tohex(0,d)}#{wcz?(c,z)}"])

#                                           EEEE 1101011 CZL DDDDDDDDD 001001101        OUTNZ   D/#         {WCZ}
  def outnz(all=%{addr: addr, con: con, instr: "OUTNZ", vars: {c,z,l,d,<< 0b00::size(2) >>,<< 0b1::size(1) >>,<< 0b00::size(2) >>,<< 0b11::size(2) >>,<< 0b0::size(1) >>,<< 0b1::size(1) >>}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"outnz","#{imm?(l)}#{tohex(0,d)}#{wcz?(c,z)}"])

#                                           EEEE 1101011 CZL DDDDDDDDD 001001110        OUTRND  D/#         {WCZ}
  def outrnd(all=%{addr: addr, con: con, instr: "OUTRND", vars: {c,z,l,d,<< 0b00::size(2) >>,<< 0b1::size(1) >>,<< 0b00::size(2) >>,<< 0b111::size(3) >>,<< 0b0::size(1) >>}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"outrnd","#{imm?(l)}#{tohex(0,d)}#{wcz?(c,z)}"])

#                                           EEEE 1101011 CZL DDDDDDDDD 001001111        OUTNOT  D/#         {WCZ}
  def outnot(all=%{addr: addr, con: con, instr: "OUTNOT", vars: {c,z,l,d,<< 0b00::size(2) >>,<< 0b1::size(1) >>,<< 0b00::size(2) >>,<< 0b1111::size(4) >>}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"outnot","#{imm?(l)}#{tohex(0,d)}#{wcz?(c,z)}"])

#                                           EEEE 1101011 CZL DDDDDDDDD 001010000        FLTL    D/#         {WCZ}
  def fltl(all=%{addr: addr, con: con, instr: "FLTL", vars: {c,z,l,d,<< 0b00::size(2) >>,<< 0b1::size(1) >>,<< 0b0::size(1) >>,<< 0b1::size(1) >>,<< 0b0000::size(4) >>}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"fltl","#{imm?(l)}#{tohex(0,d)}#{wcz?(c,z)}"])

#                                           EEEE 1101011 CZL DDDDDDDDD 001010001        FLTH    D/#         {WCZ}
  def flth(all=%{addr: addr, con: con, instr: "FLTH", vars: {c,z,l,d,<< 0b00::size(2) >>,<< 0b1::size(1) >>,<< 0b0::size(1) >>,<< 0b1::size(1) >>,<< 0b000::size(3) >>,<< 0b1::size(1) >>}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"flth","#{imm?(l)}#{tohex(0,d)}#{wcz?(c,z)}"])

#                                           EEEE 1101011 CZL DDDDDDDDD 001010010        FLTC    D/#         {WCZ}
  def fltc(all=%{addr: addr, con: con, instr: "FLTC", vars: {c,z,l,d,<< 0b00::size(2) >>,<< 0b1::size(1) >>,<< 0b0::size(1) >>,<< 0b1::size(1) >>,<< 0b00::size(2) >>,<< 0b1::size(1) >>,<< 0b0::size(1) >>}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"fltc","#{imm?(l)}#{tohex(0,d)}#{wcz?(c,z)}"])

#                                           EEEE 1101011 CZL DDDDDDDDD 001010011        FLTNC   D/#         {WCZ}
  def fltnc(all=%{addr: addr, con: con, instr: "FLTNC", vars: {c,z,l,d,<< 0b00::size(2) >>,<< 0b1::size(1) >>,<< 0b0::size(1) >>,<< 0b1::size(1) >>,<< 0b00::size(2) >>,<< 0b11::size(2) >>}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"fltnc","#{imm?(l)}#{tohex(0,d)}#{wcz?(c,z)}"])

#                                           EEEE 1101011 CZL DDDDDDDDD 001010100        FLTZ    D/#         {WCZ}
  def fltz(all=%{addr: addr, con: con, instr: "FLTZ", vars: {c,z,l,d,<< 0b00::size(2) >>,<< 0b1::size(1) >>,<< 0b0::size(1) >>,<< 0b1::size(1) >>,<< 0b0::size(1) >>,<< 0b1::size(1) >>,<< 0b00::size(2) >>}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"fltz","#{imm?(l)}#{tohex(0,d)}#{wcz?(c,z)}"])

#                                           EEEE 1101011 CZL DDDDDDDDD 001010101        FLTNZ   D/#         {WCZ}
  def fltnz(all=%{addr: addr, con: con, instr: "FLTNZ", vars: {c,z,l,d,<< 0b00::size(2) >>,<< 0b1::size(1) >>,<< 0b0::size(1) >>,<< 0b1::size(1) >>,<< 0b0::size(1) >>,<< 0b1::size(1) >>,<< 0b0::size(1) >>,<< 0b1::size(1) >>}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"fltnz","#{imm?(l)}#{tohex(0,d)}#{wcz?(c,z)}"])

#                                           EEEE 1101011 CZL DDDDDDDDD 001010110        FLTRND  D/#         {WCZ}
  def fltrnd(all=%{addr: addr, con: con, instr: "FLTRND", vars: {c,z,l,d,<< 0b00::size(2) >>,<< 0b1::size(1) >>,<< 0b0::size(1) >>,<< 0b1::size(1) >>,<< 0b0::size(1) >>,<< 0b11::size(2) >>,<< 0b0::size(1) >>}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"fltrnd","#{imm?(l)}#{tohex(0,d)}#{wcz?(c,z)}"])

#                                           EEEE 1101011 CZL DDDDDDDDD 001010111        FLTNOT  D/#         {WCZ}
  def fltnot(all=%{addr: addr, con: con, instr: "FLTNOT", vars: {c,z,l,d,<< 0b00::size(2) >>,<< 0b1::size(1) >>,<< 0b0::size(1) >>,<< 0b1::size(1) >>,<< 0b0::size(1) >>,<< 0b111::size(3) >>}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"fltnot","#{imm?(l)}#{tohex(0,d)}#{wcz?(c,z)}"])

#                                           EEEE 1101011 CZL DDDDDDDDD 001011000        DRVL    D/#         {WCZ}
  def drvl(all=%{addr: addr, con: con, instr: "DRVL", vars: {c,z,l,d,<< 0b00::size(2) >>,<< 0b1::size(1) >>,<< 0b0::size(1) >>,<< 0b11::size(2) >>,<< 0b000::size(3) >>}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"drvl","#{imm?(l)}#{tohex(0,d)}#{wcz?(c,z)}"])

#                                           EEEE 1101011 CZL DDDDDDDDD 001011001        DRVH    D/#         {WCZ}
  def drvh(all=%{addr: addr, con: con, instr: "DRVH", vars: {c,z,l,d,<< 0b00::size(2) >>,<< 0b1::size(1) >>,<< 0b0::size(1) >>,<< 0b11::size(2) >>,<< 0b00::size(2) >>,<< 0b1::size(1) >>}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"drvh","#{imm?(l)}#{tohex(0,d)}#{wcz?(c,z)}"])

#                                           EEEE 1101011 CZL DDDDDDDDD 001011010        DRVC    D/#         {WCZ}
  def drvc(all=%{addr: addr, con: con, instr: "DRVC", vars: {c,z,l,d,<< 0b00::size(2) >>,<< 0b1::size(1) >>,<< 0b0::size(1) >>,<< 0b11::size(2) >>,<< 0b0::size(1) >>,<< 0b1::size(1) >>,<< 0b0::size(1) >>}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"drvc","#{imm?(l)}#{tohex(0,d)}#{wcz?(c,z)}"])

#                                           EEEE 1101011 CZL DDDDDDDDD 001011011        DRVNC   D/#         {WCZ}
  def drvnc(all=%{addr: addr, con: con, instr: "DRVNC", vars: {c,z,l,d,<< 0b00::size(2) >>,<< 0b1::size(1) >>,<< 0b0::size(1) >>,<< 0b11::size(2) >>,<< 0b0::size(1) >>,<< 0b11::size(2) >>}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"drvnc","#{imm?(l)}#{tohex(0,d)}#{wcz?(c,z)}"])

#                                           EEEE 1101011 CZL DDDDDDDDD 001011100        DRVZ    D/#         {WCZ}
  def drvz(all=%{addr: addr, con: con, instr: "DRVZ", vars: {c,z,l,d,<< 0b00::size(2) >>,<< 0b1::size(1) >>,<< 0b0::size(1) >>,<< 0b111::size(3) >>,<< 0b00::size(2) >>}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"drvz","#{imm?(l)}#{tohex(0,d)}#{wcz?(c,z)}"])

#                                           EEEE 1101011 CZL DDDDDDDDD 001011101        DRVNZ   D/#         {WCZ}
  def drvnz(all=%{addr: addr, con: con, instr: "DRVNZ", vars: {c,z,l,d,<< 0b00::size(2) >>,<< 0b1::size(1) >>,<< 0b0::size(1) >>,<< 0b111::size(3) >>,<< 0b0::size(1) >>,<< 0b1::size(1) >>}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"drvnz","#{imm?(l)}#{tohex(0,d)}#{wcz?(c,z)}"])

#                                           EEEE 1101011 CZL DDDDDDDDD 001011110        DRVRND  D/#         {WCZ}
  def drvrnd(all=%{addr: addr, con: con, instr: "DRVRND", vars: {c,z,l,d,<< 0b00::size(2) >>,<< 0b1::size(1) >>,<< 0b0::size(1) >>,<< 0b1111::size(4) >>,<< 0b0::size(1) >>}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"drvrnd","#{imm?(l)}#{tohex(0,d)}#{wcz?(c,z)}"])

#                                           EEEE 1101011 CZL DDDDDDDDD 001011111        DRVNOT  D/#         {WCZ}
  def drvnot(all=%{addr: addr, con: con, instr: "DRVNOT", vars: {c,z,l,d,<< 0b00::size(2) >>,<< 0b1::size(1) >>,<< 0b0::size(1) >>,<< 0b11111::size(5) >>}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"drvnot","#{imm?(l)}#{tohex(0,d)}#{wcz?(c,z)}"])

#                                           EEEE 1101011 000 DDDDDDDDD 001100000        SPLITB  D
  def splitb(all=%{addr: addr, con: con, instr: "SPLITB", vars: {d,<< 0b00::size(2) >>,<< 0b11::size(2) >>,<< 0b00000::size(5) >>}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"splitb","#{tohex(0,d)}"])

#                                           EEEE 1101011 000 DDDDDDDDD 001100001        MERGEB  D
  def mergeb(all=%{addr: addr, con: con, instr: "MERGEB", vars: {d,<< 0b00::size(2) >>,<< 0b11::size(2) >>,<< 0b0000::size(4) >>,<< 0b1::size(1) >>}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"mergeb","#{tohex(0,d)}"])

#                                           EEEE 1101011 000 DDDDDDDDD 001100010        SPLITW  D
  def splitw(all=%{addr: addr, con: con, instr: "SPLITW", vars: {d,<< 0b00::size(2) >>,<< 0b11::size(2) >>,<< 0b000::size(3) >>,<< 0b1::size(1) >>,<< 0b0::size(1) >>}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"splitw","#{tohex(0,d)}"])

#                                           EEEE 1101011 000 DDDDDDDDD 001100011        MERGEW  D
  def mergew(all=%{addr: addr, con: con, instr: "MERGEW", vars: {d,<< 0b00::size(2) >>,<< 0b11::size(2) >>,<< 0b000::size(3) >>,<< 0b11::size(2) >>}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"mergew","#{tohex(0,d)}"])

#                                           EEEE 1101011 000 DDDDDDDDD 001100100        SEUSSF  D
  def seussf(all=%{addr: addr, con: con, instr: "SEUSSF", vars: {d,<< 0b00::size(2) >>,<< 0b11::size(2) >>,<< 0b00::size(2) >>,<< 0b1::size(1) >>,<< 0b00::size(2) >>}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"seussf","#{tohex(0,d)}"])

#                                           EEEE 1101011 000 DDDDDDDDD 001100101        SEUSSR  D
  def seussr(all=%{addr: addr, con: con, instr: "SEUSSR", vars: {d,<< 0b00::size(2) >>,<< 0b11::size(2) >>,<< 0b00::size(2) >>,<< 0b1::size(1) >>,<< 0b0::size(1) >>,<< 0b1::size(1) >>}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"seussr","#{tohex(0,d)}"])

#                                           EEEE 1101011 000 DDDDDDDDD 001100110        RGBSQZ  D
  def rgbsqz(all=%{addr: addr, con: con, instr: "RGBSQZ", vars: {d,<< 0b00::size(2) >>,<< 0b11::size(2) >>,<< 0b00::size(2) >>,<< 0b11::size(2) >>,<< 0b0::size(1) >>}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"rgbsqz","#{tohex(0,d)}"])

#                                           EEEE 1101011 000 DDDDDDDDD 001100111        RGBEXP  D
  def rgbexp(all=%{addr: addr, con: con, instr: "RGBEXP", vars: {d,<< 0b00::size(2) >>,<< 0b11::size(2) >>,<< 0b00::size(2) >>,<< 0b111::size(3) >>}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"rgbexp","#{tohex(0,d)}"])

#                                           EEEE 1101011 000 DDDDDDDDD 001101000        XORO32  D
  def xoro32(all=%{addr: addr, con: con, instr: "XORO32", vars: {d,<< 0b00::size(2) >>,<< 0b11::size(2) >>,<< 0b0::size(1) >>,<< 0b1::size(1) >>,<< 0b000::size(3) >>}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"xoro32","#{tohex(0,d)}"])

#                                           EEEE 1101011 000 DDDDDDDDD 001101001        REV     D
  def rev(all=%{addr: addr, con: con, instr: "REV", vars: {d,<< 0b00::size(2) >>,<< 0b11::size(2) >>,<< 0b0::size(1) >>,<< 0b1::size(1) >>,<< 0b00::size(2) >>,<< 0b1::size(1) >>}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"rev","#{tohex(0,d)}"])

#                                           EEEE 1101011 CZ0 DDDDDDDDD 001101010        RCZR    D           {WC/WZ/WCZ}
  def rczr(all=%{addr: addr, con: con, instr: "RCZR", vars: {c,z,<< 0b0::size(1) >>,d,<< 0b00::size(2) >>,<< 0b11::size(2) >>,<< 0b0::size(1) >>,<< 0b1::size(1) >>,<< 0b0::size(1) >>,<< 0b1::size(1) >>,<< 0b0::size(1) >>}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"rczr","#{tohex(0,d)}#{wcz?(c,z)}"])

#                                           EEEE 1101011 CZ0 DDDDDDDDD 001101011        RCZL    D           {WC/WZ/WCZ}
  def rczl(all=%{addr: addr, con: con, instr: "RCZL", vars: {c,z,<< 0b0::size(1) >>,d,<< 0b00::size(2) >>,<< 0b11::size(2) >>,<< 0b0::size(1) >>,<< 0b1::size(1) >>,<< 0b0::size(1) >>,<< 0b11::size(2) >>}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"rczl","#{tohex(0,d)}#{wcz?(c,z)}"])

#                                           EEEE 1101011 000 DDDDDDDDD 001101100        WRC     D
  def wrc(all=%{addr: addr, con: con, instr: "WRC", vars: {d,<< 0b00::size(2) >>,<< 0b11::size(2) >>,<< 0b0::size(1) >>,<< 0b11::size(2) >>,<< 0b00::size(2) >>}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"wrc","#{tohex(0,d)}"])

#                                           EEEE 1101011 000 DDDDDDDDD 001101101        WRNC    D
  def wrnc(all=%{addr: addr, con: con, instr: "WRNC", vars: {d,<< 0b00::size(2) >>,<< 0b11::size(2) >>,<< 0b0::size(1) >>,<< 0b11::size(2) >>,<< 0b0::size(1) >>,<< 0b1::size(1) >>}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"wrnc","#{tohex(0,d)}"])

#                                           EEEE 1101011 000 DDDDDDDDD 001101110        WRZ     D
  def wrz(all=%{addr: addr, con: con, instr: "WRZ", vars: {d,<< 0b00::size(2) >>,<< 0b11::size(2) >>,<< 0b0::size(1) >>,<< 0b111::size(3) >>,<< 0b0::size(1) >>}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"wrz","#{tohex(0,d)}"])

#                                           EEEE 1101011 000 DDDDDDDDD 001101111        WRNZ    D
  def wrnz(all=%{addr: addr, con: con, instr: "WRNZ", vars: {d,<< 0b00::size(2) >>,<< 0b11::size(2) >>,<< 0b0::size(1) >>,<< 0b1111::size(4) >>}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"wrnz","#{tohex(0,d)}"])

#                                           EEEE 1101011 CZ1 0cccczzzz 001101111        MODCZ   c,z         {WC/WZ/WCZ}
  def modcz(all=%{addr: addr, con: con, instr: "MODCZ", vars: {c,z,<< 0b1::size(1) >>,<< 0b0::size(1) >>,cflags,zflags,<< 0b00::size(2) >>,<< 0b11::size(2) >>,<< 0b0::size(1) >>,<< 0b1111::size(4) >>}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s, %s%s", [addr,fullbin,disasm_c(<<con::size(4)>>),"modcz",modcz?(cflags),modcz?(zflags),"#{wcz?(c,z)}"])

#                                           EEEE 1101100 RAA AAAAAAAAA AAAAAAAAA        JMP     #abs/#rel
  def jmp(all=%{addr: addr, con: con, instr: "JMP", vars: {r,a}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"jmp",jumprDecode(addr, a, r)])

#                                           EEEE 1101101 RAA AAAAAAAAA AAAAAAAAA        CALL    #abs/#rel
  def call(all=%{addr: addr, con: con, instr: "CALL", vars: {r,a}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"call",relToPC(addr, a, r)])

  def jumprDecode(addr, a, 0) do
    "#\\#{tohex(0,a)}"
  end
  def jumprDecode(addr, a, 1) when addr < 0x400 do
    offset = castSigned20(a)
    case (offset >= -5) do
      true  -> "#$+#{tohex(0,div(castSigned20(a),4)+1)}"
      false -> "#$-#{tohex(0, :erlang.abs(div(castSigned20(a),4)+1))}"
    end
  end

  def jumprDecode(addr, a, 1) do
        offset = castSigned20(a)
        case (offset >= 1) do
          true  -> "#$+#{tohex(0, castSigned20(a)+4)}"
          false -> "#$-#{tohex(0, :erlang.abs(castSigned20(a))-4)}"
        end
  end


  def calldDecode(addr, a, 0, base) do
    "#\\#{tohex(0,a)}"
  end
  def calldDecode(addr, a, 1, base) when addr < 0x400 do
    offset = castSignedbase(a,base)
    case (offset >= 0) do
      true  -> "#$+#{tohex(0,div(castSignedbase(a,base),4)+1)}"
      false -> "#$-#{tohex(0, :erlang.abs(div(castSignedbase(a,base),4)+1))}"
    end
  end

  def calldDecode(addr, a, 1, base) do
        offset = castSignedbase(a,base)
        case (offset >= 0) do
          true  -> "#$+#{tohex(0, castSignedbase(a,base)+4)}"
          false -> "#$-#{tohex(0, :erlang.abs(castSignedbase(a,base))-4)}"
        end
  end


  def castSignedbase(inv,base) do
    <<out::signed-size(base)>> = <<inv::unsigned-size(base)>>
    out
  end


  def relToPC(addr, a, r) when addr < 0x400 do
    relToPC(0x500, div(a,4)+1, r) # stop infinity
  end
  def relToPC(_addr, a, r) do
    offset = castSigned9(a)
    case {(offset >= 0), r} do
      {true, 1}  -> "#$+#{tohex(0,offset)}"
      {false, 1} -> "#$#{tohex(0,offset)}"
      {true, 0}  -> "#\\#{tohex(0,offset)}"
      {false, 0} -> "#\\#{tohex(0,offset)}"
    end
  end

#                                           EEEE 1101110 RAA AAAAAAAAA AAAAAAAAA        CALLA   #abs/#rel
  def calla(all=%{addr: addr, con: con, instr: "CALLA", vars: {r,a}, fullbin: <<fullbin::size(32)>>}), do: IO.inspect(all)

#                                           EEEE 1101111 RAA AAAAAAAAA AAAAAAAAA        CALLB   #abs/#rel
  def callb(all=%{addr: addr, con: con, instr: "CALLB", vars: {r,a}, fullbin: <<fullbin::size(32)>>}), do: IO.inspect(all)

  #                                           EEEE 11100WW RAA AAAAAAAAA AAAAAAAAA        CALLD   reg,#abs/#rel (#{tohex(0,div(castSigned20(a),4)+1)}"CALLD   PA/PB/PTRA/PTRB,#A)
  def calld(all=%{addr: addr, con: con, instr: "CALLD", vars: {0b00,r,a}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s, %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"calld","$1f6",calldDecode(addr, a, r, 22)])
  def calld(all=%{addr: addr, con: con, instr: "CALLD", vars: {0b01,r,a}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s, %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"calld","$1f7",calldDecode(addr, a, r, 22)])
  def calld(all=%{addr: addr, con: con, instr: "CALLD", vars: {0b10,r,a}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s, %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"calld","$1f8",calldDecode(addr, a, r, 22)])
  def calld(all=%{addr: addr, con: con, instr: "CALLD", vars: {0b11,r,a}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s, %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"calld","$1f9",calldDecode(addr, a, r, 22)])

#                                           EEEE 11101WW RAA AAAAAAAAA AAAAAAAAA        LOC     reg,#abs/#rel
  def loc(all=%{addr: addr, con: con, instr: "LOC", vars: {0b00,r,a}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s, %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"loc","$1f6",calldDecode(addr, a, r, 22)])
  def loc(all=%{addr: addr, con: con, instr: "LOC", vars: {0b01,r,a}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s, %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"loc","$1f7",calldDecode(addr, a, r, 22)])
  def loc(all=%{addr: addr, con: con, instr: "LOC", vars: {0b10,r,a}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s, %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"loc","$1f8",calldDecode(addr, a, r, 22)])
  def loc(all=%{addr: addr, con: con, instr: "LOC", vars: {0b11,r,a}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s, %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"loc","$1f9",calldDecode(addr, a, r, 22)])

#                                           EEEE 11110NN NNN NNNNNNNNN NNNNNNNNN        AUGS    #23bits
  def augs(all=%{addr: addr, con: con, instr: "AUGS", vars: {n}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"augs","##{tohex(0,n)} << 9"])

#                                           EEEE 11111NN NNN NNNNNNNNN NNNNNNNNN        AUGD    #23bits
  def augd(all=%{addr: addr, con: con, instr: "AUGD", vars: {n}, fullbin: <<fullbin::size(32)>>}), do: ExPrintf.sprintf("%04x %08x %-12s %-7s %s", [addr,fullbin,disasm_c(<<con::size(4)>>),"augd","##{tohex(0,n)} << 9"])


  def wtf(map) do
    IO.inspect(map)
  end

  def disasm_c(<<0b0000::size(4)>>), do: "_ret_"
  def disasm_c(<<0b0001::size(4)>>), do: "if_nz_and_nc"
  def disasm_c(<<0b0010::size(4)>>), do: "if_z_and_nc"
  def disasm_c(<<0b0011::size(4)>>), do: "if_nc"
  def disasm_c(<<0b0100::size(4)>>), do: "if_nz_and_c"
  def disasm_c(<<0b0101::size(4)>>), do: "if_nz"
  def disasm_c(<<0b0110::size(4)>>), do: "if_z_ne_c"
  def disasm_c(<<0b0111::size(4)>>), do: "if_nz_or_nc"
  def disasm_c(<<0b1000::size(4)>>), do: "if_z_and_c"
  def disasm_c(<<0b1001::size(4)>>), do: "if_z_eq_c"
  def disasm_c(<<0b1010::size(4)>>), do: "if_z"
  def disasm_c(<<0b1011::size(4)>>), do: "if_z_or_nc"
  def disasm_c(<<0b1100::size(4)>>), do: "if_c"
  def disasm_c(<<0b1101::size(4)>>), do: "if_nz_or_c"
  def disasm_c(<<0b1110::size(4)>>), do: "if_z_or_c"
  def disasm_c(<<0b1111::size(4)>>), do: ""

  def imm?(1), do: "#"
  def imm?(0), do: ""
  def nop(map=%{addr: addr, con: con, instr: "NOP"}) do
    asm = "#{tohex4(addr)} 00000000              nop     "
  end


  def castSigned9(inv) do
    <<out::signed-size(9)>> = <<inv::unsigned-size(9)>>
    out
  end
  def castSigned20(inv) do
    <<out::signed-size(20)>> = <<inv::unsigned-size(20)>>
    out
  end

  def tohex(1,value) when (:erlang.abs(value) < 0xa) do
    ExPrintf.sprintf("%x", [value])
  end
  def tohex(1,value) do
    ExPrintf.sprintf("$%x", [value])
  end
  def tohex(0,value) when (:erlang.abs(value) < 0xa) do
    ExPrintf.sprintf("%x", [value])
  end
  def tohex(0,value) do
    ExPrintf.sprintf("$%x", [value])
  end
  def tohex4(value) do
    ExPrintf.sprintf("%04x", [value])
  end
  def tohex8(value) do
    ExPrintf.sprintf("%08x", [value])
  end

  def wcz?(0,0), do: ""
  def wcz?(0,1), do: " wz"
  def wcz?(1,0), do: " wc"
  def wcz?(1,1), do: " wcz"


  def modcz?(0b0000), do: "_clr"
  def modcz?(0b0001), do: "_nc_and_nz"
# _NZ_AND_NC              =       0b0001), do: 
# _GT                     =       0b0001), do: 
  def modcz?(0b0010), do: "_nc_and_z"
# _Z_AND_NC               =       0b0010), do: 
  def modcz?(0b0011), do: "_nc"
# _GE                     =       0b0011), do: 
  def modcz?(0b0100), do: "_c_and_nz"
# _NZ_AND_C               =       0b0100), do: 
  def modcz?(0b0101), do: "_nz"
# _NE                     =       0b0101), do: 
  def modcz?(0b0110), do: "_c_ne_z"
# _Z_NE_C                 =       0b0110), do: 
  def modcz?(0b0111), do: "_nc_or_nz"
# _NZ_OR_NC               =       0b0111), do: 
  def modcz?(0b1000), do: "_c_and_z"
# _Z_AND_C                =       0b1000), do: 
  def modcz?(0b1001), do: "_c_eq_z"
# _Z_EQ_C                 =       0b1001), do: 
  def modcz?(0b1010), do: "_z"
# _E                      =       0b1010), do: 
  def modcz?(0b1011), do: "_nc_or_z"
# _Z_OR_NC                =       0b1011), do: 
  def modcz?(0b1100), do: "_c"
# _LT                     =       0b1100), do: 
  def modcz?(0b1101), do: "_c_or_nz"
# _NZ_OR_C                =       0b1101), do: 
  def modcz?(0b1110), do: "_c_or_z"
# _Z_OR_C                 =       0b1110), do: 
# _LE                     =       0b1110), do: 
  def modcz?(0b1111), do: "_set"


end
