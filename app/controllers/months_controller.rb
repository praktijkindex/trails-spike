class MonthsController < ApplicationController
  def new
    @month = 0
  end

  def create
    month_to_create = params[:month][:id].to_i
    if month_to_create <= 12
      redirect_to action: "show", id: month_to_create
    else
      redirect_to controller: "years", action: "show"
    end
  end

  def show
    @month = params[:id].to_i
  end
end
