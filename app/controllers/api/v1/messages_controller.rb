class API::V1::MessagesController < ApplicationController
  # GET /messages
  # GET /messages.json
  def index

    u = User.find(params[:user_id])
    c =  Collection.find params[:collection_id]
    # may want to check if c.users has u in it?
    @messages = c.messages

    # @messages = Message.all

    render json: @messages
  end

  # GET /messages/1
  # GET /messages/1.json
  def show
    @message = Message.find(params[:id])

    render json: @message
  end

  # POST /messages
  # POST /messages.json
  def create

    u = params[:user_id]
    c = params[:collection_id]

    @message = Message.new(message_params)
    @message.collection_id = c
    @message.user_id = u

    if @message.save
      Apns.send_message(@message)
      render json: @message
    else
      render json: @message.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /messages/1
  # PATCH/PUT /messages/1.json
  def update
    @message = Message.find(params[:id])

    if @message.update(params[:message])
      head :no_content
    else
      render json: @message.errors, status: :unprocessable_entity
    end
  end

  # DELETE /messages/1
  # DELETE /messages/1.json
  def destroy
    @message = Message.find(params[:id])
    @message.destroy

    head :no_content
  end

  def message_params
    params.permit(:notes, :pdp_id, :image_id, :rating, :thumbnail_url, :user_id, :collection_id)
  end
end
