class Api::ItemsController < ApiController
  before_action :authenticated?
 
  def create
    item = Item.new(item_params)
    
    if item.save
      render json: item
    else
      render json: { errors: item.errors.full_messages }, status: :unprocessable_entity
    end
    
  end
  
  def update
    item = Item.find(params[:id])
    list = item.list
    if item.update(item_params) && (list.user == current_user)
      render json: item
    else
      render json: { errors: item.errors.full_messages }, status: :unprocessable_entity
    end
  end
  
  def destroy
    begin
      item = Item.find(params[:id])
      list = item.list
      
      if item.destroy && (list.user == current_user)
        render json: {}, status: :no_content
      end
      
    rescue ActiveRecord::RecordNotFound
      render :json => {}, :status => :not_found
    end
  end
  
  private
  
  def item_params
    params.require(:item).permit(:name, :list_id)
  end

end