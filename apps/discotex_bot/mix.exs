defmodule DiscotexBot.MixProject do
  use Mix.Project

  def project do
    [
      app: :discotex_bot,
      version: "0.1.0",
      build_path: "../../_build",
      config_path: "../../config/config.exs",
      deps_path: "../../deps",
      lockfile: "../../mix.lock",
      elixir: "~> 1.8",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Configuration for the OTP application.
  #
  # Type `mix help compile.app` for more information.
  def application do
    [
      mod: {DiscotexBot.Application, []},
      extra_applications: [:logger, :runtime_tools]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:discotex, in_umbrella: true},
      {:mox, "~> 0.5", only: :test},
      {:nostrum, github: "tmecklem/nostrum", branch: "ratelimit"}
    ]
  end
end
