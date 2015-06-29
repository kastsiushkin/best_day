# == Schema Information
#
# Table name: activities
#
#  id          :integer          not null, primary key
#  name        :string
#  description :text
#  address     :string
#  time        :datetime
#  cost        :float
#  hardness    :integer
#  duration    :float
#  day_id      :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Activity < ActiveRecord::Base
  belongs_to :day

  validates_presence_of :name, :description, :address, :time, :cost, :hardness, :duration, :day_id
end
