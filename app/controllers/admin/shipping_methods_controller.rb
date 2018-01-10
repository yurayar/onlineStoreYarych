class Admin::ShippingMethodsController < Admin::BaseController
  before_action :set_shipping_method, only: [:edit, :update, :destroy]

  # GET /shipping_methods
  # GET /shipping_methods.json
  def index
    @shipping_methods = ShippingMethod.all
  end

  # GET /shipping_methods/new
  def new
    @shipping_method = ShippingMethod.new
  end

  # GET /shipping_methods/1/edit
  def edit
  end

  # POST /shipping_methods
  # POST /shipping_methods.json
  def create
    @shipping_method = ShippingMethod.new(shipping_method_params)

    respond_to do |format|
      if @shipping_method.save
        format.html { redirect_to admin_shipping_methods_url, notice: 'Shipping method was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /shipping_methods/1
  # PATCH/PUT /shipping_methods/1.json
  def update
    respond_to do |format|
      if @shipping_method.update(shipping_method_params)
        format.html { redirect_to admin_shipping_methods_url, notice: 'Shipping method was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /shipping_methods/1
  # DELETE /shipping_methods/1.json
  def destroy
    @shipping_method.destroy
    respond_to do |format|
      format.html { redirect_to admin_shipping_methods_url, notice: 'Shipping method was successfully destroyed.' }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_shipping_method
    @shipping_method = ShippingMethod.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def shipping_method_params
    params.require(:shipping_method).permit(:name, :cost)
  end
end
