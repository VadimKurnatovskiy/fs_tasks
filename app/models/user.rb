class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :events, dependent: :destroy

  validates :name, length: { maximum: 100 }, allow_blank: true
  before_validation :set_name, on: :create

  private

  def set_name
    self.name = 'Unidentified' if name.blank?
  end
end
