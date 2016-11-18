defmodule Togglex.Api.Users do
  import Togglex
  alias Togglex.Client

  @moduledoc """
  Provides functions to work with Toggl User resources.
  """

  @doc """
  Return info about the current user - owner of access token
  """
  @spec me(Client.t) :: Togglex.response
  def me(client) do
    get("me", client, [])
  end

end
