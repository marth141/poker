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

  def seq?(input), do: do_seq?(input, nil)
  # We are done
  defp do_seq?([], _), do: true

  defp do_seq?([h | t], nil),
    # entry
    do: do_seq?(t, h)

  defp do_seq?([h | t], ah) when ah == h - 1,
    # success path
    do: do_seq?(t, h)

  # ouch! we failed
  defp do_seq?(_, _), do: false

  def what_do_i_have(results) do
    highest_held_card =
      results.player_1 |> Enum.sort_by(fn card -> card.value_number end) |> List.first()

    cards = results.player_1 ++ results.dealer

    value_frequencies = Enum.frequencies_by(cards, fn card -> card.value_text end)

    suit_frequencies = Enum.frequencies_by(cards, fn card -> card.suit_text end)

    value_sorted = Enum.sort_by(cards, fn card -> card.value_number end)
    value_pairs = Enum.filter(value_frequencies, fn {_value, count} -> count == 2 end)
    value_threes = Enum.filter(value_frequencies, fn {_value, count} -> count == 3 end)
    value_fours = Enum.filter(value_frequencies, fn {_value, count} -> count == 4 end)
    suit_fives = Enum.filter(suit_frequencies, fn {_value, count} -> count == 5 end)

    head_five_sequence =
      Enum.map(value_sorted, fn card -> card.value_number end)
      |> Enum.uniq()
      |> Enum.take(5)
      |> seq?()

    tail_five_sequence =
      Enum.map(value_sorted, fn card -> card.value_number end)
      |> Enum.uniq()
      |> Enum.take(-5)
      |> seq?()

    tens = Enum.filter(value_sorted, fn card -> card.value_text == "Ten" end)
    jacks = Enum.filter(value_sorted, fn card -> card.value_text == "Jack" end)
    queens = Enum.filter(value_sorted, fn card -> card.value_text == "Queen" end)
    kings = Enum.filter(value_sorted, fn card -> card.value_text == "King" end)
    aces = Enum.filter(value_sorted, fn card -> card.value_text == "Ace" end)

    maybe_royal_hand = tens ++ jacks ++ queens ++ kings ++ aces

    royal_frequencies = Enum.frequencies_by(maybe_royal_hand, fn card -> card.suit_text end)

    royal_flush? = Enum.any?(royal_frequencies, fn {_k, v} -> v == 5 end)

    %{
      highest_held_card: highest_held_card,
      value_sorted: value_sorted,
      value_pairs: value_pairs,
      value_threes: value_threes,
      value_fours: value_fours,
      suit_fives: suit_fives,
      head_five_sequence: head_five_sequence,
      tail_five_sequence: tail_five_sequence
    }
    |> (fn %{
             highest_held_card: highest_held_card,
             value_sorted: value_sorted,
             value_pairs: value_pairs,
             value_threes: value_threes,
             value_fours: value_fours,
             suit_fives: suit_fives,
             head_five_sequence: head_five_sequence,
             tail_five_sequence: tail_five_sequence
           } ->
          %{
            high_card: highest_held_card,
            got_a_pair?: if(value_pairs |> Enum.count() == 1, do: true, else: false),
            got_a_two_pair?: if(value_pairs |> Enum.count() == 2, do: true, else: false),
            got_a_three_of_a_kind?: if(value_threes |> Enum.count() == 1, do: true, else: false),
            got_a_straight?: if(head_five_sequence or tail_five_sequence, do: true, else: false),
            got_a_flush?: if(suit_fives |> Enum.count() == 1, do: true, else: false),
            got_a_full_house?:
              if(value_threes |> Enum.count() == 1 and value_pairs |> Enum.count() == 1,
                do: true,
                else: false
              ),
            got_a_four_of_a_kind?: if(value_fours |> Enum.count() == 1, do: true, else: false),
            got_a_straight_flush?:
              if((head_five_sequence or tail_five_sequence) and suit_fives |> Enum.count() == 1,
                do: true,
                else: false
              ),
            got_a_royal_flush?: if(royal_flush?, do: true, else: false),
            hand: value_sorted
          }
        end).()
  end

  def play_a_round(opts \\ []) do
    players = Keyword.get(opts, :players, 2)
    players = 1..players

    {:ok, deck_server} = make_a_deck_server()
    {:ok, _shuffled_deck} = shuffle_deck(deck_server)
    {:ok, burned_card_1} = burn_a_card(deck_server)

    hands =
      Enum.map(players, fn _player ->
        {:ok, card_1} = draw_a_card(deck_server)
        %{hand: card_1}
      end)
      |> Enum.map(fn %{hand: card_1} ->
        {:ok, card_2} = draw_a_card(deck_server)
        %{hand: card_1 ++ card_2}
      end)

    {:ok, burned_card_2} = burn_a_card(deck_server)
    {:ok, the_flop} = draw_the_flop(deck_server)
    {:ok, burned_card_3} = burn_a_card(deck_server)
    {:ok, the_turn} = draw_the_turn(deck_server)
    {:ok, burned_card_4} = burn_a_card(deck_server)
    {:ok, the_river} = draw_the_river(deck_server)
    {:ok, deck} = view_deck(deck_server)
    {:ok, _confirmation} = destroy_deck(deck_server)

    %{
      burned_cards: burned_card_1 ++ burned_card_2 ++ burned_card_3 ++ burned_card_4,
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
    with {:ok, river_card} <- draw_a_card(deck_server) do
      {:ok, river_card}
    else
      e -> e
    end
  end

  def draw_the_turn(deck_server) do
    with {:ok, turn_card} <- draw_a_card(deck_server) do
      {:ok, turn_card}
    else
      e -> e
    end
  end

  def draw_the_flop(deck_server) do
    with {:ok, c1} <- draw_a_card(deck_server),
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
