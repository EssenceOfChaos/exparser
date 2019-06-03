defmodule Exparser.Repl do
   @moduledoc """
   The Repl module used for the `mix repl` task.
   """

   @prompt ">> "

   def loop() do
        IO.gets(@prompt)
   end
end
