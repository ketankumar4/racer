require 'time'
require 'active_support/time'
class Vehicle
  MAX_TIME = Time.parse("17:00")
  MIN_TIME = Time.parse("13:00")

  @@hash = {}
  def initialize
  end

  def set_hash(number)
    @@hash[number] = [@entry_time,@exit_time]
  end

  def get_extra_time(number,time)
    if @@hash[number].present?
      if ((Time.parse(time) + @@hash[number][1]) >  Time.parse("20:00"))
        return false
      else
        extra_time = Time.parse(time) - @@hash[number][1]
        if (extra_time/60).to_i <= 15
          return 0
        else
          return ((extra_time/3600).to_i + 1)
        end
      end
    end
  end

  def check_time(type, entry_time, number)
    @type = type
    @entry_time = Time.parse(entry_time)
    @exit_time = Time.parse(entry_time) + 3.hours
    @number = number
    if @entry_time >=  MIN_TIME && @entry_time <= MAX_TIME
      set_hash(number)
    else
      return false
    end
  end
end
