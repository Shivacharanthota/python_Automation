import json

json_data = {'name': 'charan', 'age': 24, 'city': 'Hyd'}

with open('data.json', 'w') as file:
    json.dump(json_data, file)

with open('data.json', 'r') as file:
    info = json.load(file)

print(info)
