defmodule DiscotexWeb.MixProject do
  use Mix.Project

  def project do
    [
      app: :discotex_web,
      version: "0.1.0",
      build_path: "../../_build",
      config_path: "../../config/config.exs",
      deps_path: "../../deps",
      lockfile: "../../mix.lock",
      elixir: "~> 1.8",
      elixirc_paths: elixirc_paths(Mix.env()),
      compilers: [:phoenix, :gettext] ++ Mix.compilers(),
      start_permanent: Mix.env() == :prod,
      aliases: aliases(),
      deps: deps()
    ]
  end

  # Configuration for the OTP application.
  #
  # Type `mix help compile.app` for more information.
  def application do
    [
      mod: {DiscotexWeb.Application, []},
      extra_applications: [:logger, :runtime_tools]
    ]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "test/support", "test/discotex_web/features/pages"]
  defp elixirc_paths(_), do: ["lib"]

  # Specifies your project dependencies.
  #
  # Type `mix help deps` for examples and options.
  defp deps do
    [
      {:bypass, "~> 1.0", only: :test},
      {:credo, "~> 1.6", only: [:dev, :test], runtime: false},
      {:discotex, in_umbrella: true},
      {:ecto_sql, "~> 3.8"},
      {:ex_machina, "~> 2.7", only: [:dev, :test]},
      {:gettext, "~> 0.19"},
      {:jason, "~> 1.3"},
      {:oauth2, "~> 2.0"},
      {:phoenix, "~> 1.6"},
      {:phoenix_ecto, "~> 4.4"},
      {:phoenix_html, "~> 3.2"},
      {:phoenix_live_dashboard, "~> 0.6"},
      {:phoenix_live_reload, "~> 1.3", only: :dev},
      {:phoenix_live_view, "~> 0.17"},
      {:phoenix_pubsub, "~> 2.0"},
      {:plug_cowboy, "~> 2.5"},
      {:postgrex, "~> 0.16"},
      {:swoosh, "~> 1.3"},
      {:wallaby, "~> 0.29.0", runtime: false, only: :test},
      {:cowlib, "~> 2.11.1", env: :prod, hex: "remedy_cowlib", override: true}
    ]
  end

  # Aliases are shortcuts or tasks specific to the current project.
  # For example, we extend the test task to create and migrate the database.
  #
  # See the documentation for `Mix` for more info on aliases.
  defp aliases do
    [test: ["ecto.create --quiet", "ecto.migrate", "test"]]
  end
end
