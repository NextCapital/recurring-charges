defmodule UnsubscribeServiceTest do
  use ExUnit.Case

  test "sums the charges that occur more than once" do
    sample_name = "Spotify"

    charges = [
      %{amount: 9.99, date: "2/1/2018", name: sample_name},
      %{amount: 9.99, date: "3/1/2018", name: sample_name}
    ]

    assert UnsubscribeService.display_recurring_charges(charges)[sample_name] == 2
  end

  test "does not include charges that only occur once" do
    sample_name = "Spotify"
    charges = [%{amount: 9.99, date: "2/1/2018", name: sample_name}]

    assert UnsubscribeService.display_recurring_charges(charges)[sample_name] == nil
  end
end
