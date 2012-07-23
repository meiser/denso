class OrderstickersController < ApplicationController
  # GET /orderstickers
  # GET /orderstickers.json
  def index
    @orderstickers = Ordersticker.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @orderstickers }
    end
  end

  # GET /orderstickers/1
  # GET /orderstickers/1.json
  def show
    @ordersticker = Ordersticker.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @ordersticker }
    end
  end

  # GET /orderstickers/new
  # GET /orderstickers/new.json
  def new
    @ordersticker = Ordersticker.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @ordersticker }
    end
  end

  # GET /orderstickers/1/edit
  def edit
    @ordersticker = Ordersticker.find(params[:id])
  end

  # POST /orderstickers
  # POST /orderstickers.json
  def create
    @ordersticker = Ordersticker.new(params[:ordersticker])

    respond_to do |format|
      if @ordersticker.save
        format.html { redirect_to @ordersticker, notice: 'Ordersticker was successfully created.' }
        format.json { render json: @ordersticker, status: :created, location: @ordersticker }
      else
        format.html { render action: "new" }
        format.json { render json: @ordersticker.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /orderstickers/1
  # PUT /orderstickers/1.json
  def update
    @ordersticker = Ordersticker.find(params[:id])

    respond_to do |format|
      if @ordersticker.update_attributes(params[:ordersticker])
        format.html { redirect_to @ordersticker, notice: 'Ordersticker was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @ordersticker.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orderstickers/1
  # DELETE /orderstickers/1.json
  def destroy
    @ordersticker = Ordersticker.find(params[:id])
    @ordersticker.destroy

    respond_to do |format|
      format.html { redirect_to orderstickers_url }
      format.json { head :no_content }
    end
  end
end
