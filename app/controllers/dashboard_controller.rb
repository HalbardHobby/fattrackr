class DashboardController < ApplicationController
  before_action :authenticate_user!, except: [:shared]

  def index
  end

  def shared
    @token = Token.find_by(token: params[:token])
    redirect_to root_path, notice: "Token not found" if @token.nil?
  end
end