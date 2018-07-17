# This file will read the input from input.txt and insert the host names and their occurance counts in the output file.
# read the string filename
# This was the 4th Question. We had to find the count of each unique host
filename = gets.strip
hosts = Hash.new
hosts.default = 0
File.readlines(filename).each do |line|
    line_arr = line.split(" ")
    hosts["#{line_arr[0]}"] = hosts["#{line_arr[0]}"] += 1
end
op_file = File.new("records_#{filename}", "w")
hosts.each do |key, value|
  op_file.puts "#{key} #{value}"
end
op_file.close
