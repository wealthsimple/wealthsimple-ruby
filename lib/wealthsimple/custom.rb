module Wealthsimple
  class Date
    def self.parse(value)
      ::Date.parse(value)
    end
  end

  class DateTime
    def self.parse(value)
      ::DateTime.parse(value)
    end
  end
end
