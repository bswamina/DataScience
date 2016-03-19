
### Experiments on JSON

library(jsonlite)

### Initialize variables for use

text <- '[
    {"customer" : "Alice", "email" : "alice@earth.com", "state" : "AZ"},
    {"customer" : "Bob", "email" : "bob@pluto.com", "state" : "CA"},
    {"customer" : "Charlie", "email" : "charlie@jupiter.com", "state" : "DE"},
    {"customer" : "Donna", "email" : "donna@mars.com", "state" : "FL"},
    {"customer" : "Eve", "email" : "eve@saturn.com", "state" : "GA"}
]'

json <- fromJSON(text)

### Coerces to data.frame

str(json)

### Select state

json[json[['customer']] == 'Alice',][3]
