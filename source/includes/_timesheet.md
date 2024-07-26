# Timesheet

## Timesheet Object

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
    "title": "Mars Rover",
    "id": 5
  },
  "task": {
    "name": "Planning",
    "id": 3
  },
  "date": "2021-07-26",
  "time_start": "09:00",
  "time_end": "14:00",
  "hours": 5.0,
  "billing_status": 1,
  "rate_from": 8,
  "rate": 99.40,
  "entry_status": 4,
  "tags": [
    "analyst"
  ],
  "created_on": "2021-07-27T07:56:17.515125Z",
  "created_by": {
    "name": "John Doe",
    "id": 118
  },
  "modified_on": "2021-07-27T13:23:46.583746Z",
  "modified_by": {
    "name": "John Smith",
    "id": 1146
  },
  "submitted_on": "2021-07-27T07:56:17.515125Z",
  "submitted_by":{
    "name": "John Doe",
    "id": 118
  },
  "approval_time": "2021-07-27T13:23:46.583746Z",
  "approver":{
    "name": "John Smith",
    "id": 1146
  },
}
```

<span style="color:#b93d6a">`Timesheet`</span> entry represents tracking of work done by a <a href ="#resource" class="api-ref">resource</a> on a certain <a href="#project" class="api-ref">project</a> or <a href="#tasks" class="api-ref">task</a> for a particular time range.<a href ="#resource" class="api-ref"> Resource </a> work can be tracked/entered on a <a href="#project" class="api-ref">project </a>with a defined effort and date along with other custom defined fields.

<span class="optional"><b>ATTRIBUTES</b></span>

Following attributes are available for timesheet entry. Timesheet entry can also be customized to have additional attributes by an Administrator user using eRS Cloud Application. To know about attributes currently applied for timesheet entry please check <a href="#timesheet-profile" class="api-ref">Timesheet Profile</a> API.

Name         |  Description
 ---:        |    :---- 
**id** <br>`integer`   | eRS Cloud generated unique identifier for the timesheet entry.
**resource** <br>`object` | Resource object to which this timesheet entry belongs.
**project** <br>`object` |  Project object for which this timesheet entry was created.
**task** <br>`object` | Task object defines which task was performed. Tasks could be one of the defined tasks of timesheet's project object. 
**role** <br>`object` | Role object defines which role Resource performed for this timesheet entry.
**date** <br>`string` |  Represents date for which timesheet entry is created. 
**time_start** <br>`string` | Represents starting time of timesheet entry.
**time_end** <br>`string` | Represents ending time of timesheet entry.
**hours** <br>`float` |  Represents number of hours worked by resource.
**billing_status** <br>`integer` |  Represents billing status for this timesheet entry. Billing Status could be one of `Inherit from Project`, `Billable`, `Non Billable`. <span class="warning">This field is available only when financial module is active</span>.
**rate_from** <br>`integer` |  Represents billing rate for this timesheet entry. Billing Rate could be one of `Inherit from Project`, `Inherit from Resource`, `Inherit from Role`, `Custom`. <span class="warning">This field is available only when financial module is active</span>.
**rate** <br>`float` |  Represents rate for this timesheet entry. Rate can only be defined when `rate_from` is given as `Custom`. <span class="warning">This field is available only when financial module is active</span>.
**tags** <br>`array of strings` | Tags are the list of strings (labels) attached to this timesheet entry which could be used for the purpose of identification or other information.
**created_on** <br>`string` | Timestamp at which this timesheet entry was created.
**created_by** <br> `object` | Object representing user who created this timesheet entry.
**modified_on** <br>`string` | Represents latest modification timestamp.
**modified_by** <br>`object` | Object representing most recent user who modified this timesheet entry.
**submitted_on** <br>`string` | Timestamp at which this timesheet entry was submitted.
**submitted_by** <br>`object` | Object representing user who submitted this timesheet entry.
**approval_time** <br>`string` | Timestamp at which this timesheet entry was approved/rejected.
**approver** <br>`object` | Object representing user who approved/rejected this timesheet entry.
**entry_status** <br>`integer` | Represents status of timesheet entry. Status could be one of `Draft`, `Submitted`, `Approved` or `Rejected`.
**comment** <br>`string` | String attached to this timesheet entry which could be used to describe the detail of the work. 
**udf_\*** | Custom user-defined fields are used to capture additional information of timesheet entry. User defined fields can be of multiple types. Custom fields are very useful to configure timesheet entries to best fit requirements. In given example, all keys starting with prefix `udf_` are user defined custom fields. <a href="#user-defined-fields" class="api-ref">Learn more</a>

## Create a Timesheet Entry

> **`POST v1/timesheet`**


> Example Request:

```shell
 curl -v -X POST "https://app.eresourcescheduler.cloud/rest/v1/timesheet" \
 -H "Authorization: Bearer B8x5Vj1O65r6wnoV" \
 -H "Content-Type: application/json" \
 -d '{ 
       "resource_id": 1, 
       "project_id" : 9, 
       "date": "2021-07-27",
       "hours": 5,
       "udf_location": 349,
       "comment": "Client presentation is prepared."
     }'
