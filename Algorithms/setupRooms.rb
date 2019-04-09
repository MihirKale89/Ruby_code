# Given [[0,5],

def setupRooms(arrClasses)
  rooms = Hash.new
  roomKey = 0
  arrClasses.each do |classs|
    setup = false
    rooms.each do |key, value|
      checkInTime = false
      checkOutTime = false
      value.each do |cl|
        checkInTime = true if classs[0] >= cl[0] && classs[0] <= cl[1]
        checkOutTime = true if classs[1] >= cl[0] && classs[1] <= cl[1]
      end
      if (!checkInTime && !checkOutTime)
        setup = true
        value << classs
        break
      end
    end
    if !setup
      roomKey += 1
      rooms[roomKey] = Array.new
      rooms[roomKey] << classs
    end
  end
  p rooms
end

def setupRooms2(arrClasses)
  arrClasses = arrClasses.sort_by{ |ar| ar[0] }
  rooms = Hash.new
  roomKey = 0
  arrClasses.each do |klass|
    setup = false
    rooms.each do |key, value|
      if klass[0] > value.last[1]
        setup = true
        value << klass
        break
      end
    end
    if !setup
      roomKey += 1
      rooms[roomKey] = Array.new
      rooms[roomKey] << klass
    end
  end
  p rooms
end

setupRooms([[0,50],[30,75],[60,150],[0,35],[60,90],[9,20],[1,8]])
setupRooms2([[0,50],[30,75],[60,150],[0,35],[60,90],[9,20],[1,8]])
