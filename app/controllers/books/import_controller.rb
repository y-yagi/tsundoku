class Books::ImportController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
Rails.logger.info("DEBUG: parmas: #{params.inspect}")
    if params[:url].blank?
      head :not_found
    else
      BookImporter.import(url: params[:url], user: current_user)
      head :success
    end
  end
end
