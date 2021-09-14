class Recipe < ApplicationRecord
  # 保存する前に乱数に変換
  before_create :random_set_id

  # COMMON VALIDATES
  validates :title, :description,
            presence: true

    private
      # idを乱数に変換
      def random_set_id
        while self.id.blank? || Recipe.find_by(id: self.id).present? do
          self.id = SecureRandom.urlsafe_base64(10)
        end
      end
end
