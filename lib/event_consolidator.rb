class EventConsolidator
  attr_reader :events

  def initialize(events:)
    @events = events
    @consolidated_events = []
  end

  def consolidate
    reducer(all_events: events.dup) if @consolidated_events.empty?

    @consolidated_events
  end

  private

  def reducer(all_events:)
    return if all_events.count.zero?

    event = all_events.shift
    other_event_fragments = other_fragments(events: all_events, event_fragment: event)

    if other_event_fragments.any?
      other_event_fragments.each { |fragment| event.merge!(fragment) }
      all_events = all_events - other_event_fragments
    end

    @consolidated_events << event
    reducer(all_events: all_events)
  end

  def other_fragments(events:, event_fragment:)
    events.select { |event| event[:date] == event_fragment[:date] }
  end
end
