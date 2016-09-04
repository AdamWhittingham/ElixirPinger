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

    test "returns {:error, reason: :timeout} when response timed out" do
      mock = fn("http://www.devmountain.co.uk") ->
        {:error, %{id: nil, reason: :timeout} }
      end

      with_mock HTTPoison, head: mock do
        assert { :error, reason: :timeout } = Pinger.ping("http://www.devmountain.co.uk")
      end
    end

    test "returns {:error, reason: :unknown} when response makes is unexpected" do
      mock = fn("http://www.devmountain.co.uk") ->
        {:unexpected_response, :something_odd}
      end

      with_mock HTTPoison, head: mock do
        assert { :error, reason: :unknown } = Pinger.ping("http://www.devmountain.co.uk")
      end
    end

  end
end
