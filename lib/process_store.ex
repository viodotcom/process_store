defmodule ProcessStore do
  @moduledoc """
  A Facility to store and retrieve a data from the process dictionary.
  """

  @type key() :: String.t() | atom()
  @type data() :: any()

  @doc """
  Store the passed `value` in the dictionary of the current `Process` using the passed `key`.

  The return value of this function is the value that was previously stored under the same `key`,
  or `nil` in case no value was stored before.

  ## Examples

      iex> #{inspect(__MODULE__)}.store(:my_key, anything")
      nil

      iex> #{inspect(__MODULE__)}.store(:my_key, "somethingelse")
      "anything"

  """
  @spec store(key(), data()) :: data()
  def store(key, value), do: Process.put(key, value)

  @doc """
  Retrieve the value of `key` from the `Process` or from the `$callers` dictionaries.

  Returns the first found occurrence.

  ## Examples

      iex> #{inspect(__MODULE__)}.fetch(:my_key)
      "anything"

      iex> #{inspect(__MODULE__)}.fetch(:non_existing_key)
      nil

  """
  @spec fetch(key()) :: data()
  def fetch(key), do: Process.get() |> find_data(key)

  @spec find_data(keyword(), key()) :: data()
  defp find_data([{key, value} | _data], wanted_key) when key == wanted_key, do: value

  defp find_data([{:"$callers", callers} | _data], key) do
    callers
    |> List.wrap()
    |> Enum.reduce_while(%{}, fn process, _state ->
      process
      |> Process.info()
      |> get_in([:dictionary, key])
      |> case do
        nil -> {:cont, nil}
        state -> {:halt, state}
      end
    end)
  end

  defp find_data([_something | data], key), do: find_data(data, key)

  defp find_data([], _key), do: nil
end
