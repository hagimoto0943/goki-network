import consumer from "channels/consumer";

consumer.subscriptions.create("PostsChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
    console.log("connectd : ", this);
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    // Called when there's incoming data on the websocket for this channel
    const messageName = data.name;
    const message = `
        <div class="items-center w-full max-w-xs p-4 animate-pulse text-gray-500 bg-white rounded-lg shadow role="alert">
          <div class="ml-3 text-sm font-normal">${messageName}さんが退治を開始しました。</div>
        </div>`;
    const alertMessage = document.getElementById("alert");
    alertMessage.insertAdjacentHTML("afterbegin", message);
    function removeAlert() {
      alertMessage.classList.add("hidden");
    }
    setTimeout(() => {
      removeAlert();
    }, 5000);
  },
});
