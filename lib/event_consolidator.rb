class EventConsolidator
  attr_reader :events

  def initialize(events:)
    @events = events
  end

  def consolidate
    42
  end
end
