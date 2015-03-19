module Week
  def self.of date
    date.strftime("%W").to_i
  end
end
