class API::V1::CollectionsController < ApplicationController

  # GET /collections
  # GET /collections.json
  def index
    @collections = Collection.all
    render json: @collections
  end

  # GET /collections/1
  # GET /collections/1.json
  def show
    @collection = Collection.find(params[:id])

    render json: @collection
  end

  # POST /collections
  # POST /collections.json
  def create
    @collection = Collection.new(collection_params)
      if @collection.save
        render json: @collection
      else
        render json: @collection.errors, status: :unprocessable_entity
      end
  end

  # PATCH/PUT /collections/1
  # PATCH/PUT /collections/1.json
  def update
    @collection = Collection.find(params[:id])

    if @collection.update(params[:collection])
      head :no_content
    else
      render json: @collection.errors, status: :unprocessable_entity
    end
  end

  # DELETE /collections/1
  # DELETE /collections/1.json
  def destroy
    @collection = Collection.find(params[:id])
    @collection.destroy

    head :no_content
  end

  def collection_params
    params.permit(:name, :owner)
  end
end
