defmodule Examples do

  #Basic types


  # protocols
  defprotocol JSON do
    def encode(item)
  end

  defimpl JSON, for: List do
    def encode(item) do
      item
    end
  end
  # used like this: JSON.encode(item)

  #Agents

  # Tasks


end
