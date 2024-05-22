# Kawasaki Robot UDP Communication

This repository contains example code to demonstrate how to establish a UDP communication between a PC and a Kawasaki robot.

## Files

- `robot_script.as`: Kawasaki robot AS language script to receive UDP messages.
- `send_message.py`: Python script to send UDP messages to the robot.

## Setup

### Kawasaki Robot

1. Set up the robot with the provided script `robot_script.as`.
2. Ensure the robot's IP address and port are correctly configured.

### Python Script

1. Ensure you have Python installed on your PC.
2. Update the `ROBOT_IP` and `ROBOT_PORT` variables in `send_message.py` to match your robot's configuration.

## Usage

1. Run the Kawasaki robot script on the robot.
2. Execute the Python script on your PC to send messages to the robot:

```bash
python send_message.py
