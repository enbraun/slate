# Response Codes

eRS Cloud uses conventional HTTP response codes to indicate the success or failure of an API request. In general: Codes in the 2xx range indicate success. Codes in the 4xx range indicate an error that failed given the information provided (e.g., a required parameter was omitted, syntactically incorrect request, etc.). Codes in the 5xx range indicate an error with eRS Cloud's servers (which is rare).



### List of Status Codes :

Status Code | Meaning
----------: | :-------
**200** <br><span class = "success">**`OK`**</span> | Everything worked as expected.
**201** <br><span class = "success">**`Created`**</span> | This indicates success, but the textual part of the response line indicates the URI by which the newly created document should be known .
**400**  <br> <span class="error">**`Bad Request`**</span> | The request was unacceptable, often due to missing a required parameter.
**401**  <br> <span class = "error">**`Unauthorized`**</span> | No valid API key provided. Authentication failed due to invalid authentication credentials.
**403** <br> <span class = "error">**`Forbidden`** </span> | Accessing the page or resource you were trying to reach is absolutely forbidden for some reason.
**404** <br> <span class = "error">**`Not Found`** </span>| The requested resource doesn't exist.
**405** <br> <span class = "error">**`Method Not Allowed`** </span> | HTTP method is not allowed by a web server for a requested URL. 
**409** <br> <span class = "error">**`Conflict`** </span>| The request conflicts with another request. 
**415** <br> <span class = "error">**`Unsuppoerted Media Type`** </span> | No valid media is provided.
**500** <br> <span class = "error">**`Internal Server Error`** </span>| Something went wrong on eRS's end. _(This is rare.)_

