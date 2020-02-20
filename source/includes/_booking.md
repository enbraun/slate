# Booking

## Booking object

>Example Response

```json
{
  "id": 34,
  "resource": {
    "name": "Andy Murray",
    "id": 2
  },
  "role": {
    "name": "Business Analyst",
    "id": 1
  },
  "project": {
    "id": 5,
    "title": "Mars Rover"
  },
  "task": null,
  "start_time": "2018-12-26T09:00:00",
  "end_time": "2018-12-31T17:00:00",
  "unit": 1,
  "effort": 100.0,
  "billing_status": 1,
  "rate_from": 8,
  "rate": 999999.99,
  "tags": [],
  "created_on": "2018-09-07T04:09:45.254681Z",
  "created_by": {
    "name": "Rahul Sharma",
    "id": 118
  },
  "modified_on": "2018-11-21T06:23:02.494932Z",
  "modified_by": {
    "name": "Rahul Sharma",
    "id": 118
  }
}
```

<span style="color:#b93d6a">`Booking`</span> object represents an assignment or schedule of <a href ="#resource" class="api-ref">resource</a> on a certain <a href="#project" class="api-ref">project</a> or <a href="#tasks" class="api-ref">task</a> for a particular time range.<a href ="#resource" class="api-ref"> Resource </a>can be booked / scheduled  on a <a href="#project" class="api-ref">project </a>(and task) with a defined effort and capacity along with other custom defined fields.

<span class="optional"><b>ATTRIBUTES</b></span>

Following attributes are available for booking object. Booking object can also be customized to have additional attributes by an Admin user using **eRS Cloud Application**. To know about attributes currently applied for booking object please check <a href="#booking-profile" class="api-ref">Booking Profile</a> API.

Name         |  Description
 ---:        |    :---- 
**id** <br>`integer`   | eRS Cloud-generated unique identifier for the booking object.
**resource** <br>`object` | Resource object to which this booking belongs.
**project** <br>`object` |  Project object for which this booking was created.
**task** <br>`object` | Task object defines what needs to be done. Tasks could be one of the defined tasks of booking's project object. 
**role** <br>`object` | Role object defines which role Resource needs to perform for this booking. 
**start_time** <br>`string` | Represents starting time of booking.
**end_time** <br>`string` | Represents ending time of booking.
**effort** <br>`float` |  Effort value for this booking. 
**unit** <br>`integer` |  Represents unit of effort for this booking. Unit could be one of `Capacity %` , `Total Booking Hours` , `Hours Per Day` , `Full Time Equivalent` , `Time per day`.
**progress** <br>`integer` |  Represents percentage completion for this booking.
**billing_status** <br>`integer` |  Represents billing status for this booking. Billing Status could be one of `Same as Project`, `Billable`, `Non Billable`. This field is available only <span class="warning">when financial module is active</span>.
**rate_from** <br>`integer` |  Represents billing rate for this booking. Billing Rate could be one of `Same as Project`, `Same as Resource`, `Same as Role`, `Custom`. This field is available only <span class="warning">when financial module is active</span>.
**rate** <br>`integer` |  Represents rate for this booking. Rate can only be defined when **rate_from** is given as `Custom`. This field is available only <span class="warning">when financial module is active</span>.
**tags** <br>`array of strings` | Tags are the list of strings (labels) attached to this booking object which could be used for the purpose of identification or other information.
**created_on** <br>`string` | Timestamp at which this project object was created.
**created_by** <br> `object` | Object representing user who created this booking object.
**modified_on** <br>`string` | Represents latest modification timestamp.
**modified_by** <br>`object` | Object representing most recent user who modified this booking object.
**udf_\*** | Custom user-defined fields used to capture additional information of booking. User defined field can be of multiple types. Custom fields are very useful to configure booking objects to best fit requirements. In given example response, all keys starting with prefix `udf_` are user defined custom fields. <a href="#user-defined-fields" class="api-ref">Learn more</a>

## Create a booking

