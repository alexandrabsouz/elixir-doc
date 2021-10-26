defmodule FriendsApp do
  @moduledoc """
  Documentation for `FriendsApp`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> FriendsApp.hello()
      :world

  """
  def meu_ambiente do
    case Mix.env() do
      :prod -> "iniciando ambiente de Produção"
      :dev  -> "Iniciando ambiente de Desenvolvimento"
      :test -> "Iniciando ambiente de Testes"

    end
  end
end
