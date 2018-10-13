defmodule P2Testing.Disasm.Macros do
  def t7czids({opcode,cc,zz,ii,dd,ss}) do
   unquote(def disasm_mac28(<<opcode :: size(7), cc :: size(1), zz :: size(1), ii :: size(1), dd :: size(9), ss :: size(9)>>), do: :ok)
  end
end
