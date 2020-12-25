# Given an array of meeting time intervals where intervals[i] = [starti, endi],
# determine if a person could attend all meetings.

class AttendAllMeetings
  def can_attend_meetings(intervals)
    intervals.sort_by(&:first).each_cons(2).all? { |i, j| i.last <= j.first }
  end
end

aam = AttendAllMeetings.new
p aam.can_attend_meetings([[0, 30], [5, 10], [15, 20]])
p aam.can_attend_meetings([[7, 10], [2, 4]])
