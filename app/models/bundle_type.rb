class BundleType < ActiveRecord::Base

  include MeiserRails::Informix

  attr_accessible :cnst, :description

  def self.synchronize_with_baan
   foreach_baan("select t_cnst, t_edes from erp.tttadv401000 inner join erp.tttadv402000 ON erp.tttadv401000.t_cdom = erp.tttadv402000.t_cdom AND   erp.tttadv401000.t_ctnm = erp.tttadv402000.t_ctnm where erp.tttadv401000.t_cdom = 'mei.pack' AND t_clan = 3 order by t_cnst") do |bt|
    b = BundleType.find_or_initialize_by_cnst(bt["t_cnst"])
    b.description = bt["t_edes"].strip
    b.save
   end
  end

end

