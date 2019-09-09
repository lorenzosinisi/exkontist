defmodule Exkontist.MixProject do
  use Mix.Project
  @version "0.1.1"
  def project do
    [
      app: :exkontist,
      version: @version,
      elixir: "~> 1.9",
      docs: [extras: ["README.md"], main: "readme", source_ref: "v#{@version}"],
      source_url: "https://github.com/lorenzosinisi/exkontist",
      description: description(),
      package: package(),
      deps: deps()
    ]
  end

  def application do
    []
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:httpoison, "~> 1.5"},
      {:poison, "~> 3.1"},
      {:ex_doc, "~> 0.16", only: :dev},
      {:earmark, "~> 1.2", only: :dev}
    ]
  end

  defp description do
    """
    (not official) Konstist client in Elixir
    """
  end

  defp package do
    [
      files: ["lib", "mix.exs", "README.md", "LICENSE"],
      maintainers: ["Lorenzo Sinisi"],
      licenses: ["Apache 2.0"],
      links: %{"GitHub" => "https://github.com/lorenzosinisi/exkontist"}
    ]
  end
end
