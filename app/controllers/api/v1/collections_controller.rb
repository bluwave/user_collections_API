class API::V1::CollectionsController < ApplicationController

  # GET /collections
  # GET /collections.json
  def index

    if(params[:user_id])
      u = User.find(params[:user_id])
      @collections = u.collections
    else
      p "\n** could not find user id **\n"
      @collections = Collection.all
    end


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

    if (params[:users] && params[:collection])
      res = CollectionUserTransaction.save_user_and_collection(params)
      if (res.instance_of?(String))
        error_info = {:error => res}
        render json: error_info.to_json, status: :unprocessable_entity
      else
        render json: res
      end
    else
      error_info = {:error => "need user and collection"}
      render json: error_info.to_json, status: :unprocessable_entity
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
    params.permit(:name)
  end

  def new_user_collection_params
    params.permit(:user, :collection)
  end
end
