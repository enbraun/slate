# Response Codes

eRS Cloud uses conventional HTTP response codes to indicate the success or failure of an API request. In general: Codes in the 2xx range indicate success. Codes in the 4xx range indicate an error that failed due to incorrect request. (e.g., a required parameter was omitted, syntactically incorrect request, etc.). Codes in the 5xx range indicate an error with eRS Cloud's servers (which is rare).



### List of Status Codes :

Status Code | Meaning
----------: | :-------
**200** <br><span class = "success">**`OK`**</span> | Everything worked as expected.
**201** <br><span class = "success">**`Created`**</span> | This indicates successful creation of intended object.
**400**  <br> <span class="error">**`Bad Request`**</span> | Indicates that request is not acceptable, often due to missing required parameters or invalid value for any parameter.
**401**  <br> <span class = "error">**`Unauthorized`**</span> | No valid API access token provide. Authentication failed due to invalid authentication credentials.
**403** <br> <span class = "error">**`Forbidden`** </span> | Accessing an object or performing an action when user doesn't have required permissions, causes this error.
**404** <br> <span class = "error">**`Not Found`** </span>| The requested resource doesn't exist.
**405** <br> <span class = "error">**`Method Not Allowed`** </span> | HTTP method is not allowed by a web server for a requested URL. 
**409** <br> <span class = "error">**`Conflict`** </span>| Occurs when trying to create a duplicate object where duplicates are not allowed or when request could affect other objects.
**415** <br> <span class = "error">**`Unsupported Media Type`** </span> | No valid media is provided.
**500** <br> <span class = "error">**`Internal Server Error`** </span>| Something went wrong at eRS's end. _(This is rare.)_