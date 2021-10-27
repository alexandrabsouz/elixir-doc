defmodule FriendsApp.CLI.Menu.Itens do
  alias FriendsApp.CLI.Menu

  def all, do: [
    %Menu{label: "Cadastra os amigos", id: :create},
    %Menu{label: "Listar os amigos", id: :read},
    %Menu{label: "Atualiza um amigo", id: :update},
    %Menu{label: "Exclui um amigo", id: :delete}
  ]
end
