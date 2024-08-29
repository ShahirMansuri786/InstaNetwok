// app/javascript/channels/chat_channel.js
import consumer from "./consumer"

document.addEventListener('turbolinks:load', () => {
  const messages = document.getElementById('messages');
  if (messages) {
    consumer.subscriptions.create("ChatChannel", {
      received(data) {
        messages.insertAdjacentHTML('beforeend', data.message);
        console.log(data)
        messages.scrollTop = messages.scrollHeight;
      }
    });
  }
});
