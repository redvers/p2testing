defmodule P2Testing.Hub do
  use Bitwise
  use GenServer

  def start_link(_) do
    GenServer.start_link(__MODULE__, %{memory: genmem()}, name: :HUB)
  end

  def init(state) do
    {:ok, state}
  end

  def genmem do
    Range.new(1,(512*1024))
    |> Enum.reduce([], fn(_,acc) -> [0|acc] end)
    |> :binary.list_to_bin
  end

  def boot(filename) do
    # Kill cogs0-7 - not written them yet ;-)
    {:ok, filepid} = File.open(filename, [:binary, :read])
    data = IO.binread(filepid, 1024)
    File.close(filepid)

    validate_checksum(data, 0)
  end
    
  def validate_checksum(<<>>, acc) do
    acc &&& 0xFFFFFFFF
  end
  def validate_checksum(<< addme :: signed-integer-big-size(32), rest :: binary>>, acc) do
    validate_checksum(rest, ((addme + acc) &&& 0xFFFFFFFF))
  end




end
