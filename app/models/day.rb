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
#

class Day < ActiveRecord::Base
  has_many :activities

  validates_presence_of :name, :description, :location
end
