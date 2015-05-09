class DocCategoriesController < ApplicationController
  before_action :set_doc_category, only: [:show, :edit, :update, :destroy]

  # GET /doc_categories
  # GET /doc_categories.json
  def index
    @doc_categories = DocCategory.all
  end

  # GET /doc_categories/1
  # GET /doc_categories/1.json
  def show
  end

  # GET /doc_categories/new
  def new
    @doc_category = DocCategory.new
  end

  # GET /doc_categories/1/edit
  def edit
  end

  # POST /doc_categories
  # POST /doc_categories.json
  def create
    @doc_category = DocCategory.new(doc_category_params)

    respond_to do |format|
      if @doc_category.save
        format.html { redirect_to @doc_category, notice: 'Doc category was successfully created.' }
        format.json { render :show, status: :created, location: @doc_category }
      else
        format.html { render :new }
        format.json { render json: @doc_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /doc_categories/1
  # PATCH/PUT /doc_categories/1.json
  def update
    respond_to do |format|
      if @doc_category.update(doc_category_params)
        format.html { redirect_to @doc_category, notice: 'Doc category was successfully updated.' }
        format.json { render :show, status: :ok, location: @doc_category }
      else
        format.html { render :edit }
        format.json { render json: @doc_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /doc_categories/1
  # DELETE /doc_categories/1.json
  def destroy
    @doc_category.destroy
    respond_to do |format|
      format.html { redirect_to doc_categories_url, notice: 'Doc category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_doc_category
      @doc_category = DocCategory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def doc_category_params
      params.require(:doc_category).permit(:name, :id, :account_id)
    end
end
