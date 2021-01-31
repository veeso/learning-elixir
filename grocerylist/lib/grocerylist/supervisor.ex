defmodule GroceryList.Supervisor do
  use Supervisor

  def start_link(opts) do
    Supervisor.start_link(__MODULE__, :ok, opts)
  end

  @impl true
  def init(:ok) do

    children = [
      %{
        id: Registry,
        start: {GroceryList.Registry, :start_link, [[]]}
      }
    ]

    Supervisor.init(children, strategy: :one_for_one)
  end
end
