class OrderItemsController < ApplicationController
  before_action :set_order_item, only: [:show, :edit, :destroy]
  before_action :load_order, only: [:create]

  # # GET /order_items
  # # GET /order_items.json
  def index
    @order_items = OrderItem.all
  end
  #
  # # GET /order_items/1
  # # GET /order_items/1.json
  # def show
  # end
  #
  # # GET /order_items/new
  # def new
  #   @order_item = OrderItem.new
  # end

  # GET /order_items/1/edit
  def edit
  end

  # POST /order_items
  # POST /order_items.json
  def create
    @order_item = @order.order_items.where(product_id: params[:product_id]).first_or_initialize
    @order_item.quantity = @order_item.quantity + 1
    respond_to do |format|
      if @order_item.save
        format.html { redirect_to @order, notice: 'Successfully added product to cart.' }
        format.json { render :show, status: :created, location: @order_item }
      else
        format.html { render :new }
        format.json { render json: @order_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /order_items/1
  # PATCH/PUT /order_items/1.json
  def update
    @order_item = OrderItem.find(params[:id])
    respond_to do |format|
      if (params[:order_item][:quantity].to_i) == 0
        @order_item.destroy
        format.html { redirect_to orders_path, notice: 'Order item was removed updated.' }
      elsif
        @order_item.update(order_item_params)
        format.html { redirect_to orders_path, notice: 'Order item was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /order_items/1
  # DELETE /order_items/1.json
  def destroy
    @order_item.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'Order item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order_item
      @order_item = OrderItem.find(params[:id])
    end

    def load_order
      @order = Order.where(id: session[:order_id], status: "unsubmitted", user_id: session[:user_id]).first_or_initialize
        if @order.new_record?
          @order.save!
          session[:order_id] = @order.id
        end
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def order_item_params
      params.require(:order_item).permit(:product_id, :order_id, :quantity)
    end

end
