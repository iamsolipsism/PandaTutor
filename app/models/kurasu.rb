class Kurasu < ActiveRecord::Base
	validates :department, presence: true
	validates :grade, presence: true
end
