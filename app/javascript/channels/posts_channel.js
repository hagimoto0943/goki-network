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
    const name = data.name;
    const date = data.created_at;
    const message = `
    <button class="flex items-center w-full px-5 py-2 transition-colors duration-200 gap-x-2 ">
      <i class="fa-solid fa-user w-8 h-8 rounded-full p-2 bg-neutral-400"></i>
        <div class="text-left rtl:text-right">
            <h1 class="text-sm font-medium text-gray-700 capitalize">${name}</h1>
            <p class="text-xs text-gray-500 "><%= l fight.user.created_at %>${date}</p>
        </div>
    </button>
        `;
    const alertMessage = document.getElementById("sideber");
    alertMessage.insertAdjacentHTML("afterbegin", message);
  },
});
