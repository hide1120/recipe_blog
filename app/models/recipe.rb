class Recipe < ApplicationRecord
  # 保存する前に乱数に変換
  before_create :random_set_id

  # COMMON VALIDATES
  validates :title, presence: true

  # MAINVISUAL UPLOADER
  mount_uploader :mainvisual, MainvisualUploader

  has_many :recipe_ingredients,
           dependent: :destroy,
           foreign_key: :recipe_id
  # has_many :how_to_makes,
  #          dependent: :destroy,
  #          foreign_key: :recipe_id
  accepts_nested_attributes_for :recipe_ingredients,
                                :reject_if => :all_blank,
                                #:how_to_makes,

                                allow_destroy: true


    private
      # idを乱数に変換
      def random_set_id
        while self.id.blank? || Recipe.find_by(id: self.id).present? do
          self.id = SecureRandom.urlsafe_base64(10)
        end
      end
end
