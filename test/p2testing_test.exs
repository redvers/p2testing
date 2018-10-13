defmodule P2testingTest do
  use ExUnit.Case
  doctest P2testing

  test "greets the world" do
    assert P2testing.hello() == :world
  end
end
