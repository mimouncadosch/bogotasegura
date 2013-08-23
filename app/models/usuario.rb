class Usuario < ActiveRecord::Base
  attr_accessible :email_address, :name, :last_name, :password, :password_confirmation,
                  :address, :latitude, :longitude
  has_secure_password
  
  before_save { |usuario| usuario.email_address = email_address.downcase }
  before_save :create_remember_token
  
  validates :name, :presence => true,
                    :length => { :maximum => 50 }
  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email_address, :presence => true,
                    :format => { :with => email_regex },
                    :uniqueness => { :case_sensitive => false }
  validates :password, :presence => true,
                       :confirmation => true,
                       :length => { :within => 6..40 }
  validates :latitude, :presence => true


def create_remember_token
  self.remember_token = SecureRandom.urlsafe_base64
end      

#Gmaps4Rails
acts_as_gmappable :latitude => 'lat', :longitude => 'lng', :process_geocoding => false,
                  :address => "address", :normalized_address => "address",
                  :msg => "Sorry, not even Google could figure out where that is"


#Geocoder
geocoded_by :address
after_validation :geocode


end
