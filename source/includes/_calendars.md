# Calendars

> Exmaple Response

```json

{
   "totalcount":4,
   "data":[
      {
         "id":1,
         "description":"",
         "is_default":true,
         "name":"Default",
         "created_on":"2016-05-20T17:46:48.51087+05:30",
         "modified_on":null,
         "created_by":{
            "id":null,
            "name":null
         },
         "modified_by":{
            "id":null,
            "name":null
         },
         "timings":[
            {
               "day_num":1,
               "start_time":540,
               "end_time":1020
            },
            {...},
            {...},
            {...},
            {...}
         ]
      },
      {...},
      {...},
      {...}
   ]
}
```


## List Calendars

> `GET  /rest/v1/calendars`

Retrieves the all the available list of calendars. 


> Example Request

```shell
curl -v -X GET
"https://app.eresourcescheduler.cloud/rest/v1/calendars"\
  -H "Authorization: Bearer B8x5Vj1O65r6wnoV"
```


> Exmaple Response

```json

{
   "totalcount":4,
   "data":[
      {
         "id":1,
         "description":"",
         "is_default":true,
         "name":"Default",
         "created_on":"2016-05-20T17:46:48.51087+05:30",
         "modified_on":null,
         "created_by":{
            "id":null,
            "name":null
         },
         "modified_by":{
            "id":null,
            "name":null
         },
         "timings":[
            {
               "day_num":1,
               "start_time":540,
               "end_time":1020
            },
            {...},
            {...},
            {...},
            {...}
         ]
      },
      {...},
      {...},
      {...}
   ]
}
```


### Returns 


| Code      | Description | 
| ---:        |    :----   | 
| **200** <br> <span class = "success">`OK`</span>      |  This indicates that the operation was successful and a list of calendars is returned.  |
**400** <br> <span class = "error">`Bad Request` </span>| Bad Request may occur when offset and limit value is given as negative integer.



## Retrieve a calendar


> `GET  /rest/v1/calendars/{ID}`

Retrieves the specified calendar along with excpetions and holiday applied on it. 


> Example Request

```shell
curl -v -X GET
"https://app.eresourcescheduler.cloud/rest/v1/calendars/1"\
  -H "Authorization: Bearer B8x5Vj1O65r6wnoV"
```

> Example Response

```json
{
   "id":1,
   "description":"",
   "is_default":true,
   "name":"Default",
   "created_on":"2016-05-20T17:46:48.51087+05:30",
   "modified_on":null,
   "created_by":{
      "id":null,
      "name":null
   },
   "modified_by":{
      "id":null,
      "name":null
   },
   "timings":[
      {
         "day_num":1,
         "start_time":540,
         "end_time":1020
      },
      {...},
      {...},
      {...},
      {...}
   ],
   "holidays":[
      {
         "id":1,
         "name":"Independence Day",
         "description":"India's  Independence Day",
         "date":"2018-08-15",
         "tags":[
            "Mumbai"
         ]
      },
      {...},
      {...}
   ],
   "exceptions":[
      {
         "id":1,
         "name":"Working Sunday",
         "description":"test",
         "date":"Working Sunday",
         "is_working_exception":true,
         "tags":[
            null
         ],
         "timings":{
            "start_time":1000,
            "end_time":1700
         }
      }
   ]
}
```

<span class="optional"><b>ARGUMENTS</b></span>

Name | Description
 ---:        |    :---- 
 **ID** <br><span class="required">`required`</span> | The eRS Cloud-generated ID for the calendar which is used to uniquely identified calendar object.


### Returns

| Code      | Description | 
| ---:        |    :----   | 
| **200** <br> <span class = "success">`OK`</span>     | This status code indicates that the operation was successful and a calendar  get retrieved successfully .  |
| **403** <br> <span class = "error">`Forbidden`</span> |Authorization failed due to insufficient permissions, this may be caused by user may not have rights to perform the operation.   |