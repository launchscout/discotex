defmodule Discotex.Umbrella.MixProject do
  use Mix.Project

  def project do
    [
      apps_path: "apps",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  defp deps do
    [
      {:credo, "~> 1.6", only: [:dev, :test], runtime: false},

      # things to work around silliness between Discord's API and gun's http handling
      {:gun, "2.0.1", hex: :remedy_gun, override: true},
      {:cowlib, "~> 2.11.1", env: :prod, hex: "remedy_cowlib", override: true}
    ]
  end
end
