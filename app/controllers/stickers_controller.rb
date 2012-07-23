class StickersController < ApplicationController

  def index

  end

  def new
   @sticker = Sticker.new
   @headline = case params[:type]
    when "bundle" then "durch Bundetikett"
    when "manual" then "manuell"
    else
      render :action => :index
   end.prepend("Etikettierung ")
  end


  def bundle

  end

  def manual

  end


  def create

   #Testlieferung 003100010378  1
   if params[:type] == "bundle"
    verz_id = params[:sticker][:unique_number].scan(/^.{3}(.*)(.{3})/).flatten
     job = JobABundle.new(current_user.printer.ident, verz_id)
     if job.valid?
      Delayed::Job.enqueue job
      flash[:notice] = "Gedruckt"
     else
      flash[:error] = "Angaben checken"
     end
   end
=begin
   case params[:type]
    when "order" then
     verz_id = params[:sticker][:unique_number].scan(/^.{3}(.*)(.{3})/).flatten
     job = JobAuftragsware.new(current_user.printer.ident, verz_id)
     if job.valid?
      p "JOB valid"
      Delayed::Job.enqueue job
      #redirect_to :action => :new, :type => params[:type]
     end
    else
     p "TODO Implement other types"
   end
=end

  end


end

