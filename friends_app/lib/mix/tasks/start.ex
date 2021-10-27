defmodule Mix.Tasks.Start do
  use Mix.Task

  @shortdoc "Start [FriendsApp]"
  def run(_), do: FriendsApp.CLI.Main.start_app
end
