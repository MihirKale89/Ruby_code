# Given a column title as appear in an Excel sheet, return its corresponding column number.

class ExcelColumnNumber
  def title_to_number(s)
    acc = 0
    (1..s.length).each do |i|
      acc += (26**(i - 1)) * (s[-i].ord - 'A'.ord + 1)
    end
    acc
  end
end

ecn = ExcelColumnNumber.new
ecn.title_to_number('CBA')
