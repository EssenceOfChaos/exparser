defmodule Exparser.Ingest do
    @moduledoc """
    Module for parsing input
    """
    # the number of words to take
    @max_words 10

    # the words that can be ignored
    @removed_words ["a", "an", "the", "and", "i", "of", "to", "my", "in", "me", "was", "but", "had", "you", "gutenberg", "there", "about", "again", "could", "would", "gutenbergtm"]

    @doc """
      Count the occurance of each word.
    """
    def count(path) do
      File.stream!(path)
      |> Stream.flat_map(&String.split/1)
      |> Stream.map(&String.downcase/1)
      |> Stream.map(&remove_sp_chars/1)
      |> Enum.reduce(%{}, &count_word/2)
      # |> print_most_occuring
      |> sort_and_print()

    end

    defp remove_sp_chars(string) do
      string
      |> String.normalize(:nfd)
      |> String.replace(~r/[^A-z\s]/u, "")
    end

    defp count_word(word, map) do
      Map.update(map, word, 1, &(&1 + 1))
    end

    # defp print_most_occuring(results) do
    #   Enum.max_by(results, fn {_word, freq} -> freq end)
    # end

    @doc """
    Takes map of words and frequencies, drops ignored words, returns sorted by frequency
    """
    def sort_and_print(map) do
      map
      |> Map.drop(@removed_words)
      |> Enum.filter(fn {word, _freq }-> String.length(word) >= 6 end)
      |> Enum.sort_by(fn {_word, freq} -> freq end, &>=/2)
      |> Enum.take(@max_words)
    end
  end


#   IO.puts("The 10 most frequently used words in Frankenstein: ")
#   IO.inspect(Exparser.Ingest.count("assets/data/frankenstein.txt"))
#   IO.puts("The 10 most frequently used words in Huckleberry Finn: ")
#   IO.inspect(Exparser.Ingest.count("assets/data/huckleberry_finn.txt"))

# Exparser.Ingest.count("assets/data/dracula.txt")
# Exparser.Ingest.count("assets/data/sherlock-holmes.txt")
# Exparser.Ingest.count("assets/data/tale-of-two-cities.txt")
# Exparser.Ingest.count("assets/data/alices-adventures-wonderland.txt")

