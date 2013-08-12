class Subscriber < ActiveRecord::Base
  attr_accessible :email, :subscriber_name, :subscriber_neighborhood, :latitude, :longitude
  acts_as_gmappable :latitude => 'lat', :longitude => 'lng', :process_geocoding => false,
                  :address => "address", :normalized_address => "address",
                  :msg => "Sorry, not even Google could figure out where that is"


  
  # has_secure_password
  
  # before_save { |subscriber| subscriber.email = email.downcase }
  # before_save :create_remember_token
  
  validates :subscriber_name, :presence => true,
                    :length => { :maximum => 50 }
  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, :presence => true,
                    :format => { :with => email_regex },
                    :uniqueness => { :case_sensitive => false }
  
  def create_remember_token
  	self.remember_token = SecureRandom.urlsafe_base64
  end                   

  def self.to_csv(options = {})
        CSV.generate(options) do |csv|
          csv << column_names
          all.each do |charater|
            csv << charater.attributes.values_at(*column_names)
          end
        end
  end
  
end
