require './vehicle.rb'
require './track.rb'
loop do
  print "Input data: "
  word = gets.chomp

  if word.empty?
    break
  else
    arr = word.split(" ")
    if arr[0].to_s == "BOOK"
      x=Vehicle.new
      a=x.check_time(arr[1].to_s, arr[3].to_s, arr[2].to_s)
      if a==false
        puts "invalid time"
        break
      end
      y=Track.new
      puts y.add_to_track(arr[1].to_s,arr[2].to_s)
    else
      i = Vehicle.new
      k = i.get_extra_time(arr[1].to_s,arr[2].to_s)
      if k==false
        puts "INVALID_EXIT_TIME"
        break
      end
      j=Track.new
      puts j.get_extra_time_rev(arr[1].to_s,k)
    end
  end
end

s=Track.new
puts s.get_revenue
