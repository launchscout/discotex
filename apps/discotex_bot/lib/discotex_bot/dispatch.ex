defmodule DiscotexBot.Dispatch do
  @moduledoc """
  Handles events and (eventually) dispatches to other handlers when Discotext becomes sophisticated and stuff
  """

  alias DiscotexBot.Responders.{NullResponder, PollResponder, SimpleResponder}
  # remove Discord Struct references
  alias Nostrum.Struct.{Message, User}

  @responders [
    PollResponder,
    SimpleResponder,
    NullResponder
  ]

  # ignore own messages
  def handle_message_create(%Message{author: %User{id: user_id}}, _me = %User{id: user_id}),
    do: :no_action

  def handle_message_create(message = %Message{}, _me) do
    responder =
      Enum.find(@responders, :no_match, fn candidate ->
        candidate.responds_to?(message)
      end)

    responder.handle_message(message)
  end
end
