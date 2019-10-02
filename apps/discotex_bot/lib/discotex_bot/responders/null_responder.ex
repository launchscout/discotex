defmodule DiscotexBot.Responders.NullResponder do
  def responds_to?(_), do: true
  def handle_message(_), do: :no_action
end
