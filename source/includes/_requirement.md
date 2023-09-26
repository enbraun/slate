# Requirement

## Requirement Object

>Example Response

```json
{
    "id": 251,
    "project": {
      "id": 2,
      "title": "Mars Rover"
    },
    "task": {
      "name": "Data Processing",
      "id": 7
    },
    "role": {
      "name": "Tax Manager",
      "id": 11
    },
    "start_time": "2023-08-21T09:00:00",
    "end_time": "2023-08-22T17:00:00",
    "effort": 32,
    "unit": 2,
    "tags": [
      "London",
      "onsite"
    ],
    "assignments": [ {
      "booking_id": 3306,
      "resource": {
        "id": 126,
        "name": "Oliver"
      },
      "start_time": "2023-09-20T09:00:00",
      "end_time": "2023-09-25T17:15:00",
      "effort_hrs": 16.12
      }, {
      "booking_id": 3305,
      "resource": {
        "id": 140,
        "name": "Thomas"
      },
      "start_time": "2023-09-20T09:00:00",
      "end_time": "2023-09-25T17:15:00",
      "effort_hrs": 16.3
      } ],
    "flexi_range_duration": 5,
    "flexi_range_unit": 2,
    "allow_multi_allocation": true,
    "conditions": [ {
      "operator": "all",
      "field": "udf_skills",
      "values": [ {
        "name": "Account Reconciliation",
        "description": null,
        "id": 34
    }, {
        "name": "Account Taxation",
        "description": null,
        "id": 23
    } ],
      "weightage": 10,
      "is_mandatory": true
     }, {
      "operator": "any",
      "field": "udf_city",
      "values": [ {
        "name": "London",
        "description": null,
        "id": 361
    }, {
        "name": "Dublin",
        "description": null,
        "id": 362
    } ],
      "weightage": 10,
      "is_mandatory": false
    } ],
    "created_on": "2023-09-15T09:03:48.428713+00:00",
    "created_by": {
      "name": "John doe",
      "id": 4
    },
    "modified_on": "2023-09-15T09:05:40.515333+00:00",
    "modified_by": {
      "name": "John doe",
      "id": 5
    }
}
```

<span style="color:#b93d6a">`Requirement`</span> object represents a role request for a specific project or task within a defined time range.

<span class="optional"><b>ATTRIBUTES</b></span>

Following attributes are available for requirement object. To know about attributes currently applied for requirement object please check <a href="#requirement-profile" class="api-ref">Requirement Profile</a> API.

Name         |  Description
 ---:        |    :---- 
**id** <br>`integer`   | eRS Cloud generated unique identifier for the requirement object.
**project** <br>`object` |  Project object for which this requirement was created.
**task** <br>`object` | Task object defines what needs to be done.These tasks can be selected from the predefined tasks within the project associated with the requirement.
**role** <br>`object` | Role object defines which role resource needs to perform for this requirement. 
**start_time** <br>`string` | Represents the starting date and time of the requirement.
**end_time** <br>`string` | Represents the ending date and time of the requirement.
**effort** <br>`float` |  Represents the effort value for the requirement.
**unit** <br>`integer` |  Represents unit of effort for the requirement. Unit could be one of `Hours` or `Full Time Equivalent`.
**tags** <br>`array of strings` | Tags are strings (labels) associated with this requirement object which could be used for the purpose of identification or other information.
**assignments** <br>`array of object` | This refers to resources that have been allocated to fulfill the requirements of the project or task.</li><li>**assignments.booking_id** `integer` <br> ID of the booking object on which the resource has been assigned against the requirement.</li><li>**assignments.resource** `object` <br>ID and name of the resource that has been assigned to the requirement.</li><li>**assignments.start_time** `string` <br> Represents the start date and time of the booking object of the assigned resource.</li><li>**assignments.end_time** `string` <br> Represents the end date and time of the booking object of the assigned resource.<li>**assignments.effort_hrs** `float` <br>Represents the effort value required from the assigned resource for the project in the booking object.</li>
**flexi_range_duration** <br>`integer` | Represents the defined duration range for flexibility in fulfilling the requirement compared to the original requirement date.
**flexi_range_unit** <br>`integer` | Represents a unit that allows for flexibility in fulfilling the requirement. Unit value could be one of the following:<br><br><li> **1** for `Hours` : Refers to 'hours' as a unit.</li><li> **2** for `Days` : Refers to 'days' as a unit.</li><br>
**allow_multi_allocation** <br>`boolean` | This refers to allocation of a specific requirement to multiple assignment.
**conditions** <br>`array of object` | This refers to the criteria on which the requirement must be fulfilled.<li>**conditions.field** `string` <br> This is a reference to the text's API_code.</li> <li>**<a href="#requirement-operator" class="api-ref">conditions.operator</a>** `string`  <br> This refers to a character that represents a specific mathematical or logical action or process. </li><li>**conditions.values** <br>This refers to the values defined for the requirement to be considered in suggested resources.</li><li>**conditions.weightage** `integer`  <br> Every condition can be assigned relative importance in comparison to other conditions to calculate its weightage. Weightage is ultimately used to calculate the match score of resources.</li> <li>**conditions.is_mandatory** `boolean` <br> Indicates whether this field is mandatory. If this field is marked as mandatory, it means that a required value must be provided for it in the suggested resources.</li>
**created_on** <br>`string` | Timestamp at which this requirement object was created.
**created_by** <br> `object` | Object representing user who created this requirement object.
**modified_on** <br>`string` | Represents latest modification timestamp.
**modified_by** <br>`object` | Object representing most recent user who modified this requirement object.

