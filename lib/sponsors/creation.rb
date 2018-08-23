module Sponsors
  #
  class Creation
    require 'ffaker'

    def new_password
      "#{FFaker::Color.name}#{Array.new(3) { rand(10) }.join}"
    end
  end
end
