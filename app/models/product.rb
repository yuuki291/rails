class Product < ApplicationRecord

    before_destroy :not_referenced_by_any_line_item
    # データ容量でエラーが起きないように上限を決める 処理
    mount_uploader :image, ImageUploader
    has_many :line_items
    belongs_to :user, optional: true
    validates :title, :novel, :price, :model, presence: true
    validates :description, length: { maximum: 1000, too_long: "%{count} :おめぇ～限界超えちまったよ！！"}

    validates :title, length: { maximum: 140, too_long: "%{count} :おめぇ～名前長すぎ！！ "}
    validates :price, length: { maximum: 7 }
    
    NOVEL = %w{ 恋愛 ホラー SF ファンタジー 経済 青春 }
    FINISH = %w{ ☆ ☆☆ ☆☆☆ ☆☆☆☆ ☆☆☆☆☆}

    private

    def not_referenced_by_any_line_item
      unless line_items.empty?
        errors.add(:base, "Line items product")
        throw :abort
      end
    end

end
