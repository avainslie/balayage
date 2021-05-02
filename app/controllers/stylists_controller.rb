class StylistsController < ApplicationController
  before_action :set_stylist, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :correct_user, only: [:edit, :update, :destroy]

  # GET /stylists or /stylists.json
  def index
    @stylists = Stylist.all
  end

  # GET /stylists/1 or /stylists/1.json
  def show
  end

  # GET /stylists/new
  def new
    #@stylist = stylist.new
    @stylist = current_user.stylists.build
  end

  # GET /stylists/1/edit
  def edit
  end

  # POST /stylists or /stylists.json
  def create
    #@stylist = stylist.new(stylist_params)
    @stylist = current_user.stylists.build(stylist_params)

    respond_to do |format|
      if @stylist.save
        format.html { redirect_to @stylist, notice: "stylist was successfully created." }
        format.json { render :show, status: :created, location: @stylist }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @stylist.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /stylists/1 or /stylists/1.json
  def update
    respond_to do |format|
      if @stylist.update(stylist_params)
        format.html { redirect_to @stylist, notice: "stylist was successfully updated." }
        format.json { render :show, status: :ok, location: @stylist }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @stylist.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stylists/1 or /stylists/1.json
  def destroy
    @stylist.destroy
    respond_to do |format|
      format.html { redirect_to stylists_url, notice: "stylist was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def correct_user
    @stylist = current_user.stylists.find_by(id: params[:id])
    redirect_to stylists_path, notice: "not authorized to edit this stylist" if @stylist.nil?
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_stylist
      @stylist = Stylist.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def stylist_params
      params.require(:stylist).permit(:first_name, :last_name, :email, :phone, :instagram, :user_id)
    end
end
