# ShippingCost

An application to calculate the shortest path (using Dijkstra algorithm) to delivery packages.  
I decided to use a gem with the algorithm insteat of code my own to gain some time.  
I decided to use the Dijkstra algorithm because is simple and have a good performance, but the algorithm cannot be much precise if the values of the distance are negative.  
I've created an strucutre inside the application to be easy to create new versions.  
"app\controllers\api\v1\"



## Dijkstra Alogrithm
![Dijkstra](https://upload.wikimedia.org/wikipedia/commons/5/57/Dijkstra_Animation.gif)

## Dependencies
* Djikstra Gem 0.0.2 - https://github.com/thinkphp/dijkstra.gem
* MySQL
* Ruby 2.2.5  
* Rails 5.1.6

## Runing
```shell
rails db:create
rails db:migrate
bundle install
rails s
```

## Tests
```shell
bundle exec rspec
```

## Resources

POST /distance

```json
{"source" : "B", "destination" : "C", "distance" : 10}
```
GET /cost?origin=A&destination=C&weight=5
