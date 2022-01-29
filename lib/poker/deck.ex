defmodule Poker.Deck do
  def create() do
    suits = suits()
    values = values()

    deck =
      for {value_text, value_symbol, value_number} <- values, {suit_text, suit_symbol} <- suits do
        %Poker.Card{
          value_text: value_text,
          suit_text: suit_text,
          value_symbol: value_symbol,
          suit_symbol: suit_symbol,
          value_number: value_number
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
      {"Ace", "A", 1},
      {"Two", "2", 2},
      {"Three", "3", 3},
      {"Four", "4", 4},
      {"Five", "5", 5},
      {"Six", "6", 6},
      {"Seven", "7", 7},
      {"Eight", "8", 8},
      {"Nine", "9", 9},
      {"Ten", "10", 10},
      {"Jack", "J", 11},
      {"Queen", "Q", 12},
      {"King", "K", 13}
    ]
  end
end
