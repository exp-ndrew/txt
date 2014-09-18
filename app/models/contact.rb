class Contact < ActiveRecord::Base
  validates :phone, presence: true
  validates :name, presence: true
  belongs_to :user

  has_and_belongs_to_many :messages


end
