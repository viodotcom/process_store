defmodule BoFH.ProcessStore.MixProject do
  use Mix.Project

  @version "0.1.0"
  @source_url "https://github.com/FindHotel/bofh-process-store"

  def project do
    [
      app: :bofh_process_store,
      deps: deps(),
      description: "The simple process dictionary storage wrapper.",
      dialyzer: dialyzer(),
      docs: docs(),
      elixir: "~> 1.9",
      elixirc_paths: elixirc_paths(Mix.env()),
      package: package(),
      source_url: @source_url,
      start_permanent: Mix.env() == :prod,
      version: @version
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
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
      nest_modules_by_prefix: nest_modules_by_prefix(),
      source_ref: @version
    ]
  end

  defp extras, do: ["README.md", "CHANGELOG.md"]

  defp nest_modules_by_prefix do
    []
  end

  # This makes sure your factory and any other modules in test/support are compiled
  # when in the test environment.
  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  defp package do
    %{
      files: ["lib", "mix.exs", "README.md", "CHANGELOG.md"],
      links: %{"GitHub" => @source_url},
      maintainers: [
        "Antonio Lorusso",
        "Felipe Vieira",
        "Fernando Hamasaki de Amorim"
      ],
      name: "bofh_providers"
    }
  end
end
