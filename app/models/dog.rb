class Dog < ApplicationRecord
  validates :name, :breed, :age, presence: true

  belongs_to :user
  has_many :dogs_walks
  has_many :walks, through: :dogs_walks

  accepts_nested_attributes_for :dogs_walks
    # belongs_to :user
    # has_and_belongs_to_many :walks

  def current_dog_walk(walk)
    DogsWalk.find_by(dog_id: self.id, walk_id:  walk.id)
  end

end
