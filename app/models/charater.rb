class Charater < ActiveRecord::Base
  attr_accessible :address, :date, :latitude, :longitude, :name, :tipo, :name, :description, :cedula, :neighborhood

  acts_as_gmappable :latitude => 'lat', :longitude => 'lng',
                  :msg => "Sorry, not even Google could figure out where that is"

def gmaps4rails_infowindow  
    "<h5>#{tipo}</h5>"+
    "<h5>#{address}</h5>"+
    "<h5>#{neighborhood}</h5>"+
    "<h5>#{date}</h5>"
  end

  def gmaps4rails_marker_picture
  {
  "picture" => "/assets/#{tipo}.png",          
   "width" => "40",           
   "height" => "40"
 }
  end

  def gmaps4rails_sidebar
    tipo
  end
end
