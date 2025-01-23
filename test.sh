:<<'COMMENT'
touch test.txt
curl http://127.0.0.1:5000/items >> test.txt
sleep 1s
curl -X POST -H "Content-Type: application/json" -d '{"name": "New Item"}' http://127.0.0.1:5000/item >> test.txt
sleep 1s
curl http://127.0.0.1:5000/item/1 >> test.txt
sleep 1s
curl -X PUT -H "Content-Type: application/json" -d '{"name": "Updated Item"}' http://127.0.0.1:5000/item/1 >> test.txt
sleep 1s
curl http://127.0.0.1:5000/item/1 >> test.txt
sleep 1s
curl -X DELETE http://127.0.0.1:5000/item/1 >> test.txt
COMMENT

echo "Fetching all items..." >> test.txt
curl http://127.0.0.1:5000/items >> test.txt
sleep 1s

echo "Creating a new item..." >> test.txt
curl -X POST -H "Content-Type: application/json" -d '{"name": "New Item"}' http://127.0.0.1:5000/item >> test.txt
sleep 1s

echo "Fetching item with ID 1..." >> test.txt
curl http://127.0.0.1:5000/item/1 >> test.txt
sleep 1s

echo "Updating item with ID 1..." >> test.txt
curl -X PUT -H "Content-Type: application/json" -d '{"name": "Updated Item"}' http://127.0.0.1:5000/item/1 >> test.txt
sleep 1s

echo "Fetching updated item with ID 1..." >> test.txt
curl http://127.0.0.1:5000/item/1 >> test.txt
sleep 1s

echo "Deleting item with ID 1..." >> test.txt
curl -X DELETE http://127.0.0.1:5000/item/1 >> test.txt
