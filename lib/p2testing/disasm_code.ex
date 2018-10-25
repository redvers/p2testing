defmodule P2Testing.DisasmCode do
  def coginit(map=%{addr: addr, con: con, instr: "COGINIT", vars: {c,l,i,d,s}, fullbin: <<fullbin::size(32)>>}) do
    asm = "#{tohex4(addr)} #{tohex8(fullbin)}              coginit #{tohex(l,d)}, #{tohex(i,s)}"
  end

  def nop(map=%{addr: addr, con: con, instr: "NOP"}) do
    asm = "#{tohex4(addr)} 00000000              nop"
  end

  def jmp(%{addr: addr, con: con, fullbin: <<fullbin::size(32)>>, instr: "JMP", vars: {1, a}}) do
    asm = "#{tohex4(addr)} #{tohex8(fullbin)}              jmp ##{castSigned9(divCog?(addr, a))}"
  end

  def divCog?(addr, a) when addr < 0x400 do
    div(a,4)+1
  end
  def divCog?(addr, a), do: a





























  def castSigned9(inv) do
    <<out::signed-size(9)>> = <<inv::unsigned-size(9)>>
    tohex(0,out)
  end




  def tohex(1,value) do
    ExPrintf.sprintf("#$%x", [value])
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

end
