defmodule ScosNoaaAdapter.MixProject do
  use Mix.Project

  def project do
    [
      app: :scos_noaa_adapter,
      version: "0.1.0",
      elixir: "~> 1.8",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger, :cowboy, :plug],
      mod: {ScosNoaaAdapter.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:sweet_xml, "~> 0.6.6"},
      {:cowboy, "~> 1.0.0"},
      {:plug, "~> 1.5"},
      {:jason, "~> 1.1"},
      {:tesla, "~> 1.2.1"},
      {:plug_cowboy, "~> 1.0"}
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
    ]
  end
end