## Create a Requirement

> **`POST v1/requirements`**


> Example Request:

```shell
 curl -v -X POST "https://app.eresourcescheduler.cloud/rest/v1/requirements" \
 -H "Authorization: Bearer B8x5Vj1O65r6wnoV" \
 -H "Content-Type: application/json" \
 -d '{ 
        "project_id": 1,
        "task_id": 1,
        "role_id": 7,
        "start_time": "2023-10-02T00:00:00",
        "end_time": "2023-10-03T00:00:00",
        "effort": 3,
        "unit": 4,
        "tags": ["London","Onsite"] ,
        "flexi_range_duration": 5,
        "flexi_range_unit": 2,
        "allow_multi_allocation": true,
        "conditions": [{
            "field": "udf_qualification",
            "operator": "any",
            "values": [334,337],
            "weightage": 40,
            "is_mandatory": true
          }, {
            "field": "udf_experiences",
            "operator": "eq",
            "values": 5,
            "weightage": 40,
            "is_mandatory": true
          }
        ]
      }'
```

Creates a new requirement object.


<span class="optional"><b>REQUEST BODY PARAMETERS</b></span>

Name               |  Description
 ---:        |    :----   
**project_id** <br><span class="required">`required`</span>  |  ID of the project object for which this requirement object is being created.
**task_id**<br>|  ID of the task object within the project that needs to be done in this requirement.
**role_id**<br>|  ID of the role object that the resource needs to perform for the requirement. Role can be either the performing role or non-performing role of the resource.
**start_time** <br> <span class="required">`required`</span>  | Represents start date and time for requirement object. This field accepts value in ISO 8601 format for date-time i.e. yyyy-mm-ddThh:mm:ss. The value must be snapped in 15 minutes interval, which effectively means that minutes values should be one of(00/15/30/45) and seconds value should always be 0. (if given).
**end_time** <br> <span class="required">`required`</span>  | Represents end date and time for requirement object. This field accepts value in ISO 8601 format for date-time i.e. yyyy-mm-ddThh:mm:ss. The value must be snapped in 15 minutes interval, which effectively means that minutes values should be one of(00/15/30/45) and seconds value should always be 0. (if given). `end_time` must always be ahead of `start_time` by at least 15 minutes as a requirement of less than 15 minutes is not allowed.
**effort** <br> <span class="required">`required`</span>|Represents the effort value for the requirement.This defines how much effort is needed to complete the task. Effort value is a floating-point number that cannot be less than 0 or greater than 99999999.99. If effort value is not provided system will take default value 0.
**unit**<br> <span class="required">`required`</span>  | Integer number (2 or 4) represents the unit in which effort is defined. The unit value can be one of the following:<br><br><li> **2** for `Hours` : This defines `effort` value in fixed hours which doesn't change upon changes in requirement.</li><li> **4** for `Full Time Equivalent` : Full time equivalent is calculated using FTE calendar defined in <a href="https://app.eresourcescheduler.cloud/#!/admin/calendars/settings" target="_blank" class="api-ref">Administrator calendar settings</a>. Capacity from FTE calendar for defined time in requirement, is considered as 1 FTE.</li><br>
**tags** <br>`array of strings` |Tags are strings (labels) associated with this requirement object which could be used for the purpose of identification or other information.
**flexi_range_duration** <br>`integer` |Represents the defined duration range for flexibility in fulfilling the requirement compared to the original requirement date.
**flexi_range_unit** <br>`integer` | Represents a unit that allows for flexibility in fulfilling the requirement. Unit value could be one of the following:<br><br><li> **1** for `Hours` : Refers to 'hours' as a unit</li><li> **2** for `Days` : Refers to 'days' as a unit </li><br>
**allow_multi_allocation** <br>`boolean` | This refers to allocation of a specific requirement to multiple resources simultaneously.
**conditions** <br>`array of object` | This refers to the criteria on which the requirement must be fulfilled.<li>**conditions.field** `string` <br> This is a reference to the text's API_code.</li> <li><a href="#requirement-operator" class="api-ref">conditions.operator</a>`string`  <br> This refers to a character that represents a specific mathematical or logical action or process. </li><li>**conditions.values** <br>This refers to the values defined for the requirement to be considered in suggested resources.</li> <li>**conditions.weightage** `integer`  <br> Every condition can be assigned relative importance in comparison to other conditions to calculate its weightage. Weightage is ultimately used to calculate the match score of resources.</li> <li>**conditions.is_mandatory** `boolean` <br> Indicates whether this field is mandatory. If this field is marked as mandatory, it means that a required value must be provided for it in the suggested resources.</li>


