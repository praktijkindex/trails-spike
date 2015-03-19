class TrackTime
  def initialize employee, week_number, hours
    @employee = employee
    @week_number = week_number
    @hours = hours
  end

  def call
    week_work = WeekWork.find_or_initialize_by(employee: employee, week_number: week_number)
    week_work.hours = hours
    week_work.save!
  end

  private

  attr_reader :employee, :week_number, :hours
end
