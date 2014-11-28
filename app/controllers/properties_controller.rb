class PropertiesController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]

  def new
  	  @property = Property.new 
  end

  def create
  	 @property= current_user.properties.build(property_params)
    if @property.save
      flash[:success] = "Property created!"
      redirect_to @property
  
    else
      render 'new'
    end


  end

  def destroy
    Property.find(params[:id]).destroy
    flash[:success] = "Property Deleted"
    redirect_to properties_url

  end

  def index
  	  	  @property = Property.all
          @user = current_user
  end

  def show
 
  @property = Property.find(params[:id])
  end

  private

    def property_params
      params.require(:property).permit(:propertytype , :address ,:location , :bedrooms ,
      	:bathrooms	,:otherroom , :rent)
    
    end
end

