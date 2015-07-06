# == Schema Information
#
# Table name: days
#
#  id          :integer          not null, primary key
#  name        :string
#  description :text
#  location    :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :integer
#

class Day < ActiveRecord::Base
  has_many :activities, dependent: :destroy
  has_many :reviews, dependent: :destroy
  belongs_to :user

  validates_presence_of :name, :description, :location, :user_id

  def self.search(query)
    query = query.downcase
    where('LOWER(location) like ?', "%#{query}%")
  end

  def total_time
    self.activities.inject(0) { |sum, activity| sum + activity.duration}
  end

  def total_cost
    self.activities.inject(0) { |total, activity| total + activity.cost }
  end

  def average_difficulty
    self.activities.inject(0) { |sum, activity| sum + (activity.hardness || 0) } / self.activities.count
  end

  def average_rating
    self.reviews.inject(0) { |sum, review| sum + review.rating } / self.reviews.count.to_f
  end

end
