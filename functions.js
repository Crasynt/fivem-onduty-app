// Function to open the UI
function openUI() {
    // Your code to open the UI (HTML) here
    // For example, set the display property of a container to 'block'.
    document.getElementById('appContainer').style.display = 'block';
}

// Function to close the UI
function closeUI() {
    // Your code to close the UI (HTML) here
    // For example, set the display property of a container to 'none'.
    document.getElementById('appContainer').style.display = 'none';
}

// Function to send a command to the chat
function sendChatCommand(command) {
    // You can customize this function to send the command to the chat.
    // In your FiveM context, you might need to communicate with Lua to send the command to chat.
    // Consider using the SendNUIMessage or similar functions to interact with Lua.
    console.log('Sending command: ' + command);
}

// Bind the function to close the UI when the "Escape" key is pressed
document.addEventListener('keydown', function (event) {
    if (event.key === 'Escape') {
        closeUI();
    }
});

// Export the functions to make them accessible from your HTML file
module.exports = {
    openUI,
    closeUI,
    sendChatCommand,
};
