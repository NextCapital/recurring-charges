defmodule UnsubscribeService do
  def display_recurring_charges(statements) do
    statements
    |> Enum.reduce(%{}, &increment_charge_count/2)
    |> Enum.filter(fn {_charge_name, charge_count} -> charge_count >= 1 end)
    |> Enum.into(%{})
  end

  defp increment_charge_count(%{name: charge_name}, charges) do
    charge_count = charges[charge_name] || 0
    Map.put(charges, charge_name, charge_count + 1)
  end
end
