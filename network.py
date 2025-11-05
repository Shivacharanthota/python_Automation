import requests
response = requests.get('https://jsonplaceholder.typicode.com/posts/1')
if response.status_code == 200:
    print(response.json())
else:
    print(f'Error{response.status_code}')