> **`POST v1/bookings`**


> Example Request:

```shell
 curl -v -X POST "https://app.eresourcescheduler.cloud/rest/v1/bookings" \
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
**role_id**<br><span class="mandatoryFlag">&#9873;</span> <span class="removableFlag mln-2">&#9873;</span> |  Id of role object which needs to be performed for this booking. This could be id of a role which targeted resource performs (i.e "Performing Role") or any other role (i.e. "Non-Performing-Role")
**task_id**<br><span class="removableFlag mln-2">&#9873;</span> |  Id of task object which needs to be done in this booking. This could only be id of a task which is listed in targeted project.
**effort** <br>`optional`  | This defines how much effort is needed to complete the task. Effort value is a floating point number which could not be less than 0 and greater than 99999999.99. If effort value is not provided system will take default value 0.
**unit**<br>`optional`  | Integer number (1-5) representing unit in which effort is being defined. Unit value could be one of the following :<br><br><li>**1** for `Capacity %` : This is default unit for booking. This represents effort in percentage of capacity of intended resource for defined time range. </li> <li> **2** for `Total Booking Hours` : This defines effort value in fixed hours which doesn't get changed upon changes in booking.</li> <li> **3** for `Hours Per day` : This could be used where a certain no of hours per day need to be spend for a booking. For example 4 hours per day (working day).</li> <li> **4** for `Full Time Equivalent` : Full time equivalent is calculated using FTE calendar defined in Admin section. Capacity from FTE calendar for defined time in booking, is considered as 1 FTE.</li> <li> **5** for `Time Per Day` : It is useful where effort needs to put in on a particular time of every working day i.e. 4:15 PM to 5:30 PM daily. Time portion of **start_time** argument is considered as per day start time, and Time portion of **end_time** argument is considered per day end time for this booking. </li> |
**progress** <br>`optional`  | This defines percentage completion of the booking. Progress is a integer number which could not be less than 0 and greater than 100. If progress is not provided, system will take default value 0.
**billing_status**<br>`optional`  | Integer number (1/2/4) representing billing status of the booking. Billing Status value could be one of the following :<br><br><li>**1** for `Same as Project` : This represents billing status will be same as given for the project associated with this booking. </li> <li> **2** for `Billable` : This defines billing status as billable for this booking.</li> <li> **4** for `Non Billable` : This is used to set the booking to non billable.<br><br>_**Note**: Default value of **billing_status** can be set from <a href="https://app.eresourcescheduler.cloud/#!/admin/settings/chart" target="_blank" class="api-ref">Admin Scheduling Settings</a>. This field is available only <span class="warning">when financial module is active</span>._ |
**rate_from**<br>`optional` | Integer number (1/2/4/8) representing billing rate of the booking. Billing Rate value could be one of the following :<br><br><li>**1** for `Same as Project` : This represents rate_from will be same as given for the project associated with this booking. </li> <li> **2** for `Same as Resource` :  This represents rate_from will be same as given for the resource associated with this booking.</li> <li> **4** for `Same as Role` :  This represents rate_from will be same as given for the performing role associated with this booking.<li> **8** for `Custom` :  This represents custom hourly rate can be defined on this booking.<br><br>_**Note**: Default value of **rate_from** can be set from <a href="https://app.eresourcescheduler.cloud/#!/admin/settings/chart" target="_blank" class="api-ref">Admin Scheduling Settings</a>. This field is available only <span class="warning">when financial module is active</span>._ |
**rate**  <br>`optional`  | This defines hourly billing rate associated with this booking. Rate value is a floating point number which can not be less than 0 and greater than 99999999.99. Rate can only be defined when value of **rate_from** is 8, i.e `Custom`.<br><br>_**Note**: This field is available only <span class="warning">when financial module is active</span>._ 
**tags**<br><span class="removableFlag mln-2">&#9873;</span> | An optional array of strings which could be attached to this booking object as labels. This can be useful for the purpose of identification or other information.
**udf_\***<br><span class="mandatoryFlag">&#9873;</span> <span class="removableFlag mln-2">&#9873;</span> | A user with admin rights can add custom fields. These fields can be used to capture additional information in Projects. Different types of projects may have a different set of user-defined fields. The value for user defined field can be passed as shown in example request. In given example **_udf_progress_**</span> is a user defined field. <a href="#user-defined-fields" class="api-ref">Learn more</a><br><br>_**Note**: User with admin rights can make fields marked with <span class="mandatoryFlag iconInline">&#9873;</span> mandatory and remove fields marked with <span class="removableFlag iconInline">&#9873;</span>, from <a href ="#booking-profile" class="api-ref">booking profile</a> using **eRS Cloud Application**. If mandatory fields are not passed with a valid value or removed fields are passed while creating booking, the operation will fail with response code **400**_.

### Returns
 
| Code      |Description |
 :---        |    :----   |
| **201** <br><span class = "success">`Created`</span> | This status code indicates that the operation was successful and  a booking is created successfully.|
**400** <br> <span class = "error">`Bad Request`</span> | Bad Request error occurs when a request is malformed, syntactically incorrect, missing required parameters or any unknown parameter is passed. Additionally, Bad request may also occur in one of these conditions :<ul><li>Booking is starting before the **start_date** of resource or ending after the **last_working_date** of resource (if resource has a last_working_date defined.)</li><li>Resource is **Archived** i.e. if targeted resource has a last working date of past.</li><li>Project is marked as  **Archived**.</li><li>Duration of booking is more than 5 years.</li></ul>
**403** <br> <span class = "error">`Forbidden`</span> |Authorization failed due to insufficient permissions. This occurs when user does not have enough access rights to perform this action. Access for each user can be controlled by an Administrator using eRS Cloud Application.|

## List bookings

Returns list of bookings. The bookings are returned sorted by booking's start_time and booking's id. 
	
> **`GET /v1/bookings`**

> Example Request

```shell
curl -v "https://app.eresourcescheduler.cloud/rest/v1/bookings?\
start=2018-01-01&end=2018-12-31" \
-H "Authorization: Bearer B8x5Vj1O65r6wnoV"
```

>Example Request With Offset And Limit 

```shell 
curl -v "https://app.eresourcescheduler.cloud/rest/v1/bookings?\
start=2018-01-01&end=2018-12-31&offset=1&limit=1" \
-H "Authorization: Bearer B8x5Vj1O65r6wnoV"
```

> Example Response

```json
{
  "total_count": 7,
  "data": [{
      "id": 34,
      "resource": {
        "name": "Andy Murray",
        "id": 2
      },
      "role": {
        "name": "Business Analyst",
        "id": 1
      },
      "project": {
        "id": 5,
        "title": "Mars Rover"
      },
      "task": null,
      "start_time": "2018-12-26T09:00:00",
      "end_time": "2018-12-31T17:00:00",
      "unit": 1,
      "effort": 100.0,
      "billing_status": 1,
      "rate_from": 8,
      "rate": 999999.99,
      "tags": [],
      "created_on": "2018-09-07T04:09:45.254681Z",
      "created_by": {
        "name": "Rahul Sharma",
        "id": 118
      },
      "modified_on": "2018-11-21T06:23:02.494932Z",
      "modified_by": {
        "name": "Rahul Sharma",
        "id": 118
      }
    },
    { ... },
    { ... }
  ]
}
```

<span class="optional"><b>REQUEST QUERY PARAMETERS</b></span>

|Name|Description|
|-:|:-|
**limit**<br>`optional` | The limit keyword is used to limit the number of records returned from a result set. If a limit count is given, no more than that many records will be returned (but possibly less, if the query itself yields less records)<br>_Default value of `limit` is_ <span class="required">**`500`**</span><br>_Maximum value of `limit` can be_ <span class="required">**`5000`**</span>
**offset**<br>`optional` | Offset keyword is used to skip n items. If offset value is given as 10, then first 10 records will be skipped from result set. Offset is often used together with the Limit keyword.<br>_Default value of `offset` is_ <span class="required">**`0`**</span>
**start**<br>`optional` | String value representing start date in ISO 8601 extended notation for date i.e. yyyy-MM-dd. This is used to filter bookings starting on or after this date.
**end**<br>`optional` | String value representing end date in ISO 8601 extended notation for date i.e. yyyy-MM-dd. This is used to filter bookings starting before this date.
||_**Note**: By default if `start` & `end` arguments are omitted, then bookings of current month will be returned. If bookings of a certain period are needed, then both `start` & `end` arguments required. You have to give values of both `start` and `end` to get bookings in that duration. If only one argument `start` or `end` is passed then a bad request error is raised._


### Returns 


| Code      | Description | 
| ---:        |    :----   | 
| **200** <br> <span class = "success">`OK`</span>      |This indicates that the operation was successful and list of bookings is returned.  |
**400** <br> <span class = "error">`Bad Request` </span>| Bad Request may occur when offset or limit value is negative integer.|
| **403** <br> <span class = "error">`Forbidden`</span> | Authorization failed due to insufficient permissions. This occurs when user does not have enough access rights to perform this action. Access for each user can be controlled by an Administrator using eRS Cloud Application.


## Retrieve a booking

> **`GET v1/bookings/{ID}`**

> Example Request

```shell
curl -v -X GET "https://app.eresourcescheduler.cloud/rest/v1/bookings/25" \
-H "Authorization: Bearer B8x5Vj1O65r6wnoV"
```

> Example Response

```json
{
  "id": 34,
  "resource": {
    "name": "Andy Murray",
    "id": 2
  },
  "role": {
    "name": "Business Analyst",
    "id": 1
  },
  "project": {
    "id": 5,
    "title": "Mars Rover"
  },
  "task": null,
  "start_time": "2018-12-26T09:00:00",
  "end_time": "2018-12-31T17:00:00",
  "unit": 1,
  "effort": 100.0,
  "billing_status": 1,
  "rate_from": 8,
  "rate": 999999.99,
  "tags": [],
  "created_on": "2018-09-07T04:09:45.254681Z",
  "created_by": {
    "name": "Rahul Sharma",
    "id": 118
  },
  "modified_on": "2018-11-21T06:23:02.494932Z",
  "modified_by": {
    "name": "Rahul Sharma",
    "id": 118
  }
}
```
Retrieves the details of an existing booking. You only need to  provide the unique booking identifier that was returned upon booking creation.

### Returns

| Code      | Description | 
| ---:        |    :----   | 
**200** <br> <span class = "success">`OK`</span> | This status code indicates that the operation was successful and a booking successfully returned.
**403** <br> <span class = "error">`Forbidden`</span> |Authorization failed due to insufficient permissions. This occurs when user does not have enough access rights to perform this action. Access for each user can be controlled by an Administrator using eRS Cloud Application.
**404** <br> <span class = "error">`Not Found`</span> | Not Found error occurs when requested booking does not exist (i.e. There is no booking with given id). This may also occur when requesting a booking which has been deleted.

## Search bookings



>  **`POST /v1/bookings/search`**

> Example Request For Filter In JSON Format

```shell
curl -X POST "https://app.eresourcescheduler.cloud/rest/v1/bookings/search?\
start=2018-01-01&end=2018-08-09" \
-H "Content-Type: application/json" \
-H "Authorization: Bearer B8x5Vj1O65r6wnoV" \
-d '{ 
      "id": 1
    }'
