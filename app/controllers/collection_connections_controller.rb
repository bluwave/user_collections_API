class CollectionConnectionsController < ApplicationController
  # GET /collection_connections
  # GET /collection_connections.json
  def index
    @collection_connections = CollectionConnection.all

    render json: @collection_connections
  end

  # GET /collection_connections/1
  # GET /collection_connections/1.json
  def show
    @collection_connection = CollectionConnection.find(params[:id])

    render json: @collection_connection
  end

  # POST /collection_connections
  # POST /collection_connections.json
  def create
    @collection_connection = CollectionConnection.new(params[:collection_connection])

    if @collection_connection.save
      render json: @collection_connection, status: :created, location: @collection_connection
    else
      render json: @collection_connection.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /collection_connections/1
  # PATCH/PUT /collection_connections/1.json
  def update
    @collection_connection = CollectionConnection.find(params[:id])

    if @collection_connection.update(params[:collection_connection])
      head :no_content
    else
      render json: @collection_connection.errors, status: :unprocessable_entity
    end
  end

  # DELETE /collection_connections/1
  # DELETE /collection_connections/1.json
  def destroy
    @collection_connection = CollectionConnection.find(params[:id])
    @collection_connection.destroy

    head :no_content
  end
end
