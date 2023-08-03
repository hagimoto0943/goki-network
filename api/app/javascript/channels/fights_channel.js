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
    const name = data.name;
    const date = data.created_at;
    const html = `
        <div class="flex flex-col items-center border-2 p-4 rounded-lg border-yellow-500">
            <div class="mb-2 h-24 w-24 overflow-hidden rounded-full bg-gray-100 shadow-lg md:mb-4 md:h-32 md:w-32">
              <i class="fa-solid fa-user w-24 h-24 rounded-full p-4 mx-auto bg-neutral-400"></i>
            </div>
            <div>
                <div class="text-center font-bold text-gray-800 md:text-lg">${name}</div>
                <p class="mb-3 text-center text-sm text-gray-500 md:mb-4 md:text-base">${date}</p>
                <div class="flex justify-center">
                    <div class="flex gap-4">
                    <span class="bg-green-100 text-green-800 text-sm font-medium mr-2 px-2.5 py-0.5 rounded dark:bg-green-900 dark:text-green-300">たった今退治を開始しました</span>
                    </div>
                </div>
            </div>
        </div>`;
    const fights = document.getElementById("fights");
    fights.insertAdjacentHTML("afterbegin", html);
  },
});
