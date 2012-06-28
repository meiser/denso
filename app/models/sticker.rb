class Sticker# < ActiveRecord::Base

  include ActiveModel::Validations
  include ActiveModel::Conversion
  include ActiveModel::MassAssignmentSecurity
  extend ActiveModel::Naming
  extend ActiveModel::Translation

  attr_accessor :unique_number
  attr_accessible :unique_number


  def persisted?
   false
  end

  def key

  end

end

