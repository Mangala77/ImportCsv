class Region < ApplicationRecord
  belongs_to :company
  has_many :locations
  
  validates :name, presence: true
end
