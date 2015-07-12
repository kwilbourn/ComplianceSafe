class UserGroupsController < ApplicationController
  before_action :set_user_groups, only: [:show, :edit, :update, :destroy]
  def index
    @user_groups = UserGroups.all
  end

  # GET /user_areas/1
  # GET /user_areas/1.json
  def show
  end

  # POST /doc_types
  # POST /doc_types.json
  def create
    @user_groups = UserAreas.new(user_areas_params)

    respond_to do |format|
      if @user_groups.save
        format.html { redirect_to @user_groups, notice: 'User and Group was successfully associated.' }
        format.json { render :show, status: :created, location: @user_groups }
      else
        format.html { render :new }
        format.json { render json: @user_groups.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /doc_types/1
  # PATCH/PUT /doc_types/1.json
  def update
    respond_to do |format|
      if @user_group.update(user_group_params)
        format.html { redirect_to @user_groups, notice: 'User and Group association successfully updated.' }
        format.json { render :show, status: :ok, location: @user_group }
      else
        format.html { render :edit }
        format.json { render json: @user_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /doc_types/1
  # DELETE /doc_types/1.json
  def destroy
    @user_group.destroy
    respond_to do |format|
      format.html { redirect_to doc_types_url, notice: 'Removed User / Group Association.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_group
      @user_group = UserGroups.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_groups_params
      params.permit(:client_id, :group_id)
    end

  # GET /user_areas/new
  def new
    @user_groups = UserGroups.new
  end

  # GET /user_areas/1/edit
  def edit
  end

end


end
