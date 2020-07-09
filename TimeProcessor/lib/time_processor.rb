=begin
Without using any built-in date or time functions, write a function or method
that accepts two mandatory arguments: the first argument is a 12-hour time
string with the format "[H]H:MM {AM|PM}", and the second argument is a (signed)
integer. The second argument is the number of minutes to add to the time of day
represented by the first argument. The return value should be a string of the
same format as the first argument. For example, AddMinutes("9:13 AM", 200)
would return "12:33 PM". The exercise isn't meant to be too hard or take very
 long; we just want to see how you code. Please use Ruby to
 complete the assessment and include any test cases that you write.
=end

class TimeProcessor
  def self.add_minutes(time, minutes)
    return time if minutes == 0
    time = time.split(' ')
    meridiem = time.last
    time = time.first.split(':')
    hour = time.first.to_i
    minute = time.last.to_i
    hour, minute, meridiem = process_minutes(hour, minute, minutes, meridiem)
    "#{hour}:#{minute} #{meridiem}"
  end

  def self.process_minutes(hour, minute, minutes, meridiem)
    # Handling adding over 24 hours and handling negative case.
    minutes = minutes < 0 ? minutes.abs%(24*60)*-1 : minutes%(24*60)
    hour = 0 if hour == 12 && meridiem == 'AM'
    hour +=12 if hour !=12 && meridiem == 'PM'
    sum = (hour*60+minute + minutes)%(24*60)
    # Handling going into the previous or next day
    sum = (24*60)-(sum.abs) if sum < 0
    sum = sum-(24*60) if sum > (24*60)
    hour = (sum/60)%12
    minute = sum%60<10 ? "0#{sum%60}":"#{sum%60}"
    [hour == 0 ? 12:hour, minute, (sum/60)<12 ? 'AM':'PM']
  end
end

tp = TimeProcessor
p tp.add_minutes("9:13 AM", 200)
p tp.add_minutes("9:13 AM", -10)
p tp.add_minutes("9:13 AM", 1441)
p tp.add_minutes("9:13 AM", -1441)
p tp.add_minutes("12:05 AM", -10)
p tp.add_minutes("12:05 AM", -5)
p tp.add_minutes("11:55 PM", 10)
p tp.add_minutes("11:55 AM", 10)
p tp.add_minutes("11:55 AM", 5)
p tp.add_minutes("12:05 PM", -1450)
