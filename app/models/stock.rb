class Stock < ApplicationRecord
  def self.new_lookup(ticker_symbol)
    client = IEX::Api::Client.new(
      publishable_token: Rails.application.credentials.iex_client[:publishable_key],
      secret_token: 'secret_token',
      endpoint: 'https://cloud.iexapis.com/v1'
    )
    client.quote(ticker_symbol).latest_price
  end
end
