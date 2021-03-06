defmodule Molasses.Mixfile do
  use Mix.Project

  def project do
    [app: :molasses,
     version: "0.2.2",
     elixir: "~> 1.3",
     description: description,
     package: package,
     test_coverage: [tool: ExCoveralls],
     preferred_cli_env: ["coveralls": :test, "coveralls.detail": :test, "coveralls.post": :test, "coveralls.html": :test],
     deps: deps()]
  end

  def application do
    [applications: application_env(Mix.env)]
  end


  def application_env(:test) do
    [:ecto, :postgrex] ++ application_env(:prod)
  end

  def application_env(_) do
     [:logger]
  end

  defp package do
    [files: ["lib", "mix.exs", "README.md", "LICENSE"],
      maintainers: ["James Hrisho"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/securingsincity/molasses"}]
  end

  defp description do
    """
    A feature toggle library using redis. It allows to roll out to users based on a percentage of users or alternatively to a set of users or user ids
    """
  end

  defp deps do
    [
      {:ecto, "~> 2.1.1", optional: true},
      {:exredis, ">= 0.2.4", optional: true},
      {:postgrex, ">= 0.0.0", optional: true},
      {:excoveralls, "~> 0.5", only: :test},
      {:ex_doc, ">= 0.0.0", only: :dev},
      {:credo, ">= 0.0.0", only: :dev},
      {:mix_test_watch, "~> 0.2", only: :dev}
    ]
  end
end
