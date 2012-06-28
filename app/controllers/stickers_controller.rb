class StickersController < ApplicationController

  def index

  end

  def new
   @sticker = Sticker.new
   @headline = case params[:type]
    when "order" then "Auftragsware"
    when "stock" then "Lagerware"
    when "manual" then "manuell"
    else
      render :text => "Error"
   end.prepend("Etikettierung ")
  end

  def create
   p file_path= Rails.root.join("public","110618313.ctg")
   p remote_file_path = "/erpdat/baan_ils/etikett/120/110618313.ctg"
   #Net::SCP.upload!("BaanEcht", "kellers", Rails.root.join("public","110618313.ctg"), "/erpdat/baan_ils/etikett/120/110618313.ctg", :password => "kellers")



   Net::SFTP.start('BaanEcht', 'samba', :password => "samba12") do |sftp|
    sftp.upload!(file_path.to_s,remote_file_path)
   end
   redirect_to :action => :index
  end



end

