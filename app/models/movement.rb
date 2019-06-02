class Movement < ApplicationRecord
  include RandomizeId
  
  belongs_to :store

  enum type: [:null, :Débito, :Boleto, :Financiamento, :Crédito, :Emprestimo, :Vendas, :ted, :doc, :Aluguel]
  enum kind: %i[entrada saida]
end
  