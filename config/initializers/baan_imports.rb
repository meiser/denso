Language.baan do |c|

 sql = "select * from ttcmcs046110"
 if stmt = IBM_DB::exec(c, sql)

 end

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

