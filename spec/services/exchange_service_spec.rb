require 'spec_helper'
require 'json'
require './app/services/exchange_service'

describe 'Currency' do
  it 'exchange' do
    amount = rand(0..9999)
    res = ExchangeService.new.perform("USD", "BRL", amount)
    expect(res.is_a? Numeric).to eql(true)
    expect(res != 0 || amount == 0).to eql(true)
  end
end