defmodule ProcessStoreTest do
  use ExUnit.Case

  alias ProcessStore, as: Subject

  describe "store/2" do
    test "when the key does not exist yet, stores the value and returns nil" do
      assert Subject.store(:my_key, "something") == nil
      assert Subject.fetch(:my_key) == "something"
    end

    test "when the key already exist, stores the new value and returns the previous value" do
      Subject.store(:my_key, "something")

      assert Subject.store(:my_key, %{a: "b"}) == "something"
      assert Subject.fetch(:my_key) == %{a: "b"}
    end
  end

  describe "fetch/1" do
    setup do
      {:ok, pid} = Task.Supervisor.start_link()
      {:ok, supervisor: pid}
    end

    test "when the dictionary key is in a parent process, returns the value", %{supervisor: sup} do
      Subject.store(:my_key, "somethingelse")

      # Simulate a process tree.
      sup
      |> Task.Supervisor.async(fn ->
        sup
        |> Task.Supervisor.async(fn ->
          sup
          |> Task.Supervisor.async(fn ->
            assert Subject.fetch(:my_key) == "somethingelse"
          end)
          |> Task.await()
        end)
        |> Task.await()
      end)
      |> Task.await()
    end

    test "when the dictionary key is in the same process, returns the value" do
      Subject.store(:another_key, "something")

      assert Subject.fetch(:another_key) == "something"
    end

    test "when the key does not exist, returns nil", %{supervisor: sup} do
      assert Subject.fetch(:non_existing_key) == nil

      # Simulate a process tree.
      sup
      |> Task.Supervisor.async(fn ->
        sup
        |> Task.Supervisor.async(fn ->
          sup
          |> Task.Supervisor.async(fn ->
            assert Subject.fetch(:non_existing_key) == nil
          end)
          |> Task.await()
        end)
        |> Task.await()
      end)
      |> Task.await()
    end
  end
end
