defmodule P2Testing.CNT do
  use GenStateMachine, callback_mode: :handle_event_function

  def startcnt, do: GenStateMachine.call(:CNT, :startCNT)
  def stopcnt, do: GenStateMachine.call(:CNT, :stopCNT)
  def tick, do: send(:CNT, :tick)



  def start_link(_) do
    GenStateMachine.start_link(__MODULE__, 0, name: :CNT)
  end

  def init(cnt) do
    {:ok, :stopped, %{cnt: cnt, tref: nil, delay: 1000}}
  end

  def handle_event(:info, :tick, :started, %{cnt: cnt, tref: _, delay: delay}) do
    send(:cog0, {:tick, cnt})
    timeref = :erlang.send_after(delay, self(), :tick)
    {:next_state, :started, %{cnt: cnt + 1, tref: timeref, delay: delay}}
  end

  def handle_event(:info, :tick, :stopped, %{cnt: cnt, tref: tref, delay: delay}) do
    send(:cog0, {:tick, cnt})
    {:next_state, :stopped, %{cnt: cnt + 1, tref: tref, delay: delay}}
  end

  def handle_event({:call, from}, :startCNT, :stopped, %{cnt: cnt, tref: tref, delay: delay}) do
    timeref = :erlang.send_after(delay, self(), :tick)

    {:next_state, :started, %{cnt: cnt, tref: timeref, delay: delay},
     [{:reply, from, %{cnt: cnt, tref: tref, delay: delay}}]}
  end

  def handle_event({:call, from}, :startCNT, :started, %{cnt: cnt, tref: tref, delay: delay}) do
    {:next_state, :started, %{cnt: cnt, tref: tref, delay: delay},
     [{:reply, from, %{cnt: cnt, tref: tref, delay: delay}}]}
  end

  def handle_event({:call, from}, :stopCNT, :started, %{cnt: cnt, tref: tref, delay: delay}) do
    :erlang.cancel_timer(tref)

    {:next_state, :stopped, %{cnt: cnt, tref: tref, delay: delay},
     [{:reply, from, %{cnt: cnt, tref: tref, delay: delay}}]}
  end

  def handle_event({:call, from}, :stopCNT, :stopped, %{cnt: cnt, tref: tref, delay: delay}) do
    {:next_state, :stopped, %{cnt: cnt, tref: tref, delay: delay},
     [{:reply, from, %{cnt: cnt, tref: tref, delay: delay}}]}
  end
end
