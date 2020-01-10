class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  # GET /products
  def index
     @products ||= Product.new_to_old
     @label_o ||= $new_to_old_l
     @label_f ||= $all_clothes_l
  end

  def filter

    case params[:filter]
    when $all_clothes_l
      @products = Product.all_types
      @label_f = $all_clothes_l
    when $t_shirt_l
      @products = Product.shirt_only
      @label_f = $t_shirt_l
    when $pullover_l
      @products = Product.pullover_only
      @label_f = $pullover_l
    end

    case params[:order]
    when $low_to_high_l
      @label_o = $low_to_high_l
      @products = @products.low_to_high
    when $high_to_low_l
      @label_o = $high_to_low_l
      @products = @products.high_to_low
    when $old_to_new_l
      @label_o = $old_to_new_l
      @products = @products.old_to_new
    when $alphabetic_l
      @label_o = $alphabetic_l
      @products = @products.alphabetic
    when $new_to_old_l
      @label_o = $new_to_old_l
      @products = @products.new_to_old
    end

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
