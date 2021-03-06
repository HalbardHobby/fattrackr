class LogsController < ApplicationController
  before_action :set_log, only: %i[ edit update destroy ]
  before_action :authenticate_user!
  before_action :correct_user, only: [:edit, :update, :destroy]

  # GET /logs or /logs.json
  def index
    if user_signed_in?
      @logs = current_user.logs
    else
      @logs = nil
    end
  end
  
  # GET /logs/1/edit
  def edit
  end

  # PATCH/PUT /logs/1 or /logs/1.json
  def update
    respond_to do |format|
      if @log.update(log_params)
        format.html { redirect_to @log, notice: "Log was successfully updated." }
        format.json { render :show, status: :ok, location: @log }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @log.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /logs/1 or /logs/1.json
  def destroy
    @log.destroy
    respond_to do |format|
      format.html { redirect_to logs_url, notice: "Log was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def correct_user
      log = Log.find(params[:id])
      if log.user_id != current_user.id
        redirect_to dashboard_path, notice: "Not authorized to edit this log."
      end
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_log
      @log = Log.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def log_params
      params.require(:log).permit(:calories, :intake, :date, :description, :protein, :carb, :fat, :alcochol)
    end
end
