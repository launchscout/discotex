defmodule Discotex.AccountTest do
  use Discotex.DataCase

  alias Discotex.Account

  describe "invite_discord_user/1" do
    test "it adds a user and generates an invitation message" do
      Account.subscribe()
      assert {:ok, _} = Account.invite_discord_user(12345, "test@test.com")

      updated_user = Account.get_user_by_email("test@test.com")
      expected_invitation_code = updated_user.invitation_code

      assert_receive(
        {:discord_user_added, %{discord_id: 12345, invitation_code: ^expected_invitation_code}},
        2_000
      )
    end
  end
end