```

Creates a new timesheet entry.


<span class="optional"><b>REQUEST BODY PARAMETERS</b></span>

Name               |  Description
 ---:        |    :----   
**resource_id**  <br><span class="required">`required`</span>  | ID of resource object who performed task in this timesheet entry.
**project_id** <br><span class="required">`required`</span>  |  ID of project object on which this timesheet entry is being created.
**date**<br><span class="required">`required`</span>  | String value representing a date on which task was performed. Date accepts value in ISO 8601 format i.e. yyyy-MM-dd. Date of a timesheet entry cannot be before `start_date` or after `last_date` of the resource for which this timesheet entry is being created.
**time_start** <br>  | Represents start time for timesheet entry. This field accepts value in HH:MM in 24 hour format or HH:MMam or HH:MMpm in 12 hour format.
**time_end** <br>  | Represents end time for timesheet entry. This field accepts value in HH:MM in 24 hour format or HH:MMam or HH:MMpm in 12 hour format. `time_end` must always be ahead of `time_start`.
**hours** <br> | This defines how many hours the resource worked on a given task. Hours value is a floating point number which could not be 0 or less than 0 and greater than 99999  (When entries for more than 24 hours a day is disabled, maximum value can be up to 24). When user provides `time_start` and `time_end` for a timesheet entry, system automatically calculates hours worked by resource by difference in `time_end` and `time_start`.<br><br>_**Note**: The user should either provide `time_start` and `time_end` or `hours`. `time_start` and `time_end` value can also be provided with `hours` when the difference between them is equal to `hours` value._
**role_id**<br><span class="mandatoryFlag">&#9873;</span> <span class="removableFlag mln-2">&#9873;</span> |  ID of role object which was performed for this timesheet entry. This could be ID of a role which targeted resource performed.
**task_id**<br><span class="removableFlag mln-2">&#9873;</span> |  ID of task object performed in this timesheet entry. This could only be ID of a task which is listed in targeted project.
**entry_status**<br>`optional` | Integer number (1/2/4/8) representing status of timesheet entry. Timesheet Entry Status value could be one of the following:<br><br><li>**1** for `Draft` : This represents timesheet entry is in Draft state. By default, timesheet entries are created in Draft state. </li> <li> **2** for `Submitted` : This represents timesheet entry is Submitted.</li> <li> **4** for `Approved` : This represents timesheet entry is Approved.</li> <li> **8** for `Rejected` : This represents timesheet entry is Rejected.</li>
**billing_status**<br>`optional`  | Integer number (1/2/4) representing billing status of the timesheet entry. Billing status value could be one of the following :<br><br><li>**1** for `Inherit from Project` : This represents billing status will be the same as given for the project associated with this timesheet entry. </li> <li> **2** for `Billable` : This defines billing status as billable for this timesheet entry.</li> <li> **4** for `Non Billable` : This is used to set the timesheet entry to non billable.<br><br>_**Note**: Default value of billing status can be set from <a href="https://app.eresourcescheduler.cloud/#!/admin/settings/timesheet" target="_blank" class="api-ref">Administrator Timesheet Settings</a>. <span class="warning">This field is available only when financial module is active</span>._ |
**rate_from**<br>`optional` | Integer number (1/2/4/8) representing billing rate of the timesheet entry. Billing rate value could be one of the following :<br><br><li>**1** for `Inherit from Project` : This represents billing rate will be the same as given for the project associated with this timesheet entry. </li> <li> **2** for `Inherit from Resource` :  This represents billing rate will be the same as given for the resource associated with this timesheet entry.</li> <li> **4** for `Inherit from Role` :  This represents billing rate will be the same as given for the performing role associated with this timesheet entry.<li> **8** for `Custom` :  Custom hourly rate can be defined on a timesheet entry with this billing rate value.<br><br>_**Note**: Default value of billing rate can be set from <a href="https://app.eresourcescheduler.cloud/#!/admin/settings/timesheet" target="_blank" class="api-ref">Administrator Timesheet Settings</a>. <span class="warning">This field is available only when financial module is active</span>._ |
**rate**  <br>`optional`  | This defines hourly billing rate associated with this timesheet entry. Rate value is a floating point number which can not be less than 0 and greater than 99999999.99. Rate can only be defined when value of `rate_from` is 8, i.e `Custom`.<br><br>_**Note**: <span class="warning">This field is available only when financial module is active</span>._ 
**tags**<br><span class="removableFlag mln-2">&#9873;</span> | An optional array of strings which could be attached to this timesheet entry object as labels. This can be useful for the purpose of identification or other information.
**comment**<br> `optional` | An optional string which could be attached to this timesheet entry. This can be useful for describing the detail of the work. 
**udf_\***<br><span class="mandatoryFlag">&#9873;</span> <span class="removableFlag mln-2">&#9873;</span> | A user with admin rights can add custom fields. These fields can be used to capture additional information in timesheet entry. The value for user defined fields can be passed as shown in example. In given example `udf_location`</span> is a user defined field. <a href="#user-defined-fields" class="api-ref">Learn more</a><br><br>_**Note**: User with Administrator rights can make fields marked with <span class="mandatoryFlag iconInline">&#9873;</span> mandatory and remove fields marked with <span class="removableFlag iconInline">&#9873;</span>, from <a href ="#timesheet-profile" class="api-ref">timesheet profile</a> using eRS Cloud Application. If mandatory fields are not passed with a valid value or removed fields are passed while creating timesheet entry, the operation will fail with response code **400**_.

### Returns
 
| Code      |Description |
 :---        |    :----   |
| **201** <br><span class = "success">`Created`</span> | This status code indicates that the operation was successful and a timesheet entry is created successfully.|
**400** <br> <span class = "error">`Bad Request`</span> | Bad Request occurs when a request is malformed, syntactically incorrect, missing required parameters or any unknown parameter is passed. Additionally, Bad Request may also occur in one of these conditions:<ul><li>Timesheet entry `date` is given before the `start_date` of resource or after the `last_date` of resource (if resource has a `last_date` defined).</li><li>Trying to create timesheet entry on archived resource.</li><li>Trying to create timesheet entry on archived project.</li><li>Parameters passed in timesheet entry are violating one or more pre-defined configurations of resource or project from <a href="https://app.eresourcescheduler.cloud/#!/timesheet/setup/resources" target="_blank" class="api-ref">Timesheet Setup</a> using eRS Cloud Application.</li></ul>
**403** <br> <span class = "error">`Forbidden`</span> |Authorization failed due to insufficient permissions. This occurs when user does not have enough access rights to perform this action. Access for each user can be controlled by an Administrator using eRS Cloud Application.|

## List Timesheets

Returns list of timesheet entries.
	
> **`GET /v1/timesheet`**

> Example Request

```shell
curl -v "https://app.eresourcescheduler.cloud/rest/v1/timesheet?\
start=2021-07-01&end=2021-07-31" \
-H "Authorization: Bearer B8x5Vj1O65r6wnoV"
```

>Example Request With Offset And Limit 

```shell 
curl -v "https://app.eresourcescheduler.cloud/rest/v1/timesheet?\
start=2021-07-01&end=2021-07-31&offset=1&limit=10" \
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
        "title": "Mars Rover",
        "id": 5
      },
      "task": {
        "name": "Planning",
        "id": 3
      },
      "date": "2021-07-26",
      "time_start": "09:00",
      "time_end": "14:00",
      "hours": 5.0,
      "billing_status": 1,
      "rate_from": 8,
      "rate": 99.40,
      "entry_status": 4,
      "tags": [
        "analyst"
      ],
      "created_on": "2021-07-27T07:56:17.515125Z",
      "created_by": {
        "name": "John Doe",
        "id": 118
      },
      "modified_on": "2021-07-27T13:23:46.583746Z",
      "modified_by": {
        "name": "John Smith",
        "id": 943
      },
      "submitted_on": "2021-07-27T07:56:17.515125Z",
      "submitted_by":{
        "name": "John Doe",
        "id": 118
      },
      "approval_time": "2021-07-27T13:23:46.583746Z",
      "approver":{
        "name": "John Smith",
        "id": 1146
      },
    },
    { ... },
    { ... }
  ]
}
```

<span class="optional"><b>REQUEST QUERY PARAMETERS</b></span>

|Name|Description|
|-:|:-|
**limit**<br>`optional` | The limit keyword is used to limit the number of records returned from a result set. If a limit count is given, no more than that many records will be returned (but possibly less, if the query itself yields less records)<br>_Default value of `limit` is_ <span class="required">**`500`**</span>.<br>_Maximum value of `limit` can be_ <span class="required">**`5000`**</span>.
**offset**<br>`optional` | Offset keyword is used to skip n items. If offset value is given as 10, then first 10 records will be skipped from result set. Offset is often used together with the Limit keyword.<br>_Default value of `offset` is_ <span class="required">**`0`**</span>.
**start**<br>`optional` | String value representing start date in ISO 8601 extended notation for date i.e. yyyy-MM-dd. This is used to filter timesheet entries on or after this date.
**end**<br>`optional` | String value representing end date in ISO 8601 extended notation for date i.e. yyyy-MM-dd. This is used to filter timesheet entries on or before this date.
||_**Note**: By default if `start` & `end` arguments are omitted, then timesheet entries of current month will be returned. If timesheet entries of a certain period are needed, then both `start` & `end` arguments are required. If only one argument `start` or `end` is passed then a bad request error is raised._


### Returns 


| Code      | Description | 
| ---:        |    :----   | 
| **200** <br> <span class = "success">`OK`</span>      |This indicates that the operation was successful and list of timesheet entries is returned.  |
**400** <br> <span class = "error">`Bad Request` </span>| Bad Request may occur when offset or limit value is negative integer.|
| **403** <br> <span class = "error">`Forbidden`</span> | Authorization failed due to insufficient permissions. This occurs when user does not have enough access rights to perform this action. Access for each user can be controlled by an Administrator using eRS Cloud Application.


## Retrieve a Timesheet Entry

> **`GET v1/timesheet/{ID}`**

> Example Request

```shell
curl -v -X GET "https://app.eresourcescheduler.cloud/rest/v1/timesheet/25" \
-H "Authorization: Bearer B8x5Vj1O65r6wnoV"
```

> Example Response

```json
{
  "id": 25,
  "resource": {
    "name": "Andy Murray",
    "id": 2
  },
  "role": {
    "name": "Business Analyst",
    "id": 1
  },
  "project": {
    "title": "Mars Rover",
    "id": 5
  },
  "task": {
    "name": "Planning",
    "id": 3
  },
  "date": "2021-07-26",
  "time_start": "09:00",
  "time_end": "14:00",
  "hours": 5.0,
  "billing_status": 1,
  "rate_from": 8,
  "rate": 99.40,
  "entry_status": 4,
  "tags": [
    "analyst"
  ],
  "created_on": "2021-07-27T07:56:17.515125Z",
  "created_by": {
    "name": "John Doe",
    "id": 118
  },
  "modified_on": "2021-07-27T13:23:46.583746Z",
  "modified_by": {
    "name": "John Smith",
    "id": 1146
  },
  "submitted_on": "2021-07-27T07:56:17.515125Z",
  "submitted_by":{
    "name": "John Doe",
    "id": 118
  },
  "approval_time": "2021-07-27T13:23:46.583746Z",
  "approver":{
    "name": "John Smith",
    "id": 1146
  },
}
```
Retrieves the details of an existing timesheet entry. You only need to  provide the unique timesheet identifier that was returned upon timesheet creation.

### Returns

| Code      | Description | 
| ---:        |    :----   | 
**200** <br> <span class = "success">`OK`</span> | This status code indicates that the operation was successful and a timesheet entry returned successfully.
**403** <br> <span class = "error">`Forbidden`</span> |Authorization failed due to insufficient permissions. This occurs when user does not have enough access rights to perform this action. Access for each user can be controlled by an Administrator using eRS Cloud Application.
**404** <br> <span class = "error">`Not Found`</span> | Not Found error occurs when requested timesheet entry does not exist (i.e. There is no timesheet entry with given ID). This may also occur when requesting a timesheet entry that has been deleted.

## Search Timesheet Entries



>  **`POST /v1/timesheet/search`**

> Example Request For Filter In JSON Format

```shell
curl -X POST "https://app.eresourcescheduler.cloud/rest/v1/timesheet/search?\
start=2021-07-01&end=2021-07-31" \
-H "Content-Type: application/json" \
-H "Authorization: Bearer B8x5Vj1O65r6wnoV" \
-d '{ 
      "id": 1
    }'
