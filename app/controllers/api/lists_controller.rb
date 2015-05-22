class Api::ListsController < ApiController
  before_action :authenticated?
 
  def create
    list = List.new(list_params)
    
    if list.save
      render json: list
    else
      render json: { errors: list.errors.full_messages }, status: :unprocessable_entity
    end
    
  end
  
  def destroy
    begin
      list = List.find(params[:id])
      
      if list.destroy && (list.user == current_user)
        render json: {}, status: :no_content
      end
      
    rescue ActiveRecord::RecordNotFound
      render :json => {}, :status => :not_found
    end
  end
  
  def update
    list = List.find(params[:id])
    if list.update(list_params) && (list.user == current_user)
      render json: list
    else
      render json: { errors: list.errors.full_messages }, status: :unprocessable_entity
    end
  end
  
  private
  
  def list_params
    params.require(:list).permit(:name, :permissions, :user_id)
  end
 
end