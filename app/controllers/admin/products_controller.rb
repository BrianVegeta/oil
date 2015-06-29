class Admin::ProductsController < Admin::ApplicationController
  before_action :set_admin_product, only: [:show, :edit, :update, :destroy]
  before_action :set_photo, only: [:new, :create, :edit, :update]
  before_action :check_product_admin

  # GET /admin/products
  # GET /admin/products.json
  def index
    @admin_products = Product.order('-top_rate desc').order('id desc')
  end

  # GET /admin/products/1
  # GET /admin/products/1.json
  def show
  end

  # GET /admin/products/new
  def new
    @admin_product = Product.new
    set_photo_url
  end

  # GET /admin/products/1/edit
  def edit
    @admin_product.state = :draft if @admin_product.state.nil?
    set_photo_url
  end

  # POST /admin/products
  # POST /admin/products.json
  def create
    @admin_product = Product.new(admin_product_params)
    set_photo_url

    respond_to do |format|
      if @admin_product.save
        format.html { redirect_to admin_products_path, notice: '產品新增成功。' }
        format.json { render :show, status: :created, location: @admin_product }
      else
        format.html { render :new }
        format.json { render json: @admin_product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/products/1
  # PATCH/PUT /admin/products/1.json
  def update
    set_photo_url
    respond_to do |format|
      if @admin_product.update(admin_product_params)
        format.html { redirect_to admin_products_path(@admin_product), notice: '產品編輯成功。' }
        format.json { render :show, status: :ok, location: @admin_product }
      else
        format.html { render :edit }
        format.json { render json: @admin_product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/products/1
  # DELETE /admin/products/1.json
  def destroy
    @admin_product.destroy
    respond_to do |format|
      format.html { redirect_to admin_products_url, notice: '產品已成功刪除。' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_product
      @admin_product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_product_params
      params.require(:product).permit(
        :top_rate,
        :zh_TW_title,
        :zh_TW_content,
        :zh_TW_description,
        :zh_TW_applicable_s,
        :zh_CN_title,
        :zh_CN_content,
        :zh_CN_description,
        :zh_CN_applicable_s,
        :en_title,
        :en_content,
        :en_description,
        :en_applicable_s,
        :photo_id,
        :state,
        :cate_id
      )
    end

    def set_photo_url
      if @admin_product.photo_id.nil?
        @current_photo_url = false
      else
        @current_photo_url = Photo.find(@admin_product.photo_id).avatar.url(:medium)
      end
    end

    def set_photo
      @photo = Photo.new
    end
end
