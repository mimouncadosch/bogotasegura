class Charater < ActiveRecord::Base
  attr_accessible :address, :date, :latitude, :longitude, :name, :tipo, :name, :description, :cedula, :neighborhood

  acts_as_gmappable :latitude => 'lat', :longitude => 'lng', :process_geocoding => false,
                  :address => "address", :normalized_address => "address",
                  :msg => "Sorry, not even Google could figure out where that is"

def gmaps4rails_address
  address

end
