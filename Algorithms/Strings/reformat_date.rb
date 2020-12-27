# Input=> date = "20th Oct 2052"
# Output=> "2052-10-20"

class ReformatDate
  def reformat_date(date)
    values = date.split(' ')
    d = values.first[0..-3]
    d = '0' + d if d.length == 1
    y = values.last
    months = {
      'Jan' => '01',
      'Feb' => '02',
      'Mar' => '03',
      'Apr' => '04',
      'May' => '05',
      'Jun' => '06',
      'Jul' => '07',
      'Aug' => '08',
      'Sep' => '09',
      'Oct' => '10',
      'Nov' => '11',
      'Dec' => '12'
    }
    y + '-' + months[values[1]] + '-' + d
  end
end