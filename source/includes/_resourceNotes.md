# Resource Notes

> Exmaple Response

```json
{
   "totalcount":3,
   "limit":10,
   "offset":0,
   "data":[
      {
         "id":8,
         "created_on":"2018-09-02T17:41:14.642026+05:30",
         "content":"<p>Awarded by  &#34;Employee Of The Month&#34; 
                    award on Aug  09, 2017<br> </p>",
         "modified_on":null,
         "created_by":{
            "id":2,
            "name":"Patrick Wilson",
            "image_uuid":"/img/8945d093-0f76-4347-a9ae-b2f3c13ea281",
         },
         "modified_by":{
            "id":null,
            "name":null
         }
      },
      {...},
      {...}
   ]
}
```

To capture additional information about a resource, eRS Cloud provides the `Notes`. If one has to provide any new information to a resource which is not captured from the filed, for such situations Notes are beneficial.

Let's say, If a resource has role "A", but after a certain time his role get changed or new role gets added to his profile. Roles field gives us the ability to add, update or delete a role. But it does not give brief information when the role get added, deleted or updated. The Notes comes in handy in such situations. Notes are handy to maintain the history of a resource.   

eRS Cloud API allows you to perform *`POST`*, *`GET`*, *`PUT`*, *`DELETE`* operations on Notes. 

*The Notes Of Archived Resource remain available for the records.*


## List notes

>` GET  v1/resources/{ID}/notes`


Retrieves the Notes list of specified resource. You need to provide the unique resource identifier that was returned upon resource creation.The notes are returned which sorted by lastly modified or added.

> Example Request

```shell
curl "https://app.eresourcescheduler.cloud/rest/v1/resources/8/notes"\
  -H "Authorization: Bearer B8x5Vj1O65r6wnoV"
```

>Example Request With Offset And Limit 

```shell 
curl "https://app.eresourcescheduler.cloud/rest/v1/resources/8/
      notes?offset=1&limit=1"\
 -H "Authorization: Bearer B8x5Vj1O65r6wnoV"
```
>Example Request With orderBy 

```shell 
curl "https://app.eresourcescheduler.cloud/rest/v1/resources/8/
      notes?offset=1&limit=1&orderBy=createdOn"\
 -H "Authorization: Bearer B8x5Vj1O65r6wnoV"
```


> Exmaple Response

```json
{
   "totalcount":3,
   "limit":10,
   "offset":0,
   "data":[
      {
         "id":8,
         "created_on":"2018-09-02T17:41:14.642026+05:30",
         "content":"<p>Awarded by  &#34;Employee Of The Month&#34; 
                    award on Aug  09, 2017<br> </p>",
         "modified_on":null,
         "created_by":{
            "id":2,
            "name":"Patrick Wilson",
            "image_uuid":"/img/8945d093-0f76-4347-a9ae-b2f3c13ea281",
         },
         "modified_by":{
            "id":null,
            "name":null
         }
      },
      {...},
      {...}
   ]
}
```

### Limit and Offset



<span class="optional"><b>ARGUMENTS</b></span>

|Name|Description|
|-:|:-|
|**limit**<br><span class="optional">`optional`</span>|The limit keyword is used to limit the number of notes returned from a result set.<br><br>The limit number can be any from zero going upwards. When zero is specified as the limit, no notes are returned from the result set.<br><br>Let’s suppose that we want to display 20 notes per page to avoid confusion. The limit comes in handy in such situations. We could be able to limit the results returned from query params to 20 notes only per page.<br><br>*The default value of limit is*  <span class="error">*`25`*</span><br>*Maximum value of limit can be* <span class="error">*`1000.`*</span> *If Limit value is exceeds than*<span class="error">*`1000`*</span>  *then it will get set to* <span class="error">*`1000`*</span> *which is Maximum value for limit.* |
|**offset**<br><span class="optional">`optional`</span>|The Offset value allows specifying which note to start from retrieving data. <br><br>The Offset value is also most often used together with the Limit keyword.<br><br>The offset number can be any from zero going upwards. When zero is specified as the offset, records from first note are returned from the list of notes.<br><br>Let’s suppose that we want to display notes from third note. The Offset comes in handy in such situations. We could be able to apply offset on the results returned from query params to display  notes from third note.<br><br>*The default value of offset is* <span class="error">*`0`* </span>|


### Ordering the notes

<span class="optional"><b>ARGUMENTS</b></span>

|Name|Options|Description|
|-:|:-:|:-
|**OrderBy**<br><span class="optional">`optional`</span>|<ul><li>createdOn *(Default)*</li></ul>|List of notes will be returned and sorted by it's created date.|
| |<ul><li>modifiedOn</li></ul> |List of notes will be returned and sorted by it's latest modified date|



### Returns 


