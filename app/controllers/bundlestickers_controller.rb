class BundlestickersController < ApplicationController
  # GET /bundlestickers
  # GET /bundlestickers.json
  def index
    @bundlestickers = Bundlesticker.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @bundlestickers }
    end
  end

  # GET /bundlestickers/1
  # GET /bundlestickers/1.json
  def show
    @bundlesticker = Bundlesticker.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @bundlesticker }
    end
  end

  # GET /bundlestickers/new
  # GET /bundlestickers/new.json
  def new
    @bundlesticker = Bundlesticker.new
    @headline = "durch Bund".prepend("Etik. ")
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @bundlesticker }
    end
  end

  # GET /bundlestickers/1/edit
  def edit
    @bundlesticker = Bundlesticker.find(params[:id])
  end

  # POST /bundlestickers
  # POST /bundlestickers.json
  def create
   p @bundlesticker = Bundlesticker.new(params[:bundlesticker])

   if @bundlesticker.valid?
    @bundlesticker.save
    job = JobBundle.new(current_user.printer.ident, @bundlesticker)
    Delayed::Job.enqueue job
    flash[:notice] = "#{params[:bundlesticker][:unique_number]} wird gedruckt"
   else
    flash[:error] = "Angaben checken"
   end
   redirect_to :action => :new
  end

  # PUT /bundlestickers/1
  # PUT /bundlestickers/1.json
  def update
    @bundlesticker = Bundlesticker.find(params[:id])

    respond_to do |format|
      if @bundlesticker.update_attributes(params[:bundlesticker])
        format.html { redirect_to @bundlesticker, notice: 'Bundlesticker was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @bundlesticker.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bundlestickers/1
  # DELETE /bundlestickers/1.json
  def destroy
    @bundlesticker = Bundlesticker.find(params[:id])
    @bundlesticker.destroy

    respond_to do |format|
      format.html { redirect_to bundlestickers_url }
      format.json { head :no_content }
    end
  end
end

