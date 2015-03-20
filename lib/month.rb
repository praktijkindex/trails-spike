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

  def to_s
    I18n.t("date.month_names")[month]
  end

  def self.starts(from: 1, to: 12)
    (from..to).map{|m| Date.new(2015,m)}
  end
end
