class Kurasu < ActiveRecord::Base
	validates :course, presence: true
	validates :grade, presence: true
end
