defmodule GroceryListTest do
  use ExUnit.Case
  doctest GroceryList

  # NOTE: setup runs before all tests
  setup do
    {:ok, grocery_list} = GroceryList.start_link([])
    %{grocery_list: grocery_list}
  end

  test "put element in grocery list", %{grocery_list: grocery_list} do
    assert GroceryList.get(grocery_list, "grapefruit") == nil
    GroceryList.put(grocery_list, "grapefruit", 5)
    assert GroceryList.get(grocery_list, "grapefruit") == 5
    GroceryList.del(grocery_list, "grapefruit")
    assert GroceryList.get(grocery_list, "grapefruit") == nil
  end
end
