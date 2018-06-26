require 'rest-client'
require 'json'

class ExchangeService

  def perform(source_currency, target_currency, amount)
    begin
      url = "https://min-api.cryptocompare.com/data/price?fsym=#{source_currency}&tsyms=#{target_currency}"
      res = RestClient.get url
      JSON.parse(res.body)[target_currency].to_f * amount.to_f
    rescue RestClient::ExceptionWithResponse => e
      e.response
    end
  end
end
