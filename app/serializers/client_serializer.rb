class ClientSerializer < ActiveModel::Serializer
  attributes :id, :name, :age, :total_charge

  def total_charge
    self.object.memberships.map {|mem| mem.charge}.sum
  end
end
