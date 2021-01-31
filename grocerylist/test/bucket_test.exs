defmodule GroceryList.BucketTest do
  use ExUnit.Case
  doctest GroceryList

  # NOTE: setup runs before all tests
  setup do
    {:ok, grocery_list} = GroceryList.Bucket.start_link([])
    %{grocery_list: grocery_list}
  end

  test "put element in grocery list", %{grocery_list: grocery_list} do
    assert GroceryList.Bucket.get(grocery_list, "grapefruit") == nil
    GroceryList.Bucket.put(grocery_list, "grapefruit", 5)
    assert GroceryList.Bucket.get(grocery_list, "grapefruit") == 5
    GroceryList.Bucket.del(grocery_list, "grapefruit")
    assert GroceryList.Bucket.get(grocery_list, "grapefruit") == nil
  end
end
