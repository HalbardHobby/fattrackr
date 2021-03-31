class DashboardController < ApplicationController
  before_action :authenticate_user!, except: [:shared]

  def index
  end

  def shared
    @user = Token.find_by(token: params[:token])
  end
end