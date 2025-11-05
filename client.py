import socket
client_socket = socket.socket(socket.AF_INET,socket.SOCK_STREAM)

host = '127.0.0.1'
port = 12345

client_socket.connect((host,port))

message = "hello, server!"
client_socket.send(message.encode('utf-8'))

data = client_socket.recv(1024).decode('utf-8')
print(f'recived form server: {data}')

client_socket.close()
                   