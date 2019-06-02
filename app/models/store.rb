class Movement < ApplicationRecord
  include RandomizeId
  
  has_many :movements

  enum type: %i[]
  enum kind: %i[entrada saida]
end
  