```

> Example Request For Filter By Passing multiple filters  In JSON Format

```shell
curl -X POST "https://app.eresourcescheduler.cloud/rest/v1/timesheet/search?\
start=2021-07-01&end=2021-07-31" \
-H "Content-Type: application/json" \
-H "Authorization: Bearer B8x5Vj1O65r6wnoV" \
-d '{        
       "resource":{"id":2}, 
       "project":{"id":9},
       "role_id:eq": 1,
       "tags:any": ["analyst","admin"]
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
        "title": "Mars Rover",
        "id": 5
      },
      "task": {
        "name": "Planning",
        "id": 3
      },
      "date": "2021-07-26",
      "time_start": "09:00",
      "time_end": "14:00",
      "hours": 5.0,
      "billing_status": 1,
      "rate_from": 8,
      "rate": 99.40,
      "entry_status": 4,
      "tags": [
        "analyst"
      ],
      "created_on": "2021-07-27T07:56:17.515125Z",
      "created_by": {
        "name": "John Doe",
        "id": 118
      },
      "modified_on": "2021-07-27T13:23:46.583746Z",
      "modified_by": {
        "name": "John Smith",
        "id": 1146
      },
      "submitted_on": "2021-07-27T07:56:17.515125Z",
      "submitted_by":{
        "name": "John Doe",
        "id": 118
      },
      "approval_time": "2021-07-27T13:23:46.583746Z",
      "approver":{
        "name": "John Smith",
        "id": 1146
      },
    },
    { ... },
    { ... }
  ]
}
```

<span class="optional"><b>REQUEST QUERY PARAMETERS</b></span>

|Name|Description|
|-:|:-|
**limit**<br>`optional` | The limit keyword is used to limit the number of records returned from a result set. If a limit count is given, no more than that many records will be returned (but possibly less, if the query itself yields less records)<br>_Default value of `limit` is_ <span class="required">**`500`**</span>.<br>_Maximum value of `limit` can be_ <span class="required">**`5000`**</span>.
**offset**<br>`optional` | Offset keyword is used to skip n items. If offset value is given as 10, then first 10 records will be skipped from result set. Offset is often used together with the Limit keyword.<br>_Default value of `offset` is_ <span class="required">**`0`**</span>.
**start**<br>`optional` | String value representing start date in ISO 8601 extended notation for date i.e. yyyy-MM-dd. This is used to filter timesheet entries on or after this date.
**end**<br>`optional` | String value representing end date in ISO 8601 extended notation for date i.e. yyyy-MM-dd. This is used to filter timesheet entries on or before this date.
||_**Note**: By default if `start` & `end` arguments are omitted, then timesheet entries of current month will be returned. If timesheet entries of a certain period are needed, then both `start` & `end` arguments are required. If only one argument `start` or `end` is passed then a bad request error is raised._

Search Timesheet API allows filtering the results set in various ways. This enables a great power to find out what is needed. eRS Cloud API also allows filtering on custom defined fields with multiple operators and conditions to cover up complex scenarios for searching.

A filter condition consists of three components which are **_field_**, **_operator_** and **_value_**. For example, fetching only those timesheets having tag `analyst` or `admin`, could be achieved by adding `"tags:any": ["analyst", "admin"]` to request body. If operator is not supplied, it takes default operator for field.

Below is a list of available fields, which allow filtering of timesheet entries:

|**Field Type**   | **Operator**  | **Example**|
:--|  :---    |  :---     |  :--- |
**role_id**|<li class="nowrap">**any** (_default_)  </li><li>none</li><li>eq</li><li>neq</li>| `"role_id:any": [1,2]`<br>`"role_id:none": [1,2]`<br>`"role_id:eq": 1`<br>`"role_id:neq": 1`
**tags**|<li>**any** (_default_)</li><li>none</li><li>all</li><li>ex</li>| `"tags:any": ["tagA","tagB"]`<br>`"tags:none": ["tagA","tagB"]`<br>`"tags:all": ["tagA","tagB"]`<br>`"tags:ex": ["tagA","tagB"]`
**created_on**|<li>**eq** (_default_)</li><li>lt</li><li>gt</li><li>bt</li><li>ex</li>| `"created_on:eq": ["2021-07-08T00:00:00]`<br>`"created_on:lt": ["2021-07-08T00:00:00]`<br>`"created_on:gt": ["2021-07-08T59:59:59"]`<br>`"created_on:bt": ["2021-07-08T00:00:00", "2021-07-10T23:59:59"]`<br>`"created_on:bt": ["2021-07-08T00:00:00", ""]` <br>`"created_on:bt": ["", "2021-07-10T23:59:59"]` <br>`"created_on:ex": ["2021-07-08T00:00:00", "2021-07-10T23:59:59"]` <br>`"created_on:ex": ["2021-07-08T00:00:00", ""]` <br>`"created_on:ex": ["", "2021-07-10T23:59:59"]]` 
**modified_on**|<li>**eq** (_default_)</li><li>lt</li><li>gt</li><li>bt</li><li>ex</li>| `"modified_on:eq": ["2021-07-08T00:00:00]`<br>`"modified_on:lt": ["2021-07-08T00:00:00]`<br>`"modified_on:gt": ["2021-07-08T59:59:59"]`<br>`"modified_on:bt": ["2021-07-08T00:00:00", "2021-07-10T23:59:59"]`<br>`"modified_on:bt": ["2021-07-08T00:00:00", ""]` <br>`"modified_on:bt": ["", "2021-07-10T23:59:59"]` <br>`"modified_on:ex": ["2021-07-08T00:00:00", "2021-07-10T23:59:59"]` <br>`"modified_on:ex": ["2021-07-08T00:00:00", ""]` <br>`"modified_on:ex": ["", "2021-07-10T23:59:59"]]` 
**approval_time**|<li>**eq** (_default_)</li><li>lt</li><li>gt</li><li>bt</li><li>ex</li>| `"approval_time:eq": ["2021-07-08T00:00:00]`<br>`"approval_time:lt": ["2021-07-08T00:00:00]`<br>`"approval_time:gt": ["2021-07-08T59:59:59"]`<br>`"approval_time:bt": ["2021-07-08T00:00:00", "2021-07-10T23:59:59"]`<br>`"approval_time:bt": ["2021-07-08T00:00:00", ""]` <br>`"approval_time:bt": ["", "2021-07-10T23:59:59"]` <br>`"approval_time:ex": ["2021-07-08T00:00:00", "2021-07-10T23:59:59"]` <br>`"approval_time:ex": ["2021-07-08T00:00:00", ""]` <br>`"approval_time:ex": ["", "2021-07-10T23:59:59"]]` 
**submitted_on**|<li>**eq** (_default_)</li><li>lt</li><li>gt</li><li>bt</li><li>ex</li>| `"submitted_on:eq": ["2021-07-08T00:00:00]`<br>`"submitted_on:lt": ["2021-07-08T00:00:00]`<br>`"submitted_on:gt": ["2021-07-08T59:59:59"]`<br>`"submitted_on:bt": ["2021-07-08T00:00:00", "2021-07-10T23:59:59"]`<br>`"submitted_on:bt": ["2021-07-08T00:00:00", ""]` <br>`"submitted_on:bt": ["", "2021-07-10T23:59:59"]` <br>`"submitted_on:ex": ["2021-07-08T00:00:00", "2021-07-10T23:59:59"]` <br>`"submitted_on:ex": ["2021-07-08T00:00:00", ""]` <br>`"submitted_on:ex": ["", "2021-07-10T23:59:59"]]` 
**created_by**|<li>**eq** (_default_)</li><li>neq</li><li>any</li><li>none</li>| `"created_by:eq": 1`<br>`"created_by:neq": 1`<br>`"created_by:any": [1, 2]`<br>`"created_by:none": [1, 2]`
**modified_by**|<li>**eq** (_default_)</li><li>neq</li><li>any</li><li>none</li>| `"modified_by:eq": 1`<br>`"modified_by:neq": 1`<br>`"modified_by:any": [1, 2]`<br>`"modified_by:none": [1, 2]`
**approver**|<li>**eq** (_default_)</li><li>neq</li><li>any</li><li>none</li>| `"approver:eq": 1`<br>`"approver:neq": 1`<br>`"approver:any": [1, 2]`<br>`"approver:none": [1, 2]`
**submitted_by**|<li>**eq** (_default_)</li><li>neq</li><li>any</li><li>none</li>| `"submitted_by:eq": 1`<br>`"submitted_by:neq": 1`<br>`"submitted_by:any": [1, 2]`<br>`"submitted_by:none": [1, 2]`
**entry_status**|<li>**eq** (_default_)</li><li>neq</li><li>any</li><li>none</li>| `"entry_status:eq": 1`<br>`"entry_status:neq": 2`<br>`"entry_status:any": [4, 8]`<br>`"entry_status:none": [1, 2]`
_Additionally, timesheet entries can also be filtered using <a href="#search-resources" class="api-ref">resource fields</a>, <a href="#search-projects" class="api-ref">project fields</a> and <a href="#filters-for-user-defined-fields" class="api-ref">custom fields</a> of timesheet. An example request for fetching only timesheet entry having `resource_id` as 2, `project_id` as 9 and `role_id` as 1 is shown._

## Update a Timesheet Entry

Updates the specified timesheet entry by setting values of parameters passed. Values of any parameters which are not provided will be unchanged.  To unset existing value for a parameter, just pass an empty value i.e. `null`.

>  **`PUT /v1/timesheet/{ID}`**

> Example Request

```shell
curl -v -X PUT "https://app.eresourcescheduler.cloud/rest/v1/timesheet/25" \
-H "Authorization: Bearer B8x5Vj1O65r6wnoV" \
-H "Content-Type: application/json" \
-d '{ 
      "resource_id": 3, 
      "project_id" : 4, 
      "hours" : 5,
      "date": "2021-07-24",
      "comment": "Client presentation is prepared."
    }'
