defmodule FriendsApp.CLI.MenuChoice do
  alias Mix.Shell.IO, as: Shell

  def start do
    Shell.cmd("clear")
    Shell.info("Escolha uma opcao: ")

    menu_itens = FriendsApp.CLI.MenuItens.all()

    menu_itens
    |> Enum.map(&(&1.label))
    |> display_options
  end

  defp display_options(options) do
    options
    |> Enum.with_index(1)
    |> Enum.each(fn {option, index} ->
      Shell.info("#{index} - #{option}")

    end)
  end
end
