defmodule MyModule.Fatorial do
  def of(n), do: fatorial_of(n, 1)

  defp fatorial_of(0, acc1), do: acc
  defp fatorial_of(n, acc2) when n > 0, do: fatorial_of(n - 1, n * acc2)
end
