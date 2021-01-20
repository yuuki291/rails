class CartPdf < Prawn::Document
  def initialize(line_items,products)
    super()
    # 座標を表示
    stroke_axis
    font 'app/assets/fonts/ipaexm00401/ipaexm.ttf' 
    t = Time.new
    @line_item = LineItem.all
    @product = Product.all.order("created_at desc")

    # bunding_boxメソッドでボックスを生成
    # 引数にはボックス生成位置、横、縦のサイズを指定
    bounding_box([20, 720], width: 300, height: 150) do
      # textメソッドでテキストを挿入。引数には文字サイズとalignを指定できる。:left, :right, :center
      text "〒123-4567", size: 10, align: :left

      # move_downメソッドで次のテキストの書き出し位置を下げている
      move_down 10
      text "東京都新宿区新宿1-1-1", size: 10, align: :left

      move_down 10
      text "ご担当者 様", size: 12, align: :left
    end

    bounding_box([400, 720], width: 300, height: 150) do
      text '株式会社Avalon', size: 12, align: :left
      move_down 5
      text '〒103-0021', size: 10, align: :left
      move_down 5
      text '大阪府大阪市中央区中央1-1-1', size: 10, align: :left
      move_down 5
      text '大阪中央ビル4F 経理部経理課', size: 10, align: :left
      move_down 5
      text 'TEL: 03-1234-5678', size: 10, align: :left
    end

    text '購入履歴', size: 20, align: :center

    bounding_box([400, 520], width: 300, height: 60) do
      text "日付：" "#{t.year}年#{t.month}月#{t.day}日", size: 10, align: :left
    end

    bounding_box([230, 500],width:120) do
      @line_item.each do |line_item|
          @product.map do |product| 
            if line_item.product_id == product.id
              table [
                    ['商品名',"#{product.title}"],
                    ['種類',"#{product.novel}"],
                    ['単価',"#{product.price}"]]
              end
            end
          end
        end
    
    bounding_box([180, 80], width: 300, height: 100) do
      text '振込先　　　　日本銀行 本店 20201', size: 10, align: :left
      move_down 20
      text '　　　　　　　普通：　1234567', size: 10, align: :left
    end
    end
  end
    