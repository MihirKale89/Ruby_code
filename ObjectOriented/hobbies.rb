module Hobbies
  def self.find_hobbyists(hobbies, hobby)
    hobbyists_array = []
    hobbies.each {|key, value| hobbyists_array << key if value.include? hobby }
    return hobbyists_array
  end
end

hobbies = {
    "John" => ['Piano', 'Puzzles', 'Yoga'],
    "Adam" => ['Drama', 'Fashion', 'Pets'],
    "Mary" => ['Magic', 'Pets', 'Reading']
}

puts Hobbies.find_hobbyists(hobbies, 'Yoga')
