# My Favorite Recipes3
Organize all your favorite recipes!

Keep track of:
1. which cookbook your recipe is in and the page number
2. or the URL to your favorite recipe
3. a picture of the prepared dish
4. Notes on what the heck went wrong, or what you had to change
    1. e.g. used different ingredients, or how much

Also:
1. Rate the 'true' effort level to prepare the ingredients and cook the meal
   and the time it took from prep work to completion!

## Technology
Recipes3 uses Node.js with MongoDb for the backend services, while still
retaining the Angular Dart web front-end.

## Coming Soon!
### Recipes4
Converting the web application to Angular JS while continuing with Node.js and MongoDb for the recipe_server

### Getting Started
1. run 'npm start' from the project root directory
2. open recipe_web/web/index.html in a browser

## TODOs
Not in any particular order

## Features Used

#### Angular Dart features used in recipe_web

Feature - Where Located  
1. dependency injection - every file ending in _component.dart  
2. event firing - recipe_form_component.dart  
3. event handling - recipe_app_component.dart  
4. component declaration - every file ending in _component.dart  
5. services - every file ending in _service.dart  
6. unit tests - tbd   


#### recipe_server
 1. [x] Get the body of a POST message as JSON and convert it to JavaScript
 2. [x] Modularize the handling of requests for recipes, recipe tags, and cookbooks, for one service call for now
 3. [x] Modularize the handling of database access into one module, for one DB call for now
 4. [x] Retrieve an object from the DB, convert it to JSON, and add it to the response
 5. [x] Add "use strict"; to all files and cleanup subsequent errors
 6. [x] Add copyright info to all files
 7. [x] Update the 'start server' process to setup the DB and start the backend service
 8. [x] Expand the supported service calls for all coming from the recipe_web server
 9. [x] Refactor start_server.js into smaller modules, as it's handling all web service requests right now
 10. [x] Update these notes on Getting Started (above)
 11. [x] Determine better method to check if a module exposes a specific function
 12. [x] Convert incoming date numbers to Date objects
 13. [x] Convert outgoing date object to an int
 14. [x] Add description (class) information to all files
 15. [x] move server information to a config file, and read the config file on startup
 16. [x] Add better error handling so an error does not crash the server
 17. [x] When saving a new document, if the 'id' is -1 then get the next id sequence and use that value for both the '_id' and 'id'
 18. [x] Add a logger to avoid dumping everything to the console
 19. [x] Add unique indexes to Cookbook, Recipe, and Recipe Tag collections
 20. [x] Handle database non-unique key exceptions
 21. [x] Add Javadoc-style comments to all functions
 22. [x] Refactor start_server.js so it may be invoked from recipe_server.js
 23. [x] Move database server functions to another module: start the server, check the status of the server, and close (shutdown) the web server
 24. [X] Update the 'start server' process to start the web server
 25. [x] Refactor to eliminate the recipe_tag_join table and keep the associated tags as embedded documents in the recipe collection
 26. [x] Process OPTIONS request
 27. [x] Add CORS headers to response
 28. [x] Replace customer http request/response handler with Express Middleware,
 converting the body to JSON, adding CORS headers, and routing requests with Router. 

#### recipe_web
 1. [x] Port the recipe_web Angular Dart directory from Recipes2 to here
 2. [x] Convert recipe_web to use angular 4.0.0
 3. [x] Eliminate Category use in the UI; it is deprecated
 4. [x] Examine HTTP response code and analyze decoded result from server calls before returning data
 5. [x] Use Angular Dart's router to control the display in the main window

===========================================================================================

### See LICENSE
