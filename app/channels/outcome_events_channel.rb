class OutcomeEventsChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    outcome = Outcome.find(params[:id])
    stream_for outcome
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end


