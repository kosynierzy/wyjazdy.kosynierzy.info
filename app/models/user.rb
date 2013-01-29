class User < ActiveRecord::Base
  devise :database_authenticatable,
    :recoverable,
    :rememberable,
    :trackable,
    :confirmable,
    :lockable,
    :validatable,
    :timeoutable

  has_and_belongs_to_many :users_groups

  attr_accessible :username, :email, :password, :password_confirmation, :remember_me

  validates :username, presence: true, uniqueness: true
end
