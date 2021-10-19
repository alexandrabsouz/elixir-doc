total = 856

defmodule Mutante do
  def mutar(valor) do
    valor = 1
    IO.puts "interno - #{valor}" # Aqui será exibido 1 ou 856? R: 1
    valor
  end
end


Mutante.mutar(total)
IO.puts "Externo - #{total}" # Aqui será exibido 1 ou 856? R: 865

total = Mutante.mutar(total)
IO.puts "Externo - #{total}" # Aqui será exibido 1 ou 856? R: 1
