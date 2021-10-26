defmodule FriendsApp.CLI.Main do
  alias Mix.Shell.IO as Shell

  def start_app do
    Shell.cmd("Clear")
    welcome_message
    Shell.prompt("Pressione ENTER para iniciar...")
  end

  def welcome_message do
    Shell.info("============ Friends App ============")
    Shell.info(" Seja bem vindo a sua agenda pessoal!")
    Shell.info("=====================================")
  end
end
