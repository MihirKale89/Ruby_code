class User
  attr_accessor :first_name, :last_name, :birthday, :gender, :roles, :status, :email, :password
end


class UserBuilder
  def self.build
    builder = new
    yield(builder)
    builder.user
  end

  def initialize
    @user = User.new
  end

  def set_name(first_name, last_name)
    @user.first_name = first_name
    @user.last_name = last_name
  end

  def set_birthday(birthday)
    @user.birthday = Time.new(birthday)
  end

  def set_as_active
    @user.status = 'active'
  end

  def set_as_on_hold
    @user.status = 'on_hold'
  end

  def set_as_men
    @user.gender = 'm'
  end

  def set_as_women
    @user.gender = 'f'
  end

  def set_as_admin
    @user.roles = ['admin']
  end

  def set_login_credentials(email, password)
    @user.email = email
    @user.password = password
  end

  def user
    @user
  end
end

UserBuilder.build do |builder|
  builder.set_name('John', 'Doe')
  builder.set_birthday('1999-03-02')
  builder.set_as_on_hold
  builder.set_as_men
  builder.set_as_admin
  builder.set_login_credentials('test@test.com', 'abcdef')
end
