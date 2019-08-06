class QuotesController < ApplicationController
  def index
    @quote = Quote.order("RANDOM()").first
  end

  def new
    @quote = Quote.new
  end

  def create
    Quote.create(quote_params)
    if @quote.invalid?
      flas[:error] = '<strong>Could not saver</strong> the data you entered is invalid.'
    end
    redirect_to root_path
  end

  private

  def quote_params
    params.require(:quote).permit(:saying, :authour)
  end
end
