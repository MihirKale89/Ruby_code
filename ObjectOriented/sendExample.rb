class Account
  attr_accessor :name, :address, :email, :notes

  def assign_values(values)
    values.each_key do |k|
      self.send("#{k}=", values[k])
    end
  end
end

user_info = {
  :name => 'Mihir Kale',
  :address => '255 King Street',
  :email => 'kale001@cougars.csusm.edu',
  :notes => 'Mighty generous person'
}

account = Account.new
account.assign_values(user_info)

p account.inspect
