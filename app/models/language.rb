class Language < ActiveRecord::Base

  include MeiserRails::Informix

  attr_accessible :code, :description, :lang

  def self.synchronize_with_baan
   foreach_baan("select * from ttcmcs046110") do |lb|
    l = Language.find_or_initialize_by_lang(lb["t_lang"].strip)
    l.code = lb["t_clan"].strip
    l.description = lb["t_dsca"].strip
    l.save
   end
  end

end

