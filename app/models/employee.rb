class Employee < ActiveRecord::Base
  class << self
    def artm
      find_or_create_by!(name: "artm")
    end

    def michael
      find_or_create_by!(name: "Michael")
    end

    def leon
      find_or_create_by!(name: "Leon")
    end
  end
end
