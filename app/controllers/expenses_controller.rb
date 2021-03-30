class ExpensesController < ApplicationController

  def new
    @log = Log.new(intake: false)
  end

  def index
    @logs = current_user.logs.expenses
  end

  def create
    @log = Log.new(
      log_params.merge(user_id: current_user.id, intake: false)
    )

    if @log.save
      redirect_to intakes_url
    else
      render :new
    end
  end

  private
    def log_params
      params.require(:log).permit(:calories, :date, :description)
    end
end
