class TokensController < ApplicationController
  before_action :set_token, only: [:destroy, :show]
  before_action :authenticate_user!

  def index
    @tokens = current_user.tokens
  end

  def show
  end

  def create
    uuid = SecureRandom.uuid
    @token = Token.new(user_id: current_user.id, token: uuid)
    
    if @token.save
      redirect_to token_url(@token)
    end
  end

  def destroy
    @token.destroy
    redirect_to tokens_url
  end

  private

    def set_token
      @token = Token.find(params[:id])
    end

end