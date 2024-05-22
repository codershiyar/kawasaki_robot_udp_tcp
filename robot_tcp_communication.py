import socket
import time
# This script is created by Coder Shiyar

def start_server(host, port):
    server_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    server_socket.bind((host, port))
    server_socket.listen(5)
    print(f"Server is listening on {host}:{port}")

    while True:
        client_socket, addr = server_socket.accept()
        print(f"Connected by {addr}")
        while True:
            response = '1'
            client_socket.sendall(response.encode())
            time.sleep(2)
            response = '2'
            client_socket.sendall(response.encode())
            time.sleep(3)

if __name__ == '__main__':
    HOST = '192.168.0.2'  # Your PC's IP address
    PORT = 10001  # Port to listen on (non-privileged ports are > 1023)
    start_server(HOST, PORT)
