import consumer from "channels/consumer";

consumer.subscriptions.create("FightsChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
    console.log("connectd : ", this);
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    console.log(data);
    // Called when there's incoming data on the websocket for this channel
    const count = data.count;
    const html = `${count}人
        `;
    const fights = document.getElementById("fights");
    fights.innerHTML = html;
  },
});
