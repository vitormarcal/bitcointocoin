require 'rest-client'
require 'json'

module ExchangesHelper

  def currency_list
    begin
      res = JSON.parse(RestClient.get('https://www.cryptonator.com/api/currencies').body)['rows']
      res.map { |x| x['code']}
    rescue RestClient::ExceptionWithResponse => e
      e.response
    end
  end
end