```
<span class="optional"><b>REQUEST BODY PARAMETERS</b></span>

Name               |  Description
 ---:        |    :----   
**resource_id**  <br><span class="required">`required`</span>  | ID of resource object which is being used in timesheet entry. This will throw an error if you post an empty value.
**project_id** <br><span class="required">`required`</span>  |  ID of project object which this timesheet entry is being created for. This will throw an error if you post an empty value.
**date**<br><span class="required">`required`</span>  | String value representing a date on which task was performed. Date accepts value in ISO 8601 format i.e. yyyy-MM-dd. Date of a timesheet entry cannot be before `start_date` or after `last_date` of the resource for which this timesheet entry is being created.
**time_start** <br>  | Represents start time for timesheet entry. This field accepts value in HH:MM in 24 hour format or HH:MMam or HH:MMpm in 12 hour format.
**time_end** <br>  | Represents end time for timesheet entry. This field accepts value in HH:MM in 24 hour format or HH:MMam or HH:MMpm in 12 hour format. `time_end` must always be ahead of `time_start`.
**hours** <br> | This defines how many hours the resource worked on a given task. Hours value is a floating point number which could not be 0 or less than 0 and greater than 99999  (When entries for more than 24 hours a day is disabled, maximum value can be up to 24).<br><br>_**Note**: The user should either provide `time_start` and `time_end` or `hours`. `time_start` and `time_end` value can also be provided with `hours` when the difference between them is equal to `hours` value._
**role_id**<br><span class="mandatoryFlag">&#9873;</span> <span class="removableFlag mln-2">&#9873;</span> | ID of role object which was performed for this timesheet entry. This could be ID of a role which targeted resource performed.
**task_id**<br><span class="removableFlag mln-2">&#9873;</span> |  ID of task object performed in this timesheet entry. This could only be ID of a task which is listed in targeted project.
**entry_status**<br>`optional` | Integer number (1/2/4/8) representing status of timesheet entry. Timesheet Entry Status value could be one of the following:<br><br><li>**1** for `Draft` : This represents timesheet entry is in Draft state. By default, timesheet entries are created in Draft state. </li> <li> **2** for `Submitted` : This represents timesheet entry is Submitted.</li> <li> **4** for `Approved` : This represents timesheet entry is Approved.</li> <li> **8** for `Rejected` : This represents timesheet entry is Rejected.</li>
**billing_status**<br>`optional`  | Integer number (1/2/4) representing billing status of the timesheet entry. Billing status value could be one of the following :<br><br><li>**1** for `Inherit from Project` : This represents billing status will be the same as given for the project associated with this timesheet entry. </li> <li> **2** for `Billable` : This defines billing status as billable for this timesheet entry.</li> <li> **4** for `Non Billable` : This is used to set the timesheet entry to non billable.<br><br>_**Note**: Default value of billing status can be set from <a href="https://app.eresourcescheduler.cloud/#!/admin/settings/timesheet" target="_blank" class="api-ref">Administrator Timesheet Settings</a>. <span class="warning">This field is available only when financial module is active</span>._ |
**rate_from**<br>`optional` | Integer number (1/2/4/8) representing billing rate of the timesheet entry. Billing rate value could be one of the following :<br><br><li>**1** for `Inherit from Project` : This represents billing rate will be the same as given for the project associated with this timesheet entry. </li> <li> **2** for `Inherit from Resource` :  This represents billing rate will be the same as given for the resource associated with this timesheet entry.</li> <li> **4** for `Inherit from Role` :  This represents billing rate will be the same as given for the performing role associated with this timesheet entry.<li> **8** for `Custom` :  Custom hourly rate can be defined on a timesheet entry with this billing rate value.<br><br>_**Note**: Default value of billing rate can be set from <a href="https://app.eresourcescheduler.cloud/#!/admin/settings/timesheet" target="_blank" class="api-ref">Administrator Timesheet Settings</a>. <span class="warning">This field is available only when financial module is active</span>._ |
**rate**  <br>`optional`  | This defines hourly billing rate associated with this timesheet entry. Rate value is a floating point number which can not be less than 0 and greater than 99999999.99. Rate can only be defined when value of `rate_from` is 8, i.e `Custom`.<br><br>_**Note**: <span class="warning">This field is available only when financial module is active</span>._ 
**tags**<br><span class="removableFlag mln-2">&#9873;</span> | An optional array of strings which could be attached to this timesheet entry object as labels. This can be useful for the purpose of identification or other information.
**comment**<br> `optional` | An optional string which could be attached to this timesheet entry. This can be useful for describing the detail of the work.<br><br>_**Note**: Existing comments cannot be updated but new comments can always be added with timesheet updates._
**udf_\***<br><span class="mandatoryFlag">&#9873;</span> <span class="removableFlag mln-2">&#9873;</span> | A user with Administrator rights can add custom fields. These fields can be used to capture additional information in timesheet entry. <a href="#user-defined-fields" class="api-ref">Learn more</a><br><br>_**Note**: User with Administrator rights can make fields marked with <span class="mandatoryFlag iconInline">&#9873;</span> mandatory and remove fields marked with <span class="removableFlag iconInline">&#9873;</span>, from <a href ="#timesheet-profile" class="api-ref">timesheet profile</a> using eRS Cloud Application. If mandatory fields are not passed with a valid value or removed fields are passed while creating timesheet entry, the operation will fail with response code **400**_.

### Returns

| Code      | Description | 
| ---:        |    :----   | 
**200** <br> <span class = "success">`OK`</span>    |  This indicates that the operation was successful and a timesheet entry updated successfully.
**400** <br> <span class = "error">`Bad Request`</span> | Bad Request error occurs when a request is malformed, syntactically incorrect, empty required parameters or any unknown parameter is passed. Additionally, Bad request may also occur in one of these conditions :<ul><li>Trying to update `time_start` or `time_end` such that `time_end` gets earlier than `time_start`.</li><li>Trying to update `date` of timesheet entry before the `start_date` of resource or after `last_date` of resource. (if resource has a `last_date` defined).</li><li>Trying to update timesheet entry of archived resource.</li><li>Trying to update timesheet entry of archived project.</li><li>Parameters passed in timesheet entry are violating one or more pre-defined configurations of resource or project from  <a href="https://app.eresourcescheduler.cloud/#!/timesheet/setup/resources" target="_blank" class="api-ref">Timesheet Setup</a> using eRS Cloud Application.</li></ul>
**403** <br> <span class = "error">`Forbidden`</span> |Authorization failed due to insufficient permissions. This occurs when user does not have enough access rights to perform this action. Access for each user can be controlled by an Administrator using eRS Cloud Application.
**404** <br> <span class = "error">`Not Found`</span> | Not Found error occurs when requested timesheet entry does not exist (i.e. There is no timesheet entry with given ID). This may also occur when requesting a timesheet entry that has been deleted.

## Update a Timesheet Entry Status

Updates status of a specified timesheet entry by setting different integer values set for status.

>  **`PUT /v1/timesheet/status/{ID}`**

> Example Request

```shell
curl -v -X PUT "https://app.eresourcescheduler.cloud/rest/v1/timesheet/status/25" \
-H "Authorization: Bearer B8x5Vj1O65r6wnoV" \
-H "Content-Type: application/json" \
-d '{ 
      "entry_status": 2
    }'
