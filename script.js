function OpenUI() {
    document.getElementById('ui-container').style.display = 'block';
}

function CloseUI() {
    document.getElementById('ui-container').style.display = 'none';
}

function sendChatCommand(command) {
    // Implement your logic to send a chat command to the server here
    // You can use JavaScript fetch or any other method to send the command.
    // Replace the endpoint with your actual server endpoint.
    fetch('/your-chat-command-endpoint', {
        method: 'POST',
        body: JSON.stringify({ command }),
        headers: {
            'Content-Type': 'application/json'
        }
    });
}
