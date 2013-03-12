class FtypesController < ApplicationController
  before_filter :get_current_user

  # GET /ftypes
  # GET /ftypes.json
  def index
    @ftypes = Ftype.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @ftypes }
    end
  end

  # GET /ftypes/1
  # GET /ftypes/1.json
  def show
    @ftype = Ftype.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @ftype }
    end
  end

  # GET /ftypes/new
  # GET /ftypes/new.json
  def new
    @ftype = Ftype.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @ftype }
    end
  end

  # GET /ftypes/1/edit
  def edit
    @ftype = Ftype.find(params[:id])
  end

  # POST /ftypes
  # POST /ftypes.json
  def create
    @ftype = Ftype.create_ftype(params[:ftype], @user)
    if @ftype.save
      render json: {:code => 0}
    else
      render json: {:code => -1, :msg => "params invalid"}
    end
  end

  # PUT /ftypes/1
  # PUT /ftypes/1.json
  def update
    @ftype = Ftype.find(params[:id])

    respond_to do |format|
      if @ftype.update_attributes(params[:ftype])
        format.html { redirect_to @ftype, notice: 'Ftype was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @ftype.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ftypes/1
  # DELETE /ftypes/1.json
  def destroy
    @ftype = Ftype.find(params[:id])
    @ftype.destroy

    respond_to do |format|
      format.html { redirect_to ftypes_url }
      format.json { head :no_content }
    end
  end
end
