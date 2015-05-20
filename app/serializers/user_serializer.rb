class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :created_at

  # Delegate the practical definition of `full_name` to 
  # the User model, where it belongs, rather than 
  # (re)defining it here.
  
  def full_name
    object.name 
  end

  def created_at
    object.created_at.strftime('%B %d, %Y')
  end
  
end
