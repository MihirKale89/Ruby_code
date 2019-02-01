a = [1,2,3,4]
b = []
c = []

# Move the disks from one peg to another following the rules of Hanoi.
#
# number_of_disks - the total number of disks
# from - the starting peg
# to - the ending (goal) peg
# via - the remaining peg (b in this case)
#
def move_disk(number_of_disks,from,to,via)
  # Do your magic here
  # your method should return to

  # So I think the idea here is to use recursion to make a
  # branch like structure of every possible move of disks
  # Not sure when and were I should validate moves:
  #   Before I move so I don't go there, or after and fail
  #   Could probably do either
  # Anyway, I think the exit (base case) is going to be:
  #   to == [1, 2, 3, 4]
  # If we aren't at that condition, we probably want to try
  # to make every/any valid move we can

  # The first case will start looking like this:
  #   from (a) == [1,2,3,4]
  #   to (c) == []
  #   via (b) == []
  # And we want it to end up like this before we
  # make any other moves:
  #   from (a) == [2,3,4]
  #   to (c) == [1]
  #   via (b) == []

  # What we want to actually _do_ in this call is say:
  # Can we move a disk from 'from' to 'via'?
  # Can we then move that disk from 'via' to 'to'?

  # Looking at this again in the morning...
  # I think I was looking at this too _immediately_
  # and I need to step back and look at the larger picture.
  # With my previous explanations and since removed code
  # it seemed possible to get stuck in an infinite recursion
  # i.e. moving disk 1 to c and then moving disk 1 to a
  #   and back and forth forever was a valid path

  # I think the idea will be to attempt to drill down and
  # move the _bottom_ disk. And let that drive the algorithm

  # If I can move the bottom disk to where it needs to be
  # this means I need a stack that looks like this:
  #   a == [4]
  #   b == [1,2,3]
  #   c == []
  # So I can move that last disk onto where it needs to be
  # This is the point where if we tracked the number of disks
  # to move by subtracting 1, we should have number == 1
  if number_of_disks == 1
    to.unshift(from.shift)
  else
  # But this isn't the most common case. Normally,
  # we have to move other disks out of the way first, to
  # get the number of disks to move down to 1. We can make
  # some recursive calls subtracting 1 from the number of disks

  # The first move_disk call will take all the disks and move
  # them from 'from' to 'via' to get them out of the way
  # This drills all the way down to there being ONE DISK
  # and hits the base case above causing a disk to move
  # from 'from' to 'via' ('via' is sent in for the 'to' arg)
    move_disk(number_of_disks - 1, from, via, to)
  # Since we actually returned from that last recursive call
  # We can actually make another move here
  # This will happen when number_of_disks == 2 and we have
  # already moved the only disk we could move to the via peg
  # This will move what we think is the bottom disk to 'to'
    to.unshift(from.shift)
  # Now we can stack the smaller disk on top of the disk we
  # just moved in the last section from the 'via' peg (step 1)
  # on top of the 'to' peg (step 2)
    move_disk(number_of_disks - 1, via, to, from)
  end

  to
end

# here we go!
move_disk(4, a, c, b)
p a,b,c
