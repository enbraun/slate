# Booking

## Booking object

>Example Response

```json
{
  "modified_on": null,
  "role": {
    "name": "Functional Manager",
    "id": 2
  },
  "resource": {
    "name": "Anselm Batie",
    "id": 97
  },
  "end_time": "2018-11-14T17:00:00",
  "project": {
    "id": 1,
    "title": "Jaipur"
  },
  "effort": 100,
  "priority": null,
  "created_by": {
    "name": "John Doe",
    "id": 6
  },
  "billable": true,
  "tags": [],
  "start_time": "2018-11-07T09:00:00",
  "unit": 1,
  "task": null,
  "created_on": "2018-11-22T16:18:13.957046Z",
  "modified_by": null,
  "id": 25
}
```

<span style="color:#b93d6a">`Booking`</span> object represents an assignment or schedule of <a href ="#resource" class="api-ref">resource</a> on a certain <a href="#project" class="api-ref">project</a> or <a href="#tasks" class="api-ref">task</a> for a particular time range.<a href ="#resource" class="api-ref"> Resource </a>can be booked / scheduled  on a <a href="#project" class="api-ref">project </a>(and task) with a defined effort and capacity along with other custom defined fields.

<span class="optional"><b>ATTRIBUTES</b></span>

Following attributes are available for booking object. Booking object can also be customized to have additional attributes by an Admin user using **eRS Cloud Application**. To know about attributes currently applied for booking object please check Booking Profile API.

Name         |  Description
 ---:        |    :---- 
**id** <br><span class="optional">`integer`</span>   |   System generated unique identifier for this particular booking object. 
**resource** <br><span class="optional">`object`</span> | Resource object which this booking belongs to.
**project** <br><span class="optional">`object`</span> |  Project object this booking was created for.
**task** <br><span class="optional">`object`</span> | Task object defines what need to be done. Tasks could be one of the defined tasks of booking's project object. 
**role** <br><span class="optional">`object`</span> | Role object defines which role Resource needs to perform for this booking. 
**start_time** <br><span class="optional">`string`</span> | Represents starting time of booking.
**end_time** <br><span class="optional">`string`</span> | Represents ending time of booking.
**effort** <br><span class="optional">`float`</span> |  Effort value for this booking. 
**unit** <br><span class="optional">`integer`</span> |  This represents unit of effort for this booking. Unit could be one of (percent of capacity,  booking hours,hours per day, FTE, Specific time per day)
**tags** <br><span class="optional">`array of strings`</span> | Tags are the list of strings (labels) attached to this booking object which could be used for the purpose of identification or other information.
**created_on** <br><span class="optional">`string`</span> |   Time at which the resource object is created.
**modified_by** <br><span class="optional">`object`</span> | This field describes by whom the modification is done.
**User defined fields** <br><span class="optional">`optional`</span>  | Custom user-defined fields used to capture additional information of booking. <a href="#user-defined-fields" class="api-ref">Learn more</a>

## Create a booking

>  `POST v1/bookings`


> Example Request:

```shell
 curl -v -X POST \
 "https://app.eresourcescheduler.cloud/rest/v1/bookings" \
  -H "Authorization: Bearer B8x5Vj1O65r6wnoV" \
  -H "Content-Type: application/json" \
  -d '{ 
        "resource_id": 1, 
        "project_id" : 9, 
        "start_time" : "2017-06-01T09:00", 
        "end_time": "2017-06-11T17:00", 
        "effort": 100, 
        "unit": 1 
      }'
```

Creates a new booking object.


<span class="optional"><b>REQUEST BODY PARAMETERS</b></span>

Name               |  Description
 ---:        |    :----   
