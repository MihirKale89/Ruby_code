=begin
Given two arrays A and B of length N, determine if there is a way to
make A equal to B by reversing any subarrays from array B any number of times.
Signature
bool areTheyEqual(int[] arr_a, int[] arr_b)
Input
All integers in array are in the range [0, 1,000,000,000].
Output
Return true if B can be made equal to A, return false otherwise.
Example
A = [1, 2, 3, 4]
B = [1, 4, 3, 2]
output = true
After reversing the subarray of B from indices 1 to 3,
array B will equal array A.
=end

class ReverseMakeEqual
  def are_they_equal(arr_a, arr_b)
    # Write your code here
    return true if arr_a == arr_b
    return false if arr_a.length != arr_b.length
    for i in 0...arr_a.length
      while arr_a[i] == arr_b[i] && i < arr_a.length
        arr_a.delete_at(i)
        arr_b.delete_at(i)
      end
    end
    arr_a.reverse == arr_b
  end
end

rme = ReverseMakeEqual.new
p rme.are_they_equal([1, 2, 3, 4, 5, 6],[1, 2, 3, 6, 5, 4])
