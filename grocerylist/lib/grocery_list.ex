defmodule GroceryList do
  @moduledoc """
  Documentation for `GroceryList`.
  """

  use Agent

  @doc """
  Start a new grocery list instance
  """
  def start_link(_opts) do
    Agent.start_link(fn -> %{} end)
  end

  @doc """
  Gets an item from the grocery list
  """
  def get(list, item) do
    Agent.get(list, &Map.get(&1, item))
  end

  @doc """
  Puts a new item in the grocery list
  """
  def put(list, item, quantity) do
    Agent.update(list, &Map.put(&1, item, quantity))
  end

  @doc """
  Delete an item from the grocery list
  """
  def del(list, item) do
    Agent.get_and_update(list, &Map.pop(&1, item))
  end

end
