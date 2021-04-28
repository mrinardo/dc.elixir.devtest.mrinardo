defmodule DeliverycenterElixir.OrderItem do
  use Ecto.Schema

  schema "order_items" do
    belongs_to :order, DeliverycenterElixir.Order
    belongs_to :items, DeliverycenterElixir.Item
  end
end
