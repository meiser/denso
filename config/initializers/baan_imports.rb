
begin
  unless Language.first
  Rails.logger.info "Erstmalige Beladung der Datenbank mit allen angelegten Sprachen aus Baan"
  Language.foreach_baan("select * from ttcmcs046110") do |l|
   Language.create(
    :code => l["t_clan"].strip,
    :description => l["t_dsca"].strip,
    :lang => l["t_lang"].strip
   )
  end

  Rails.logger.info "Erstbeladung mit Sprachen aus BAAN erfolgreich abgeschlossen"
 else
   Rails.logger.info "Druckerinitialisierung mit BAAN nicht notwendig"
 end

rescue Exception => e
 Rails.logger.error e.message
 p e.message
 p e.backtrace
 exit
end


=begin
 #get languages from Baan
 begin
  sql = "select * from ttcmcs046110"
  if stmt = IBM_DB::exec(conn, sql)
   while row = IBM_DB::fetch_assoc(stmt)
    puts row["t_dsca"]
   end

   IBM_DB::free_result(stmt)
  else
   puts "Statement execution failed: #{IBM_DB::stmt_errormsg}"
  end
 ensure
  IBM_DB::close(conn)
 end

else
 puts "Connection failed: #{IBM_DB::conn_errormsg}"
end
=end

