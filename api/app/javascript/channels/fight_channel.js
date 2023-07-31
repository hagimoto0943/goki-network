import consumer from "./consumer";

consumer.subscriptions.create("FightChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    // Called when there's incoming data on the websocket for this channel
    // const html = `<p>${data.name}</p>`;
    // const fights = document.getElementById("fights");
    // fights.insertAdjacentHTML("afterbegin", html);
    console.log(data);
  },

  create_fight(data) {},
});
