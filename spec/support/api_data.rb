RSpec.configure do |config|
  config.before(:each) do
    
    stub_request(:get, 'https://www.cryptocompare.com/api/data/coinlist/').
    with(
      headers: {
          'Accept'=>'*/*',
          'Accept-Encoding'=>'gzip, deflate',
          'Host'=>'www.cryptocompare.com',
          'User-Agent'=>'rest-client/2.0.2 (linux-gnu x86_64) ruby/2.5.1p57'
      }).
    to_return(status: 200, body: '
    {
      "Data": {
             "BTC": {
                "Symbol": "BTC"
              },
             "USD": {
                "Symbol": "USD"
             }
      }

    }', headers: {})

    stub_request(:get, "https://min-api.cryptocompare.com/data/price?fsym=USD&tsyms=BRL").
    with(
      headers: {
  	  'Accept'=>'*/*',
  	  'Accept-Encoding'=>'gzip, deflate',
  	  'Host'=>'min-api.cryptocompare.com',
  	  'User-Agent'=>'rest-client/2.0.2 (linux-gnu x86_64) ruby/2.5.1p57'
      }).
    to_return(status: 200, body: '{
        "BRL": 3.91
      }
    ', headers: {})
    
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
