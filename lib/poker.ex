defmodule Poker do
  @moduledoc """
  Documentation for `Poker`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Poker.hello()
      :world

  """
  def hello do
    :world
  end

  def give_me_a_hand(deck_server) do
    hand = GenServer.call(deck_server, :draw)
    hand ++ GenServer.call(deck_server, :draw)
  end

  def make_a_deck_server do
    GenServer.start_link(Poker.DeckServer, :ok)
  end

  def make_a_deck do
    {:ok, deck} = Poker.Deck.create()
    {:ok, deck}
  end

  def make_a_shuffled_deck() do
    {:ok, deck} = make_a_deck() |> Poker.Deck.shuffle()
    {:ok, deck}
  end
end
