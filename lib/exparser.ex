defmodule Exparser do
  @moduledoc """
  Documentation for Exparser.
  """

    defdelegate parse(file), to: Exparser.Ingest, as: :count

    def lint_file(file) do
        with true <- File.exists?(file),
             {:ok, contents} <- File.read(file) do
            lint(contents)
        end
     end


    ## Private functions ##
    def lint(file_contents) do
        IO.inspect(file_contents)
    end
end

# Exparser.parse("assets/data/frankenstein.txt")
# Exparser.parse("assets/data/huckleberry_finn.txt")
