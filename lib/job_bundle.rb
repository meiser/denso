class JobBundle < Struct.new(:printer,:sticker)

  def perform
   @output = []
   p sticker.verz_id
   Baan.foreach_baan("select ttibde914120.t_cprj, ttdsls401120.t_pono, ttdsls401120.t_corn, ttdsls401120.t_corp, ttibde914120 .t_dqua, ttcibd001120.t_dsca, ttcibd001120.t_dscb, ttcibd001120.t_dscc from ttibde914120 inner join ttdsls401120 on ttibde914120.t_mitm = ttdsls401120.t_item inner join ttcibd001120 on ttcibd001120.t_item = ttdsls401120.t_item where t_load=? AND t_bund=?", sticker.verz_id) do |e|
    @output << e
   end

   p @output
   #etikett = "Rostetikett Zebra V2.btw"

   etikett= case sticker.language.code
    when "E" then "Rostetikett Zebra V2E"
    when "F" then "Rostetikett Zebra V2F"
   else
    "Rostetikett Zebra V2"
   end

   etikett<<("CE") if sticker.ce?
   etikett << ".btw"

   file_name = SecureRandom.hex(10)
   local_file_dir = Rails.root.join("public","etiketten")
   local_file =  local_file_dir.join("#{file_name}.ctg")
   remote_file = "/erpdat/baan_ils/etikett/120/#{file_name}.ctg"
   FileUtils.mkpath(local_file_dir)


   File.open(local_file, 'w') do |f|
    @output.each do |st|
     #sticker["t_dqua"].to_i.times do
      #Drucker|Etikett|Auftragsnummer|Position|Auftragsnummer Kunde|Kundenposition|Bstellte Menge|Arttxt. 1|Arttxt. 2|Arttxt. 3|Neutral
      f.puts("#{printer}|#{etikett}|#{st["t_cprj"]}|#{st["t_pono"]}|#{st["t_corn"]}|#{st["t_corp"]}|#{st["t_dqua"]}|#{st["t_dsca"]}|#{st["t_dscb"]}|#{st["t_dscc"]}|#{sticker.neutral? ? '1' : '2'}")
     #end
    end
    #{"t_cprj"=>"120617863", "t_pono"=>1, "t_corn"=>"gem. AG 2906/091111 ", "t_corp"=>"1 ", "t_dqua"=>4.0, "t_dsca"=>"Bostep G 40 3,0 fvz ", "t_dscb"=>"DD11 ", "t_dscc"=>" 2200 x 200"}
    #f.write("0009|Rostetikett Zebra V2.btw|110618313|1|110607288|1|Stepbloc 40 2,5 fvz|DD11| 5075 x  253|1") }
   end

   #Net::SCP.upload!("BaanEcht", "kellers", Rails.root.join("public","#{file_name}.ctg"), "/erpdat/baan_ils/etikett/120/#{file_name}.ctg", :password => "kellers")



   Net::SFTP.start('BaanEcht', 'samba', :password => "samba12") do |sftp|
    sftp.upload!(local_file.to_s,remote_file.to_s)
   end

  end


end

