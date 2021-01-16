# This application has a Process which holds state and serves it when requested

import IEx.Helpers

defmodule KV do
  def start do
    Task.start_link(fn -> loop(%{}) end)
  end

  defp loop(map) do
    receive do
      {:get, key, caller} ->
        send caller, Map.get(map, key)
        loop(map)
      {:put, key, value} ->
        loop(Map.put(map, key, value))
    end
  end
end

# Start thread
{_result, pid} = KV.start()
# Register pid as server
Process.register(pid, :server)
# Set a key
send(:server, {:put, :name, "pippo"})
# Get hello key
send(:server, {:get, :name, self()})
# Read inbox
flush()

# Over these kind of implementation of state holders, the
# Agent module should be preferred (since provides easily these kind of functionalities)
# <https://hexdocs.pm/elixir/Agent.html>

defmodule Counter do
  use Agent

  def start_link(initial_value) do
    Agent.start_link(fn -> initial_value end, name: __MODULE__)
  end

  def value do
    Agent.get(__MODULE__, & &1)
  end

  def increment do
    Agent.update(__MODULE__, &(&1 + 1))
  end
end

# Let's use it
Counter.start_link(0)
Counter.increment()
IO.puts Counter.value()