### Returns
 
| Code      |Description |
 :---        |    :----   |
| **201** <br><span class = "success">`Created`</span> | This status code indicates that the operation was successful and  a requirement is created successfully.|
**400** <br> <span class = "error">`Bad Request`</span> | Bad Request error occurs when a request is malformed, syntactically incorrect, missing required parameters or any unknown parameter is passed. Additionally, Bad request may also occur in one of these conditions:<ul><li>Project is marked as  Archived.</li><li>Duration of requirement is more than allowed requirement duration set by Administrator using ers Cloud Application in <a href="https://app.eresourcescheduler.cloud/#!/admin/settings/requirement" target="_blank" class="api-ref">Administrator Requirement Settings</a>.</li></ul>
**403** <br> <span class = "error">`Forbidden`</span> |Authorization failed due to insufficient permissions. This occurs when user does not have enough access rights to perform this action. Access for each user can be controlled by an Administrator using eRS Cloud Application.|

## List Requirements

Returns list of requirements. The requirements are returned sorted by requirement's `start_time` and ID. 
	
> **`GET /v1/requirements`**

> Example Request

```shell
curl -v GET "https://app.eresourcescheduler.cloud/rest/v1/requirements?\
start=2023-01-01&end=2023-12-31" \
-H "Authorization: Bearer B8x5Vj1O65r6wnoV"
```

>Example Request With Offset And Limit 

```shell 
curl -v GET "https://app.eresourcescheduler.cloud/rest/v1/requirements?\
start=2023-01-01&end=2023-12-31&offset=1&limit=10" \
-H "Authorization: Bearer B8x5Vj1O65r6wnoV"
```

> Example Response

