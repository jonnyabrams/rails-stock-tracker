class StocksController < ApplicationController

  def search
    if params[:stock].present?
      @stock = Stock.new_lookup(params[:stock])
      # if @stock is not nil (as stipulated in Stock model's begin/rescue block)
      if @stock
        respond_to do |format|
          format.js { render partial: 'users/partials/result' }
        end
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