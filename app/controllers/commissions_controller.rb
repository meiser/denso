class CommissionsController < ApplicationController
  # GET /commissions
  # GET /commissions.json
  def index
    @commissions = Commission.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @commissions }
    end
  end

  # GET /commissions/1
  # GET /commissions/1.json
  def show
    @commission = Commission.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @commission }
    end
  end

  # GET /commissions/new
  # GET /commissions/new.json
  def new
    @commission = Commission.new
    @bundle_types = BundleType.all

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @commission }
    end
  end

  # GET /commissions/1/edit
  def edit
    @commission = Commission.find(params[:id])
  end

  # POST /commissions
  # POST /commissions.json
  def create
   @commission = Commission.new(params[:commission])

   if @commission.valid?
    @commission.save
    #job = JobBundle.new(current_user.printer.ident, @bundlesticker)
    #Delayed::Job.enqueue job
    flash[:notice] = "Kommissionierung #{@commission.id} abgeschlossen"
   else
    flash[:error] = "Nicht erfolgreich"
   end

   redirect_to :action => :new
  end

  # PUT /commissions/1
  # PUT /commissions/1.json
  def update
    @commission = Commission.find(params[:id])

    respond_to do |format|
      if @commission.update_attributes(params[:commission])
        format.html { redirect_to @commission, notice: 'Commission was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @commission.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /commissions/1
  # DELETE /commissions/1.json
  def destroy
    @commission = Commission.find(params[:id])
    @commission.destroy

    respond_to do |format|
      format.html { redirect_to commissions_url }
      format.json { head :no_content }
    end
  end
end