**resource_id**  <br><span class="required">`required`</span>  | Id of resource object which is being booked or scheduled.
**project_id** <br><span class="required">`required`</span>  |  Id of project object which this booking object is being created for.
**start_time** <br> <span class="required">`required`</span>  | Represents start date and time for booking object. This field accepts value in ISO 8601 extended format for date-time i.e. yyyy-mm-ddThh:mm:ss. The value must be snapped in 15 minutes interval, which effectively means that minutes values should be one of(00/15/30/45) and seconds value should always be 0. (if given).
**end_time** <br> <span class="required">`required`</span>  | Represents end date and time for booking object. This field accepts value in ISO 8601 extended format for date-time i.e. yyyy-mm-ddThh:mm:ss. The value must be snapped in 15 minutes interval, which effectively means that minutes values should be one of(00/15/30/45) and seconds value should always be 0. (if given). End date time must always be ahead of start date time by at least 15 minutes as a booking of less than 15 minutes is not allowed.
**role_id**  <br><span class="optional">`optional`</span>  |  Id of role object which needs to be performed for this booking. This could be id of a role which targeted resource performs (i.e "Performing Role") or any other role (i.e. "Non-Performing-Role")
**effort**  <br><span class="optional">`optional`</span>  | This defines how much effort is needed to complete the task. Effort value is a floating point number which could not be less than 0 and greater than 99999999.99. If effort value is not provided system will take default value 0.
**unit**<br><span class="optional">`optional`</span>  | Integer number (1-5) representing unit in which effort is being defined. Unit value could be one of the following : <li>**1** for 'Percent of capacity' : This is default unit for booking. This represents effort in percentage of capacity of intended resource for defined time range. </li> <li> **2** for 'Total Booking Hours' : This defines effort value in fixed hours which doesn't get changed upon changes in booking.</li> <li> **3** for 'Hours Per day' : This could be used where a certain no of hours need to be spend for a booking. For example 4 hours per day (working day).</li> <li> **4** for 'Full Time Equivalent' : Full time equivalent is calculated using FTE calendar defined in Admin section. Capacity from FTE calendar for defined time in booking, is considered as 1 FTE.</li> <li> **5** for 'Time Per Day' : It is useful where effort needs to put in on a particular time of every working day i.e. 4:15 PM to 5:30 PM daily. Time portion of **start_time** argument is considered as per day start time, and Time portion of **end_time** argument is considered per day end time for this booking. </li> |
**tags**  <br><span class="optional">`optional`</span>  | An optional array of strings which could be attached to this booking object as labels. This can be useful for the purpose of identification or other information.
**user_defined_field** <br><span class="optional">`optional`</span>  | A user with admin rights can add such custom fields. These fields can be used to capture additional info in bookings. <a href="#user-defined-fields" class="api-ref">Learn more</a>

### Returns
 
| Code      |Description |
 :---        |    :----   |
| **201** <br><span class = "success">`Created`</span> | This status code indicates that the operation was successful and  a booking get created successfully.|
| **400** <br> <span class = "error">`Bad Request`</span> | Bad Request error occurs when a request is malformed, syntactically incorrect, missing required parameters or any unknown parameter is passed. Additionally, Bad request may also occur in one of these conditions :<ul><li>Booking is starting before the **start_date** of resource or ending after the **last_working_date** of resource (if resource has a last_working_date defined.)</li><li>Resource is **Archived** i.e. if targeted resource has a last working date of past.</li><li>Project is marked as  **Archived**.</li><li>Duration of booking is more than 5 years.</li></ul> |
| **403** <br> <span class = "error">`Forbidden`</span> |Authorization failed due to insufficient permissions. This occurs when user does not have enough access rights to perform this action. Access for each user can be controlled by an Administrator using eRS Cloud Application.|

## List bookings

Returns list of bookings. The bookings are returned sorted by booking's start_time and booking's id. 
	
>  `GET v1/bookings`

> Example Request

```shell
 curl -v -X GET \
 "https://app.eresourcescheduler.cloud/rest/v1/bookings?start=2018-01-01&end=2018-12-31"\
  -H "Authorization: Bearer B8x5Vj1O65r6wnoV"
```

>Example Request With Offset And Limit 

