defmodule Math do
  defmacro increment(i) do
    quote do
      a = 0
      unquote(i) + 1
    end
  end
end

defmodule Report do
  require Math

  def run do
    a = 4
    b = 6

    a = Math.increment(a)
    b = Math.increment(b)

    IO.puts("a is now #{a}, b is now #{b}")
  end
end
