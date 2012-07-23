class Bundlesticker < ActiveRecord::Base

 include MeiserRails::Informix

 belongs_to :language

 # attr_accessible :title, :body
 # attr_accessor :unique_number, :language, :neutral, :ce

 attr_accessible :unique_number, :language_id, :neutral, :ce

 validate :scanned_number

 validates :unique_number, :presence => true


 def verz_id
  if self.unique_number
   self.unique_number.scan(/^.{3}(.*)(.{3})/).flatten
  else
   return []
  end
 end

 private

 def scanned_number
  begin
   Baan.foreach_baan("select count(*) from ttibde914120 where t_load=? and t_bund =?",self.verz_id) do |r|
    errors.add(:unique_number,"Keinen Datensatz in Datenbank gefunden") if r.values.first.zero?
   end
  rescue => e
   errors.add(:unique_number,e.message)
  end
 end


end

