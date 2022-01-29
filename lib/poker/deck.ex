defmodule Poker.Deck do
  def create() do
    suits = suits()
    values = values()

    deck =
      for {value_text, value_symbol} <- values, {suit_text, suit_symbol} <- suits do
        %Poker.Card{
          value_text: value_text,
          suit_text: suit_text,
          value_symbol: value_symbol,
          suit_symbol: suit_symbol
        }
      end

    {:ok, deck}
  end

  def shuffle({:ok, deck}) do
    shuffled_deck = Enum.shuffle(deck)
    {:ok, shuffled_deck}
  end

  def shuffle(deck) do
    shuffled_deck = Enum.shuffle(deck)
    {:ok, shuffled_deck}
  end

  defp suits() do
    [
      {"Spades", "♠️"},
      {"Clubs", "♣️"},
      {"Hearts", "♥️"},
      {"Diamonds", "♦️"}
    ]
  end

  defp values() do
    [
      {"Ace", "A"},
      {"Two", "2"},
      {"Three", "3"},
      {"Four", "4"},
      {"Five", "5"},
      {"Six", "6"},
      {"Seven", "7"},
      {"Eight", "8"},
      {"Nine", "9"},
      {"Ten", "10"},
      {"Jack", "J"},
      {"Queen", "Q"},
      {"King", "K"}
    ]
  end
end
