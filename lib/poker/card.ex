defmodule Poker.Card do
  use Ecto.Schema

  embedded_schema do
    field(:value_text, :string)
    field(:suit_text, :string)
    field(:value_symbol, :string)
    field(:suit_symbol, :string)
  end
end
