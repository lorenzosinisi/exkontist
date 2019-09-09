defmodule Exkontist.Client do
  @api_url "https://api.kontist.com"
  def login(email, password) do
    url = @api_url <> "/api/user/auth-token"
    body = %{email: email, password: password} |> encode()
    post!(url, body)
  end

  def user(token) do
    get("/api/user", token)
  end

  def accounts(token) do
    get("/api/accounts", token)
  end

  def account_transactions(account_number, token) do
    get("/api/accounts/#{account_number}/transactions", token)
  end

  def future_transactions(account_number, token) do
    get("/api/accounts/#{account_number}/future-transactions", token)
  end

  def standing_orders(account_number, token) do
    get("/api/accounts/#{account_number}/standing_orders", token)
  end

  def wire_transfer_suggestions(account_number, token) do
    get("/api/accounts/#{account_number}/wire-transfer-suggestions", token)
  end

  def statement(year, month, token) do
    get("/api/user/statements/#{year}/#{month}", token)
  end

  defp post!(url, body, headers \\ nil) do
    headers = default_headers(headers)

    case HTTPoison.post!(url, body, headers) do
      %{status_code: 200, body: body} ->
        decode(body)

      res ->
        {:error, res}
    end
  end

  defp get(url, token) do
    url = @api_url <> url
    headers = default_headers(token)

    case HTTPoison.get!(url, headers) do
      %{status_code: 200, body: body} ->
        decode(body)

      %{status_code: 201, body: body} ->
        decode(body)

      res ->
        {:error, res}
    end
  end

  defp decode(params) do
    Poison.decode(params)
  end

  defp encode(params) do
    Poison.encode!(params)
  end

  defp default_headers(token) when is_binary(token) do
    [
      "Content-Type": "application/json",
      accept: "application/vnd.kontist.transactionlist.v2.1+json",
      Authorization: "Bearer #{token}"
    ]
  end

  defp default_headers(nil) do
    default_headers()
  end

  defp default_headers() do
    [
      "Content-Type": "application/json",
      accept: "application/vnd.kontist.transactionlist.v2.1+json"
    ]
  end
end
