class SimulateTimeTracking
  def initialize month
    @month = month
  end

  def call
    simulate_artm
    simulate_michael
    simulate_leon
  end

  private

  attr_reader :month

  def simulate_artm
    last_friday_of_the_year do
      (1..53).each do |work_week|
        TrackTime.new(Employee.artm, work_week, 38).call
      end
    end
  end

  def simulate_leon
    every_friday_of_the_month do |friday|
      TrackTime.new(Employee.leon, Week.of(friday), Random.rand(16..24)).call
    end
  end

  def simulate_michael
    every_friday_of_the_month do |friday|
      this_week = Week.of(friday)
      TrackTime.new(Employee.michael, this_week - 1, Random.rand(31..33)).call if this_week > 0
      TrackTime.new(Employee.michael, this_week, Random.rand(44..52)).call
    end
  end

  def last_friday_of_the_year
    return unless month == 12
    friday = DateTime.commercial(2015, -1, 5)
    Timecop.freeze(friday) do
      yield friday
    end
  end

  def every_friday_of_the_month
    first = DateTime.new(2015,month,1)
    friday = first + (5 - first.wday) % 7
    while friday.month == month do
      Timecop.freeze(friday) do
        yield friday
      end
      friday += 7
    end
  end
end