| Code      | Description | 
| ---:        |    :----   | 
| **200** <br> <span class = "success">`OK`</span>      |  This indicates that the operation was successful and a list of notes is returned.  |
**400** <br> <span class = "error">`Bad Request` </span>| Bad Request may occur when offset and limit value is given as negative integer.
> Example Request


## Create a note

>` POST  v1/resources/{ID}/notes`


> Example Request

```shell

curl -v -X POST "https://app.eresourcescheduler.cloud/rest/v1/resources/8/notes"\
  -H "Authorization: Bearer 2Gee9LrXLHMZehzq"\
  -H "Content-Type: application/json"\
  -d '{"content":"Hello Enbraun"}'
```

> Example Request With HTML Tag

```shell

curl -v -X POST "https://app.eresourcescheduler.cloud/rest/v1/resources/8/notes"\
  -H "Authorization: Bearer 2Gee9LrXLHMZehzq"\
  -H "Content-Type: application/json"\
  -d '{"content":"<p>Hello Enbraun</p>"}'
```

<span class="optional"><b>ARGUMENTS</b></span>


Name         |  Description
 ---:        |    :----   
**content**  <br><span class="required">`required`</span>  | To create new note you have to pass the body from `content` parameter.  Content param accepts plain text. Also, you can pass text with HTML tags as Notes are Multi Line Rich Text.


### Returns
 
| Code      |Description |
 :---        |    :----   |
| **201** <br><span class = "success">`Created`</span> | This status code indicates that the operation was successful and created a note successfully.|
| **400** <br> <span class = "error">`Bad Request`</span> | Bad Request error occurs when a request is not malformed, syntactically incorrect, missing required parameters are  or any unknown parameter is passed.  |
| **403** <br> <span class = "error">`Forbidden`</span> |Authorization failed due to insufficient permissions, this may be caused by user may not have rights to perform the operation.|



## Update a note

>` PUT  v1/resources/{ID}/notes/{Note_ID}`

Updates the specified resource's note by setting the value of the parameter passed. You need to  provide the unique resource identifier that was returned upon resource creation and unique note identifier that was returend upon notes creation. If parameter is not provided then it will be left unchanged.

This request accepts mostly the same argument as the note creation call.

> Example Request

```shell

curl -v -X PUT "https://app.eresourcescheduler.cloud/rest/v1/resources/8/notes/4"\
  -H "Authorization: Bearer 2Gee9LrXLHMZehzq"\
  -H "Content-Type: application/json"\
  -d '{"content":"Hello World"}'
```

> Example Request With HTML Tags.

```shell

curl -v -X PUT "https://app.eresourcescheduler.cloud/rest/v1/resources/8/notes/4"\
  -H "Authorization: Bearer 2Gee9LrXLHMZehzq"\
  -H "Content-Type: application/json"\
  -d '{"content":"<p>Hello World</p>"}'
```

<span class="optional"><b>ARGUMENTS</b></span>


Name         |  Description
 ---:        |    :----   
 **Note_ID** <br><span class="required">`required`</span> | The eRS Cloud-generated ID for the note which is used to uniquely identified.
**content**  <br><span class="required">`required`</span>  | To create new note you have to pass the body from `content` parameter.  Content param accepts plain text. Also, you can pass text with HTML tags as Notes are Multi Line Rich Text.


### Returns

| Code      | Description | 
| ---:        |    :----   | 
| **200** <br> <span class = "success">`OK`</span>    |  This indicates that the operation was successful and a note get updated successfully.|
| **400** <br> <span class = "error">`Bad Request`</span> | Bad Request occurs when a request is not well-formed, syntactically incorrect, empty required parameters or any unknown parameter is passed.|
| **403** <br> <span class = "error">`Forbidden`</span> | Authorization failed due to insufficient permissions, this may be caused by user may not have rights to perform the operation.   |


## Delete a note

>` DELETE  v1/resources/{ID}/notes/{Note_ID}`

Permanently deletes a Note. It cannot be undone.You need to  provide the unique resource identifier that was returned upon resource creation and unique note identifier that was returend upon notes creation.

> Example Request

```shell

curl -v -X DELETE "https://app.eresourcescheduler.cloud/rest/v1/resources/8/notes/5"\
  -H "Authorization: Bearer 2Gee9LrXLHMZehzq"
```

<span class="optional"><b>ARGUMENTS</b></span>

Name | Description
 ---:        |    :---- 
 **ID** <br><span class="required">`required`</span> | The eRS Cloud-generated ID for the resource which is used to uniquely identified resource object.
**Note_ID** <br><span class="required">`required`</span> | The eRS Cloud-generated ID for the note which is used to uniquely identified.



| Code      | Description  
| ---:        |    :----   
| **200** <br><span class = "success">`OK`</span> |This status code indicates that the operation was successful and a note get deleted successfully |
