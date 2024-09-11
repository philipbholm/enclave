#!/usr/local/bin/python3

import socket


def main():
    sock = socket.socket(socket.AF_VSOCK, socket.SOCK_STREAM)
    sock.bind((socket.VMADDR_CID_ANY, 5005))
    sock.listen()
    print("Enclave listening on port 5005")

    while True:
        conn, addr = sock.accept()
        print(f"Connected to {addr}")
        try:
            data = conn.recv(1024).decode("UTF-8")
            if not data:
                break
            print(f"Received data: {data}", flush=True)
        except Exception:
            break
        conn.close()


if __name__ == "__main__":
    main()
