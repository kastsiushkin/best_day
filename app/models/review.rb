# == Schema Information
#
# Table name: reviews
#
#  id          :integer          not null, primary key
#  description :text
#  rating      :integer
#  day_id      :integer
#  user_id     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :day

  validates_presence_of :rating, :description, :day_id, :user_id
end
