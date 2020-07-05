# Program to find if a string is one edit away from being exactly
# identical with the other.

class OneEditAway
  def oneEditAway(str1, str2)
    return false if str1.length == str2.length
    # making str1 the smaller one
    if str1.length > str2.length
      temp = str1
      str1 = str2
      str2 = temp
    end
    return true if str2.start_with? str1
    return true if str2.end_with? str1
    differenceFound = false
    index2 = 0
    for index1 in 0..str1.length-1 do
      # return false if(str1[index1] != str2[index2] && differenceFound == true)
      if str1[index1] != str2[index2]
        return false if differenceFound == true
        differenceFound = true
        while str1[index1] != str2[index2]
          index2 += 1
        end
      end
      index2 += 1
    end
    return differenceFound && index2 == str2.length
  end
end

oea = OneEditAway.new
p oea.oneEditAway("This is a car", "This is a blue car")
p oea.oneEditAway("This is a car", "This is a green car")
p oea.oneEditAway("This is a car", "This is an ordinary car")
p oea.oneEditAway("This is a car", "This is a blue car with new wheels")
p oea.oneEditAway("This is a car", "This is why it is called a good car")