```

> Example Request For Filter By Passing multiple filters  In JSON Format

```shell
curl -X POST "https://app.eresourcescheduler.cloud/rest/v1/bookings/search?\
start=2018-01-01&end=2018-08-09" \
-H "Content-Type: application/json" \
-H "Authorization: Bearer B8x5Vj1O65r6wnoV" \
-d '{        
       "resource":{"id":2}, 
       "project":{"id":9},
       "role_id:eq": 1,
       "tags:none": ["tagX","tagY"]
     }'
```

> Example Response

```json
{
  "total_count": 7,
  "data": [{
      "id": 34,
      "resource": {
        "name": "Andy Murray",
        "id": 2
      },
      "role": {
        "name": "Business Analyst",
        "id": 1
      },
      "project": {
        "id": 5,
        "title": "Mars Rover"
      },
      "task": null,
      "start_time": "2018-12-26T09:00:00",
      "end_time": "2018-12-31T17:00:00",
      "unit": 1,
      "effort": 100.0,
      "billing_status": 1,
      "rate_from": 8,
      "rate": 999999.99,
      "tags": [],
      "created_on": "2018-09-07T04:09:45.254681Z",
      "created_by": {
        "name": "Rahul Sharma",
        "id": 118
      },
      "modified_on": "2018-11-21T06:23:02.494932Z",
      "modified_by": {
        "name": "Rahul Sharma",
        "id": 118
      }
    },
    { ... },
    { ... }
  ]
}
```

<span class="optional"><b>REQUEST QUERY PARAMETERS</b></span>

|Name|Description|
|-:|:-|
**limit**<br>`optional` | The limit keyword is used to limit the number of records returned from a result set. If a limit count is given, no more than that many records will be returned (but possibly less, if the query itself yields less records)<br>_Default value of `limit` is_ <span class="required">**`500`**</span><br>_Maximum value of `limit` can be_ <span class="required">**`5000`**</span>
**offset**<br>`optional` | Offset keyword is used to skip n items. If offset value is given as 10, then first 10 records will be skipped from result set. Offset is often used together with the Limit keyword.<br>_Default value of `offset` is_ <span class="required">**`0`**</span>
**start**<br>`optional` | String value representing start date in ISO 8601 extended notation for date i.e. yyyy-MM-dd. This is used to filter bookings starting on or after this date.
**end**<br>`optional` | String value representing end date in ISO 8601 extended notation for date i.e. yyyy-MM-dd. This is used to filter bookings starting before this date.
||_**Note**: By default if `start` & `end` arguments are omitted, then bookings of current month will be returned. If bookings of a certain period are needed, then both `start` & `end` arguments required. You have to give values of both `start` and `end` to get bookings in that duration. If only one argument `start` or `end` is passed then a bad request error is raised._

Search Booking API allows filtering the results set in various ways. This enables a great power to find out what is needed. eRS Cloud API also allows filtering on custom defined fields with multiple operators and conditions to cover up complex scenarios for searching.

A filter condition consists of three components which are **_field_**, **_operator_** and **_value_**. For example, fetching only those bookings having tag `tagA` or `tagB`, could be achieved by adding "tags:any": ["tagA", "tagB"] to request body. If operator is not supplied, it takes default operator for field.

Below is a list of available fields, which allow filtering bookings:

|**Field Type**   | **Operator**  | **Example**|
:--|  :---    |  :---     |  :--- |
**role_id**|<li>**any** (_default_)  </li><li>none</li><li>eq</li><li>neq</li>| `"role_id:any": [1,2]`<br>`"role_id:none": [1,2]`<br>`"role_id:eq": 1`<br>`"role_id:neq": 1`
**tags**|<li>**any** (_default_)</li><li>none</li><li>all</li><li>ex</li>| `"tags:any": ["tagA","tagB"]`<br>`"tags:none": ["tagA","tagB"]`<br>`"tags:all": ["tagA","tagB"]`<br>`"tags:ex": ["tagA","tagB"]`

Additionally, bookings can also be filtered using <a href="#search-resources" class="api-ref">resource fields</a>, <a href="#search-projects" class="api-ref">project fields</a> and <a href="#filters-for-user-defined-fields" class="api-ref">custom fields</a> of bookings. An example request for fetching only booking having `resource_id` as 2, `project_id` as 9 and `role_id` as 1 is shown.

## Update a booking

Updates the specified booking by setting values of parameters passed. Values of any parameters which are not provided will be unchanged. 

>  **`PUT /v1/bookings/{ID}`**

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
**resource_id**  <br><span class="required">`required`</span>  | Id of resource object which is being booked or scheduled. This will throw an error if you post an empty value.
**project_id** <br><span class="required">`required`</span>  |  Id of project object which this booking object is being created for. This will throw an error if you post an empty value.
**start_time** <br> <span class="required">`required`</span>  | Represents start date and time for booking object. This field accepts value in ISO 8601 extended format for date-time i.e. yyyy-mm-ddThh:mm:ss. The value must be snapped in 15 minutes interval, which effectively means that minutes values should be one of(00/15/30/45) and seconds value should always be 0. (if given). This will throw an error if you post an empty value.
**end_time** <br> <span class="required">`required`</span>  | Represents end date and time for booking object. This field accepts value in ISO 8601 extended format for date-time i.e. yyyy-mm-ddThh:mm:ss. The value must be snapped in 15 minutes interval, which effectively means that minutes values should be one of(00/15/30/45) and seconds value should always be 0. (if given). End date time must always be ahead of start date time by at least 15 minutes as a booking of less than 15 minutes is not allowed. This will throw an error if you post an empty value.
**role_id**<br><span class="mandatoryFlag">&#9873;</span> <span class="removableFlag mln-2">&#9873;</span> |  Id of role object which needs to be performed for this booking. This could be id of a role which targeted resource performs (i.e "Performing Role") or any other role (i.e. "Non-Performing-Role")
**task_id**<br><span class="removableFlag mln-2">&#9873;</span> |  Id of task object which needs to be done in this booking. This could only be id of a task which is listed in targeted project.
**effort**  <br>`optional`  | This defines how much effort is needed to complete the task. Effort value is a floating point number which could not be less than 0 and greater than 99999999.99. If effort value is not provided system will take default value 0.
**unit**<br>`optional`  | Integer number (1-5) representing unit in which effort is being defined. Unit value could be one of the following :<br><br><li>**1** for `Capacity %` : This is default unit for booking. This represents effort in percentage of capacity of intended resource for defined time range. </li> <li> **2** for `Total Booking Hours` : This defines effort value in fixed hours which doesn't get changed upon changes in booking.</li> <li> **3** for `Hours Per day` : This could be used where a certain no of hours need to be spend for a booking. For example 4 hours per day (working day).</li> <li> **4** for `Full Time Equivalent` : Full time equivalent is calculated using FTE calendar defined in Admin section. Capacity from FTE calendar for defined time in booking, is considered as 1 FTE.</li> <li> **5** for `Time Per Day` : It is useful where effort needs to put in on a particular time of every working day i.e. 4:15 PM to 5:30 PM daily. Time portion of **start_time** argument is considered as per day start time, and Time portion of **end_time** argument is considered per day end time for this booking. </li> |
**progress** <br>`optional`  | This defines percentage completion of the booking. Progress is a integer number which could not be less than 0 and greater than 100. If progress is not provided, system will take default value 0.
**billing_status**<br>`optional`  | Integer number (1/2/4) representing billing status of the booking. Billing Status value could be one of the following :<br><br><li>**1** for `Same as Project` : This represents billing status will be same as given for the project associated with this booking. </li> <li> **2** for `Billable` : This defines billing status as billable for this booking.</li> <li> **4** for `Non Billable` : This is used to set the booking to non billable.<br><br>_**Note**: Default value of **billing_status** can be set from <a href="https://app.eresourcescheduler.cloud/#!/admin/settings/chart" target="_blank" class="api-ref">Admin Scheduling Settings</a>. This field is available only <span class="warning">when financial module is active</span>._ |
**rate_from**<br>`optional`  | Integer number (1/2/4/8) representing billing rate of the booking. Billing Rate value could be one of the following :<br><br><li>**1** for `Same as Project` : This represents rate_from will be same as given for the project associated with this booking. </li> <li> **2** for `Same as Resource` :  This represents rate_from will be same as given for the resource associated with this booking.</li> <li> **4** for `Same as Role` :  This represents rate_from will be same as given for the performing role associated with this booking.<li> **8** for `Custom` :  This represents custom hourly rate can be defined on this booking.<br><br>_**Note**: Default value of **rate_from** can be set from <a href="https://app.eresourcescheduler.cloud/#!/admin/settings/chart" target="_blank" class="api-ref">Admin Scheduling Settings</a>. This field is available only <span class="warning">when financial module is active</span>._ |
**rate**  <br>`optional`  | This defines hourly billing rate associated with this booking. Rate value is a floating point number which can not be less than 0 and greater than 99999999.99. Rate can only be defined when value of **rate_from** is 8, i.e `Custom`.<br><br>_**Note**: This field is available only <span class="warning">when financial module is active</span>._ 
**tags**<br><span class="removableFlag mln-2">&#9873;</span> | Tags is an optional filed. Tags are attached to this booking object which could be used for the purpose of identification or other information.. This may be up to 50 characters. This will be blank if you post an empty value.
**udf_\***<br><span class="mandatoryFlag">&#9873;</span> <span class="removableFlag mln-2">&#9873;</span> | A user with admin rights can add such custom fields. These fields can be used to capture additional info in bookings. <a href="#user-defined-fields" class="api-ref">Learn more</a><br><br>_**Note**: User with admin rights can make fields marked with <span class="mandatoryFlag iconInline">&#9873;</span> mandatory and remove fields marked with <span class="removableFlag iconInline">&#9873;</span>, from <a href ="#booking-profile" class="api-ref">booking profile</a> using **eRS Cloud Application**. If mandatory fields are not passed with a valid value or removed fields are passed while updating booking, the operation will fail with response code **400**_.

### Returns

| Code      | Description | 
| ---:        |    :----   | 
**200** <br> <span class = "success">`OK`</span>    |  This indicates that the operation was successful and a booking get updated successfully.
**400** <br> <span class = "error">`Bad Request`</span> | Bad Request error occurs when a request is malformed, syntactically incorrect, empty required parameters or any unknown parameter is passed. Additionally, Bad request may also occur in one of these conditions :<ul><li>Trying to update `start_time` or `end_time` such that `end_time` gets earlier than `start_time`.</li><li>Trying to update `start_time` of booking before the **start_date** of resource or `end_time` after the **last_working_date** of resource (if resource has a last_working_date defined.)</li><li>Trying to update a booking of **archived** resource</li><li>Trying to update bookings of **archived** project.</li><li>Duration of booking is more than 5 years.</li></ul>
**403** <br> <span class = "error">`Forbidden`</span> |Authorization failed due to insufficient permissions. This occurs when user does not have enough access rights to perform this action. Access for each user can be controlled by an Administrator using eRS Cloud Application.
**404** <br> <span class = "error">`Not Found`</span> | Not Found error occurs when requested booking does not exist (i.e. There is no booking with given id). This may also occur when requesting a booking which has been deleted.




## Delete a booking

Permanently deletes a booking. It cannot be undone.

> **`DELETE /v1/bookings/{ID}`**


> Example Request
 
```shell
curl -v -X DELETE "https://app.eresourcescheduler.cloud/rest\
/v1/bookings/1" -H "Authorization: Bearer B8x5Vj1O65r6wnoV"
```

### Returns


| Code      | Description  
| ---:        |    :----   
| **200** <br><span class = "success">`OK`</span> |This status code indicates that the operation was successful and a booking get deleted successfully |
| **403** <br> <span class = "error">`Forbidden`</span> | Authorization failed due to insufficient permissions. This occurs when user does not have enough access rights to perform this action. Access for each user can be controlled by an Administrator using eRS Cloud Application.|
| **404** <br> <span class = "error">`Not Found`</span> | Not Found error occurs when requested booking does not exist.