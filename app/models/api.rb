require 'soda/client'

class Socrata_API

  def self.query(column)

    results = basic_query(column)

    results

  end

  def self.generate_activities

    non_sports = ['park_number', 'park_name', 'street_address', 'zip', 'acres', 'label', 'ward', 'park_class', 'location', 'location_location']

    client = SODA::Client.new({:domain => "data.cityofchicago.org", :app_token => ENV["SOCRATA_APP_TOKEN"]})

    results = client.get("4xwe-2j3y", "$limit" => 5000)
    
    results.first.each do |k, v|
      unless non_sports.include?(k)
        a = Activity.new(name: k)
        if a.save
        end
      end
    end

  end

  private

  def self.basic_query(column)
    client = SODA::Client.new({:domain => "data.cityofchicago.org", :app_token => ENV["SOCRATA_APP_TOKEN"]})

    results = client.get("4xwe-2j3y", {"$where" => "#{column} > '0'"})
  end

end