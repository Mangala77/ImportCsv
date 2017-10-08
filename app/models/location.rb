class Location < ApplicationRecord
  belongs_to :region
  belongs_to :company

  #def services
  #  region.company.services
  #end

  #delegate :services,
          # to: :company

  validates :name, presence: true
end
