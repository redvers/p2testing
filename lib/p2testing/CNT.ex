defmodule P2Testing.CNT do
  use GenStateMachine, callback_mode: :handle_event_function

  def start_link(_) do
    GenStateMachine.start_link(__MODULE__, 0, name: :CNT)
  end

  def init(cnt) do
    {:ok, :stopped, %{cnt: cnt, tref: nil, delay: 1000}}
  end

  def handle_event(:info, :tick, :started, %{cnt: cnt, tref: tref, delay: delay}) do
    IO.puts("tick: #{cnt}")
    timeref = :erlang.send_after(delay, self, :tick)
    {:next_state, :started, %{cnt: cnt+1, tref: timeref, delay: delay}}
  end
  def handle_event(:info, :tick, :stopped, %{cnt: cnt, tref: tref, delay: delay}) do
    IO.puts("tick ignored")
    {:next_state, :stopped, %{cnt: cnt, tref: tref, delay: delay}}
  end



  def handle_event({:call, from}, :startCNT, :stopped, %{cnt: cnt, tref: tref, delay: delay}) do
    IO.puts(":stopped -> :started")
    timeref = :erlang.send_after(delay, self, :tick)
    {:next_state, :started, %{cnt: cnt, tref: timeref, delay: delay}, [{:reply, from, %{cnt: cnt, tref: tref, delay: delay}}]}
  end
  def handle_event({:call, from}, :startCNT, :started, %{cnt: cnt, tref: tref, delay: delay}) do
    IO.puts(":started -> :started (redundant)")
    {:next_state, :started, %{cnt: cnt, tref: tref, delay: delay}, [{:reply, from, %{cnt: cnt, tref: tref, delay: delay}}]}
  end

  def handle_event({:call, from}, :stopCNT, :started, %{cnt: cnt, tref: tref, delay: delay}) do
    IO.puts(":started -> :stopped")
    {:next_state, :stopped, %{cnt: cnt, tref: tref, delay: delay}, [{:reply, from, %{cnt: cnt, tref: tref, delay: delay}}]}
  end
  def handle_event({:call, from}, :stopCNT, :stopped, %{cnt: cnt, tref: tref, delay: delay}) do
    IO.puts(":stopped -> :stopped (redundant)")
    {:next_state, :stopped, %{cnt: cnt, tref: tref, delay: delay}, [{:reply, from, %{cnt: cnt, tref: tref, delay: delay}}]}
  end




end
