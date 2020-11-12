class Day < ActiveHash::Base
  self.data [
    {id: 1, name: "A"}
    {id: 2, name: "A"}
    {id: 3, name: "A"}
    {id: 4, name: "A"}
    {id: 5, name: "A"}
    {id: 6, name: "A"}
    {id: 7, name: "A"}
    {id: 8, name: "A"}
    {id: 9, name: "A"}
    {id: 10, name: "A"}
    {id: 11, name: "A"}
    {id: 12, name: "A"}
  ]
end

include ActiveHash::Associations
has_many :items