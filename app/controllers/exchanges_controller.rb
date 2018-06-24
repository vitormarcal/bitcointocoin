class ExchangesController < ApplicationController
  def index
  end

  def convert
    value = ExchangeService.new.perform(params[:source_currency], params[:target_currency], params[:amount])
    render json: {"value": value}
  end
end
