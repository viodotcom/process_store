defmodule ProcessStoreTest do
  use ExUnit.Case
  doctest ProcessStore

  test "greets the world" do
    assert ProcessStore.hello() == :world
  end
end
