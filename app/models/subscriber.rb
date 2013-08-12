class Subscriber < ActiveRecord::Base
  attr_accessible :email
  

  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, :presence => true,
                    :format => { :with => email_regex },
                    :uniqueness => { :case_sensitive => false }
  
              

  geocoded_by :address
  after_validation :geocode
  
  def self.to_csv(options = {})
        CSV.generate(options) do |csv|
          csv << column_names
          all.each do |charater|
            csv << charater.attributes.values_at(*column_names)
          end
        end
  end
  
end
