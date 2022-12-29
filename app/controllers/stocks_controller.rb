class StocksController < ApplicationController

  def search
    if params[:stock].present?
      @stock = Stock.new_lookup(params[:stock])
      # if @stock is not nil (as stipulated in Stock model's begin/rescue block)
      if @stock
        render 'users/my_portfolio'
      else
        flash[:alert] = "Please enter a valid symbol"
        redirect_to my_portfolio_path
      end
    else
      flash[:alert] = "Please enter a symbol to search"
      redirect_to my_portfolio_path
    end
  end

end