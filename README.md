Microservice for [GardenThat](https://github.com/adumortier/gardenthat).  


Solo usage not recommended.  

Url for API get requests:  
https://plantmicroservice.herokuapp.com/

For return of first 10 plants associated with term:  

get '/api/<term>'

For return of individual plant info(used most efficiently with results from previous request)  

get '/plant/<slug>'

For first 100 plants in database"  

get '/allplants'
