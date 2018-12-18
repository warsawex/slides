defmodule EventSystem do
  @moduledoc """
  Sends events and validates payloads.
  """

  use EventSystem.Schemas

  define_schema(:id)

  @spec send_event(String.t(), Map.t()) :: no_return
  def send_event(name, _payload) do
    schema = fetch_schema(name)

    # Remaining sending logic

    schema
  end
end
