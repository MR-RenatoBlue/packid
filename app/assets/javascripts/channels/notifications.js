$(document).on("turbolinks:load", function(){
  if ($("meta[name='current-user']").length > 0) {
    App.notifications = App.cable.subscriptions.create("NotificationsChannel", {
      connected: function() {
        console.log("connected to notification chanel");
      },

      disconnected: function() {
        // Called when the subscription has been terminated by the server
      },

      received: function(data) {
        // Called when there's incoming data on the websocket for this channel
        $("#notifications").prepend(data.html);
        notifications = document.getElementById('notifications');

        notifications.innerHTML +=
          "<h2>" + data.title + "</h2>";

        notifications.innerHTML +=
          "<p>" + data.content + "</p>";
      }
    });
  }
});