class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :per_week, :employees, :time_travel_to

  private

  def tracked_hours
    all = WeekWork.all
    all = all.map{|ww| ww.version_at(time_travel_to)}.compact if time_travel_to
    all
  end

  def employees
    names = tracked_hours.map{|ww| ww.employee.name}.presence || Employee.pluck(:name)
    names.uniq.sort_by(&:capitalize)
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

  def time_travel_to
    params[:time_travel_to]
  end
end
