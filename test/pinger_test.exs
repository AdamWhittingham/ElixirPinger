defmodule PingerTest do
  use ExUnit.Case
  import Mock
  doctest Pinger

  describe "ping" do
    test "returns the status and time taken" do
      mock = fn("http://www.devmountain.co.uk") ->
        :timer.sleep 2
        {:ok, [] }
      end

      with_mock HTTPoison, head: mock do
        assert { :ok, ms: time_taken } = Pinger.ping("http://www.devmountain.co.uk")
        assert time_taken >= 2
      end
    end
  end
end