```json
{
  "total_count": 7,
  "data": [{
      "id": 251,
      "project": {
        "id": 2,
        "title": "Mars Rover"
      },
      "task": {
        "name": "Data Processing",
        "id": 7
      },
      "role": {
        "name": "Tax Manager",
        "id": 11
      },
      "start_time": "2023-08-21T09:00:00",
      "end_time": "2023-08-22T17:00:00",
      "effort": 32,
      "unit": 2,
      "tags": [
        "London",
        "onsite"
      ],
      "assignments": [ {
      "booking_id": 3306,
      "resource": {
        "id": 126,
        "name": "Oliver"
      },
      "start_time": "2023-09-20T09:00:00",
      "end_time": "2023-09-25T17:15:00",
      "effort_hrs": 16.12
      }, {
      "booking_id": 3305,
      "resource": {
        "id": 140,
        "name": "Thomas"
        },
      "start_time": "2023-09-20T09:00:00",
      "end_time": "2023-09-25T17:15:00",
      "effort_hrs": 16.3
      } ],
      "flexi_range_duration": 5,
      "flexi_range_unit": 2,
      "allow_multi_allocation": true,
      "conditions": [ {
        "operator": "all",
        "field": "udf_skills",
        "values": [ {
          "name": "Account Reconciliation",
          "description": null,
          "id": 34
      }, {
          "name": "Account Taxation",
          "description": null,
          "id": 23
      } ],
        "weightage": 10,
        "is_mandatory": true
      }, {
        "operator": "any",
        "field": "udf_city",
        "values": [ {
          "name": "London",
          "description": null,
          "id": 361
      }, {
          "name": "Dublin",
          "description": null,
          "id": 362
      } ],
        "weightage": 10,
        "is_mandatory": false
      } ],
      "created_on": "2023-09-15T09:03:48.428713+00:00",
      "created_by": {
        "name": "John doe",
        "id": 4
      },
      "modified_on": "2023-09-15T09:05:40.515333+00:00",
      "modified_by": {
        "name": "John doe",
        "id": 5
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
**limit**<br>`optional` | The limit keyword is used to limit the number of records returned from a result set. If a limit count is given, no more than that many records will be returned (but possibly less, if the query itself yields less records)<br>_Default value of `limit` is_ <span class="required">**`100`**</span>.<br>_Maximum value of `limit` can be_ <span class="required">**`500`**</span>.
**offset**<br>`optional` | Offset keyword is used to skip n items. If offset value is given as 10, then first 10 records will be skipped from result set. Offset is often used together with the Limit keyword.<br>_Default value of `offset` is_ <span class="required">**`0`**</span>.
**start**<br>`optional` | String value representing start date in ISO 8601 extended notation for date i.e. yyyy-MM-dd. This is used to filter requirements starting on or after this date.
**end**<br>`optional` | String value representing end date in ISO 8601 extended notation for date i.e. yyyy-MM-dd. This is used to filter requirements starting before this date.
||_**Note**: By default if `start` & `end` arguments are omitted, then requirements of current month will be returned. If requirements of a certain period are needed, then both `start` & `end` arguments required. If only one argument `start` or `end` is passed then a bad request error is raised._


### Returns 


| Code      | Description | 
| ---:        |    :----   | 
| **200** <br> <span class = "success">`OK`</span>      |This indicates that the operation was successful and list of requirements is returned.  |
**400** <br> <span class = "error">`Bad Request` </span>| Bad Request may occur when offset or limit value is negative integer.|
| **403** <br> <span class = "error">`Forbidden`</span> | Authorization failed due to insufficient permissions. This occurs when user does not have enough access rights to perform this action. Access for each user can be controlled by an Administrator using eRS Cloud Application.


## Retrieve a Requirement

> **`GET v1/requirements/{ID}`**

> Example Request

```shell
curl -v -X GET "https://app.eresourcescheduler.cloud/rest/v1/requirements/251" \
-H "Authorization: Bearer B8x5Vj1O65r6wnoV"
```

> Example Response

```json
{
  "id": 251,
  "project": {
    "id": 2,
    "title": "Mars Rover"
  },
  "task": {
    "name": "Data Processing",
    "id": 7
  },
  "role": {
    "name": "Tax Manager",
    "id": 11
  },
  "start_time": "2023-08-21T09:00:00",
  "end_time": "2023-08-22T17:00:00",
  "effort": 32,
  "unit": 2,
  "tags": [
    "London",
    "onsite"
  ],
  "assignments": [ {
    "booking_id": 3306,
    "resource": {
      "id": 126,
      "name": "Oliver"
    },
    "start_time": "2023-09-20T09:00:00",
    "end_time": "2023-09-25T17:15:00",
    "effort_hrs": 16.12
    }, {
    "booking_id": 3305,
    "resource": {
      "id": 140,
      "name": "Thomas"
      },
    "start_time": "2023-09-20T09:00:00",
    "end_time": "2023-09-25T17:15:00",
    "effort_hrs": 16.3
      } ],
  "flexi_range_duration": 5,
  "flexi_range_unit": 2,
  "allow_multi_allocation": true,
  "conditions": [ {
    "operator": "all",
    "field": "udf_skills",
    "values": [ {
      "name": "Account Reconciliation",
      "description": null,
      "id": 34
  }, {
      "name": "Account Taxation",
      "description": null,
      "id": 23
  } ],
    "weightage": 10,
    "is_mandatory": true
    }, {
    "operator": "any",
    "field": "udf_city",
    "values": [ {
      "name": "London",
      "description": null,
      "id": 361
  }, {
      "name": "Dublin",
      "description": null,
      "id": 362
  } ],
    "weightage": 10,
    "is_mandatory": false
  } ],
  "created_on": "2023-09-15T09:03:48.428713+00:00",
  "created_by": {
    "name": "John doe",
    "id": 4
  },
  "modified_on": "2023-09-15T09:05:40.515333+00:00",
  "modified_by": {
    "name": "John doe",
    "id": 5
  }
}
```
Retrieves the details of an existing requirement. You only need to  provide the unique requirement identifier that was returned upon requirement creation.

### Returns

| Code      | Description | 
| ---:        |    :----   | 
**200** <br> <span class = "success">`OK`</span> | This status code indicates that the operation was successful and a requirement returned successfully.
**403** <br> <span class = "error">`Forbidden`</span> |Authorization failed due to insufficient permissions. This occurs when user does not have enough access rights to perform this action. Access for each user can be controlled by an Administrator using eRS Cloud Application.
**404** <br> <span class = "error">`Not Found`</span> | Not Found error occurs when requested requirement does not exist (i.e. There is no requirement with given ID). This may also occur when requesting a requirement that has been deleted.

## Search Requirements



>  **`POST /v1/requirements/search`**

> Example Request For Filter In JSON Format

```shell
curl -X POST "https://app.eresourcescheduler.cloud/rest/v1/requirements/search?\
start=2023-01-01&end=2023-12-31" \
-H "Content-Type: application/json" \
-H "Authorization: Bearer B8x5Vj1O65r6wnoV" \
-d '{ 
      "requirement":{
        "role_id:any":1
        }
    }'
```

> Example Request For Filter By Passing Multiple Filters In JSON Format

```shell
curl -X POST "https://app.eresourcescheduler.cloud/rest/v1/requirements/search?\
start=2023-01-01&end=2023-12-31" \
-H "Content-Type: application/json" \
-H "Authorization: Bearer B8x5Vj1O65r6wnoV" \
-d '{
       "project":{"id:eq":1},
       "requirement":{"role_id:any":1},
       "task":{"id:any":[2,3]}
     }'
