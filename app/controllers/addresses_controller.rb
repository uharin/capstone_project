class AddressesController < ApplicationController

  def create
    address = Address.new({
      address_number: params[:address_number],
      street: params[:street],
      city: params[:city],
      state: params[:state]
      })
    if address.save
      render json: address.as_json
    else
      render json: address.errors.full_messages
    end
  end

  def show
    address_id = params[:id]
    address = Address.find_by(id: address_id)
    render json: address.as_json
  end
  
  def destroy

  end

  def update

  end

end
