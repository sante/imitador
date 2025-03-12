// Global variables
let microbitDevice = null;
let isConnected = false;
let isReading = false;
let lastSentTime = 0;
let lastValue = null;
const THROTTLE_INTERVAL = 20; // 20ms throttle interval

// Function to handle all micro:bit events received from uBitOpenDevice
function handleMicrobitEvents(event, device, data) {
  // console.log("micro:bit event:", event, data);

  switch (event) {
    case "connected":
      console.log("micro:bit connected successfully");
      isConnected = true;
      microbitDevice = device;
      break;

    case "disconnected":
      console.log("micro:bit disconnected");
      isConnected = false;
      microbitDevice = null;
      break;

    case "connection failure":
      console.error("Failed to connect to micro:bit");
      alert(
        "Error connecting to micro:bit. Make sure it's properly connected and try again."
      );
      isConnected = false;
      break;

    case "error":
      console.error("micro:bit error:", data);
      break;

    case "console":
      // Handle console data (plain text)
      if (data && data.data) {
        processSerialData(data.data);
      }
      break;

    case "graph-data":
      // Handle graph data (numeric)
      if (data && data.data !== undefined) {
        // Convert graph data to a normalized value
        const value = data.data;
        const normalizedValue = Math.max(0, Math.min(1, value / 255.0));
        console.log("Graph data received:", data);
        console.log("Normalized value for game:", normalizedValue);

        // Send to throttled sender
        sendThrottledValue(normalizedValue);
      }
      break;

    case "graph-event":
      // Handle graph events (string data)
      if (data && data.data) {
        console.log("Graph event received:", data);
      }
      break;
  }
}

// Process data received from the micro:bit
function processSerialData(data) {
  try {
    // Log raw data for debugging
    // console.log("Raw micro:bit data received:", data);

    // Try multiple formats for parsing

    // Format 1: Try as plain text
    const dataString = data.toString().trim();
    // console.log("Data as string:", dataString);

    // Try to extract a value from the data
    let value = null;

    // Format 2: Parse as simple number
    const simpleNumber = parseInt(dataString, 10);
    if (!isNaN(simpleNumber)) {
      // console.log("Parsed as simple number:", simpleNumber);
      value = simpleNumber;
    }

    // Format 3: Check for key:value format (x:123)
    const keyValueMatch = dataString.match(/x:(\d+)/);
    if (keyValueMatch && keyValueMatch[1]) {
      const parsedValue = parseInt(keyValueMatch[1], 10);
      if (!isNaN(parsedValue)) {
        // console.log("Parsed from key:value format:", parsedValue);
        value = parsedValue;
      }
    }

    // If we got a value, send it to the game
    if (value !== null) {
      // Normalize to 0-1 range for the game
      const normalizedValue = Math.max(0, Math.min(1, value / 255.0));
      // console.log("Final normalized value for game:", normalizedValue);

      // Send to throttled sender instead of direct callback
      sendThrottledValue(normalizedValue);
    } else {
      console.log("Could not extract a usable value from data");
    }
  } catch (error) {
    console.error("Error processing serial data:", error);
  }
}

// Send throttled values at a consistent interval
function sendThrottledValue(value) {
  // Store the latest value
  lastValue = value;

  // If we don't have a timer running, start one
  if (!window.microbitProcessTimer) {
    window.microbitProcessTimer = setInterval(() => {
      // Only send if we have a value and a callback
      if (
        lastValue !== null &&
        typeof window.flutterMicrobitCallback === "function"
      ) {
        window.flutterMicrobitCallback(lastValue);
        // Reset last value to null to avoid duplicate sends
        lastValue = null;
      }
    }, THROTTLE_INTERVAL);
  }
}

// Function to be called from Flutter to initialize the micro:bit connection
window.connectMicrobit = function () {
  return new Promise(async (resolve, reject) => {
    console.log("Requesting micro:bit connection...");

    // Use the uBitConnectDevice function from ubitwebusb.js
    try {
      uBitConnectDevice(handleMicrobitEvents);

      // This is asynchronous and will be resolved via the handleMicrobitEvents callback
      // We'll wait a moment and check if the device was connected
      setTimeout(() => {
        if (isConnected && microbitDevice) {
          resolve(true);
        } else {
          // If not connected after timeout, assume failure
          resolve(false);
        }
      }, 5000); // Give it 5 seconds to connect
    } catch (connectError) {
      console.error("Error during micro:bit connection:", connectError);
      alert(
        "Error connecting to micro:bit. Make sure it's properly connected and try again."
      );
      resolve(false);
    }
  });
};

// Function to send data to micro:bit
window.sendToMicrobit = function (data) {
  if (microbitDevice && isConnected) {
    try {
      uBitSend(microbitDevice, data);
      return true;
    } catch (error) {
      console.error("Error sending data to micro:bit:", error);
      return false;
    }
  }
  return false;
};

// Function to disconnect micro:bit
window.disconnectMicrobit = function () {
  return new Promise(async (resolve, reject) => {
    if (microbitDevice && isConnected) {
      try {
        // Clear the processing timer if it exists
        if (window.microbitProcessTimer) {
          clearInterval(window.microbitProcessTimer);
          window.microbitProcessTimer = null;
        }

        await uBitDisconnect(microbitDevice);
        isConnected = false;
        microbitDevice = null;
        resolve(true);
      } catch (error) {
        console.error("Error disconnecting micro:bit:", error);
        resolve(false);
      }
    } else {
      resolve(false);
    }
  });
};

// Automatically handle disconnection events
navigator.usb.addEventListener("disconnect", (event) => {
  if (microbitDevice && event.device === microbitDevice) {
    console.log("micro:bit disconnected");
    isConnected = false;
    microbitDevice = null;
  }
});
