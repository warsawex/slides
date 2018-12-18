defmodule EventSystemTest do
  use ExUnit.Case
  doctest EventSystem

  test "greets the world" do
    assert EventSystem.hello() == :world
  end
end
