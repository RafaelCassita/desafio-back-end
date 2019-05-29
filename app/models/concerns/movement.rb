class Movement < ApplicationRecord
  include RandomizeId
  
  belongs_to :store

  enum type: %i[]
  enum kind: %i[entrada saida]
end
  