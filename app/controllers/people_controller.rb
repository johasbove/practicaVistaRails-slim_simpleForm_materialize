class PeopleController < ApplicationController

  def index
    @people = Person.all
  end

  def new
    @person = Person.new
  end

  def create
    Person.create(person_params)
    redirect_to people_path
  end

  def edit
    @person = Person.find(params[:id])
    render 'new'
  end

  def update
    Person.find(params[:id]).update(person_params)
    redirect_to people_path
  end

  private

  def person_params
    params.require(:person)
      .permit(:name, :last_name, :ci_number, :birthday, addresses_attributes: [:street, :city, :state, :country, :address_type_id])
  end
end
