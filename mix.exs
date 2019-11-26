defmodule ProcessStore.MixProject do
  use Mix.Project

  @version "0.1.0"
  @source_url "https://github.com/FindHotel/process_store"

  def project do
    [
      app: :process_store,
      deps: deps(),
      description: "A library which allows to store temporary data in the process dictionary.",
      dialyzer: dialyzer(),
      docs: docs(),
      elixir: "~> 1.9",
      package: package(),
      source_url: @source_url,
      start_permanent: Mix.env() == :prod,
      version: @version
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [
      {:credo, "~> 1.1", only: [:dev, :test], runtime: false},
      {:dialyxir, "~> 1.0.0-rc.7", only: [:dev], runtime: false},
      {:ex_doc, "~> 0.21", only: :dev, runtime: false}
    ]
  end

  defp dialyzer do
    [
      plt_file: {:no_warn, "priv/plts/dialyzer.plt"}
    ]
  end

  defp docs do
    [
      extras: extras(),
      main: "readme",
      source_ref: @version
    ]
  end

  defp extras, do: ["README.md", "CHANGELOG.md"]

  defp package do
    %{
      files: ["lib", "mix.exs", "README.md", "CHANGELOG.md"],
      licenses: ["Apache 2"],
      links: %{"GitHub" => @source_url},
      maintainers: [
        "Antonio Lorusso",
        "Felipe Vieira",
        "Fernando Hamasaki de Amorim"
      ],
      name: "process_store"
    }
  end
end
