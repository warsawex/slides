defmodule Conditional do
  defmacro unless(condition, do: expr) do
    quote do
      if(!unquote(condition), do: unquote(expr))
    end
  end
end
