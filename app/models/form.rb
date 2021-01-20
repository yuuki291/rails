class Form < ApplicationRecord
    validates :phone, presence: true,
    numericality:{
        only_integer: true
        
    }
end
