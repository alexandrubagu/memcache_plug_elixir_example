defmodule PlugMemcacheExample.MixProject do
  use Mix.Project

  def project do
    [
      app: :plug_memcache_example,
      version: "0.1.0",
      elixir: "~> 1.6",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger, :memcachex, :cowboy, :plug],
      mod: {PlugMemcacheExample.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:cowboy, "~> 1.0"},
      {:plug, "~> 1.0"},
      {:memcachex, "~> 0.4"},
      {:jason, "~> 1.1"}
    ]
  end
end
