defmodule StatementAPI do
  import YamlElixir, only: [read_from_file: 2]

  def get_charges do
    read_result = read_from_file("config/charges.yml", atoms: true)

    case read_result do
      {:ok, %{charges: charges}} ->
        charges

      _ ->
        "Read result of charges.yml was in an unexpected format."
    end
  end
end
