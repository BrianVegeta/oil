class Admin::UsersController < Admin::ApplicationController
  before_action :set_admin_user, only: [:show, :edit, :update, :destroy]
  before_action :check_super_admin

  # GET /admin/users
  # GET /admin/users.json
  def index
    @admin_users = User.where(is_admin: true)
  end

  # GET /admin/users/1
  # GET /admin/users/1.json
  def show
  end

  # GET /admin/users/new
  def new
    @admin_user = User.new()
  end

  # GET /admin/users/1/edit
  def edit
  end

  # POST /admin/users
  # POST /admin/users.json
  def create
    @admin_user = User.new(admin_user_params)
    @admin_user.is_admin = true

    respond_to do |format|
      if @admin_user.save
        format.html { redirect_to edit_admin_user_path(@admin_user), notice: '管理員新增成功。' }
        format.json { render :show, status: :created, location: @admin_user }
      else
        format.html { render :new }
        format.json { render json: @admin_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/users/1
  # PATCH/PUT /admin/users/1.json
  def update
    params_to_update = admin_user_params
    params_to_update = admin_user_params_without_password if params_to_update[:password].blank?

    respond_to do |format|
      if @admin_user.update(params_to_update)
        format.html { redirect_to edit_admin_user_path(@admin_user), notice: '管理員更新成功。' }
        format.json { render :show, status: :ok, location: @admin_user }
      else
        format.html { render :edit }
        format.json { render json: @admin_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/users/1
  # DELETE /admin/users/1.json
  def destroy
    @admin_user.destroy
    respond_to do |format|
      format.html { redirect_to admin_users_url, notice: '管理員已刪除。' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_user
      @admin_user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_user_params
      params.require(:user).permit(
        :username, 
        :email, 
        :password, 
        :password_confirmation,
        :is_super_admin,
        :is_customer_service_manager,
        :is_product_manager
      )
    end

    def admin_user_params_without_password
      params.require(:user).permit(
        :username, 
        :email, 
        :is_super_admin,
        :is_customer_service_manager,
        :is_product_manager
      )
    end
end
