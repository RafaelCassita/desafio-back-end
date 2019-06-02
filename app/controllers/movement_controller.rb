class MovementController < ApplicationController
  
  def create
    cnab = params[:movements][:file].read
    movements = []
    cnab.each_line do |row|
      movements << row
    end
    movements.each do |movement|
      type = movement[0, 1].to_i
      type == 2 || type == 3 || type == 9 ? kind = 1 : kind = 0
      date = movement[1, 8].insert(6, '-').insert(4, '-')
      value = movement[9, 10].to_f / 100.0
      cpf = movement[19, 11]
      card_number = movement[30, 12]
      hour = movement[42, 6].insert(4, ':').insert(2, ':')
      performed_in = "#{data} #{hour} -3".to_datetime
      
      owner = movement[48, 14]
      name = movement[62, 19]
      store = create_store(name, owner)
      
      movement = movement.new(type: type, 
        performed_in: performed_in, 
        value: value,
        cpf: cpf, 
        card_number: card_number, 
        store_id: store.id)

      update_balance(kind)
      end
      redirect_to movements_path
    end

    def index
      @stores = Store.includes(:movements)
    end
  
    def new; end
    
    private
    def update_balance
      store.account_total += kind == 1 ? -value : value
    end
    def create_store(name, owner)
      Store.find_or_create_by(name: name, owner: owner)
    end
  end
