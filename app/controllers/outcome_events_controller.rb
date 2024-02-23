class OutcomeEventsController < ApplicationController
  include ActionController::Live

  def index
    response.headers['Content-Type'] = 'text/event-stream'
    response.headers['Last-Modified'] = Time.now.httpdate
    sse = SSE.new(response.stream, retry: 300, event: "outcome-events")

    begin
      30.times do |i|
        sse.write({ time: Time.now.to_s, message: "Message ##{i}" }, event: 'server-time')
        sleep 2
      end
    rescue IOError => e
      logger.info "Stream closed (IOError): #{e.message}"
    end
  ensure
    sse.close
  end
end
