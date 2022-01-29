defmodule PokerTest do
  use ExUnit.Case
  doctest Poker

  test "greets the world" do
    assert Poker.hello() == :world
  end

  test "shuffle a deck" do
    {:ok, deck_server} = Poker.make_a_deck_server()
    {:ok, deck} = Poker.view_deck(deck_server)
    {:ok, shuffled_deck} = Poker.shuffle_deck(deck_server)

    assert deck != shuffled_deck
  end

  test "make a deck" do
    {:ok, deck_server} = Poker.make_a_deck_server()
    {:ok, deck} = Poker.view_deck(deck_server)

    assert {:ok, 52} = Poker.count_deck(deck_server)

    assert ^deck = [
             %Poker.Card{
               suit_text: "Spades",
               suit_symbol: "♠️",
               value_text: "Ace",
               value_symbol: "A"
             },
             %Poker.Card{
               suit_text: "Clubs",
               suit_symbol: "♣️",
               value_text: "Ace",
               value_symbol: "A"
             },
             %Poker.Card{
               suit_text: "Hearts",
               suit_symbol: "♥️",
               value_text: "Ace",
               value_symbol: "A"
             },
             %Poker.Card{
               suit_text: "Diamonds",
               suit_symbol: "♦️",
               value_text: "Ace",
               value_symbol: "A"
             },
             %Poker.Card{
               suit_text: "Spades",
               suit_symbol: "♠️",
               value_text: "Two",
               value_symbol: "2"
             },
             %Poker.Card{
               suit_text: "Clubs",
               suit_symbol: "♣️",
               value_text: "Two",
               value_symbol: "2"
             },
             %Poker.Card{
               suit_text: "Hearts",
               suit_symbol: "♥️",
               value_text: "Two",
               value_symbol: "2"
             },
             %Poker.Card{
               suit_text: "Diamonds",
               suit_symbol: "♦️",
               value_text: "Two",
               value_symbol: "2"
             },
             %Poker.Card{
               suit_text: "Spades",
               suit_symbol: "♠️",
               value_text: "Three",
               value_symbol: "3"
             },
             %Poker.Card{
               suit_text: "Clubs",
               suit_symbol: "♣️",
               value_text: "Three",
               value_symbol: "3"
             },
             %Poker.Card{
               suit_text: "Hearts",
               suit_symbol: "♥️",
               value_text: "Three",
               value_symbol: "3"
             },
             %Poker.Card{
               suit_text: "Diamonds",
               suit_symbol: "♦️",
               value_text: "Three",
               value_symbol: "3"
             },
             %Poker.Card{
               suit_text: "Spades",
               suit_symbol: "♠️",
               value_text: "Four",
               value_symbol: "4"
             },
             %Poker.Card{
               suit_text: "Clubs",
               suit_symbol: "♣️",
               value_text: "Four",
               value_symbol: "4"
             },
             %Poker.Card{
               suit_text: "Hearts",
               suit_symbol: "♥️",
               value_text: "Four",
               value_symbol: "4"
             },
             %Poker.Card{
               suit_text: "Diamonds",
               suit_symbol: "♦️",
               value_text: "Four",
               value_symbol: "4"
             },
             %Poker.Card{
               suit_text: "Spades",
               suit_symbol: "♠️",
               value_text: "Five",
               value_symbol: "5"
             },
             %Poker.Card{
               suit_text: "Clubs",
               suit_symbol: "♣️",
               value_text: "Five",
               value_symbol: "5"
             },
             %Poker.Card{
               suit_text: "Hearts",
               suit_symbol: "♥️",
               value_text: "Five",
               value_symbol: "5"
             },
             %Poker.Card{
               suit_text: "Diamonds",
               suit_symbol: "♦️",
               value_text: "Five",
               value_symbol: "5"
             },
             %Poker.Card{
               suit_text: "Spades",
               suit_symbol: "♠️",
               value_text: "Six",
               value_symbol: "6"
             },
             %Poker.Card{
               suit_text: "Clubs",
               suit_symbol: "♣️",
               value_text: "Six",
               value_symbol: "6"
             },
             %Poker.Card{
               suit_text: "Hearts",
               suit_symbol: "♥️",
               value_text: "Six",
               value_symbol: "6"
             },
             %Poker.Card{
               suit_text: "Diamonds",
               suit_symbol: "♦️",
               value_text: "Six",
               value_symbol: "6"
             },
             %Poker.Card{
               suit_text: "Spades",
               suit_symbol: "♠️",
               value_text: "Seven",
               value_symbol: "7"
             },
             %Poker.Card{
               suit_text: "Clubs",
               suit_symbol: "♣️",
               value_text: "Seven",
               value_symbol: "7"
             },
             %Poker.Card{
               suit_text: "Hearts",
               suit_symbol: "♥️",
               value_text: "Seven",
               value_symbol: "7"
             },
             %Poker.Card{
               suit_text: "Diamonds",
               suit_symbol: "♦️",
               value_text: "Seven",
               value_symbol: "7"
             },
             %Poker.Card{
               suit_text: "Spades",
               suit_symbol: "♠️",
               value_text: "Eight",
               value_symbol: "8"
             },
             %Poker.Card{
               suit_text: "Clubs",
               suit_symbol: "♣️",
               value_text: "Eight",
               value_symbol: "8"
             },
             %Poker.Card{
               suit_text: "Hearts",
               suit_symbol: "♥️",
               value_text: "Eight",
               value_symbol: "8"
             },
             %Poker.Card{
               suit_text: "Diamonds",
               suit_symbol: "♦️",
               value_text: "Eight",
               value_symbol: "8"
             },
             %Poker.Card{
               suit_text: "Spades",
               suit_symbol: "♠️",
               value_text: "Nine",
               value_symbol: "9"
             },
             %Poker.Card{
               suit_text: "Clubs",
               suit_symbol: "♣️",
               value_text: "Nine",
               value_symbol: "9"
             },
             %Poker.Card{
               suit_text: "Hearts",
               suit_symbol: "♥️",
               value_text: "Nine",
               value_symbol: "9"
             },
             %Poker.Card{
               suit_text: "Diamonds",
               suit_symbol: "♦️",
               value_text: "Nine",
               value_symbol: "9"
             },
             %Poker.Card{
               suit_text: "Spades",
               suit_symbol: "♠️",
               value_text: "Ten",
               value_symbol: "10"
             },
             %Poker.Card{
               suit_text: "Clubs",
               suit_symbol: "♣️",
               value_text: "Ten",
               value_symbol: "10"
             },
             %Poker.Card{
               suit_text: "Hearts",
               suit_symbol: "♥️",
               value_text: "Ten",
               value_symbol: "10"
             },
             %Poker.Card{
               suit_text: "Diamonds",
               suit_symbol: "♦️",
               value_text: "Ten",
               value_symbol: "10"
             },
             %Poker.Card{
               suit_text: "Spades",
               suit_symbol: "♠️",
               value_text: "Jack",
               value_symbol: "J"
             },
             %Poker.Card{
               suit_text: "Clubs",
               suit_symbol: "♣️",
               value_text: "Jack",
               value_symbol: "J"
             },
             %Poker.Card{
               suit_text: "Hearts",
               suit_symbol: "♥️",
               value_text: "Jack",
               value_symbol: "J"
             },
             %Poker.Card{
               suit_text: "Diamonds",
               suit_symbol: "♦️",
               value_text: "Jack",
               value_symbol: "J"
             },
             %Poker.Card{
               suit_text: "Spades",
               suit_symbol: "♠️",
               value_text: "Queen",
               value_symbol: "Q"
             },
             %Poker.Card{
               suit_text: "Clubs",
               suit_symbol: "♣️",
               value_text: "Queen",
               value_symbol: "Q"
             },
             %Poker.Card{
               suit_text: "Hearts",
               suit_symbol: "♥️",
               value_text: "Queen",
               value_symbol: "Q"
             },
             %Poker.Card{
               suit_text: "Diamonds",
               suit_symbol: "♦️",
               value_text: "Queen",
               value_symbol: "Q"
             },
             %Poker.Card{
               suit_text: "Spades",
               suit_symbol: "♠️",
               value_text: "King",
               value_symbol: "K"
             },
             %Poker.Card{
               suit_text: "Clubs",
               suit_symbol: "♣️",
               value_text: "King",
               value_symbol: "K"
             },
             %Poker.Card{
               suit_text: "Hearts",
               suit_symbol: "♥️",
               value_text: "King",
               value_symbol: "K"
             },
             %Poker.Card{
               suit_text: "Diamonds",
               suit_symbol: "♦️",
               value_text: "King",
               value_symbol: "K"
             }
           ]
  end
end
