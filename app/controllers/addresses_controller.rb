class AddressesController < ApplicationController
  before_action :find_person, except: :new

  def index
    @addresses = @person.addresses
  end

  def new
    @address = Address.new
    @address_types = AddressType.all
  end

  def create
    @person.addresses.create(address_params)
    redirect_to person_addresses_path
  end

  def edit
    @address = Address.find(params[:id])
    @address_types = AddressType.all
    render 'new'
  end

  def update
    Address.find(params[:id]).update(address_params)
    redirect_to person_addresses_path
  end

  private

  def address_params
    params.require(:address).permit(:street, :city, :state, :country, :address_type_id)
  end

  def find_person
    @person = Person.find(params[:person_id])
  end
end
