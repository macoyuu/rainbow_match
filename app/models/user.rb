class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
  belongs_to :gender_identity
  belongs_to :sexual_orientation
  belongs_to :body_type
  belongs_to :purpose
  has_one_attached :image

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         validates :nickname, presence: true

         PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i
         validates_format_of :password, with: PASSWORD_REGEX, message: 'には半角英字と数字の両方を含めて設定してください'
       
         with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: '全角文字を使用してください' } do
           validates :family_name
           validates :last_name
         end
       
         with_options presence: true, format: { with: /\A[ァ-ヶー]+\z/, message: '全角カタカナを使用してください' } do
           validates :family_name_kana
           validates :last_name_kana
         end
       
         validates :birth_date, presence: true
         validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
         validates :gender_identity_id, numericality: { other_than: 1, message: "can't be blank" }
         validates :sexual_orientation_1_id, numericality: { other_than: 1, message: "can't be blank" }
         validates :height, presence: true
         validates :body_type_id, numericality: { other_than: 1, message: "can't be blank" }
         validates :purpose_id, numericality: { other_than: 1, message: "can't be blank" }
         validates :self_pr, presence: true
         validates :image, presence: true
       
         has_many :messages
         has_many :likes
      end
