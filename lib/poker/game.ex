defmodule Poker.Game do
  defstruct [
    :burned_cards,
    :dealer,
    :deck,
    :player_1,
    :player_2,
    :player_3,
    :player_4,
    :player_5,
    :the_flop,
    :the_river,
    :the_turn
  ]
end
