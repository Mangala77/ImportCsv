class Company < ApplicationRecord
  
  has_many :regions
  has_many :services
  has_many :locations, through: :regions


  after_save :toggle_services #if: :disabled_changed?

  def toggle_services
    self.services.each do |service|
      service.update_attributes!(disabled: self.disabled)
    end
  end
  
  validates :name, presence: true
end
