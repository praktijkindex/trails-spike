class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :per_week, :employees

  private

  def tracked_hours
    if params[:time_travel_to]
      WeekWork.where("week_works.updated_at <= ?", params[:time_travel_to])
    else
      WeekWork.all
    end
  end

  def employees
    tracked_hours.joins(:employee).pluck(:name).uniq.sort_by(&:capitalize)
  end

  def per_week
    unless @per_week
      @per_week = {}
      tracked_hours.each do |week_work|
        week = "2015 W#{week_work.week_number}"
        @per_week[week] ||= {}
        @per_week[week].merge! "week" => week, week_work.employee.name => week_work.hours
      end
    end
    @per_week
  end
end
