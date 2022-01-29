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

  def play_a_round(opts \\ []) do
    players = Keyword.get(opts, :players, 2)
    players = 1..players

    {:ok, deck_server} = make_a_deck_server()
    {:ok, _shuffled_deck} = shuffle_deck(deck_server)
    {:ok, _burned_card} = burn_a_card(deck_server)

    hands =
      Enum.map(players, fn _player ->
        {:ok, card_1} = draw_a_card(deck_server)
        %{hand: card_1}
      end)
      |> Enum.map(fn %{hand: card_1} ->
        {:ok, card_2} = draw_a_card(deck_server)
        %{hand: card_1 ++ card_2}
      end)
      |> IO.inspect()

    {:ok, the_flop} = draw_the_flop(deck_server)
    {:ok, the_turn} = draw_the_turn(deck_server)
    {:ok, the_river} = draw_the_river(deck_server)
    {:ok, deck} = view_deck(deck_server)
    {:ok, _confirmation} = destroy_deck(deck_server)

    %{
      dealer: the_flop ++ the_turn ++ the_river,
      deck: deck,
      player_1: (hands |> Enum.at(0))[:hand],
      player_2: (hands |> Enum.at(1))[:hand],
      player_3: (hands |> Enum.at(2))[:hand],
      player_4: (hands |> Enum.at(3))[:hand],
      player_5: (hands |> Enum.at(4))[:hand],
      the_flop: the_flop,
      the_river: the_river,
      the_turn: the_turn
    }
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
    with {:ok, card} <- draw_a_card(deck_server) do
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
