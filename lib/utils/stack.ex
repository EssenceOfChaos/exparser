defmodule Exparser.Utils.Stack do
   @moduledoc """
   An implementation of a Stack
   """
   def start_link do
    Agent.start_link fn -> [] end
  end

  def size(pid) do
    Agent.get pid, fn stack -> Enum.count(stack) end
  end

  def push(pid, item) do
    Agent.update pid, fn stack -> [item | stack] end
  end

  def pop(pid) do
    Agent.get_and_update pid, fn [item | last] ->
      {item, last}
    end
  end

  def empty?(pid) do
    case Agent.get pid, fn stack -> Enum.count(stack) end do
        0 -> true
        _ -> false
    end
  end

end
