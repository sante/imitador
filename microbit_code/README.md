# micro:bit Setup for Imitador Game

This guide explains how to set up your micro:bit to work as a controller for the Imitador game using the bsiever/microbit-webusb library.

## Requirements

- BBC micro:bit (v1 or v2)
- USB cable
- Computer with a web browser that supports WebUSB (Chrome, Edge, Opera)

## Setup Instructions

1. Connect your micro:bit to your computer using a USB cable
2. Copy the following code to the [MakeCode Editor](https://makecode.microbit.org/)

```blocks
let x = 0
let position = 127
basic.forever(function () {
    // Read accelerometer X axis (range -1023 to 1023)
    x = input.acceleration(Dimension.X)
    // Map accelerometer value to range 0-255 for USB output
    // When micro:bit is tilted left, value will be lower
    // When micro:bit is tilted right, value will be higher
    position = Math.map(x, -1023, 1023, 0, 255)
    // Constrain to valid range
    position = Math.constrain(position, 0, 255)
    serial.writeLine("" + (position))
})
```

3. Click the "Download" button to download the .hex file
4. Transfer the .hex file to your micro:bit
5. The micro:bit should now be ready to use with the game

## Using with the Game

1. Open the Imitador game in your web browser (Chrome, Edge, or Opera)
2. Click the "Connect micro:bit" button in the game interface
3. A dialog will appear asking you to select a device - choose your micro:bit
4. Once connected, the game will start using the micro:bit as input
5. Tilt the micro:bit left and right to control the game character

## How It Works

The game now uses the bsiever/microbit-webusb library to establish a reliable WebUSB connection with the micro:bit. This library handles all the complex USB communication details, making it much more reliable than direct WebUSB API calls.

The micro:bit program reads the accelerometer's X-axis value, maps it to a value between 0-255, and sends it over the serial connection. The library receives this data and our code converts it to control the game character.

## Troubleshooting

- If the connection fails, try disconnecting and reconnecting the micro:bit
- Make sure you're using a supported browser (Chrome, Edge, or Opera)
- Check that your micro:bit is properly flashed with the code above
- If you see connection errors:
  - Try unplugging and re-plugging your micro:bit
  - Press the reset button on the back of your micro:bit
  - Make sure no other programs are using the micro:bit
  - Restart your browser

## Technical Details

The bsiever/microbit-webusb library was created specifically for micro:bit WebUSB communication. It handles the complexities of the micro:bit's USB interface and provides a simple, reliable way to send and receive data. Learn more about the library at [https://github.com/bsiever/microbit-webusb](https://github.com/bsiever/microbit-webusb).
