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
    to_return(status: 200, body: "", headers: {})
    
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
