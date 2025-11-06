import json

json_data = '{"name": "charan", "age": 24, "city": "Hyd"}'

data = json.loads(json_data)

## pritig the dictonary
print(data)

# Getting specife info
print(data['name'])

## Adding new info
data['country'] = 'India'
data['age']= '28'

#print(data)

