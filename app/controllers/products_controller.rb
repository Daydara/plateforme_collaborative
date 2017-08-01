class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: :index

  after_action :verify_authorized, except: :index
  after_action :verify_policy_scoped, only: :index

  # GET /products
  # GET /products.json
  def index
    # @products = Product.all.page params[:page]
    @products = policy_scope(Product)

    @products = @products.order(updated_at: :desc).page(params[:page])

    search = params[:term].present? ? params[:term] : nil
    @products = if search
    Product.search(search)
  else
    Product.all
  end
  end

  # GET /products/1
  # GET /products/1.json
  def show
  end

  # GET /products/new
  def new
    @product = current_user.products.new
    authorize @product
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products
  # POST /products.json
  def create
    @product = current_user.products.create(product_params)
    authorize @product
    #respond_to do |format|
      if @product.save
        redirect_to @product, notice: 'Product was successfully created.'
        #format.html { redirect_to @product, notice: 'Product was successfully created.' }
        #format.json { render :show, status: :created, location: @product }
      else
         render :new
        #format.html { render :new }
        #format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  #end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    #respond_to do |format|
      if @product.update(product_params)
        redirect_to @product, notice: 'Product was successfully updated.'
        #format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        #format.json { render :show, status: :ok, location: @product }
      else
        render :edit
        #format.html { render :edit }
        #format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  #end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    redirect_to products_url, notice: 'Product was successfully destroyed.'
    #respond_to do |format|
      #format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      #format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
      authorize @product
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:name, :description, :category, :date, :activate, :image)
    end
