class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :contacts
  has_many :messages, :foreign_key => :from
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