```shell 
curl -v -X GET \
"https://app.eresourcescheduler.cloud/rest/v1/bookings?start=2018-01-01&end=2018-12-31&offset=1&limit=1" \
 -H "Authorization: Bearer B8x5Vj1O65r6wnoV"
```

> Example Response

```json
{
   "total_count": 7,
   "data": [
     {
        "modified_on": null,
        "role": {
          "name": "Functional Manager",
          "id": 2
        },
        "resource": {
          "name": "Anselm Batie",
          "id": 97
        },
        "end_time": "2018-11-14T17:00:00",
        "project": {
          "id": 1,
          "title": "Jaipur"
        },
        "effort": 100,
        "priority": null,
        "created_by": {
          "name": "John Doe",
          "id": 6
        },
        "billable": true,
        "tags": [],
        "start_time": "2018-11-07T09:00:00",
        "unit": 1,
        "task": null,
        "created_on": "2018-11-22T16:18:13.957046Z",
        "modified_by": null,
        "id": 25
     },
     {...},
     {...}
   ]
}
```

<span class="optional"><b>REQUEST QUERY PARAMETERS</b></span>

|Name|Description|
|-:|:-|
|**limit**<br><span class="optional">`optional`</span>|The limit keyword is used to limit the number of rows returned from a result set.<br>*The default value of limit is*  <span class="error">*`500`*</span><br>*Maximum value of limit can be* <span class="error">*`5000.`*</span> *If value of limit is greater than*<span class="error">*`5000`*</span>  *then it will set to  Maximum value of limit which is*  <span class="error">*`5000.`*</span>|
|**offset**<br><span class="optional">`optional`</span>|The Offset value allows you to specify the ranking number of the first item on the page .The Offset value is most often used together with the Limit keyword.<br>*The default value of `offset` is* <span class="error">*`0`* </span>|
|**start**<br><span class="optional">`optional`</span> | Start value is used to get number of bookings in which start date is equal to or after start.|
|**end**<br><span class="optional">`optional`</span> |End value is used to get number of bookings in which end date is before or equal to end.

 <sup class = "error">*</sup>You have to give values of both start and end to get bookings in that duration .If you don't give any value then you will get bookings of current month, but if you give either value of start or end then you will get bad request.


### Returns 


| Code      | Description | 
| ---:        |    :----   | 
| **200** <br> <span class = "success">`OK`</span>      |  This indicates that the operation was successful and  list of bookings is returned.  |
**400** <br> <span class = "error">`Bad Request` </span>| Bad Request may occur when offset and limit value is negative integer.|
| **403** <br> <span class = "error">`Forbidden`</span> |Authorization failed due to insufficient permissions, this may be caused by user may not have rights to perform the operation.|


## Retrieve a booking

>  `GET v1/bookings/{ID}`

> Example Request

```shell
curl -v -X GET "https://app.eresourcescheduler.cloud/rest/v1/bookings/25"\
  -H "Authorization: Bearer B8x5Vj1O65r6wnoV"
```

> Example Response

```json
{
  "modified_on": null,
  "role": {
    "name": "Functional Manager",
    "id": 2
  },
  "resource": {
    "name": "Anselm Batie",
    "id": 97
  },
  "end_time": "2018-11-14T17:00:00",
  "project": {
    "id": 1,
    "title": "Jaipur"
  },
  "effort": 100,
  "priority": null,
  "created_by": {
    "name": "John Doe",
    "id": 6
  },
  "billable": true,
  "tags": [],
  "start_time": "2018-11-07T09:00:00",
  "unit": 1,
  "task": null,
  "created_on": "2018-11-22T16:18:13.957046Z",
  "modified_by": null,
  "id": 25
}
```
Retrieves the details of an existing booking. You only need to  provide the unique booking identifier that was returned upon booking creation.

### Returns

