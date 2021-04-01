class ItemsController < ApplicationController
    before_action :get_item, only: [:show, :update, :destroy]

    # GET /items - returns all items
    def index
        @items = Item.all
        render json: @items, status: :ok
    end

    # POST /items - create an Item
    def create
        @item = Item.create!(params.permit(:name))
        render json: @item, status: :created
    end

    # PUT /items/:id - update an Item
    def update
        @item.update(params.permit(:name))
        head :no_content
    end

    # GET /items/:id - get a single item with the given id
    def show
        render json: @item, status: :ok
    end

    # DELETE /items/:id - delete the item with the given id if it exists
    def destroy
        @item.destroy
        head :no_content
    end

    private

    def get_item
        @item = Item.find(params[:id])
    end
end
