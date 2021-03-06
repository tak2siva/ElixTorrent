defmodule ElixTorrent.Mixfile do
  use Mix.Project

  def project do
    [app: :elix_torrent,
     version: "0.0.1",
     elixir: "~> 1.0",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps]
  end

  # Configuration for the OTP application
  #
  # Type `mix help compile.app` for more information
  def application do
    [mod: {ElixTorrent, []}, applications: [:logger, :elixir_bencode, :httpotion]]
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type `mix help deps` for more examples and options
  defp deps do
    [
    {:elixir_bencode, "~> 1.0.0"},
    {:ibrowse, github: "cmullaparthi/ibrowse", tag: "v4.1.2"},
    {:httpotion, "~> 2.1.0"}
    ]
  end
end
