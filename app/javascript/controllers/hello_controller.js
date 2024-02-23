import { Controller } from "@hotwired/stimulus"
import consumer from "../channels/consumer"

export default class extends Controller {
  connect() {
    const outcomeId = this.element.getAttribute("id");
    this.subscribeToOutcome(outcomeId);
  }
  subscribeToOutcome(id) {
    consumer.subscriptions.create({ channel: "OutcomeEventsChannel", id }, {
      received(data) {
          const event = JSON.parse(data);
          if(event.action === 'redirect') {
            window.location.replace(event.url);
          }
      }
    });
  }
}
