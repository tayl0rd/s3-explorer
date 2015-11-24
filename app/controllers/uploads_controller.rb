class UploadsController < ApplicationController
  before_action :authenticate

  def index
    @uploads = Upload.all
  end

  def new
    @upload = Upload.new
  end

  def create
    @upload = Upload.create(upload_params)
    redirect_to root_path 
  end

  private

  def upload_params
    params.require(:upload).permit(:title)
  end
end
