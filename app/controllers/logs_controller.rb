class LogsController < ApplicationController
  before_action :set_log, only: %i[ show edit update destroy ]

  # GET /logs or /logs.json
  def index
    @logs = Log.where("user_id = ?", current_user.id)
  end

  # GET /logs/intake
  def intake
    @logs = Log.where("user_id = ?", current_user.id)
               .where("intake = ?", true)
  end

  # GET /logs/expense
  def expense
    @logs = Log.where("user_id = ?", current_user.id)
               .where("intake = ?", false)
  end

  # GET /logs/new
  def new
    @log = Log.new
  end

  # GET /logs/new_intake
  def new_intake
    @log = Log.new(intake: true)
  end

  # GET /logs/new_expense
  def new_expense
    @log = Log.new(intake: false)
  end
  
  # GET /logs/1/edit
  def edit
  end

  # POST /logs or /logs.json
  def create
    @log = Log.new(
      log_params.merge(user_id: current_user.id)
    )

    respond_to do |format|
      if @log.save
        format.html { redirect_to logs_url, notice: "Log was successfully created." }
        format.json { render :index, status: :created }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @log.errors, status: :unprocessable_entity }
      end
    end
  end

  # POST /logs/intake
  def create_intake
    @log = Log.new(
      log_params.merge(user_id: current_user.id, intake:true)
    )

    respond_to do |format|
      if @log.save
        format.html { redirect_to logs_intake_url, notice: "Log was successfully created." }
        format.json { render :intake, status: :created }
      else
        format.html { render :new_intake, status: :unprocessable_entity }
        format.json { render json: @log.errors, status: :unprocessable_entity }
      end
    end
  end

  # POST /logs/expense
  def create_expense
    @log = Log.new(
      log_params.merge(user_id: current_user.id, intake:true)
    )

    respond_to do |format|
      if @log.save
        format.html { redirect_to logs_expense_url, notice: "Log was successfully created." }
        format.json { render :expense, status: :created }
      else
        format.html { render :new_expense, status: :unprocessable_entity }
        format.json { render json: @log.errors, status: :unprocessable_entity }
      end
    end
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
    # Use callbacks to share common setup or constraints between actions.
    def set_log
      @log = Log.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def log_params
      params.require(:log).permit(:calories, :intake, :date, :description, :protein, :carb, :fat, :alcochol)
    end
end
