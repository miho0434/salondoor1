class SalonsController < ApplicationController
  def index
    @salons = Salon.order("created_at DESC")
    @comment = Comment.new
  end

  def new
    @salon = Salon.new
  end

  def create
    @salon = Salon.new(salon_params)
    if @salon.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @salon = Salon.find(params[:id])
  end

  private  
  
  def salon_params
    params.require(:salon).permit(:salon_email, :store_name, :corporate_name,
     :prefecture_id, :city, :street_number, :building_name, :station, :established, :offices, :image)
    
  end
end
