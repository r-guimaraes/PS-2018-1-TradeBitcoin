class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
    if Account.find_by_client_id(current_user.id)
      @contas = Account.find_by_client_id(current_user.id).id
    else
      @contas = false
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    puts @user
  end

  # GET /users/new
  def new
    @user = User.new
    @client = Client.new
    @user.client = @client
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    r = @user.build_client
    login = params["user"]["client"]["login"]
    senha = params["user"]["client"]["senha"]

    r.login = login
    r.senha = senha

    puts @user
    # c = Client.new
    # c.user = @user
    #
    # debugger
    #
    # c.login = params[:user][:client][:login]
    # c.save

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'Usuário criado com sucesso!' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'Usuário atualizado com sucesso!' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'Usuário removido com sucesso!' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:name, :email, :rg, :cpf, client_attributes: [:id, :login, :senha])
    end
end
