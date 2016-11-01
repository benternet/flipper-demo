class ImportsController < ApplicationController
  before_action :set_list

  # GET /imports/new
  def new
  end

  # POST /imports
  # POST /imports.json
  def create
    ImportJob.perform_now(@list, import_params.tempfile.path)
    redirect_to @list, notice: 'Import was successfully created.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_list
      @list = current_user.lists.find(params[:list_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def import_params
      params.require(:file)
    end
end
