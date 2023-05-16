class Track

  @@regular_bike = []
  @@regular_car = []
  @@regular_suv = []
  @@vip_car = []
  @@vip_suv = []
  @@regular_rev = 0
  @@vip_rev = 0

  def initialize
  end

  def add_to_track(type,number)
    if type == "bike" 
      if @@regular_bike.length < 4
        @@regular_bike << number
        @@regular_rev = @@regular_rev + 60
        return "success"
      else
        return "race track is full."
      end
    elsif type == "car"
      if @@regular_car.length < 2
        @@regular_car << number
        @@regular_rev = @@regular_rev + 120
        return "success"
      elsif @@vip_car.length < 1
        @@vip_car << number
        @@vip_rev = @@vip_rev + 250
        return "success"
      else
        return "race track is full."
      end
    elsif type == "suv"
      if @@regular_suv.length < 2
        @@regular_suv << number
        @@regular_rev = @@regular_rev + 200
        return "success"
      elsif @vip_suv.length < 1
        @@vip_suv << number
        @@vip_rev = @@vip_rev + 250
        return "success"
      else
        return "race track is full."
      end
    end
  end

  def get_extra_time_rev(number,extra_time)
    if @@regular_bike.include?(number)
      @@regular_rev = @@regular_rev + 50*((extra_time*(extra_time + 1))/2)
      return "success"
    elsif @@regular_car.include?(number)
      @@regular_rev = @@regular_rev + 150*((extra_time*(extra_time + 1))/2)
      return "success"
    elsif @@regular_suv.include?(number)
      @@regular_rev = @@regular_rev + 100*((extra_time*(extra_time + 1))/2)
      return "success"
    elsif @@vip_car.include?(number)
      @@vip_rev = @@vip_rev + 150*((extra_time*(extra_time + 1))/2)
      return "success"
    elsif @@vip_suv.include?(number)
      @@vip_rev = @@vip_rev + 100*((extra_time*(extra_time + 1))/2)
      return "success"
    end
  end

  def get_revenue
    return [@@regular_rev,@@vip_rev]
  end

  def find_vehicle
  end
end
