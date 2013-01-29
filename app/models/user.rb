class User < ActiveRecord::Base
  devise :database_authenticatable,
    :recoverable,
    :rememberable,
    :trackable,
    :confirmable,
    :lockable,
    :validatable,
    :timeoutable

  attr_accessible :username, :email, :password, :password_confirmation, :remember_me

  validates :username, presence: true, uniqueness: true
end
