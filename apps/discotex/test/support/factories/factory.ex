defmodule Discotex.Factory do
  @moduledoc false
  use ExMachina.Ecto, repo: Discotex.Repo

  use Discotex.UserFactory
end
