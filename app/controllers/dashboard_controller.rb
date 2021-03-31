class DashboardController < ApplicationController
  def index
  end

  def shared
    @user = Token.find_by(token: params[:token])
  end
end