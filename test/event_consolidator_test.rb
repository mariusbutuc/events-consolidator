require_relative 'test_helper'
require_relative '../lib/event_consolidator'

class EventConsolidatorTest < Minitest::Test
  def test_consolidate_does_not_alter_original_events
    consolidator.consolidate

    assert_equal events, consolidator.events
  end

  def test_consolidate_reduces_events
    expected_output = [
      { date: '2014-01-01', a: 5, b: 1, xyz: 11 },
      { date: '2014-10-10', qbz: 5, v: 4, q: 1, strpm: -99 }
    ]

    assert_equal expected_output, consolidator.consolidate
  end

  def test_consolidate_is_idempotent
    expected_output = [
      { date: '2014-01-01', a: 5, b: 1, xyz: 11 },
      { date: '2014-10-10', qbz: 5, v: 4, q: 1, strpm: -99 }
    ]

    3.times { consolidator.consolidate }

    assert_equal expected_output, consolidator.consolidate
  end

  private

  def consolidator
    @consolidator ||= EventConsolidator.new(events: events)
  end

  def events
    @events ||= [
      { date: '2014-01-01', a: 5, b: 1 },
      { date: '2014-01-01', xyz: 11 },
      { date: '2014-10-10', qbz: 5 },
      { date: '2014-10-10', v: 4, q: 1, strpm: -99 }
    ]
  end
end
