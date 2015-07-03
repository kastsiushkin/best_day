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
  belongs_to :user

  validates_presence_of :name, :description, :location, :user_id

  def self.search(query)
    query = query.downcase
    where('LOWER(location) like ?', "%#{query}%")
  end

  def total_cost
    
  end

end
