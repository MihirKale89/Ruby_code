# Given 3 , return 1+2+3=6

def sumOfN(num)
  return 1 if num == 1
  result += sumOfN(num-1)
end

p sumOfN(3)
