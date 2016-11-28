defmodule Togglex.Api.UsersTest do
  use ExUnit.Case
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney

  import Togglex.Api.Users

  doctest Togglex.Api.Users

  @client Togglex.Client.new(%{access_token: "PASTE_TOGGL_TOKEN_HERE"}, :api)

  setup_all do
    HTTPoison.start
  end

  test "me/1" do
    use_cassette "users#me" do
      response = me(@client)
      %{data: %{timezone: timezone}} = response

      assert timezone == "Europe/Belgrade"
    end
  end

  test "me_with_related/1" do
    use_cassette "users#me_with_related" do
      response = me_with_related(@client)

      assert Map.has_key?(response.data, :workspaces)
      assert Map.has_key?(response.data, :projects)
      assert Map.has_key?(response.data, :clients)
    end
  end
end
