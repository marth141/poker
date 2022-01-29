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
               id: nil,
               suit_symbol: "♠️",
               suit_text: "Spades",
               value_number: 2,
               value_symbol: "2",
               value_text: "Two"
             },
             %Poker.Card{
               id: nil,
               suit_symbol: "♣️",
               suit_text: "Clubs",
               value_number: 2,
               value_symbol: "2",
               value_text: "Two"
             },
             %Poker.Card{
               id: nil,
               suit_symbol: "♥️",
               suit_text: "Hearts",
               value_number: 2,
               value_symbol: "2",
               value_text: "Two"
             },
             %Poker.Card{
               id: nil,
               suit_symbol: "♦️",
               suit_text: "Diamonds",
               value_number: 2,
               value_symbol: "2",
               value_text: "Two"
             },
             %Poker.Card{
               id: nil,
               suit_symbol: "♠️",
               suit_text: "Spades",
               value_number: 3,
               value_symbol: "3",
               value_text: "Three"
             },
             %Poker.Card{
               id: nil,
               suit_symbol: "♣️",
               suit_text: "Clubs",
               value_number: 3,
               value_symbol: "3",
               value_text: "Three"
             },
             %Poker.Card{
               id: nil,
               suit_symbol: "♥️",
               suit_text: "Hearts",
               value_number: 3,
               value_symbol: "3",
               value_text: "Three"
             },
             %Poker.Card{
               id: nil,
               suit_symbol: "♦️",
               suit_text: "Diamonds",
               value_number: 3,
               value_symbol: "3",
               value_text: "Three"
             },
             %Poker.Card{
               id: nil,
               suit_symbol: "♠️",
               suit_text: "Spades",
               value_number: 4,
               value_symbol: "4",
               value_text: "Four"
             },
             %Poker.Card{
               id: nil,
               suit_symbol: "♣️",
               suit_text: "Clubs",
               value_number: 4,
               value_symbol: "4",
               value_text: "Four"
             },
             %Poker.Card{
               id: nil,
               suit_symbol: "♥️",
               suit_text: "Hearts",
               value_number: 4,
               value_symbol: "4",
               value_text: "Four"
             },
             %Poker.Card{
               id: nil,
               suit_symbol: "♦️",
               suit_text: "Diamonds",
               value_number: 4,
               value_symbol: "4",
               value_text: "Four"
             },
             %Poker.Card{
               id: nil,
               suit_symbol: "♠️",
               suit_text: "Spades",
               value_number: 5,
               value_symbol: "5",
               value_text: "Five"
             },
             %Poker.Card{
               id: nil,
               suit_symbol: "♣️",
               suit_text: "Clubs",
               value_number: 5,
               value_symbol: "5",
               value_text: "Five"
             },
             %Poker.Card{
               id: nil,
               suit_symbol: "♥️",
               suit_text: "Hearts",
               value_number: 5,
               value_symbol: "5",
               value_text: "Five"
             },
             %Poker.Card{
               id: nil,
               suit_symbol: "♦️",
               suit_text: "Diamonds",
               value_number: 5,
               value_symbol: "5",
               value_text: "Five"
             },
             %Poker.Card{
               id: nil,
               suit_symbol: "♠️",
               suit_text: "Spades",
               value_number: 6,
               value_symbol: "6",
               value_text: "Six"
             },
             %Poker.Card{
               id: nil,
               suit_symbol: "♣️",
               suit_text: "Clubs",
               value_number: 6,
               value_symbol: "6",
               value_text: "Six"
             },
             %Poker.Card{
               id: nil,
               suit_symbol: "♥️",
               suit_text: "Hearts",
               value_number: 6,
               value_symbol: "6",
               value_text: "Six"
             },
             %Poker.Card{
               id: nil,
               suit_symbol: "♦️",
               suit_text: "Diamonds",
               value_number: 6,
               value_symbol: "6",
               value_text: "Six"
             },
             %Poker.Card{
               id: nil,
               suit_symbol: "♠️",
               suit_text: "Spades",
               value_number: 7,
               value_symbol: "7",
               value_text: "Seven"
             },
             %Poker.Card{
               id: nil,
               suit_symbol: "♣️",
               suit_text: "Clubs",
               value_number: 7,
               value_symbol: "7",
               value_text: "Seven"
             },
             %Poker.Card{
               id: nil,
               suit_symbol: "♥️",
               suit_text: "Hearts",
               value_number: 7,
               value_symbol: "7",
               value_text: "Seven"
             },
             %Poker.Card{
               id: nil,
               suit_symbol: "♦️",
               suit_text: "Diamonds",
               value_number: 7,
               value_symbol: "7",
               value_text: "Seven"
             },
             %Poker.Card{
               id: nil,
               suit_symbol: "♠️",
               suit_text: "Spades",
               value_number: 8,
               value_symbol: "8",
               value_text: "Eight"
             },
             %Poker.Card{
               id: nil,
               suit_symbol: "♣️",
               suit_text: "Clubs",
               value_number: 8,
               value_symbol: "8",
               value_text: "Eight"
             },
             %Poker.Card{
               id: nil,
               suit_symbol: "♥️",
               suit_text: "Hearts",
               value_number: 8,
               value_symbol: "8",
               value_text: "Eight"
             },
             %Poker.Card{
               id: nil,
               suit_symbol: "♦️",
               suit_text: "Diamonds",
               value_number: 8,
               value_symbol: "8",
               value_text: "Eight"
             },
             %Poker.Card{
               id: nil,
               suit_symbol: "♠️",
               suit_text: "Spades",
               value_number: 9,
               value_symbol: "9",
               value_text: "Nine"
             },
             %Poker.Card{
               id: nil,
               suit_symbol: "♣️",
               suit_text: "Clubs",
               value_number: 9,
               value_symbol: "9",
               value_text: "Nine"
             },
             %Poker.Card{
               id: nil,
               suit_symbol: "♥️",
               suit_text: "Hearts",
               value_number: 9,
               value_symbol: "9",
               value_text: "Nine"
             },
             %Poker.Card{
               id: nil,
               suit_symbol: "♦️",
               suit_text: "Diamonds",
               value_number: 9,
               value_symbol: "9",
               value_text: "Nine"
             },
             %Poker.Card{
               id: nil,
               suit_symbol: "♠️",
               suit_text: "Spades",
               value_number: 10,
               value_symbol: "10",
               value_text: "Ten"
             },
             %Poker.Card{
               id: nil,
               suit_symbol: "♣️",
               suit_text: "Clubs",
               value_number: 10,
               value_symbol: "10",
               value_text: "Ten"
             },
             %Poker.Card{
               id: nil,
               suit_symbol: "♥️",
               suit_text: "Hearts",
               value_number: 10,
               value_symbol: "10",
               value_text: "Ten"
             },
             %Poker.Card{
               id: nil,
               suit_symbol: "♦️",
               suit_text: "Diamonds",
               value_number: 10,
               value_symbol: "10",
               value_text: "Ten"
             },
             %Poker.Card{
               id: nil,
               suit_symbol: "♠️",
               suit_text: "Spades",
               value_number: 11,
               value_symbol: "J",
               value_text: "Jack"
             },
             %Poker.Card{
               id: nil,
               suit_symbol: "♣️",
               suit_text: "Clubs",
               value_number: 11,
               value_symbol: "J",
               value_text: "Jack"
             },
             %Poker.Card{
               id: nil,
               suit_symbol: "♥️",
               suit_text: "Hearts",
               value_number: 11,
               value_symbol: "J",
               value_text: "Jack"
             },
             %Poker.Card{
               id: nil,
               suit_symbol: "♦️",
               suit_text: "Diamonds",
               value_number: 11,
               value_symbol: "J",
               value_text: "Jack"
             },
             %Poker.Card{
               id: nil,
               suit_symbol: "♠️",
               suit_text: "Spades",
               value_number: 12,
               value_symbol: "Q",
               value_text: "Queen"
             },
             %Poker.Card{
               id: nil,
               suit_symbol: "♣️",
               suit_text: "Clubs",
               value_number: 12,
               value_symbol: "Q",
               value_text: "Queen"
             },
             %Poker.Card{
               id: nil,
               suit_symbol: "♥️",
               suit_text: "Hearts",
               value_number: 12,
               value_symbol: "Q",
               value_text: "Queen"
             },
             %Poker.Card{
               id: nil,
               suit_symbol: "♦️",
               suit_text: "Diamonds",
               value_number: 12,
               value_symbol: "Q",
               value_text: "Queen"
             },
             %Poker.Card{
               id: nil,
               suit_symbol: "♠️",
               suit_text: "Spades",
               value_number: 13,
               value_symbol: "K",
               value_text: "King"
             },
             %Poker.Card{
               id: nil,
               suit_symbol: "♣️",
               suit_text: "Clubs",
               value_number: 13,
               value_symbol: "K",
               value_text: "King"
             },
             %Poker.Card{
               id: nil,
               suit_symbol: "♥️",
               suit_text: "Hearts",
               value_number: 13,
               value_symbol: "K",
               value_text: "King"
             },
             %Poker.Card{
               id: nil,
               suit_symbol: "♦️",
               suit_text: "Diamonds",
               value_number: 13,
               value_symbol: "K",
               value_text: "King"
             },
             %Poker.Card{
               id: nil,
               suit_symbol: "♠️",
               suit_text: "Spades",
               value_number: 14,
               value_symbol: "A",
               value_text: "Ace"
             },
             %Poker.Card{
               id: nil,
               suit_symbol: "♣️",
               suit_text: "Clubs",
               value_number: 14,
               value_symbol: "A",
               value_text: "Ace"
             },
             %Poker.Card{
               id: nil,
               suit_symbol: "♥️",
               suit_text: "Hearts",
               value_number: 14,
               value_symbol: "A",
               value_text: "Ace"
             },
             %Poker.Card{
               id: nil,
               suit_symbol: "♦️",
               suit_text: "Diamonds",
               value_number: 14,
               value_symbol: "A",
               value_text: "Ace"
             }
           ]
  end
end