```

<span class="optional"><b>REQUEST BODY PARAMETERS</b></span>

Name               |  Description
 ---:        |    :----   |
**entry_status**<br>`optional` | Integer number (1/2/4/8) representing status of timesheet entry. Timesheet Entry Status value could be one of the following:<br><br><li>**1** for `Draft` : This represents timesheet entry is in Draft state. By default, timesheet entries are created in Draft state. </li> <li> **2** for `Submitted` : This represents timesheet entry is Submitted.</li> <li> **4** for `Approved` : This represents timesheet entry is Approved.</li> <li> **8** for `Rejected` : This represents timesheet entry is Rejected.</li>

### Returns

| Code      | Description | 
| ---:        |    :----   | 
**200** <br> <span class = "success">`OK`</span>    |  This indicates that the operation was successful and status of timesheet entry has been updated successfully.
**400** <br> <span class = "error">`Bad Request`</span> | Bad Request error occurs when a request is malformed, syntactically incorrect, empty required parameters or any unknown parameter is passed. Additionally, Bad request may also occur in one of these conditions :<ul><li>Trying to update timesheet entry status other then `Draft`, `Submitted`, `Approved` or `Rejected`(passing values other than 1/2/4/8 for `entry_status`).</li><li>Trying to update timesheet entry status targeted on an  archived resource</li><li>Trying to update timesheet entry status targeted on an archived project.</li></ul>
**403** <br> <span class = "error">`Forbidden`</span> |Authorization failed due to insufficient permissions. This occurs when user does not have enough access rights to perform this action. Access for each user can be controlled by an Administrator using eRS Cloud Application.
**404** <br> <span class = "error">`Not Found`</span> | Not Found error occurs when requested timesheet entry does not exist (i.e. There is no timesheet entry with given ID). This may also occur when requesting a timesheet entry that has been deleted.

## Delete a Timesheet Entry

Permanently deletes a timesheet entry. It cannot be undone.

> **`DELETE /v1/timesheet/{ID}`**


> Example Request
 
```shell
curl -v -X DELETE "https://app.eresourcescheduler.cloud/rest\
/v1/timesheet/1" -H "Authorization: Bearer B8x5Vj1O65r6wnoV"
```

### Returns


| Code      | Description  
| ---:        |    :----   
| **200** <br><span class = "success">`OK`</span> |This status code indicates that the operation was successful and a timesheet entry deleted successfully. |
| **403** <br> <span class = "error">`Forbidden`</span> | Authorization failed due to insufficient permissions. This occurs when user does not have enough access rights to perform this action. Access for each user can be controlled by an Administrator using eRS Cloud Application.|
| **404** <br> <span class = "error">`Not Found`</span> | Not Found error occurs when requested timesheet entry does not exist or is already deleted.
