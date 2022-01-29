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

  def destroy_deck(deck_server) do
    with :ok <- GenServer.cast(deck_server, :destroy) do
      {:ok, "Destroyed Deck: #{inspect(deck_server)}"}
    else
      e -> e
    end
  end

  def give_me_a_hand(deck_server) do
    {:ok, c1} = give_me_a_card(deck_server)
    {:ok, c2} = give_me_a_card(deck_server)
    {:ok, c1 ++ c2}
  end

  def give_me_a_card(deck_server) do
    {:ok, c} = GenServer.call(deck_server, :draw)
    {:ok, c}
  end

  def make_a_deck_server do
    {:ok, deck_server} = GenServer.start_link(Poker.DeckServer, :ok)
    {:ok, deck_server}
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
