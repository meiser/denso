class Language < ActiveRecord::Base

  include MeiserRails::Informix

  attr_accessible :code, :description, :lang

end

