class UsersController < ApplicationController
  def new
   @user = User.new
  end

  def create
   @user = User.new(params[:user])
  end

  def edit
   @user = current_user
   @printers = Printer.all
  end

  def update
   @user = current_user
   @printer = Printer.find_by_id(params[:user][:printer])
   @user.printer = @printer
   respond_to do |format|
     if @user.save
       format.html { redirect_to root_path, notice: 'Nutzereinstellungen aktualisiert' }
       format.json { head :no_content }
     else
       format.html { render action: "edit" }
       format.json { render json: @user.errors, status: :unprocessable_entity }
     end
    end
  end

end

