function openUI() {
    document.getElementById('ui-container').style.display = 'block';
}

function closeUI() {
    document.getElementById('ui-container').style.display = 'none';
    fetch('https://your-resource-name/closeUI', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        }
    });
}

function sendChatCommand(command) {
    // Implement your logic to send a chat command to the server here
    // You need to replace the endpoint with your actual server endpoint.
    fetch('https://your-resource-name/chatCommand', {
        method: 'POST',
        body: JSON.stringify({ command }),
        headers: {
            'Content-Type': 'application/json'
        }
    });
}
