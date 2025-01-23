from flask import Flask, jsonify, request
import json
import os

app = Flask(__name__)

# Path to the JSON file where data will be stored
DATA_FILE = 'data.json'

# Helper functions to interact with the JSON file
def read_data():
    if not os.path.exists(DATA_FILE):
        return []
    with open(DATA_FILE, 'r') as file:
        return json.load(file)

def write_data(data):
    with open(DATA_FILE, 'w') as file:
        json.dump(data, file, indent=4)

@app.route('/items', methods=['GET'])
def get_items():
    data = read_data()
    return jsonify(data)

@app.route('/item', methods=['POST'])
def create_item():
    new_item = request.get_json()
    data = read_data()
    new_id = len(data) + 1
    new_item['id'] = new_id
    data.append(new_item)
    write_data(data)
    return jsonify(new_item), 201

@app.route('/item/<int:item_id>', methods=['GET'])
def get_item(item_id):
    data = read_data()
    item = next((item for item in data if item['id'] == item_id), None)
    if item is None:
        return jsonify({"error": "Item not found"}), 404
    return jsonify(item)

@app.route('/item/<int:item_id>', methods=['PUT'])
def update_item(item_id):
    data = read_data()
    item = next((item for item in data if item['id'] == item_id), None)
    if item is None:
        return jsonify({"error": "Item not found"}), 404

    updated_data = request.get_json()
    item.update(updated_data)
    write_data(data)
    return jsonify(item)

@app.route('/item/<int:item_id>', methods=['DELETE'])
def delete_item(item_id):
    data = read_data()
    data = [item for item in data if item['id'] != item_id]
    write_data(data)
    return jsonify({"message": "Item deleted"}), 200

if __name__ == '__main__':
    app.run(debug=True)
