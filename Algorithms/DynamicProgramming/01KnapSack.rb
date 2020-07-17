# A Dynamic Programming based Python
# Program for 0-1 Knapsack problem
# Returns the maximum value that can
# be put in a knapsack of capacity W
# wt is an array of weights of elements
# val is an array of values of elements
# n is the number of elements

class KnapSack
   def knapSack(max_w, wt, val, n)
     k = Hash.new
     (0..n).each { |e| k[e] = Array.new(max_w+1) }
     (0..n).each do |i|
       (0..max_w).each do |w|
         if (i==0 || w==0)
           k[i][w] = 0
         elsif (wt[i-1] <= w)
           k[i][w] = [val[i-1] + k[i-1][w-wt[i-1]], k[i-1][w]].max
         else
           k[i][w] = k[i-1][w]
         end
       end
     end
     puts "The maximum value that can be selected is #{k[n][max_w]}"
     sel = []
     rw = max_w
     for i in (n).downto(1)
       if k[i][rw] > k[i-1][rw]
         sel << wt[i-1]
         rw-=wt[i-1]
       end
     end
     puts "The weights selected are #{sel}"
   end
end

val = [1,2,5,6]
wt = [2,3,4,5]
max_w = 8
n = val.size
ks = KnapSack.new
p ks.knapSack(max_w, wt, val, n)
p ks.knapSack(50, [10, 20, 30], [60, 100, 120], 3)
