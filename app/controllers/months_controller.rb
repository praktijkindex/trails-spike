class MonthsController < ApplicationController
  def new
    WeekWork.paper_trail_off!
    WeekWork.delete_all
    PaperTrail::Version.delete_all
    WeekWork.paper_trail_on!
  end

  def create
    if this_year?
      SimulateTimeTracking.new(new_month_number).call
      redirect_to action: "show", id: new_month_number
    else
      redirect_to controller: "years", action: "show"
    end
  end

  private

  def new_month_number
    @new_month_number ||= params[:month][:id].to_i
  end

  def tracked_hours
    WeekWork.where(week_number: view_context.month.weeks)
  end

  def this_year?
   new_month_number <= 12
  end
end
