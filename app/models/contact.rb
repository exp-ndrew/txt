class Contact < ActiveRecord::Base
  validates :phone, presence: true
  validates :name, presence: true
end
