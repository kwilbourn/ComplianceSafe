class UserAreasController < ApplicationController
  before_action :set_user_areas, only: [:show, :edit, :update, :destroy]
  def index
    @user_areas = UserAreas.all
  end

  # GET /user_areas/1
  # GET /user_areas/1.json
  def show
  end

  # POST /doc_types
  # POST /doc_types.json
  def create
    @user_areas = UserAreas.new(user_areas_params)

    respond_to do |format|
      if @user_areas.save
        format.html { redirect_to @user_areas, notice: 'User and Area was successfully associated.' }
        format.json { render :show, status: :created, location: @user_areas }
      else
        format.html { render :new }
        format.json { render json: @doc_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /doc_types/1
  # PATCH/PUT /doc_types/1.json
  def update
    respond_to do |format|
      if @user_areas.update(user_areas_params)
        format.html { redirect_to @user_areas, notice: 'User and Area association successfully updated.' }
        format.json { render :show, status: :ok, location: @user_areas }
      else
        format.html { render :edit }
        format.json { render json: @user_area.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /doc_types/1
  # DELETE /doc_types/1.json
  def destroy
    @user_areas.destroy
    respond_to do |format|
      format.html { redirect_to doc_types_url, notice: 'Removed User / Area Association.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_area
      @user_areas = UserAreas.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_areas_params
      params.permit(:user_id, :area_id)
    end

  # GET /user_areas/new
  def new
    @user_areas = UserAreas.new
  end

  # GET /user_areas/1/edit
  def edit
  end

end

