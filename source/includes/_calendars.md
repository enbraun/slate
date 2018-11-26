# Calendars

## Calendar object

Calendar is used to define working-timing of resources. We can apply holidays and exceptions on calendars.A particular calendar can be applied on number of resources. When we want to declare a day off, it is declared by holiday, we can also apply multiple holidays. And if we want to changes in working-timings,can be declared by exceptions.We can add exception for a single day or multiple days.

> Example Request

```shell
curl -v -X GET "https://app.eresourcescheduler.cloud/rest/v1/calendars/1" \
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
         "date":"2018-02-03",
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

<span class="optional"><b>ATTRIBUTES</b></span>

Name | Description
---------: | :-----------
**id**  <br><span class="optional">`integer`</span>|  Unique identifier for the object.
**name** <br><span class="optional">`string`</span>  |  This is an object which represents the name of a calendar. 
**timings** <br><span class = "optional">`array of strings`</span> | Timings are list of days in which day_num is defined day(For example-0 for sunday,1 for monday) and start time and end time  are  defined start time and end time for a particular day respectively, also we can calculate no of working-hours on that day.
**holidays**<br><span class= "optional">`array of strings`</span> | Holidays are list of holidays that are applied on a calendar.
**exceptions**<br><span class ="optional">`array of strings`</span>| Exceptions are list of exceptions that are applied on a calendar.In any exception,name is exception's name,date is defined for which date  exception is applied on.

## List Calendars

> `GET  /rest/v1/calendars`

Retrieves the all the available list of calendars. 


> Example Request

```shell
curl -v -X GET \
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
| **200** <br> <span class = "success">`OK`</span>      |  This indicates that the operation was successful and list of calendars is returned.  |




## Retrieve a calendar


> `GET  /rest/v1/calendars/{ID}`

Retrieves the specified calendar along with excpetions and holiday applied on it. 


> Example Request

```shell
curl -v -X GET \
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
         "date":"2018-02-03",
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


### Returns

| Code      | Description | 
| ---:        |    :----   | 
| **200** <br> <span class = "success">`OK`</span>     | This status code indicates that the operation was successful and a calendar  get retrieved successfully .  |
|  **404** <br><span class = "error">`Not Found`</span> |This status code indicates that calendar_id does not exist|