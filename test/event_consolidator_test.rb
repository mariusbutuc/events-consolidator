require_relative 'test_helper'
require_relative '../lib/event_consolidator'

class EventConsolidatorTest < Minitest::Test
  def test_consolidate_returns_a_value
    consolidator = EventConsolidator.new(events: [])
    refute_nil consolidator.consolidate
  end
end
