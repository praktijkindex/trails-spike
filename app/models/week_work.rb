class WeekWork < ActiveRecord::Base
  belongs_to :employee
  has_paper_trail
end
