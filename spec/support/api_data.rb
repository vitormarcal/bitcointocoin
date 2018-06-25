RSpec.configure do |config|
  config.before(:each) do
    
    stub_request(:get, "https://www.cryptonator.com/api/currencies").
    with(
      headers: {
  	  'Accept'=>'*/*',
  	  'Accept-Encoding'=>'gzip, deflate',
  	  'Host'=>'www.cryptonator.com',
  	  'User-Agent'=>'rest-client/2.0.2 (linux-gnu x86_64) ruby/2.5.1p57'
      }).
    to_return(status: 200, body: '
    {
      "rows": [
              {
                "code": "BRL",
                "name": "Brazilian Real",
                "statuses": [
                    "secondary"
                ]
                },
              {
                "code": "USD",
                "name": "US Dollar",
                "statuses": [
                "primary",
                "secondary"
              ]
             }
      ]
    }', headers: {})
    
    stub_request(:get, "https://api.cryptonator.com/api/ticker/USD-BRL").
    with(
      headers: {
  	  'Accept'=>'*/*',
  	  'Accept-Encoding'=>'gzip, deflate',
  	  'Host'=>'api.cryptonator.com',
  	  'User-Agent'=>'rest-client/2.0.2 (linux-gnu x86_64) ruby/2.5.1p57'
      }).
    to_return(status: 200, body: "", headers: '{
        {
          "ticker": {
                "base": "BTC",
                "target": "USD",
                "price": "6305.43971026",
                "volume": "80842.97426477",
                "change": "134.62440295"
          },
          "timestamp": 1529938861,
          "success": true,
          "error": ""
          }
    }')
    
    stub_request(:get, /currencydatafeed.com/ )
        .with(headers: {
            'Accept'=>'*/*'
        }).to_return(status: 200, body: '
      {
        "status": true,
        "currency": [
            {
                "currency": "USD/BRL",
                "value": "3.41325",
                "date": "2018-04-20 17:22:59",
                "type": "original"
            }
        ]
      }', headers: {})
  end
end
