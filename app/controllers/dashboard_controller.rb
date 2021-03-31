class DashboardController < ApplicationController
  before_action :authenticate_user!, except: [:shared]

  def index
    @expenses = current_user.logs.expenses
                            .group_by_day(:date, range: (Date.today - 30.days)..Date.today)
                            .sum(:calories)
    @intakes = current_user.logs.intakes
                           .group_by_day(:date, range: (Date.today - 30.days)..Date.today)
    
    @protein_intake = @intakes.sum(:protein)
    @carb_intake = @intakes.sum(:carb)
    @fat_intake = @intakes.sum(:fat)
    @alcohol_intake = @intakes.sum(:alcochol)
    @calorie_intake = @intakes.sum(:calories)
  end

  def shared
    @token = Token.find_by(token: params[:token])
    if @token.nil?
      redirect_to root_path, notice: "Token not found" 
    else
      @expenses = @token.user.logs.expenses
                            .group_by_day(:date, range: (Date.today - 30.days)..Date.today)
                            .sum(:calories)
      @intakes = @token.user.logs.intakes
                            .group_by_day(:date, range: (Date.today - 30.days)..Date.today)
      
      @protein_intake = @intakes.sum(:protein)
      @carb_intake = @intakes.sum(:carb)
      @fat_intake = @intakes.sum(:fat)
      @alcohol_intake = @intakes.sum(:alcochol)
      @calorie_intake = @intakes.sum(:calories)
    end
  end


end