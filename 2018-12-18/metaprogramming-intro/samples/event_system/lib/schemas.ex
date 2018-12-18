defmodule EventSystem.Schemas do
  @schemas_directory "lib/schemas"

  defmacro __using__(_args) do
    quote do: import(EventSystem.Schemas)
  end

  defmacro define_schema(schema_name) do
    schema = load_schema(schema_name)

    quote do
      def fetch_schema(unquote(schema_name)) do
        unquote(schema)
      end
    end
  end

  def load_schema(schema_name) do
    file_name = Enum.join([Atom.to_string(schema_name), "json"], ".")
    file_path = Path.join(@schemas_directory, file_name)

    file_path
    |> File.read!()
    |> Jason.decode!()
    |> ExJsonSchema.Schema.resolve()
    |> Macro.escape()
  end
end
