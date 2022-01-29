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

  def draw_the_river(deck_server) do
    with {:ok, _burned_card} <- burn_a_card(deck_server),
         {:ok, river_card} <- draw_a_card(deck_server) do
      {:ok, river_card}
    else
      e -> e
    end
  end

  def draw_the_turn(deck_server) do
    with {:ok, _burned_card} <- burn_a_card(deck_server),
         {:ok, turn_card} <- draw_a_card(deck_server) do
      {:ok, turn_card}
    else
      e -> e
    end
  end

  def draw_the_flop(deck_server) do
    with {:ok, _burned_card} <- burn_a_card(deck_server),
         {:ok, c1} <- draw_a_card(deck_server),
         {:ok, c2} <- draw_a_card(deck_server),
         {:ok, c3} <- draw_a_card(deck_server) do
      {:ok, c1 ++ c2 ++ c3}
    else
      e -> e
    end
  end

  def burn_a_card(deck_server) do
    with {:ok, card} <- GenServer.call(deck_server, :burn) do
      {:ok, card}
    else
      e -> e
    end
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

  def shuffle_deck(deck_server) do
    with {:ok, deck} <- GenServer.call(deck_server, :shuffle) do
      {:ok, deck}
    else
      e -> e
    end
  end

  def draw_a_hand(deck_server) do
    with {:ok, c1} <- draw_a_card(deck_server),
         {:ok, c2} <- draw_a_card(deck_server) do
      {:ok, c1 ++ c2}
    else
      e -> e
    end
  end

  def draw_a_card(deck_server) do
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
end
