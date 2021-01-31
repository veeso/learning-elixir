defmodule GroceryList.RegistryTest do
  use ExUnit.Case, async: true

  setup do
    registry = start_supervised!(GroceryList.Registry)
    %{registry: registry}
  end

  test "spawns buckets", %{registry: registry} do
    assert GroceryList.Registry.lookup(registry, "wednesday-list") == :error

    GroceryList.Registry.create(registry, "wednesday-list")
    assert {:ok, bucket} = GroceryList.Registry.lookup(registry, "wednesday-list")

    GroceryList.Bucket.put(bucket, "potatoes", 5)
    assert GroceryList.Bucket.get(bucket, "potatoes") == 5
  end

  test "removes buckets on exit", %{registry: registry} do
    GroceryList.Registry.create(registry, "shopping")
    {:ok, bucket} = GroceryList.Registry.lookup(registry, "shopping")
    Agent.stop(bucket)
    assert GroceryList.Registry.lookup(registry, "shopping") == :error
  end
end
