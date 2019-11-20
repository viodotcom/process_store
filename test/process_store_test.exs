defmodule BoFH.ProcessStoreTest do
  use ExUnit.Case

  alias BoFH.ProcessStore, as: Subject

  setup do
    {:ok, pid} = Task.Supervisor.start_link()
    {:ok, supervisor: pid}
  end

  test "store/2" do
    assert Subject.store(:key, "something") == nil

    assert Subject.store(:key, %{a: "b"}) == "something"
  end

  test "fetch/2 when the dictionary key is a parent process", %{supervisor: sup} do
    Subject.store(:key, "somethingelse")

    # simulate a process tree
    sup
    |> Task.Supervisor.async(fn ->
      sup
      |> Task.Supervisor.async(fn ->
        sup
        |> Task.Supervisor.async(fn ->
          assert Subject.fetch(:key) == "somethingelse"
        end)
        |> Task.await()
      end)
      |> Task.await()
    end)
    |> Task.await()
  end

  test "fetch/2 when the dictionary key is in the same process" do
    Subject.store("akey", "something")

    assert Subject.fetch("akey") == "something"
  end
end
