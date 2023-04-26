module Tracking
  module Aggregates
    class Visit
      include AggregateRoot

      def start
        apply Events::VisitStarted.new(data: { "start_at" => Time.current })
      end

      def finish
        apply Events::VisitFinished.new(data: { "finish_at" => Time.current})
      end

      on Events::VisitStarted do |event|
        @start_at = event.data.fetch("start_at")
      end

      on Events::VisitFinished do |event|
        @finish_at = event.data.fetch("finish_at")
      end

      attr_reader :start_at, :finish_at

      # stream_name = "visit-#{visit_id}-rentals-search-#{rentals_search_id}-rentals-page-visit-#{rentals_page_visit_id}-payments_page-"
    end
  end
end