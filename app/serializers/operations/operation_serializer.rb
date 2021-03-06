class Operations::OperationSerializer < ApplicationSerializer
  attribute :id
  attribute :thread_id
  attribute :title
  attribute :text
  attribute :image
  attribute :start
  attribute :hidden
  attribute :locked
  attribute :participating
  attribute :number_of_participants
  attribute :number_of_slots

  belongs_to :author

  def hidden
    object.hidden == 1
  end

  def locked
    object.locked == 1
  end

  def participating
    object.participating? scope
  end

  def start
    local_to_utc(object.start)
  end
end
