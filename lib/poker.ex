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

  def view_deck(deck_server) do
    with {:ok, deck} <- GenServer.call(deck_server, :view) do
      {:ok, deck}
    else
      e -> e
    end
  end

  def count_deck(deck_server) do
    with {:ok, count} <- GenServer.call(deck_server, :count) do
      {:ok, count}
    else
      e -> e
    end
  end

  def give_me_a_hand(deck_server) do
    with {:ok, c1} <- give_me_a_card(deck_server),
         {:ok, c2} <- give_me_a_card(deck_server) do
      {:ok, c1 ++ c2}
    else
      e -> e
    end
  end

  def give_me_a_card(deck_server) do
    with {:ok, c} <- GenServer.call(deck_server, :draw) do
      {:ok, c}
    else
      e -> e
    end
  end

  def make_a_deck_server do
    with {:ok, deck_server} <- GenServer.start_link(Poker.DeckServer, :ok) do
      {:ok, deck_server}
    else
      e -> e
    end
  end

  def make_a_deck do
    with {:ok, deck} <- Poker.Deck.create() do
      {:ok, deck}
    else
      e -> e
    end
  end

  def make_a_shuffled_deck() do
    with {:ok, deck} <- make_a_deck() |> Poker.Deck.shuffle() do
      {:ok, deck}
    else
      e -> e
    end
  end
end
