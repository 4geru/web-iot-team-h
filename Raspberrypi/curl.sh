# test
# ls

# curl -X GET http://localhost:3000/commands 
# curl -X POST -H "Content-Type: application/json" -d '{"blog": {"title":"hoge", "content": "huga"}}' http://localhost:3000/logs 

curl -H "Accept: application/json" -H "Content-Type: application/json" \
 -X POST -d $'{"auth": {"email": "user_1@example.com", "password": "12345"}}' \
 http://localhost:3000/logs -w '\n%{http_code}\n' -s -c cookie