class ListSerializer < ActiveModel::Serializer
  attributes :id, :permissions, :name
  has_one :user
end
