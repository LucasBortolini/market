class ProductsController < ApplicationController
  layout "admin"
  before_action :set_product, only: %i[ show edit update destroy view buy ]

  # GET /products or /products.json
  def index
    @products = Product.all
  end

  # GET /products/1 or /products/1.json
  def show
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products or /products.json
  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to product_url(@product), notice: "Product was successfully created." }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1 or /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to product_url(@product), notice: "Product was successfully updated." }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1 or /products/1.json
  def destroy
    @product.destroy

    respond_to do |format|
      format.html { redirect_to products_url, notice: "Product was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  # GET /products/1 or /products/1.json
  def view
    render layout: "application"
  end

  # GET /products/1/buy
  def buy
    customer = Customer.all.sample
    employee = Employee.all.sample
    branch = Branch.all.sample
    storage = Storage.find_by({ product_id: @product.id, branch_id: branch.id })

    if (storage.quantity > 1)
      Order.create!({
        branch: branch,
        customer: customer,
        employee: employee,
        price: @product.price,
        product: @product
      })

      redirect_to root_path, notice: "Produto comprado pelo cliente #{customer.name},
          vendido pelo funcion??rio #{employee.name}
          na filial #{branch.name}"
    else
      redirect_to product_view_url(@product), notice: "OOPS! A filial #{branch.name} est?? sem estoque!"
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def product_params
      params.require(:product).permit(:name, :price, :quantity, :brand, :sku, :branch_id)
    end
end
