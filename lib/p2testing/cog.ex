defmodule P2Testing.Cog do
  use Bitwise
  use GenServer

  def start_link do
    start_link(:cog0)
  end
  def start_link(cogatom) do
    GenServer.start_link(__MODULE__, %{register: load(), lut: genmem(), pc: 0, step: 1, c: false, z: false}, name: cogatom)
  end

  def init(state) do
    {:ok, state}
  end

  def load do
    load("nopandjump.eeprom")
  end

  def load(filename) do
    {:ok, filepid} = File.open(filename, [:binary, :read])
    data = IO.binread(filepid, :all)
           |> :binary.bin_to_list

    length = Enum.count(data)
    File.close(filepid)

    registermem =
    data ++ :binary.bin_to_list(genmem(length+1))
    |> :binary.list_to_bin

  end


  def genmem do
    genmem(1)
  end

  def genmem(initsize) do
    Range.new(initsize, 512 * 4)
    |> Enum.reduce([], fn _, acc -> [0 | acc] end)
    |> :binary.list_to_bin()
  end

  def handle_info({:tick, cnt}, state = %{register: rmem, lut: lutmem, pc: pc, step: step, c: c, z: z}) do
    instr =  retrieve_instr(state)
    newstate = P2Testing.Disasm.dissassemble(instr)
    |> execute(state)

    {:noreply, newstate}
  end

  #  def execute([condit,instr,dst,src,flags] ,state) do
  #  IO.inspect(x)
  #  state
  #end

  def execute([{_,_,{bitmap,[_,"NOP",_,_,_]}}] ,state = %{pc: pc, step: step}) do
    IO.puts("#{pc} #{bitmap} NOP")
    Map.put(state, :pc, pc+step)
  end
  def execute([{_,_,{bitmap,[_,"JMP",d,_,_]}}] ,state = %{pc: pc, step: step}) do
    IO.puts("#{pc} #{bitmap} JMP #{d}")
    Map.put(state, :pc, String.to_integer(d))
  end


  #    IO.puts("Clock Tick: #{cnt}: #{pc} -> #{inspect(disasm)}")



  def retrieve_instr(state =  %{register: rmem, lut: lutmem, pc: pc, step: step}) when pc < 0x200 do
    :binary.part(rmem, (pc*4), 4)
  end
  def retrieve_instr(state =  %{register: rmem, lut: lutmem, pc: pc, step: step}) when pc < 0x400 do
    :binary.part(lutmem, (pc*4), 4)
  end








end
