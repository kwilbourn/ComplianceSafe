class DocumentsController < ApplicationController
  before_action :set_document, only: [:show, :edit, :update, :destroy, :verify]
  load_and_authorize_resource
  helper_method :sort_column, :sort_direction
def file_attachment
  send_file 'document.file.path'
end
  # GET /documents
  # GET /documents.json
  def index
    @documents = Document.accessible_by(current_ability).search(params[:search]).order(sort_column + " " + sort_direction).paginate(:per_page => 10, :page => params[:page])  

    @user = current_user
  end

  # GET /documents/1
  # GET /documents/1.json
  def show
  end

  # GET /documents/new
  def new
    @document = Document.new
  end

  # GET /documents/1/edit
  def edit
  end

# GET /documents/1/verify
  def verify
    
  end
  def verify_click
    document = Document.find(params[:id])
    document.verify = 1 #set verification status to 1
    document.save
    next_document = document.next_verify
    if next_document.nil? && document.prev_verify.nil?
      redirect_to @document, notice: 'Document Verification Completed.'
      #format.json { render :show, status: :verified, location: @document }
    elsif (next_document.nil?)
      redirect_to verify_path(document.prev_verify)
    else
      redirect_to verify_path(next_document)
    end
  end

# GET /documents/1/verify

# GET /documents/need_verify
def need_verify
  @documents = Document.accessible_by(current_ability).where("verify = ?", 0).search(params[:search]).order(sort_column + " " + sort_direction).paginate(:per_page => 10, :page => params[:page])  
end
  # POST /documents
  # POST /documents.json
  def create
 
    if ClientSite
      @document = Document.new(document_params)
      @document.user = current_user
    else
      @document = Document.new(document_params) 
    end
    respond_to do |format|
      if @document.save
        format.html { redirect_to @document, notice: 'Document was successfully created.' }
        format.json { render :show, status: :created, location: @document }
      else
        format.html { render :new }
        format.json { render json: @document.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /documents/1
  # PATCH/PUT /documents/1.json
  def update
    respond_to do |format|
      if @document.update(document_params)
        format.html { redirect_to @document, notice: 'Document was successfully updated.' }
        format.json { render :show, status: :ok, location: @document }
      else
        format.html { render :edit }
        format.json { render json: @document.errors, status: :unprocessable_entity }
      end
    end
  end
  
  # DELETE /documents/1
  # DELETE /documents/1.json
  def destroy
    @document.destroy
    respond_to do |format|
      format.html { redirect_to documents_url, notice: 'Document was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_document
      @document = Document.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def document_params
      params.require(:document).permit(:name, :permit_number, :expiration_date, :document_upload, :doc_type_id, :replaced_by, :user_id)
    end
    def admin_params
      params.require(:document).permit(:name, :permit_number, :expiration_date, :document_upload, :doc_type_id, :replaced_by, :user_id)
    end
    def verify_params
      params.permit(:document, :name, :permit_number, :expiration_date, :document_upload, :doc_type_id, :replaced_by)
    end
    def sort_column
      Document.column_names.include?(params[:sort]) ? params[:sort] : "expiration_date"
    end
    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end
end
