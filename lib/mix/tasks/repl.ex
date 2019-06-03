defmodule Mix.Tasks.Repl do
    @moduledoc """
    The Mix task for starting a REPL session
    """
    use Mix.Task
    alias Exparser.Repl

    def run(_) do
      user = "whoami" |> System.cmd([]) |> elem(0) |> String.trim_trailing()

      IO.puts("Hello, #{user}! Welcome to Exparser.")
      IO.puts("Let's get to work, shall we?")
      Repl.loop()
    end
  end
