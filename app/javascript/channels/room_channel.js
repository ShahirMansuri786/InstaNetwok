import consumer from "channels/consumer"

consumer.subscriptions.create( { channel: "RoomChannel" , room_id: 27 } , {
  connected() {
   console.log("connected")
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
   console.log(data)

  //  const messageContainer = document.getElementById('messages')

  //  messageContainer.innerHTML = messageContainer.innerHTML + data.message
  }
});
