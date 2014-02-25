class LoggerEntry
  include Mongoid::Document
  include Mongoid::Timestamps

  field :object_type, type: String
  field :object_id,   type: String
  field :action_type, type: String
  field :description, type: String
  field :data,        type: Hash

  attr_accessor :result

  before_create :prepare_result

  validates :object_type, :object_id, :action_type, :description, presence: true

  private

  def prepare_result
    self.data = LoggerSchema.prepare(self)
  end
end