| Code      | Description | 
| ---:        |    :----   | 
| **200** <br> <span class = "success">`OK`</span>     | This status code indicates that the operation was successful and a booking  get retrieved successfully .  |
| **403** <br> <span class = "error">`Forbidden`</span> |Authorization failed due to insufficient permissions. This occurs when user does not have enough access rights to perform this action. Access for each user can be controlled by an Administrator using eRS Cloud Application.|
| **404** <br> <span class = "error">`Not Found`</span> | Not Found error occurs when requested resource does not exist (i.e. There is no booking with given id). This may also occur when requesting a booking which has been deleted. |

## Search bookings
>  `POST v1/bookings/search`

Filtering API responses to retrieve specific data.


The filter parameter allows for filtering the results returned from the various endpoint in various ways. For example fetching only booking having booking id 1 by adding id:1 to your query.<a href ="#filters" class= "api-ref"> Read more</a>

> Example Request For Filter In JSON Format

```shell
curl -X POST  \
"https://app.eresourcescheduler.cloud/rest/v1/bookings/search?start=2018-01-01&end=2018-08-09" \
-H "Content-Type: application/json" \
-H "Authorization: Bearer B8x5Vj1O65r6wnoV" \
-d '{ 
      "id": 1
    }'
```

> Example Request For Filter By Passing multiple filters  In JSON Format

```shell
curl -X POST  \
"https://app.eresourcescheduler.cloud/rest/v1/resources/search?start=2018-01-01&end=2018-08-09" \
-H "Content-Type: application/json" \
-H "Authorization: Bearer B8x5Vj1O65r6wnoV" \
-d '{ 
       "id": 1,
       "resource":{"id":2}, 
       "project":{"id":9} 
     }'
```

### Filters for System-defined fields
 
Filter by booking-fields 

|**Field Type**   | **Operator**  | **Example**|
:--|  :---    |  :---     |  :--- |
**role_id** | <li> any *(default)* </li> <li> eq </li> | <li>-d "role_id":1  / -d "role_id:any":1</li> <li> -d "role_id:eq": "1&#124;2" </li>|
|**tags**|<li>any *(default)* </li><li>all</li>|<li>-d "tags": "1&#124;2&#124;3"  / -d "tags:any": "2&#124;5"</li><li>-d "tags:all": "4&#124;6"</li> |


   
You can filter booking by resource-fields. 
 _For Resource-Fields please <a href="#search-resources" class="api-ref">click here</a>._

You can also filter booking by project-fields. 
 _For Project-Fields please <a href="#search-projects" class="api-ref">click here</a>._

 _For User-defined fields please <a href="#filters-for-user-defined-fields" class="api-ref">click here</a>._ 


You can filter booking by multiple objects.  For example fetching only booking having resource_id as 2 , project_id as 9 and booking_id as 1  <span style="font-size:24px; font-weight:bold;">￼&#x1f449;</span>

## Update a booking

Updates the specified booking by setting values of parameters passed. Values of any parameters which are not provided will be unchanged. 

>  `PUT v1/bookings/{ID}`

> Example Request

```shell
 curl -v -X PUT "https://app.eresourcescheduler.cloud/rest/v1/bookings/25" \
  -H "Authorization: Bearer B8x5Vj1O65r6wnoV" \
  -H "Content-Type: application/json" \
  -d '{ 
        "resource_id": 3, 
        "project_id" : 4, 
        "start_time" : "2017-06-05T09:00", 
        "unit": 3 
      }'
```
<span class="optional"><b>REQUEST BODY PARAMETERS</b></span>

Name               |  Description
 ---:        |    :----   
