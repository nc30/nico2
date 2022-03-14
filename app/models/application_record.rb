class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class

  def pwd=(s)
    self.password = BCrypt::Password.create(s)
  end

  def valid_password?(pwd)
    BCrypt::Password.new(password) == pwd
  end
end