```

> Example Response

```json
{
  "total_count": 3,
  "data": [{
      "id": 249,
      "project": {
        "id": 1,
        "title": "Apollo 11"
      },
      "task": {
        "name": "Data Handling",
        "id": 3
      },
      "role": {
        "name": "Project Manager",
        "id": 1
      },
      "start_time": "2023-09-21T09:00:00",
      "end_time": "2023-09-22T17:00:00",
      "effort": 32,
      "unit": 2,
      "tags": [
        "London",
        "onsite"
      ],
       "assignments": null,
      "flexi_range_duration": 5,
      "flexi_range_unit": 2,
      "allow_multi_allocation": true,
      "conditions": [ {
        "operator": "all",
        "field": "udf_skills",
        "values": [ {
          "name": "Account Reconciliation",
          "description": null,
          "id": 34
      }, {
          "name": "Account Taxation",
          "description": null,
          "id": 23
      } ],
        "weightage": 10,
        "is_mandatory": true
      }, {
        "operator": "any",
        "field": "udf_city",
        "values": [ {
          "name": "London",
          "description": null,
          "id": 361
      }, {
          "name": "Dublin",
          "description": null,
          "id": 362
      } ],
        "weightage": 10,
        "is_mandatory": false
      } ],
      "created_on": "2023-09-15T09:03:48.428713+00:00",
      "created_by": {
        "name": "John doe",
        "id": 4
      },
      "modified_on": "2023-09-15T09:05:40.515333+00:00",
      "modified_by": {
        "name": "John doe",
        "id": 5
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
**limit**<br>`optional` | The limit keyword is used to limit the number of records returned from a result set. If a limit count is given, no more than that many records will be returned (but possibly less, if the query itself yields less records)<br>_Default value of `limit` is_ <span class="required">**`100`**</span>.<br>_Maximum value of `limit` can be_ <span class="required">**`500`**</span>.
**offset**<br>`optional` | Offset keyword is used to skip n items. If offset value is given as 10, then first 10 records will be skipped from result set. Offset is often used together with the Limit keyword.<br>_Default value of `offset` is_ <span class="required">**`0`**</span>.
**start**<br>`optional` | String value representing start date in ISO 8601 extended notation for date i.e. yyyy-MM-dd. This is used to filter requirements starting on or after this date.
**end**<br>`optional` | String value representing end date in ISO 8601 extended notation for date i.e. yyyy-MM-dd. This is used to filter requirements starting before this date.
||_**Note**: By default if `start` & `end` arguments are omitted, then requirements of current month will be returned. If requirements of a certain period are needed, then both `start` & `end` arguments required. If only one argument `start` or `end` is passed then a bad request error is raised._

Search Requirement API allows filtering the results set in various ways. This enables a great power to find out what is needed. eRS Cloud API also allows filtering on custom defined fields with multiple operators and conditions to cover up complex scenarios for searching.

A filter condition consists of three components which are **_field_**, **_operator_** and **_value_**. For example, fetching only those requirements having tag `tagA` or `tagB`, could be achieved by adding `"tags:any": ["tagA", "tagB"]` to request body. If operator is not supplied, it takes default operator for field.

Below is a list of available fields, which allow filtering requirements:

|**Field Type**   | **Operator**  | **Example**|
:--|  :---    |  :---     |  :--- |
**tags**|<li class="nowrap">**any** (_default_)</li><li>none</li><li>all</li><li>ex</li>| `"tags:any": ["tagA","tagB"]`<br>`"tags:none": ["tagA","tagB"]`<br>`"tags:all": ["tagA","tagB"]`<br>`"tags:ex": ["tagA","tagB"]`
|**gap**| <li class="nowrap">**eq** *(default)* </li><li>lt</li><li>gt</li><li>bt</li><li>ex</li>| `"gap:eq": "50h", "gap:eq":"50%"`<br>`"gap:lt": "50h", "gap:eq":"50%"`<br>`"gap:gt": "50h", "gap:eq":"50%"`<br>`"gap:bt": ["50h","60h"], "gap:eq":["50%","60%"] ` <br>`"gap:ex": ["50h","60h"], "gap:eq":["50%","60%"]`  
**role_id**|<li class="nowrap">**any** (_default_)  </li><li>none</li><li>eq</li><li>neq</li>| `"role_id:any": [1,2]`<br>`"role_id:none": [1,2]`<br>`"role_id:eq": 1`<br>`"role_id:neq": 1`
**created_by**|<li class="nowrap">**eq** (_default_)</li><li>neq</li><li>any</li><li>none</li>| `"created_by:eq": 1`<br>`"created_by:neq": 1`<br>`"created_by:any": [1, 2]`<br>`"created_by:none": [1, 2]`
**modified_by**|<li class="nowrap">**eq** (_default_)</li><li>neq</li><li>any</li><li>none</li>| `"modified_by:eq": 1`<br>`"modified_by:neq": 1`<br>`"modified_by:any": [1, 2]`<br>`"modified_by:none": [1, 2]`
**created_on**|<li class="nowrap">**eq** (_default_)</li><li>lt</li><li>gt</li><li>bt</li><li>ex</li>| `"created_on:eq": ["2021-07-08T00:00:00"]`<br>`"created_on:lt": ["2021-07-08T00:00:00"]`<br>`"created_on:gt": ["2021-07-08T59:59:59"]`<br>`"created_on:bt": ["2021-07-08T00:00:00", "2021-07-10T23:59:59"]` <br>`"created_on:bt": ["2021-07-08T00:00:00", ""]` <br>`"created_on:bt": ["", "2021-07-10T23:59:59"]` <br>`"created_on:ex": ["2021-07-08T00:00:00", "2021-07-10T23:59:59"]` <br>`"created_on:ex": ["2021-07-08T00:00:00", ""]` <br>`"created_on:ex": ["", "2021-07-10T23:59:59"]]` 
**modified_on**|<li class="nowrap">**eq** (_default_)</li><li>lt</li><li>gt</li><li>bt</li><li>ex</li>| `"modified_on:eq": ["2021-07-08T00:00:00"]`<br>`"modified_on:lt": ["2021-07-08T00:00:00"]`<br>`"modified_on:gt": ["2021-07-08T59:59:59"]`<br>`"modified_on:bt": ["2021-07-08T00:00:00", "2021-07-10T23:59:59"]` <br>`"modified_on:bt": ["2021-07-08T00:00:00", ""]` <br>`"modified_on:bt": ["", "2021-07-10T23:59:59"]` <br>`"modified_on:ex": ["2021-07-08T00:00:00", "2021-07-10T23:59:59"]` <br>`"modified_on:ex": ["2021-07-08T00:00:00", ""]` <br>`"modified_on:ex": ["", "2021-07-10T23:59:59"]]` 

## Update a Requirement

Updates the specified requirement by setting values of parameters passed. Values of any parameters which are not provided will be unchanged. To unset existing value for a parameter, just pass an empty value i.e. `null`.

>  **`PUT /v1/requirements/{ID}`**

> Example Request

```shell
curl -v -X PUT "https://app.eresourcescheduler.cloud/rest/v1/requirements/251" \
-H "Authorization: Bearer B8x5Vj1O65r6wnoV" \
-H "Content-Type: application/json" \
-d '{
    "project_id": 1,
    "start_time": "2023-08-15T09:00:00",
    "end_time":"2023-08-15T17:00:00",
    "effort": 8,
    "role_id":3,
    "unit": 2,
    "conditions": [
        {
          "field":"udf_qualification",
          "operator":"any",
          "values":[18,26],
          "weightage":20,
          "is_mandatory":false}
    ]
}'
```

> Example Request: Update a requirement and unlinking its linked bookings

```shell
curl -v -X PUT "https://app.eresourcescheduler.cloud/rest/v1\
/requirements/106?unlink_bookings=true" \
-H "Authorization: Bearer B8x5Vj1O65r6wnoV" \
-H "Content-Type: application/json" \
-d '{ 
        "task_id":4,
        "role_id":1,
        "start_time":"2023-10-10T09:00:00",
        "end_time":"2023-10-13T17:00:00"      
    }'
```

> Example Request: Update a requirement and deleting its linked bookings

```shell
curl -v -X PUT "https://app.eresourcescheduler.cloud/rest/v1\
/requirements/106?delete_bookings=true" \
-H "Authorization: Bearer B8x5Vj1O65r6wnoV" \
-H "Content-Type: application/json" \
-d '{ 
        "task_id":4,
        "role_id":1,
        "start_time":"2023-10-10T09:00:00",
        "end_time":"2023-10-13T17:00:00"
    }'
```


<span class="optional"><b>REQUEST BODY PARAMETERS</b></span>

Name               |  Description
 ---:        |    :----   
**project_id** <br><span class="required">`required`</span>   |  ID of the project object for which this requirement object is being created. This will throw an error if you post an empty value.
**task_id**<br>|  ID of the task object within the project that needs to be done in this requirement.
**role_id**<br>|  ID of the role object that the resource needs to perform for the requirement. Role can be either the performing role or non-performing role of the resource.
**start_time** <br><span class="required">`required`</span>  | Represents start date and time for requirement object. This field accepts value in ISO 8601 format for date-time i.e. yyyy-mm-ddThh:mm:ss. The value must be snapped in 15 minutes interval, which effectively means that minutes values should be one of(00/15/30/45) and seconds value should always be 0. (if given). This will throw an error if you post an empty value.
**end_time** <br><span class="required">`required`</span> | Represents end date and time for requirement object. This field accepts value in ISO 8601 format for date-time i.e. yyyy-mm-ddThh:mm:ss. The value must be snapped in 15 minutes interval, which effectively means that minutes values should be one of(00/15/30/45) and seconds value should always be 0. (if given). `end_time` must always be ahead of `start_time` by at least 15 minutes as a requirement of less than 15 minutes is not allowed. This will throw an error if you post an empty value.
**effort**  <br><span class="required">`required`</span>  |Represents the effort value for the requirement.This defines how much effort is needed to complete the task. Effort value is a floating-point number that cannot be less than 0 or greater than 99999999.99. If effort value is not provided system will take default value 0.
**unit**<br> <span class="required">`required`</span>  | Integer number (2 or 4) represents the unit in which effort is defined. The unit value can be one of the following:<br><br><li> **2** for `Hours` : This defines `effort` value in fixed hours which doesn't change upon changes in requirement.</li><li> **4** for `Full Time Equivalent` : Full time equivalent is calculated using FTE calendar defined in <a href="https://app.eresourcescheduler.cloud/#!/admin/calendars/settings" target="_blank" class="api-ref">Administrator calendar settings</a>. Capacity from FTE calendar for defined time in requirement, is considered as 1 FTE.</li><br>
**tags** <br>`array of strings` |Tags are strings (labels) associated with this requirement object which could be used for the purpose of identification or other information.
**flexi_range_duration** <br>`integer` | Represents the defined duration range for flexibility in fulfilling the requirement compared to the original requirement date.
**flexi_range_unit** <br>`integer` | Represents a unit that allows for flexibility in fulfilling the requirement. Unit value could be one of the following:<br><br><li> **1** for `Hours` : Refers to 'hours' as a unit.</li><li> **2** for `Days` : Refers to 'days' as a unit.</li><br>
**allow_multi_allocation** <br>`boolean` | This refers to allocation of a specific requirement to multiple resources simultaneously.
**conditions** <br>`array of object` | This refers to the criteria on which the requirement must be fulfilled.<li>**conditions.field** `string` <br> This is a reference to the text's API_code.</li> <li><a href="#requirement-operator" class="api-ref">conditions.operator</a>`string`  <br> This refers to a character that represents a specific mathematical or logical action or process. </li><li>**conditions.values** <br>This refers to the values defined for the requirement to be considered in suggested resources.</li> <li>**conditions.weightage** `integer`  <br> Every condition can be assigned relative importance in comparison to other conditions to calculate its weightage. Weightage is ultimately used to calculate the match score of resources.</li> <li>**conditions.is_mandatory** `boolean` <br> Indicates whether this field is mandatory. If this field is marked as mandatory, it means that a required value must be provided for it in the suggested resources.</li>

### Returns



| Code      | Description | 
| ---:        |    :----   | 
**200** <br> <span class = "success">`OK`</span>    |  This indicates that the operation was successful and a requirement updated successfully.
**400** <br> <span class = "error">`Bad Request`</span> | Bad Request error occurs when a request is malformed, syntactically incorrect, empty required parameters or any unknown parameter is passed. Additionally, Bad request may also occur in one of these conditions:<ul><li>Trying to update `start_time` or `end_time` such that `end_time` gets earlier than `start_time`.</li><li>Trying to update requirements of archived project.</li><li>Duration of requirement is more than allowed requirement duration set by Administrator using ers Cloud Application in <a href="https://app.eresourcescheduler.cloud/#!/admin/settings/requirement" target="_blank" class="api-ref">Administrator Requirement Settings</a>.</li></ul>
**403** <br> <span class = "error">`Forbidden`</span> |Authorization failed due to insufficient permissions. This occurs when user does not have enough access rights to perform this action. Access for each user can be controlled by an Administrator using eRS Cloud Application.
**404** <br> <span class = "error">`Not Found`</span> | Not Found error occurs when requested requirement does not exist (i.e. There is no requirement with given ID). This may also occur when requesting a requirement that has been deleted.
**409** <br> <span class = "error">`Conflict`</span> | Conflict indicates that when you are updating a requirement linked to booking(s), then you must pass one of the parameters i.e; `delete_bookings=true` to delete requirement and respective booking or another parameter `unlink_bookings=true` will update requirement after unlinking the respective bookings. this action will be performed through <a href="https://app.eresourcescheduler.cloud/#!/admin/settings/requirement" target="_blank" class="api-ref">Administrator Requirement Settings</a>




## Requirement Operator


> Example for Conditions (resource_type_id)

```shell
{
  ...
  ...
  "conditions": [{ 
        "field":"resource_type_id",
        "operator":"any",
        "values":[2,3],
        "weightage":10,
        "is_mandatory": true
        }]
  ...
  ...
}
```

> Example for Conditions (resource name)

```shell
{
  ...
  ...
  "conditions": [{          
        "field":"resource",
        "operator":"match",
        "values":[3,5,8],
        "weightage":10,
        "is_mandatory": true
        }]
  ...
  ...
}
```

> Example for Conditions (resource start date)

```shell
{
  ...
  ...
  "conditions": [{
        "field":"start_date",
        "operator":"bt",
        "values":["2023-03-24","2023-05-20"],
        "weightage":10,
        "is_mandatory": true
       }]
  ...
  ...
}
```


> Example for Conditions (resource last date)

```shell
{
  ...
  ...
  "conditions": [{  
        "field":"last_date",
        "operator":"eq",
        "values":"2023-03-24",
        "weightage":20,
        "is_mandatory": true
        }]
  ...
  ...
}
```


> Example for Conditions (time zone)

```shell
{
  ...
  ...
  "conditions": [{
        "field":"timezone",
        "operator":"any",
        "values":[315,240],
        "weightage":10,
        "is_mandatory": true
          }]
  ...
  ...
}
```

> Example for Conditions (resource primary_role)

```shell
{
  ...
  ...
  "conditions": [{
        "field":"primary_role_id",
        "weightage":10
        }]
  ...
  ...
}
```

> Example for Conditions (resource availability)

```shell
{
  ...
  ...
  "conditions": [{
        "field":"availability",
        "weightage":10
        }]
  ...
  ...
}
```

### Conditions for System Generated Fields

|**Field code** |     | **Operators** 
|:--|:--|:--
**resource_type_id**|<div class="w-100"></div>|<li class="w-300">**eq** (_default_)</li><li>any</li>
**resource**||<li >**match** (_default_)</li>
**start_Date**||<li>**eq** (_default_)</li><li>lt</li><li>gt</li><li> bt</li><li>ex</li>
**last_date**||<li>**eq** (_default_)</li><li>lt</li><li>gt</li><li> bt</li><li>ex</li>|
**timezone**||<li>**eq** (_default_)</li><li>any</li>
**primary_role_id**||N/A
**availability**||N/A

### Conditions for User Generated Fields

|**Field Type**| |**Operators**  
|:--|:--|:--
|**Integer Number**|<div class="w-100"></div>|<li class="w-300">**eq** *(default)* </li><li>lt </li><li>  gt </li><li> bt </li><li> ex</li> 
|**Fractional Number**||<li >**eq** *(default)* </li><li>lt </li><li>  gt </li><li> bt </li><li> ex</li> 
|**Date**|| <li>**eq** *(default)* </li><li>lt </li><li>  gt </li><li> bt </li><li> ex</li> 
|**Checkbox**|| N/A 
|**Checkbox Group**||<li>**any** *(default)* </li><li>all</li>
|**Radio Group**|| <li>**eq** *(default)* </li><li>any</li>
|**Label**||<li>**eq** *(default)* </li><li>any</li> 
|**Drop Down Single Select**|| <li >**eq** *(default)*</li> <li>any</li>
|**Drop Down Multi Select**|| <li>**any** *(default)* </li><li>all</li>
|**User Single Select**|| <li>**eq** *(default)* </li><li>any</li>
|**User Multi Select**||<li>**any** *(default)* </li><li>all</li>




## Delete a Requirement

Permanently deletes a requirement. It cannot be undone.

> **`DELETE /v1/requirements/{ID}`**

> Example Request
 
```shell
curl -v -X DELETE "https://app.eresourcescheduler.cloud/rest\
/v1/requirements/1" \
-H "Authorization: Bearer B8x5Vj1O65r6wnoV"
```


> Example Request: Delete requirement and its linked bookings
 
```shell
curl -v -X DELETE "https://app.eresourcescheduler.cloud/rest/v1\
/requirements/106?delete_bookings=true" \
-H "Authorization: Bearer B8x5Vj1O65r6wnoV"
```

> Example Request: Delete requirement and unlinking its linked bookings
 
```shell
curl -v -X DELETE "https://app.eresourcescheduler.cloud/rest/v1\
/requirements/106?unlink_bookings=true" \
-H "Authorization: Bearer B8x5Vj1O65r6wnoV"
```

### Returns


| Code      | Description  
| ---:        |    :----   
**200** <br><span class = "success">`OK`</span> | This status code indicates that the operation was successful and a requirement deleted successfully.
**403** <br> <span class = "error">`Forbidden`</span> | Authorization failed due to insufficient permissions. This occurs when user does not have enough access rights to perform this action. Access for each user can be controlled by an Administrator using eRS Cloud Application.
**404** <br> <span class = "error">`Not Found`</span> | Not Found error occurs when requested requirement does not exist or has been deleted already.
**409** <br> <span class = "error">`Conflict`</span> | Conflict indicates that when you are deleting a requirement linked to booking(s), then you must pass one of the parameters i.e; `delete_bookings=true` to delete both requirement and respective booking or another parameter `unlink_bookings=true` will delete requirement after unlinking the respective bookings. this action will be performed through <a href="https://app.eresourcescheduler.cloud/#!/admin/settings/requirement" target="_blank" class="api-ref">Administrator Requirement Settings</a>
