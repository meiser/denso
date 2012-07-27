class Commission < ActiveRecord::Base
  attr_accessible :bundle_type, :length, :width, :height, :weight
end

