defmodule Poker.DeckServer do
  use GenServer

  @impl true
  def init(:ok) do
    {:ok, deck} = Poker.make_a_deck()
    {:ok, deck}
  end

  @impl true
  def handle_call(:view, _from, state) do
    {:reply, state, state}
  end

  @impl true
  def handle_call(:count, _from, state) do
    {:reply, state |> Enum.count(), state}
  end

  @impl true
  def handle_call(:draw, _from, [c1 | deck]) do
    {:reply, [c1], deck}
  end

  @impl true
  def handle_call(:burn, _from, [c1 | deck]) do
    {:reply, {:ok, c1}, deck}
  end

  @impl true
  def handle_call(:shuffle, _from, state) do
    shuffled_deck = Enum.shuffle(state)
    {:reply, shuffled_deck, shuffled_deck}
  end

  @impl true
  def handle_cast(:destroy, _state) do
    Process.exit(self(), :normal)
    {:noreply, :ok}
  end
end
