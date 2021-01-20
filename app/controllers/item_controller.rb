require './EC/Sale'
class ItemController < ApplicationController
  def sale
  end

  def pay
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      :amount => @cart.total_price,
      :card => params['payjp-token'],
      :currency => 'jpy'
    )

    intbox = Sale.foo(1,100)
 
    if intbox.floor <= 5
     @probability = 1 # 判定変数 ・・・ 真1
    else 
     @probability = 0 # 判定変数 ・・・ 偽0
    end 
 
    @i = Magnification.fa
 
    @a = 1.0 - @i
 
    @a.round(1) #支払い分
 
    @i.round(1) #割合い
  
  end
end
