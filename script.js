function openUI() {
    document.getElementById('ui-container').style.display = 'block';
}

function closeUI() {
    document.getElementById('ui-container').style.display = 'none';
}

function sendChatCommand(command) {
    // Implement your logic to send a chat command to the server here
    // You need to replace the endpoint with your actual server endpoint.
    fetch('/your-chat-command-endpoint', {
        method: 'POST',
        body: JSON.stringify({ command }),
        headers: {
            'Content-Type': 'application/json'
        }
    });
}
