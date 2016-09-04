defmodule Pinger do
    
  def ping url do
    start = :os.system_time(:milli_seconds)
    HTTPoison.head url
    finish = :os.system_time(:milli_seconds)
    {:ok, ms: finish - start}
  end
end
