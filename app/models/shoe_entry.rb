class ShoeEntry < ActiveRecord::Base
  belongs_to :user
  has_many :brands
  has_many :styles




end
