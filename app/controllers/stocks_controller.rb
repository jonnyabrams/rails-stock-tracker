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
        respond_to do |format|
          flash[:alert] = "Please enter a valid symbol"
          format.js { render partial: 'users/partials/result' }
        end
      end
    else
      respond_to do |format|
        flash[:alert] = "Please enter a symbol to search"
        format.js { render partial: 'users/partials/result' }
      end
    end
  end

end