require 'rest-client'
require 'json'

class ExchangeService

  def perform(source_currency, target_currency, amount)
    begin
      url = "https://api.cryptonator.com/api/ticker/#{source_currency}-#{target_currency}"
      puts "GET to #{url}"
      res = RestClient.get url
      puts "Response #{res}"
      value = JSON.parse(res.body)['ticker']['price'].to_f
      value * amount.to_f
    rescue RestClient::ExceptionWithResponse => e
      e.response
    end
  end

  def listCoins
    begin
      res = JSON.parse(RestClient.get('https://www.cryptonator.com/api/currencies').body)['rows']
      res.map { |rd| rd['code']}
    rescue RestClient::ExceptionWithResponse => e
      e.response
    end
  end
end
