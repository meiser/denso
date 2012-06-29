class Sticker < ActiveRecord::Base

  include MeiserRails::Informix

  attr_accessor :unique_number
  attr_accessible :unique_number


end

