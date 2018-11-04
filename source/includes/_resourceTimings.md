# Resource Timings

> Example Response 

```json
{
   "totalcount":2,
   "data":[
      {
         "id":5,
         "name":"Part Time",
         "effective_date":"2018-11-15",
         "applied_on":"2018-11-03T15:06:15.454+05:30",
         "created_on":"2018-11-03T15:06:15.484913+05:30",
         "modified_on":null,
         "created_by":{
            "id":2,
            "name":"Patrick Wilson"
         },
         "modified_by":{
            "id":null,
            "name":null
         },
         "timings":[
            {
               "day_num":2,
               "start_time":600,
               "end_time":840
            },
              {...},
        	  {...}, 
              {...},
              {...},
	          {...},	            
         ]
      },
      {...},
      {...} 
```

To capture timings about a resource, eRS Cloud provides Timings. One resource may work in different timings as per his availability or requirement, for such situations Timings are beneficial.

Let say, If a resource works on a full-time profile but then for a certain time of period he switched his timings from full-time to part-time. Then for that certain period “Part Time” calendar will get applied along with its effective date. Timings are beneficial to apply multiple calendars on a resource. 

eRS Cloud API allows you to perform *`POST`*, *`GET`*, *`PUT`*, *`DELETE`* operations on Notes.


## Retrieving the timings

> `GET v1/resources/{ID}/timings`

> Example Request

```shell
curl -v -X GET "https://app.eresourcescheduler.cloud/rest/v1/resources/12/timings"\
  -H "Authorization: Bearer fZ5jaMNaV9syzOaS"\
```

> Example Response


```json
{
   "totalcount":2,
   "data":[
      {
         "id":5,
         "name":"Part Time",
         "effective_date":"2018-11-15",
         "applied_on":"2018-11-03T15:06:15.454+05:30",
         "created_on":"2018-11-03T15:06:15.484913+05:30",
         "modified_on":null,
         "created_by":{
            "id":2,
            "name":"Patrick Wilson"
         },
         "modified_by":{
            "id":null,
            "name":null
         },
         "timings":[
            {
               "day_num":2,
               "start_time":600,
               "end_time":840
            },
              {...},
        	  {...}, 
              {...},
              {...},
	          {...},	            
         ]
      },
      {...},
      {...} 
```

Retrieves the details of timings which are applied to the resource. You only need to provide the unique resource identifier that was returned upon resource creation.

<span class="optional"><b>ARGUMENTS</b></span>

Name | Description
 ---:        |    :---- 
 **ID** <br><span class="required">`required`</span> | The eRS Cloud-generated ID for the resource which is used to uniquely identified resource object.


### Returns

| Code      | Description | 
| ---:        |    :----   | 
| **200** <br> <span class = "success">`OK`</span>     | This status code indicates that the operation was successful and timings  get retrieved successfully .  |
| **403** <br> <span class = "error">`Forbidden`</span> |Authorization failed due to insufficient permissions, this may be caused by user may not have rights to perform the operation.   |
| **404** <br> <span class = "error">`Not Found`</span> | Not Found error occurs when requested resource does not exist (i.e. There is no resource with given id). This may also occur when requesting a resource which has been deleted. |


## Applying new timing (POST)

> `POST v1/resources/{ID}/timings`

> Example Request

```shell
curl -v -X POST "https://app.eresourcescheduler.cloud/rest/v1/resources/12/timings"\
  -H "Authorization: Bearer fZ5jaMNaV9syzOaS"\
  -H "Content-Type: application/json"\
  -d '{
 	    "appliedOn": "2018-12-04T08:14:41.109Z",
	    "calendarId": "5",
	    "effectiveDate": "2018-02-02"
      }'
```

<span class="optional"><b>ARGUMENTS</b></span>


Name         |  Description
 ---:        |    :----   
**appliedOn**  <br><span class="required">`required`</span>| AppliedOn Field describes when the calendar gets applied. It is a `DateTime` type of field. 
**calendarId**  <br><span class="required">`required`</span>|As the name shows it is a calendar id which we have to pass. You will get this id at the time of calendar creation. This field accepts `Integer` only. 
**effectiveDate**  <br><span class="required">`required`</span>|Effective date describes from when should the calendar get applied. This field accepts `Date`only.


### Returns
 
| Code      |Description |
 :---        |    :----   |
| **201** <br><span class = "success">`Created`</span> | This status code indicates that the operation was successful and timing get applied successfully.|
| **400** <br> <span class = "error">`Bad Request`</span> | Bad Request error occurs when a request is not malformed, syntactically incorrect, missing required parameters are  or any unknown parameter is passed.  |
| **403** <br> <span class = "error">`Forbidden`</span> |Authorization failed due to insufficient permissions, this may be caused by user may not have rights to perform the operation.|


## Update timings


> `PUT v1/resources/{ID}/timings/{Timing_ID}`

> Example Request

```shell
curl -v -PUT "https://app.eresourcescheduler.cloud/rest/v1/resources/12/timings/2"\
  -H "Authorization: Bearer fZ5jaMNaV9syzOaS"\
  -H "Content-Type: application/json"\
  -d '{
 	    "appliedOn": "2018-12-04T08:14:41.109Z",
	    "calendarId": "5",
	    "effectiveDate": "2018-02-02"
      }'
```



Updates the specified resource's calendar by setting the value of the parameter passed. You need to provide the unique resource identifier that was returned upon resource creation and unique note identifier that was returend upon timing addition. If parameter is not provided then it will be left unchanged.

This request accepts mostly the same argument as the note creation call.


<span class="optional"><b>ARGUMENTS</b></span>


Name         |  Description
 ---:        |    :----   
 **Timing_ID** <br><span class="required">`required`</span> | The eRS Cloud-generated ID for the `timing` which is used to uniquely identified.
**appliedOn**  <br><span class="required">`required`</span>| AppliedOn Field describes when the calendar gets applied. It is a `DateTime` type of field. 
**calendarId**  <br><span class="required">`required`</span>|As the name shows it is a calendar id which we have to pass. You will get this id at the time of calendar creation. This field accepts `Integer` only. 
**effectiveDate**  <br><span class="required">`required`</span>|Effective date describes from when should the calendar get applied. This field accepts `Date`only.

## Delete timings


> `DELETE v1/resources/{ID}/timings/{Timing_ID}`

Permanently deletes a applied Calendar. It cannot be undone. You need to provide the unique resource identifier that was returned upon resource creation and unique timing identifier that was returend upontiming addition.


> Example Request

```shell
curl -v -X DELETE\
"https://app.eresourcescheduler.cloud/rest/v1/resources/12/timings/2"\
  -H "Authorization: Bearer fZ5jaMNaV9syzOaS"
```

<span class="optional"><b>ARGUMENTS</b></span>

Name | Description
 ---:        |    :---- 
 **ID** <br><span class="required">`required`</span> | The eRS Cloud-generated ID for the resource which is used to uniquely identified resource object.
 **Timing_ID** <br><span class="required">`required`</span> | The eRS Cloud-generated ID for the `timing` which is used to uniquely identified.



| Code      | Description  
| ---:        |    :----   
| **200** <br><span class = "success">`OK`</span> |This status code indicates that the operation was successful and a aapplied calendar get deleted successfully |
