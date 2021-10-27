defmodule FriendsApp.DB.CSV do
  alias Mix.Shell.IO, as: Shell
  alias FriendsApp.CLI.Menu
  alias FriendsApp.CLI.Friend
  alias NimbleCSV.RFC4180, as: CSVparser
  alias FriendsApp.CLI.Menu.Choice

  def perform(chosen_menu_item) do
    case chosen_menu_item do
      %Menu{id: :create, label: _} -> create()
      %Menu{id: :read, label: _}   -> read()
      %Menu{id: :update, label: _} -> Shell.info(">>>>> UPDATE <<<<<")
      %Menu{id: :delete, label: _} -> Shell.info(">>>>> DELETE <<<<<")
    end
    Choice.start()
  end

  defp read do
    File.read!("#{File.cwd!}/friends.csv")
    |> CSVparser.parse_string(headers: false)
    |> Enum.map(fn [email, name, phone] ->
      %Friend{name: name, email: email, phone: phone}
    end)
    |> Scribe.console(data: [{"Nome", :name}, {"Email", :email}, {"Telefone", :phone}])
  end

  defp create do
    collect_data()
    |> transform_on_wrapped_list()
    |> prepare_list_save_csv()
    |> save_csv_file([:append])
  end

  defp collect_data do
    Shell.cmd("clear")

    %Friend{
      name: prompt_message("Digite o nome: "),
      email: prompt_message("Digite o email: "),
      phone: prompt_message("Digite o telefone: ")
    }
  end

  defp prompt_message(message) do
    Shell.prompt(message)
    |> String.trim
  end

  defp transform_on_wrapped_list(list) do
    list
    |> Map.from_struct()
    |> Map.values()
    |> wrap_in_list
  end

  defp wrap_in_list(list) do
    [list]
  end

  defp prepare_list_save_csv(list) do
    list
    |> CSVparser.dump_to_iodata
  end

  defp save_csv_file(data, mode \\ []) do
    File.write!("#{File.cwd!}/friends.csv", data, mode)
  end
end
