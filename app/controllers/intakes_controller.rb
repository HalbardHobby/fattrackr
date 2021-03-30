class IntakesController < ApplicationController

  def new
    @log = Log.new(intake: true)
  end

  def index
    @logs = current_user.logs.intakes
  end

  def create
    @log = Log.new(
      log_params.merge(user_id: current_user.id, intake: true)
    )

    if @log.save
      redirect_to expenses_url
    else
      render :new
    end
  end

  private
    def log_params
      params.require(:log).permit(:calories, :intake, :date, :description, :protein, :carb, :fat, :alcochol)
    end
end