**resource_id**  <br><span class="required">`required`</span>  | Id of resource object which is being booked or scheduled.This will throw an error if you post an empty value.
**project_id** <br><span class="required">`required`</span>  |  Id of project object which this booking object is being created for. This will throw an error if you post an empty value.
**start_time** <br> <span class="required">`required`</span>  | Represents start date and time for booking object. This field accepts value in ISO 8601 extended format for date-time i.e. yyyy-mm-ddThh:mm:ss. The value must be snapped in 15 minutes interval, which effectively means that minutes values should be one of(00/15/30/45) and seconds value should always be 0. (if given). This will throw an error if you post an empty value.
**end_time** <br> <span class="required">`required`</span>  | Represents end date and time for booking object. This field accepts value in ISO 8601 extended format for date-time i.e. yyyy-mm-ddThh:mm:ss. The value must be snapped in 15 minutes interval, which effectively means that minutes values should be one of(00/15/30/45) and seconds value should always be 0. (if given). End date time must always be ahead of start date time by at least 15 minutes as a booking of less than 15 minutes is not allowed. This will throw an error if you post an empty value.
**role_id**  <br><span class="optional">`optional`</span>  |  Id of role object which needs to be performed for this booking. This could be id of a role which targeted resource performs (i.e "Performing Role") or any other role (i.e. "Non-Performing-Role")
**effort**  <br><span class="optional">`optional`</span>  | This defines how much effort is needed to complete the task. Effort value is a floating point number which could not be less than 0 and greater than 99999999.99. If effort value is not provided system will take default value 0.
**unit**<br><span class="optional">`optional`</span>  | Integer number (1-5) representing unit in which effort is being defined. Unit value could be one of the following : <li>**1** for 'Percent of capacity' : This is default unit for booking. This represents effort in percentage of capacity of intended resource for defined time range. </li> <li> **2** for 'Total Booking Hours' : This defines effort value in fixed hours which doesn't get changed upon changes in booking.</li> <li> **3** for 'Hours Per day' : This could be used where a certain no of hours need to be spend for a booking. For example 4 hours per day (working day).</li> <li> **4** for 'Full Time Equivalent' : Full time equivalent is calculated using FTE calendar defined in Admin section. Capacity from FTE calendar for defined time in booking, is considered as 1 FTE.</li> <li> **5** for 'Time Per Day' : It is useful where effort needs to put in on a particular time of every working day i.e. 4:15 PM to 5:30 PM daily. Time portion of **start_time** argument is considered as per day start time, and Time portion of **end_time** argument is considered per day end time for this booking. </li> |
**tags**  <br><span class="optional">`optional`</span>  | Tags is an optional filed. Tags are attached to this booking object which could be used for the purpose of identification or other information.. This may be up to 50 characters. This will be blank if you post an empty value.
**User defined fields** <br><span class="optional">`optional`</span>  | A user with admin rights can add such custom fields. These fields can be used to capture additional info in bookings. <a href="#user-defined-fields" class="api-ref">Learn more</a>

### Returns

| Code      | Description | 
| ---:        |    :----   | 
| **200** <br> <span class = "success">`OK`</span>    |  This indicates that the operation was successful and a booking get updated successfully.|
| **400** <br> <span class = "error">`Bad Request`</span> | Bad Request occurs when a request is not well-formed, syntactically incorrect, empty required parameters or any unknown parameter is passed. |
| **403** <br> <span class = "error">`Forbidden`</span> |Authorization failed due to insufficient permissions. This occurs when user does not have enough access rights to perform this action. Access for each user can be controlled by an Administrator using eRS Cloud Application.|
| **404** <br> <span class = "error">`Not Found`</span> | Not Found error occurs when requested booking does not exist (i.e. There is no booking with given id). This may also occur when requesting a booking which has been deleted. |




## Delete a booking

Permanently deletes a booking. It cannot be undone.

> `DELETE v1/bookings/{ID}`


> Example Request
 
```shell
curl -v -X DELETE "https://app.eresourcescheduler.cloud/rest/v1/bookings/1"\
  -H "Authorization: Bearer B8x5Vj1O65r6wnoV"
```

### Returns


| Code      | Description  
| ---:        |    :----   
| **200** <br><span class = "success">`OK`</span> |This status code indicates that the operation was successful and a booking get deleted successfully |
| **403** <br> <span class = "error">`Forbidden`</span> | Authorization failed due to insufficient permissions. This occurs when user does not have enough access rights to perform this action. Access for each user can be controlled by an Administrator using eRS Cloud Application.|
| **404** <br> <span class = "error">`Not Found`</span> | Not Found error occurs when requested booking does not exist.
