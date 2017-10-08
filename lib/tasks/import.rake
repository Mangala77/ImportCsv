require 'csv'

namespace :import do
  desc "Import  data"
  task company_data:  :environment do

    CSV.foreach('lib/data/companies_data.csv', headers: true) do |row|
      row = row.to_h
      company = Company.where(:name => row["company"]).first_or_create!
      region = company.regions.where(:name => row["region"]).first_or_create!
      if region.id.present? and company.id.present?
        location = region.locations.where(:name => row["location"], :company_id => company.id).first_or_create!
        service = company.services.where(:name => row["service"], :location_id => location.id).first_or_create! do |stat|
          stat.price = row["price"]
          stat.duration = row["duration"] 
          stat.disabled = row["disabled"]
        end
      end
    end
  end
end
