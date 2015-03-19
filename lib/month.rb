class Month
  attr_reader :year, :month

  def initialize year, month
    @year, @month = year, month
  end

  def weeks
    Week.of(first_day)..Week.of(last_day)
  end

  def first_day
    Date.new(year, month)
  end

  def last_day
    Date.new(year, month, -1)
  end
end
