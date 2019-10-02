defmodule DiscotexBot.Responders.NullResponder do
  @moduledoc """
  catchall responder (should go last in responders list)
  """

  def responds_to?(_), do: true
  def handle_message(_), do: :no_action
end
