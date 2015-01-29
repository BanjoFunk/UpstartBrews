class BatchProcess < ActiveRecord::Base
  belongs_to :batches
  belongs_to :process_type

  scope :kind, lambda { |type| joins(:process_type).where("process_types.name = ?", type) }
  scope :order_kind, lambda { joins(:process_type).order('process_types.sort_order ASC') }
  scope :secured, lambda { joins(:process_type).where.not("process_types.secure") }
  scope :current, lambda { where.not(:started => nil).where(:stopped => nil) }

end
