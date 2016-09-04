defmodule Pinger do

  def ping url do
    start = :os.system_time(:milli_seconds)
    response = HTTPoison.head url
    case response do
      { :ok, _ } ->
        finish = :os.system_time(:milli_seconds)
        {:ok, ms: finish - start}

      { :error, error } ->
        {:error, reason: error[:reason] }

      _ ->
        { :error, reason: :unknown }
    end
  end
end
