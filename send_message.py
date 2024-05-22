import socket

ROBOT_IP = '192.168.0.1'  # Replace with your robot's IP address
ROBOT_PORT = 10010  # Replace with the port your robot is listening on

def send_message(message):
    """Send a message to the Kawasaki robot via UDP."""
    with socket.socket(socket.AF_INET, socket.SOCK_DGRAM) as sock:
        try:
            # Send message to the robot
            sock.sendto(message.encode(), (ROBOT_IP, ROBOT_PORT))
            print(f"Message '{message}' sent to robot")
        except Exception as e:
            print(f"Error sending message to robot: {e}")

# Example usage
if __name__ == "__main__":
    message = "Hello Robot"
    send_message(message)
