class ProductsController < ApplicationController
  include ProductsHelper
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  # GET /products
  def index
     @products ||= Product.new_to_old
     @filter_scope ||= :ALL_CLOTHES
     @order_scope ||= :NEW_TO_OLD
     @label_o ||= "Neuste zuerst"
     @label_f ||= "Alle"
  end

  def filter
    @filter_scope = params[:filter_scope].to_sym
    filter_config = PRODUCT_FILTER[@filter_scope]
    @label_f = filter_config[:label]

    @order_scope = params[:order_scope].to_sym
    order_config = PRODUCT_SORT[@order_scope]
    @label_o = order_config[:label]

    @products = Product.try(filter_config[:method]).try(order_config[:method])

    respond_to do |format|
      format.html { render "index" }
      format.json { render json: @products }
    end
  end

  def search
    if params[:search].blank?
      redirect_to(root_path, alert: "Empty field!") and return
    else
      @parameter = params[:search].downcase
      @products = Product.all.where("lower(name) LIKE :search", search: "%#{@parameter}%")
    end

    respond_to do |format|
      format.html { render "index" }
      format.json { render json: @products }
    end

  end

  # GET /products/'productid'
  def show
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/'productid'/edit
  def edit
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:name, :price, :description, :picture, :cloth_type)
    end
  end
