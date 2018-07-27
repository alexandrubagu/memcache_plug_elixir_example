defmodule PlugMemcacheExampleTest do
  use ExUnit.Case
  doctest PlugMemcacheExample

  test "greets the world" do
    assert PlugMemcacheExample.hello() == :world
  end
end
