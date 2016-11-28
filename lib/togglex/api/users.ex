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

  @doc """
  Return current user with related data - clients, projects, tasks etc.
  """
  @spec me(Client.t) :: Togglex.response
  def me_with_related(client) do
    get("me", client, [{"with_related_data", "true"}])
  end

end
