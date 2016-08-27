defmodule DiscordExExample.Mixfile do
  use Mix.Project

  def project do
    [app: :discord_ex_example,
     version: "0.1.0",
     elixir: "~> 1.3",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps()]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [applications: [:logger, :discord_ex],
     mod: {DiscordExExample, []}]
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    [{:discord_ex, git: "https://github.com/rmcafee/discord_ex.git"}]
    # alternative:
    #[{:discord_ex, "~> 1.1.4"}]
  end
end
