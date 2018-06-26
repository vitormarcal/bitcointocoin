require 'rest-client'
require 'json'

module ExchangesHelper

  def currency_list
    begin
      res = JSON.parse(RestClient.get('https://www.cryptocompare.com/api/data/coinlist/').body)['Data']
      puts res
      cryptos = res.map { |x, y| y['Symbol']}
      cryptos.concat currency_fiat_list
    rescue RestClient::ExceptionWithResponse => e
      e.response
    end
  end


  def currency_fiat_list
      [
          'AUD', 'BGN', 'BRL', 'CAD', 'CHF', 'CNY', 'CZK', 'DKK', 'EUR', 'GBP',
          'HKD', 'HRK', 'HUF', 'IDR', 'ILS', 'INR', 'JPY', 'KRW', 'MXN',
          'MYR', 'NOK', 'NZD', 'PHP', 'PLN', 'RON', 'RUB', 'SEK', 'SGD',
          'THB', 'TRY', 'USD', 'ZAR'
      ]
  end
end