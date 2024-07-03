# Project

## Project Object
>Example Response  

```json
  {
    "id": 1,
    "title": "Project-A",
    "type": {
      "name": "Satellite",
      "description": null,
      "id": 1
    },
    "email": "apollo@enbraun.com",
    "project_start_date": null,
    "end_date": null,
    "image": "https://erscloud/img/7aca31f5-29ae205ba315",
    "tags": ["NASA"],
    "disable_parallel_booking": false,
    "is_archive": false,
    "created_on": "2018-08-20T09:25:34.925474Z",
    "created_by": {
      "name": "John doe",
      "id": 118
    },
    "modified_on": "2018-09-28T12:32:44.896426Z",
    "modified_by": {
      "name": "John doe",
      "id": 118
    },
    "udf_color": "#FF8A80;0",
    "udf_progress": 70,
    "udf_project_manager": "Gene Kranz",
    "udf_priority": {
      "name": "High",
      "description": null,
      "id": 21
    }
  }
```

<span style="color:#b93d6a">`Project`</span> object contains all the information about a project. Project is used as an activity for resources to be scheduled for. The API allows you to list, search, create, delete, and update project.

<span class="optional"><b>ATTRIBUTES</b></span>

Name      |  Description
 ---:     |    :---- 
**id** <br>`integer` |  eRS Cloud generated unique identifier for the project object.
**title** <br>`string` | Represents title or name of the project. It can be up to 255 characters.
**type** <br>`object` | Describes the type of project. This is one of the project type objects which an Administrator user creates using eRS Cloud Application.
**email** <br>`string` | An optional email address of project object.
**project_start_date** <br>`string` |  Date on which project is considered started.
**end_date** <br>`string` | Date on which project is considered ended / completed.
**image** <br>`string` | String value representing URL of image file of project.
**tags** <br>`array of strings` | Tags are the list of strings (labels) attached to this project object which could be used for the purpose of filtering, identification or other information.
**timezone** <br>`integer` | Defines and categorize projects based on their location. This field is only available when scheduling plus module is on.
**project_calender** <br>`integer` | ID of the Calendar object, which should be assigned to the project. Depending upon requirements, different calendars can be applied to different projects. If the calendar is omitted, then the default calendar (as defined in the Administrator calendar settings) will be applied to this project.This field is only available when scheduling plus module is on.
**is_archive** <br>`boolean` | Boolean value representing whether this project is archived or not.
**created_on** <br>`string` | Timestamp at which this project object was created.
**created_by** <br> `object` | Object representing user who created this project object.
**modified_on** <br>`string` | Represents latest modification timestamp.
**disable_parallel_booking** <br>`boolean` | Boolean value defining if project can or cannot have multiple bookings at a time. Default value for disable parallel booking is false.
**modified_by** <br>`object` | Object representing most recent user who modified this project object.
**udf_\*** | Custom user-defined fields used to capture additional information of project. User defined field can be of multiple types. Custom fields are very useful to configure project objects to best fit requirements.  In given example response, all keys starting with prefix `udf_` are user defined custom fields. <a href="#user-defined-fields" class="api-ref">Learn more</a>

## Create a Project

Creates a new project object.

> **`POST /v1/projects`**

> Example Request:

```shell
 curl -v -X POST "https://app.eresourcescheduler.cloud/rest/v1/projects" \
 -H "Authorization: Bearer B8x5Vj1O65r6wnoV" \
 -H "Content-Type: application/json" \
 -d '{ 
       "title": "Project-A",
       "project_type_id": 1,
       "project_start_date": "2016-05-02",
       "email": "andrew@enbraun.com",
       "udf_progress": 70
     }'
```

<span class="optional"><b>REQUEST BODY PARAMETERS</b></span>

Name               |  Description
 ---:        |    :----
 **project_type_id** <br> <span class="required">`required`</span> | ID of <a href="#project-types" class="api-ref">project-type</a> object. A project must be linked with one of <a href="#project-types" class="api-ref">project-type</a> defined in Administration section (_using eRS Cloud Application_). Let’s assume there are two project types defined as `Medical` (_having ID as 1_) and `Education` (_having ID as 2_), now while creating a new project, if `project_type_id` is given as **1** then it will get created under Medical type and the same for Education when `project_type_id` is given as **2**.
**title** <br><span class="required">`required`</span> | String representing title / name of project. This can be a maximum of 255 characters long.
**email**<br><span class="mandatoryFlag">&#9873;</span> <span class="removableFlag mln-2">&#9873;</span> | String value representing email address of project object. Email address must be properly formatted with a maximum length of 254 characters.
**project_start_date**<br><span class="mandatoryFlag">&#9873;</span> <span class="removableFlag mln-2">&#9873;</span> | String value representing a date in ISO 8601 extended notation for date i.e. yyyy-MM-dd.
**end_date**<br><span class="mandatoryFlag">&#9873;</span> <span class="removableFlag mln-2">&#9873;</span> | String value representing a date in ISO 8601 extended notation for date i.e. yyyy-MM-dd.
**tags**<br><span class="removableFlag mln-2">&#9873;</span> | An optional array of strings which could be attached to this project object as labels. This can be useful for the purpose of filtering, identification or other information.
**timezone** <br><span class="mandatoryFlag">&#9873;</span> <span class="removableFlag mln-2">&#9873;</span> | One timezone object can be defined for a project.<br><br>_**Note**: <span class="warning">This field is only available when scheduling plus module is on</span>._
**project_calender** <br>| ID of the Calendar object, which should be assigned to the project. Depending upon requirements, different calendars can be applied to different projects. If the calendar is omitted, then the default calendar (as defined in the Administrator calendar settings) will be applied to this project.<br><br>_**Note**: <span class="warning">This field is only available when scheduling plus module is on</span>._
**disable_parallel_booking** <br>`optional` | Boolean value defining if project can or cannot have multiple bookings at a time. Default value for disable parallel booking is false.
**udf_\*** <br><span class="mandatoryFlag">&#9873;</span> <span class="removableFlag mln-2">&#9873;</span> | A user with Administrator rights can add custom fields. These fields can be used to capture additional information in Projects. Different types of projects may have a different set of user-defined fields. The value for user defined field can be passed as shown in example request. In given example `udf_progress`</span> is a user defined field. <a href="#user-defined-fields" class="api-ref">Learn more</a><br><br>_**Note**: User with Administrator rights can make fields marked with <span class="mandatoryFlag iconInline">&#9873;</span> mandatory and remove fields marked with <span class="removableFlag iconInline">&#9873;</span>, from <a href ="#get-a-specific-project-type" class="api-ref">specific project type</a> using eRS Cloud Application. If mandatory fields are not passed with a valid value or removed fields are passed while creating project, the operation will fail with response code **400**_.

### Returns

| Code      | Description |
| :---      |    :----    |
**201** <br><span class = "success">`Created`</span> | Indicates that the operation was successful and a project created successfully.
**400** <br> <span class = "error">`Bad Request`</span> | Bad Request error occurs when a request is  malformed, syntactically incorrect, missing required parameters or has any unknown parameter. 
**403** <br> <span class = "error">`Forbidden`</span> | Authorization failed due to insufficient permissions. This occurs when user does not have enough access rights to perform this action. Access for each user can be controlled by an Administrator using eRS Cloud Application.


## List Projects


Returns a list of projects. The projects are returned sorted by `title`. 
	

> **`GET /v1/projects`** 


> Example Request

```shell
curl -v \
"https://app.eresourcescheduler.cloud/rest/v1/projects" \
-H "Authorization: Bearer B8x5Vj1O65r6wnoV"
```


>Example Request With Offset And Limit 

```shell 
curl -v \
"https://app.eresourcescheduler.cloud/rest/v1/projects?offset=1&limit=15" \
-H "Authorization: Bearer B8x5Vj1O65r6wnoV"
```

> Example Response

```json
{
  "total_count": 50,
  "offset": 1,
  "limit": 15,
  "data": [{
      "id": 1,
      "title": "Project-A",
      "type": {
        "name": "Satellite",
        "description": null,
        "id": 1
      },
      "email": "apollo@enbraun.com",
      "project_start_date": null,
      "end_date": null,
      "image": "https://erscloud/img/7aca31f5-29ae205ba315",
      "tags": ["NASA"],
      "disable_parallel_booking": false,
      "is_archive": false,
      "created_on": "2018-08-20T09:25:34.925474Z",
      "created_by": {
        "name": "John doe",
        "id": 118
      },
      "modified_on": "2018-09-28T12:32:44.896426Z",
      "modified_by": {
        "name": "John doe",
        "id": 118
      },
      "udf_color": "#FF8A80;0",
      "udf_progress": 70,
      "udf_project_manager": "Gene Kranz",
      "udf_priority": {
        "name": "High",
        "description": null,
        "id": 21
      }
    },
    { ... },
    { ... },
    { ... }
  ]
}
```

<span class="optional"><b>REQUEST QUERY PARAMETERS</b></span>

|Name|Description|
|-:|:-|
**limit**<br>`optional` | The limit keyword is used to limit the number of records returned from a result set. If a limit count is given, no more than that many records will be returned (but possibly less, if the query itself yields less records)<br>_Default value of `limit` is_ <span class="required">**`25`**</span>.<br>_Maximum value of `limit` can be_ <span class="required">**`500`**</span>.
**offset**<br>`optional` | Offset keyword is used to skip n items. If offset value is given as 10, then first 10 records will be skipped from result set. Offset is often used together with the Limit keyword.<br>_Default value of `offset` is_ <span class="required">**`0`**</span>.


### Returns 


| Code    | Description | 
| ---:    |    :----    | 
**200** <br> <span class = "success">`OK`</span>  | Indicates that the operation was successful and  list of projects is returned. 
**400** <br> <span class = "error">`Bad Request` </span> | Bad Request may occur when offset or limit value is negative.
**403** <br> <span class = "error">`Forbidden`</span> | Authorization failed due to insufficient permissions. This occurs when user does not have enough access rights to perform this action. Access for each user can be controlled by an Administrator using eRS Cloud Application.

## Retrieve a Project


>  **`GET /v1/projects/{ID}`**

> Example Request

```shell
curl -v "https://app.eresourcescheduler.cloud/rest/v1/projects/1" \
-H "Authorization: Bearer B8x5Vj1O65r6wnoV"
```

> Example Response

```json
{
  "id": 1,
  "title": "Project-A",
  "type": {
    "name": "Satellite",
    "description": null,
    "id": 1
  },
  "email": "apollo@enbraun.com",
  "project_start_date": null,
  "end_date": null,
  "image": "https://erscloud/img/7aca31f5-29ae205ba315",
  "tags": ["NASA"],
  "disable_parallel_booking": false,
  "is_archive": false,
  "created_on": "2018-08-20T09:25:34.925474Z",
  "created_by": {
    "name": "John doe",
    "id": 118
  },
  "modified_on": "2018-09-28T12:32:44.896426Z",
  "modified_by": {
    "name": "John doe",
    "id": 118
  },
  "udf_color": "#FF8A80;0",
  "udf_progress": 70,
  "udf_project_manager": "Gene Kranz",
  "udf_priority": {
    "name": "High",
    "description": null,
    "id": 21
  }
}
```

Retrieves the details of an existing project. You only need to provide the unique project identifier that was returned upon project creation as request parameter.


### Returns

| Code      | Description | 
| ---:        |    :----   | 
| **200** <br> <span class = "success">`OK`</span>     | This status code indicates that the operation was successful and project retrieved successfully.  |
| **403** <br> <span class = "error">`Forbidden`</span> |Authorization failed due to insufficient permissions. This occurs when user does not have enough access rights to perform this action. Access for each user can be controlled by an Administrator using eRS Cloud Application.|
| **404** <br> <span class = "error">`Not Found`</span> | Not Found error occurs when requested project does not exist (i.e. There is no project with given ID). This may also occur when requesting a project that has been deleted. |

## Search Projects
> **`POST /v1/projects/search`**

> Example Request For Filter In JSON Format

```shell
curl -X POST \
"https://app.eresourcescheduler.cloud/rest/v1/projects/search?offset=1&limit=15" \
-H "Content-Type: application/json" \
-H "Authorization: Bearer B8x5Vj1O65r6wnoV" \
-d '{ 
      "project_type_id:eq": 1 
    }'
```

> Example Request For Filter By Passing Multiple Rules In JSON Format

```shell
curl -X POST \
"https://app.eresourcescheduler.cloud/rest/v1/projects/search" \
-H "Content-Type: application/json" \
-H "Authorization: Bearer B8x5Vj1O65r6wnoV" \
-d '{ 
      "project_type_id:eq": 1, 
      "project_start_date:gt": "2015-04-02",
      "title:miss": "z"
    }'
```

> Example Response

```json
{
  "total_count": 50,
  "offset": 1,
  "limit": 15,
  "data": [{
      "id": 1,
      "title": "Project-A",
      "type": {
        "name": "Satellite",
        "description": null,
        "id": 1
      },
      "email": "apollo@enbraun.com",
      "project_start_date": null,
      "end_date": null,
      "image": "https://erscloud/img/7aca31f5-29ae205ba315",
      "tags": ["NASA"],
      "disable_parallel_booking": false,
      "is_archive": false,
      "created_on": "2018-08-20T09:25:34.925474Z",
      "created_by": {
        "name": "John doe",
        "id": 118
      },
      "modified_on": "2018-09-28T12:32:44.896426Z",
      "modified_by": {
        "name": "John doe",
        "id": 118
      },
      "udf_color": "#FF8A80;0",
      "udf_progress": 70,
      "udf_project_manager": "Gene Kranz",
      "udf_priority": {
        "name": "High",
        "description": null,
        "id": 21
      }
    },
    { ... },
    { ... },
    { ... }
  ]
}
```

<span class="optional"><b>REQUEST QUERY PARAMETERS</b></span>

|Name|Description|
|-:|:-|
**limit**<br>`optional` | The limit keyword is used to limit the number of records returned from a result set. If a limit count is given, no more than that many records will be returned (but possibly less, if the query itself yields less records)<br>_Default value of `limit` is_ <span class="required">**`25`**</span>.<br>_Maximum value of `limit` can be_ <span class="required">**`500`**</span>.
**offset**<br>`optional` | Offset keyword is used to skip n items. If offset value is given as 10, then first 10 records will be skipped from result set. Offset is often used together with the Limit keyword.<br>_Default value of `offset` is_ <span class="required">**`0`**</span>.
<br><br>

Search Project API allows filtering the results returned in various ways. This enables a great power to find out what is needed. eRS Cloud API also allows filtering on custom defined fields with multiple operators and conditions to cover up complex scenarios for searching.

A filter condition consists of three components which are **_field_**, **_operator_** and **_value_**. For example fetching only those projects having `project_type_id` 1, could be achieved by adding `"project_type_id:eq":1 ` to your query.  If operator is not supplied, it takes default operator for field. <a href="#filters" class="api-ref">Read more</a>

Below is a list of available fields, which allow filtering projects:

### Filters for System-defined fields

|**Field Code**| **Operator**  | **Example**|
|:--|:---|:--|
**project_type_id**|<li>**eq** (_default_)  </li><li>neq</li><li>any</li><li>none</li>| `"project_type_id:eq":1 `<br>`"project_type_id:neq":1 `<br>`"project_type_id:any":1`<br>`"project_type_id:none":1`
**title**|<li class="nowrap">**has** (_default_)&nbsp;&nbsp;</li><li>miss</li><li>eq</li><li>neq</li>|`"title:has": "e"`<br>`"title:miss": "e"`<br>`"title:eq": "Project-A"`<br>`"title:neq": "Project-A"`
**email**|<li class="nowrap">**has** (_default_)&nbsp;&nbsp;</li><li>miss</li><li>eq</li><li>neq</li>|`"email:has":"abc"` <br>`"email:miss":"abc"` <br>`"email:eq":"ujjwal@gmail.com"`<br>`"email:neq":"ujjwal@gmail.com"`
**project_start_date**|<li>**eq** (_default_)</li><li>lt</li><li>gt</li><li>bt</li><li>ex</li>|`"project_start_date:eq":"2015-02-02"`<br>`"project_start_date:lt":"2015-02-02"`<br>`"project_start_date:gt":"2015-02-02"`<br>`"project_start_date:bt":["2015-02-02","2015-04-05"]` <br>`"project_start_date:ex":["2015-02-02","2015-04-04"]`
**end_date**|<li>**eq** (_default_) </li><li>lt</li><li>gt</li><li>bt</li><li>ex</li>| `"end_date:eq":"2015-02-02"`<br>`"end_date:lt":"2015-02-02"`<br>`"end_date:gt":"2015-02-02"`<br>`"end_date:bt":["2015-02-02","2015-04-05"]`<br>`"end_date:ex":["2015-02-02","2015-04-04"]`
**tags**|<li>**any** (_default_) </li><li>none</li><li>all</li><li>ex</li>|`"tags:any":"["tagA", "tagB"]`<br>`"tags:none":"["tagA", "tagB"]`<br>`"tags:all":["tagB","tagC"]`<br>`"tags:ex":["tagB","tagC"]`
**timezone**|<li>**eq** (_default_)</li><li>neq</li><li>any</li><li>none</li>| `"timezone:eq": 1`<br>`"timezone:neq": 1`<br>`"timezone:any": [1, 2]`<br>`"timezone:none": [3, 2]`
**is_archive**| N/A |`"is_archive":true` <br>`"is_archive":false`
**disable_parallel_booking**| N/A |`"disable_parallel_booking": true`<br>`"disable_parallel_booking": false`
**created_by**|<li>**eq** (_default_)</li><li>neq</li><li>any</li><li>none</li>| `"created_by:eq": 1`<br>`"created_by:neq": 1`<br>`"created_by:any": [1, 2]`<br>`"created_by:none": [1, 2]`
**modified_by**|<li>**eq** (_default_)</li><li>neq</li><li>any</li><li>none</li>| `"modified_by:eq": 1`<br>`"modified_by:neq": 1`<br>`"modified_by:any": [1, 2]`<br>`"modified_by:none": [1, 2]`
**created_on**|<li>**eq** (_default_)</li><li>lt</li><li>gt</li><li>bt</li><li>ex</li>| `"created_on:eq": ["2021-07-08T00:00:00]`<br>`"created_on:lt": ["2021-07-08T00:00:00]`<br>`"created_on:gt": ["2021-07-08T59:59:59"]`<br>`"created_on:bt": ["2021-07-08T00:00:00", "2021-07-10T23:59:59"]`<br>`"created_on:bt": ["2021-07-08T00:00:00", ""]` <br>`"created_on:bt": ["", "2021-07-10T23:59:59"]` <br>`"created_on:ex": ["2021-07-08T00:00:00", "2021-07-10T23:59:59"]` <br>`"created_on:ex": ["2021-07-08T00:00:00", ""]` <br>`"created_on:ex": ["", "2021-07-10T23:59:59"]]` 
**modified_on**|<li>**eq** (_default_)</li><li>lt</li><li>gt</li><li>bt</li><li>ex</li>| `"modified_on:eq": ["2021-07-08T00:00:00]`<br>`"modified_on:lt": ["2021-07-08T00:00:00]`<br>`"modified_on:gt": ["2021-07-08T59:59:59"]`<br>`"modified_on:bt": ["2021-07-08T00:00:00", "2021-07-10T23:59:59"]`<br>`"modified_on:bt": ["2021-07-08T00:00:00", ""]` <br>`"modified_on:bt": ["", "2021-07-10T23:59:59"]` <br>`"modified_on:ex": ["2021-07-08T00:00:00", "2021-07-10T23:59:59"]` <br>`"modified_on:ex": ["2021-07-08T00:00:00", ""]` <br>`"modified_on:ex": ["", "2021-07-10T23:59:59"]]` 
_For filtering using custom fields and operators please <a href="#filters-for-user-defined-fields" class="api-ref">check here</a>._  

## Update a Project

Updates specified project by setting the values of the parameters passed. Any parameters which are not provided remains unchanged. To unset existing value for a parameter, just pass an empty value i.e. `null`.

This request accepts mostly the same arguments as `Create Project` API, except user can never update `project_type_id` of any project.

> **`PUT /v1/projects/{ID}`**

> Example Request

```shell 
curl -v -X PUT \
"https://app.eresourcescheduler.cloud/rest/v1/projects/1" \
-H "Authorization: Bearer B8x5Vj1O65r6wnoV" \
-H "Content-Type: application/json" \
-d '{
      "title": "Angola",
      "udf_progress": 70
    }' 
```


<span class="optional"><b>REQUEST BODY PARAMETERS</b></span>

|Name         |  Description |
| ---:        |    :----     |
**title** <br> <span class="required">`required`</span>  |String representing the  title of a project. It can be up to 255 characters.
**project_start_date**<br><span class="mandatoryFlag">&#9873;</span> <span class="removableFlag mln-2">&#9873;</span> | String value representing a date in ISO 8601 extended notation for date i.e. yyyy-MM-dd. The project is started from this date.
**end_date**<br><span class="mandatoryFlag">&#9873;</span> <span class="removableFlag mln-2">&#9873;</span> | String value representing a date in ISO 8601 extended notation for date i.e. yyyy-MM-dd. The project is considered ended / completed on this date.
**email**<br><span class="mandatoryFlag">&#9873;</span> <span class="removableFlag mln-2">&#9873;</span> | String value representing email address associated with project object. Email address must be properly formatted with a maximum length of 254 characters.
**tags**<br><span class="removableFlag mln-2">&#9873;</span> | An optional array of strings which could be attached to this project object as labels. This can be useful for the purpose of filtering, identification or other information. It can be up to 50 characters.
**timezone** <br><span class="mandatoryFlag">&#9873;</span> <span class="removableFlag mln-2">&#9873;</span> | One timezone object can be defined for a project.<br><br>_**Note**: <span class="warning">This field is only available when scheduling plus module is on</span>._
**project_calender** <br>| ID of the Calendar object, which should be assigned to the project. Depending upon requirements, different calendars can be applied to different projects. If the calendar is omitted, then the default calendar (as defined in the Administrator calendar settings) will be applied to this project.<br><br>_**Note**: <span class="warning">This field is only available when scheduling plus module is on</span>._
**disable_parallel_booking** <br>`optional` | Boolean value defining if project can or cannot have multiple bookings at a time. Default value for disable parallel booking is false.
**udf_\*** <br><span class="mandatoryFlag">&#9873;</span> <span class="removableFlag mln-2">&#9873;</span> | A user with Administrator rights can add custom fields. These fields can be used to capture additional information in Project. Different types of projects may have a different set of user-defined fields. The value for user defined field can be passed as shown in example request. In first example `udf_progress` is a user defined field. <a href ="#user-defined-fields" class="api-ref">Learn more</a><br><br>_**Note**: User with Administrator rights can make fields marked with <span class="mandatoryFlag iconInline">&#9873;</span> mandatory and remove fields marked with <span class="removableFlag iconInline">&#9873;</span>, from <a href ="#get-a-specific-project-type" class="api-ref">specific project type</a> using eRS Cloud Application. If mandatory fields are not passed with a valid value or removed fields are passed while updating project, the operation will fail with response code **400**_.


### Returns

| Code      | Description | 
| ---:        |    :----   | 
**200** <br> <span class = "success">`OK`</span> | Indicates that the operation was successful and project is updated successfully.
**400** <br> <span class = "error">`Bad Request`</span> | Bad Request occurs when a request is not well-formed, syntactically incorrect, empty required parameters or any unknown parameter is passed. <br> Additionally, Bad request may also occur when :<ul><li>User tries to update archived project.</li><li> User tries to update `project_start_date` or `end_date` or both such that `end_date` gets earlier than `project_start_date`. </li></ul>
**403** <br> <span class = "error">`Forbidden`</span> | Authorization failed due to insufficient permissions. This occurs when user does not have enough access rights to perform this action. Access for each user can be controlled by an Administrator using eRS Cloud Application.
**404** Delete a Project<br><span class = "error">`Not Found`</span> | This status code indicates that project does not exist.


## Delete a Project

 Permanently deletes requested project. It cannot be undone. By default, this operation will fail if a project has any bookings, timesheets or rates associated with it. To override this, forceful deletion can be used which will delete all bookings, timesheets and rates and then, ultimately deletes the project object.

> **`DELETE /v1/projects/{ID}`**


> Example Request
 
```shell
curl -v -X DELETE \
"https://app.eresourcescheduler.cloud/rest/v1/projects/1" \
-H "Authorization: Bearer B8x5Vj1O65r6wnoV"
```

> Example Request For Forceful Delete 
 
```shell
curl -v -X DELETE \
"https://app.eresourcescheduler.cloud/rest/v1/projects/1?\
force_delete_bookings=true&force_delete_rates=true&\
force_delete_timesheet_entry=true" \
-H "Authorization: Bearer B8x5Vj1O65r6wnoV" 
```

### Returns


| Code      | Description  
| ---:        |    :----   
**200** <br><span class = "success">`OK`</span> |This status code indicates that the operation was successful and project deleted successfully.
**409** <br> <span class = "error">`Conflict`</span> |Conflict indicates that the project can not be deleted as there are bookings, timesheets or rates associated with this project. If you wish to delete it any way you must use force delete option by passing <span class = "required">`true`</span> for parameter <span class = "required">`force_delete_bookings`</span>, <span class = "required">`force_delete_timesheet_entry`</span> and <span class = "required">`force_delete_rates`</span> which will delete all associated bookings, timesheets and rates corresponding to the project. This operation deletes all bookings, timesheets and rates of requested project and project itself (shown in example request).
**403** <br> <span class = "error">`Forbidden`</span> | Authorization failed due to insufficient permissions. This occurs when user does not have enough access rights to perform this action. Access for each user can be controlled by an Administrator using eRS Cloud Application.
**404** <br><span class = "error">`Not Found`</span> |This status code indicates that requested project does not exist.| |

## Tasks

A task is a single unit of work – an action to accomplish in a project, a single step in a multi-step project. Each project has it's own set of tasks.

This API allows you to list, create, delete and update tasks of any project.

### List Tasks

Retrieves list of all the tasks of specified project. List of tasks is returned sorted by name.

>**`GET /v1/projects/{ID}/tasks`**

> Example Request

```shell
curl -v -X GET \
"https://app.eresourcescheduler.cloud/rest/v1/projects/2/tasks" \
-H "Authorization: Bearer B8x5Vj1O65r6wnoV"
```
> Example Response
 
 ```json
{
  "total_count": 8,
  "data": [{
      "id": 9,
      "name": "TASK- 2A",
      "start_time": "2018-09-16T18:30:00+00:00",
      "end_time": "2018-09-20T18:30:00+00:00",
      "project_id": 2,
      "created_by": {
        "id": 118,
        "name": "John doe"
      },
      "modified_by": {
        "id": 118,
        "name": "John doe"
      }
    },
    { ... },
    { ... }
  ]
}
```
<span class="optional"><b>ATTRIBUTES</b></span>


Name         |  Description
 ---:        |    :----   
 **ID** <br>`Integer`| Auto generated unique identifier for task object.
 **name** <br>`String`| Name of task object.
**start_time** <br>`String`| Represents start time of task object.
**end_time** <br>`String`| Represents end time of task object. 
**project_id** <br>`Integer` | Unique ID of project object, which this task belongs to.


### Returns

| Code      | Description | 
| ---:        |    :----   | 
**200** <br> <span class = "success">`OK`</span> | This status code indicates that the operation was successful and list of tasks retrieved successfully.
**403** <br> <span class = "error">`Forbidden`</span> |Authorization failed due to insufficient permissions. This occurs when user does not have enough access rights to perform this action. Access for each user can be controlled by an Administrator using eRS Cloud Application.
**404** <br> <span class = "error">`Not Found`</span> | Not Found error occurs when requested project task does not exist (i.e. There is no project task exists with given ID). This may also occur when requesting tasks of project that has been deleted.

<br><br>

### Create a task
 
Creates a new task object for specified project.


>**`POST /v1/projects/{ID}/tasks`**

>Example Request

```shell

curl -v -X POST \
"https://app.eresourcescheduler.cloud/rest/v1/projects/2/tasks" \
-H "Authorization: Bearer B8x5Vj1O65r6wnoV" \
-H "Content-Type: application/json" \
-d '{
      "name": "TASK- 2A",
      "start_time": "2018-09-16T18:30:00Z",
      "end_time": "2018-09-20T18:30:00Z"
    }'

```

<span class="optional"><b>REQUEST BODY PARAMETERS</b></span>


Name     |    Description
---:     |    :----   
**name** <br> <span class ="required">`required`</span> | String representing the name of task. It can be up to 100 characters long.
**start_time** <br>`optional`| String representing timestamp value for start time of task. This field takes input in ISO 8601 extended notation for date and time value i.e. yyyy-MM-ddTHH:mm:ssZ and supports time zone offset as well.
**end_time** <br>`optional`|  String representing timestamp value for end time of task. This field takes input in ISO 8601 extended notation for date and time value i.e. yyyy-MM-ddTHH:mm:ssZ and supports time zone offset as well.

### Returns
 
| Code      |Description |
 :---        |    :----   |
**201** <br><span class = "success">`Created`</span> | Indicates that the operation was successful and task is created successfully.
**400** <br> <span class = "error">`Bad Request`</span> | Bad Request error occurs when a request is malformed, syntactically incorrect, missing required parameters or any unknown parameter is passed. Additionally, Bad request may also occur when `start_time` is given later then `end_time`.
**403** <br> <span class = "error">`Forbidden`</span> |Authorization failed due to insufficient permissions. This occurs when user does not have enough access rights to perform this action. Access for each user can be controlled by an Administrator using eRS Cloud Application.

### Update a task

>**`PUT /v1/projects/{ID}/tasks/{Task_ID}`**

Updates an existing task by setting the values of the parameters passed. Any parameters not passed will be left unchanged. 

This request accepts mostly the same arguments as the task creation call.

>Example Request

```shell
curl -v -X PUT \
"https://app.eresourcescheduler.cloud/rest/v1/projects/8/tasks/9" \
-H "Authorization: Bearer B8x5Vj1O65r6wnoV" \
-H "Content-Type: application/json" \
-d '{
      "name": "TASK- 2B"
    }'

```

<span class="optional"><b>REQUEST BODY PARAMETERS</b></span>

Name         |  Description
 ---:        |    :----   
**name** <br> <span class ="required">`required`</span> | String representing the name of task. It can be up to 100 characters long.
**start_time** <br>`optional`| String representing timestamp value for start time of task. This field takes input in ISO 8601 extended notation for date and time value i.e. yyyy-MM-ddTHH:mm:ssZ and supports time zone offset as well.
**end_time** <br>`optional`|  String representing timestamp value for end time of task. This field takes input in ISO 8601 extended notation for date and time value i.e. yyyy-MM-ddTHH:mm:ssZ and supports time zone offset as well.

### Returns

| Code      | Description | 
| ---:      |    :----    | 
**200** <br><span class = "success">`OK`</span> | Indicates that the operation was successful and task is updated successfully.
**400** <br> <span class = "error">`Bad Request`</span> | Bad Request error occurs when a request is malformed, syntactically incorrect, missing required parameters or any unknown parameter is passed. Additionally, Bad request may also occur if `start_time` becomes later then `end_time`.
**403** <br> <span class = "error">`Forbidden`</span> |Authorization failed due to insufficient permissions. This occurs when user does not have enough access rights to perform this action. Access for each user can be controlled by an Administrator using eRS Cloud Application.
**404** <br><span class = "error">`Not Found`</span> | This status code indicates that project or task does not exist.


<br><br>
### Delete a task

> **`DELETE /v1/projects/{ID}/tasks/{Task_ID}`**

Permanently deletes a task. It cannot be undone. By default, this operation will fail if a task has any bookings or timesheets associated with it. To override this behavior, forceful removal can be used which will remove this task from all bookings and timesheets associated with it.

> Example Request

```shell
curl -v -X DELETE \
"https://app.eresourcescheduler.cloud/rest/v1/projects/1/tasks/2" \
-H "Authorization: Bearer B8x5Vj1O65r6wnoV"
```
> Example Request For Forceful Delete 
 
```shell
curl -v -X DELETE \
"https://app.eresourcescheduler.cloud/rest/v1/projects/1/tasks/2\
?remove_from_bookings=true&remove_from_timesheet=true" \
-H "Authorization: Bearer B8x5Vj1O65r6wnoV"
```

### Returns

| Code      | Description  
| :---      | :----
**200** <br><span class = "success">`OK`</span> | Indicates that the operation was successful and task is deleted successfully.
**409** <br> <span class = "error">`Conflict`</span> | Conflict indicates that the task can not be deleted as there are bookings or timesheets associated with this task. If you wish to delete it any way you must use force delete option by passing <span class = "required">`true`</span> for parameters <span class = "required">`remove_from_bookings`</span> and <span class = "required">`remove_from_timesheet`</span>. This operation removes task from all associated bookings and timesheets, and then deletes the task itself. Example request is shown to right.
**403** <br> <span class = "error">`Forbidden`</span> |Authorization failed due to insufficient permissions. This occurs when user does not have enough access rights to perform this action. Access for each user can be controlled by an Administrator using eRS Cloud Application.
**404** <br><span class = "error">`Not Found`</span> | This indicates that project or task does not exist.

## Phases

A phase is a time frame for a project, making it easy to visualize different stages of a project. Each project has its own set of phases.

This API allows you to list, create, delete and update phases of any project.

### List Phases

Retrieves a list of all the phases of specified project. The list of phases is returned sorted by name.

>**`GET /v1/projects/{ID}/phases`**

> Example Request

```shell
curl -v -X GET \
"https://app.eresourcescheduler.cloud/rest/v1/projects/477/phases" \
-H "Authorization: Bearer B8x5Vj1O65r6wnoV"
```
> Example Response
 
 ```json
{
  "total_count": 8,
  "data": [{
      "id": 1,
      "name": "Documentation",
      "description": "Product synopsis and documentation",
      "start_date": "2022-01-04",
      "end_date": "2022-01-11",
      "project_id": 477,
      "created_on": "2022-01-01T04:31:51.0+00:00",
      "modified_on": "2022-01-01T04:35:03.0+00:00",
      "created_by":{
          "id": 1146,
          "name": "John Doe"
      },
      "modified_by":{
          "id": 1146,
          "name": "John Doe"
      }
    },
    { ... },
    { ... }
  ]
}
```
<span class="optional"><b>ATTRIBUTES</b></span>


Name         |  Description
 ---:        |    :----   
**ID** <br>`Integer`| Auto generated unique identifier for phase object.
**name** <br>`String` | Name of phase object.
**description** <br> `String` | Any other information regarding this phase.
**start_date** <br>`String`| Represents start date of the phase object.
**end_date** <br>`String`| Represents end date of the phase object. 
**project_id** <br>`Integer` | Unique ID of project object, which this phase belongs to.


### Returns

| Code      | Description | 
| ---:        |    :----   | 
**200** <br> <span class = "success">`OK`</span> | This status code indicates that the operation was successful and the phases list was successfully retrieved.
**403** <br> <span class = "error">`Forbidden`</span> |Authorization failed due to insufficient permissions. This occurs when the user does not have enough access rights to perform this action. Access for each user can be controlled by an Administrator using eRS Cloud Application.
**404** <br> <span class = "error">`Not Found`</span> | Not Found error occurs when requested project does not exist.
<br><br>

### Create a phase
 
Creates a new phase object for the specified project.


>**`POST /v1/projects/{ID}/phases`**

>Example Request

```shell

curl -v -X POST \
"https://app.eresourcescheduler.cloud/rest/v1/projects/477/phases" \
-H "Authorization: Bearer B8x5Vj1O65r6wnoV" \
-H "Content-Type: application/json" \
-d '{
      "name": "Development",  
      "start_date": "2022-01-14",
      "end_date": "2022-03-27",
      "description": "First phase of development"
    }'
```

<span class="optional"><b>REQUEST BODY PARAMETERS</b></span>


Name     |    Description
---:     |    :----   
**name** <br> <span class ="required">`required`</span> | String representing the name of phase. It can be up to 100 characters long.
**start_date** <br><span class ="required">`required`</span> | String representing date value for start date of phase. This field takes input in ISO 8601 extended notation for date value i.e. yyyy-MM-dd.
**end_date** <br><span class ="required">`required`</span>|  String representing date value for end date of phase.  This field takes input in ISO 8601 extended notation for date value i.e. yyyy-MM-dd.
**description** <br>`optional` |  String consisting information related to this phase. It can be up to 255 characters long.

### Returns
 
| Code      |Description |
 :---        |    :----   |
**201** <br><span class = "success">`Created`</span> | Indicates that the operation was successful and phase is created successfully.
**400** <br> <span class = "error">`Bad Request`</span> | Bad Request error occurs when a request is malformed, syntactically incorrect, missing required parameters or any unknown parameter is passed. Additionally, a Bad Request error may also occur when `start_date` is given later than `end_date` or the date range for this phase is overlapping with any existing phase.
**403** <br> <span class = "error">`Forbidden`</span> | Authorization failed due to insufficient permissions. This occurs when the user does not have enough access rights to perform this action. Access for each user can be controlled by an Administrator using eRS Cloud Application.

### Update a phase

>**`PUT /v1/projects/{ID}/phases/{Phase_ID}`**

Updates an existing phase by setting the values of the parameters passed. Any parameters not passed will be left unchanged. 

This request accepts mostly the same arguments as the phase creation call.

>Example Request

```shell
curl -v -X PUT \
"https://app.eresourcescheduler.cloud/rest/v1/projects/477/phases/2" \
-H "Authorization: Bearer B8x5Vj1O65r6wnoV" \
-H "Content-Type: application/json" \
-d '{
      "description": "First phase of development"
    }'

```

<span class="optional"><b>REQUEST BODY PARAMETERS</b></span>

Name         |  Description
 ---:        |    :----   
**name** <br><span class ="required">`required`</span> | String representing the name of phase. It can be up to 100 characters long.
**start_date** <br><span class ="required">`required`</span> | String representing date value for start date of phase. This field takes input in ISO 8601 extended notation for date value i.e. yyyy-MM-dd.
**end_date** <br><span class ="required">`required`</span>|  String representing date value for end date of phase.  This field takes input in ISO 8601 extended notation for date value i.e. yyyy-MM-dd.
**description** <br>`optional` |  String consisting information related to this phase. It can be up to 255 characters long.

### Returns

| Code      | Description | 
| ---:      |    :----    | 
**200** <br><span class = "success">`OK`</span> | Indicates that the operation was successful and phase is updated successfully.
**400** <br> <span class = "error">`Bad Request`</span> | Bad Request occurs when a request is malformed, syntactically incorrect, empty required parameters or any unknown parameter is passed. Additionally, a Bad Request error may also occur when `start_date` is given later than `end_date` or the date range for this phase is overlapping with any existing phase.
**403** <br> <span class = "error">`Forbidden`</span> | Authorization failed due to insufficient permissions. This occurs when the user does not have enough access rights to perform this action. Access for each user can be controlled by an Administrator using eRS Cloud Application.
**404** <br><span class = "error">`Not Found`</span> | This status code indicates that the project or phase does not exist.


<br><br>
### Delete a phase

> **`DELETE /v1/projects/{ID}/phases/{Phase_ID}`**

Permanently deletes a phase. It cannot be undone. 

> Example Request

```shell
curl -v -X DELETE \
"https://app.eresourcescheduler.cloud/rest/v1/projects/477/phases/2" \
-H "Authorization: Bearer B8x5Vj1O65r6wnoV"
```


### Returns

| Code      | Description  
| :---      | :----
**200** <br><span class = "success">`OK`</span> | Indicates that the operation was successful and phase is deleted successfully.
**403** <br> <span class = "error">`Forbidden`</span> |Authorization failed due to insufficient permissions. This occurs when the user does not have enough access rights to perform this action. Access for each user can be controlled by an Administrator using eRS Cloud Application.
**404** <br><span class = "error">`Not Found`</span> | This indicates that the project or phase does not exist.


## Milestones

A milestone is a notation used to define a goal reached in a project. Each project has its own milestones.

This API allows you to list, create, delete and update milestones of any project.

### List Milestones

Retrieves a list of all the milestones of specified project. The list of milestones is returned sorted by name.

>**`GET /v1/projects/{ID}/milestones`**

> Example Request

```shell
curl -v -X GET \
"https://app.eresourcescheduler.cloud/rest/v1/projects/477/milestones" \
-H "Authorization: Bearer B8x5Vj1O65r6wnoV"
```
> Example Response
 
 ```json
{
  "total_count": 4,
  "data": [{
      "id": 1,
      "name": "Documentation Complete",
      "description": "Done with initial planning & documentation.",
      "date": "2022-01-11",
      "color": "#3F51B5",
      "project_id": 477,
      "created_on": "2022-01-01T04:31:51.0+00:00",
      "modified_on": "2022-01-01T04:35:03.0+00:00",
      "created_by":{
          "id": 1146,
          "name": "John Doe"
      },
      "modified_by":{
          "id": 1146,
          "name": "John Doe"
      }
    },
    { ... },
    { ... }
  ]
}
```
<span class="optional"><b>ATTRIBUTES</b></span>


Name         |  Description
 ---:        |    :----   
**ID** <br>`Integer` | Auto-generated unique identifier for milestone object.
**project_id** <br>`Integer` | Unique ID of project object, which this milestone belongs to.
**name** <br>`String` | Name of milestone object.
**description** <br> `String` | Any information regarding this milestone.
**date** <br>`String`| Represents date of the milestone object.
**color** <br>`String`| String representing hexadecimal color code assigned to the milestone. 


### Returns

| Code      | Description | 
| ---:        |    :----   | 
**200** <br> <span class = "success">`OK`</span> | This code indicates that the operation was successful and the milestones list was retrieved successfully.
**403** <br> <span class = "error">`Forbidden`</span> |Authorization failed due to insufficient permissions. This occurs when the user does not have enough access rights to perform this action. Access for each user can be controlled by an Administrator using eRS Cloud Application.
**404** <br> <span class = "error">`Not Found`</span> | Not Found error occurs when requested project does not exist.
<br><br>

### Create a milestone
 
Creates a new milestone object for the specified project.


>**`POST /v1/projects/{ID}/milestones`**

>Example Request

```shell

curl -v -X POST \
"https://app.eresourcescheduler.cloud/rest/v1/projects/477/milestones" \
-H "Authorization: Bearer B8x5Vj1O65r6wnoV" \
-H "Content-Type: application/json" \
-d '{
      "name": "Development Phase 1 Completed",
      "date": "2022-04-02",
      "color": "#3F51B5",
      "description": "Development phase-I is completed, staging link at https://mydomain.tld/phase1."
    }'
```

<span class="optional"><b>REQUEST BODY PARAMETERS</b></span>


Name     |    Description
---:     |    :----   
**name** <br> <span class ="required">`required`</span> | String representing the name of a milestone. It can be up to 100 characters long.
**date** <br><span class ="required">`required`</span> | String representing date value for date of milestone. This field takes input in ISO 8601 extended notation for date value i.e. yyyy-MM-dd.
**color** <br>`optional`|  String representing a color code for this milestone object. This is helpful to visually identify a milestone on the scheduling chart.This field takes input in string format of hexadecimal color code.
**description** <br>`optional` |  String consisting information related to this milestone. It can be up to 255 characters long.

### Returns
 
| Code      |Description |
 :---        |    :----   |
**201** <br><span class = "success">`Created`</span> | Indicates that the operation was successful and a milestone is created successfully.
**400** <br> <span class = "error">`Bad Request`</span> | Bad Request error occurs when a request is malformed, syntactically incorrect, missing required parameters or any unknown parameter is passed.
**403** <br> <span class = "error">`Forbidden`</span> | Authorization failed due to insufficient permissions. This occurs when the user does not have enough access rights to perform this action. Access for each user can be controlled by an Administrator using eRS Cloud Application.
**404** <br><span class = "error">`Not Found`</span> | This status code indicates that the project on which the milestone is being created, does not exist.

### Update a milestone

>**`PUT /v1/projects/{ID}/milestones/{Milestone_ID}`**

Updates an existing milestone by setting the values of the parameters passed. Any parameters not passed will be left unchanged. 

This request accepts mostly the same arguments as the milestone creation call.

>Example Request

```shell
curl -v -X PUT \
"https://app.eresourcescheduler.cloud/rest/v1/projects/477/milestones/1" \
-H "Authorization: Bearer B8x5Vj1O65r6wnoV" \
-H "Content-Type: application/json" \
-d '{
      "name": "Documentation Completed"
    }'

```

<span class="optional"><b>REQUEST BODY PARAMETERS</b></span>

Name         |  Description
 ---:        |    :----   
**name** <br> <span class ="required">`required`</span> | String representing the name of a milestone. It can be up to 100 characters long.
**date** <br><span class ="required">`required`</span> | String representing date value for date of milestone. This field takes input in ISO 8601 extended notation for date value i.e. yyyy-MM-dd.
**color** <br>`optional`|  String representing a color code for this milestone object. This is helpful to visually identify a milestone on the scheduling chart.This field takes input in string format of hexadecimal color code.
**description** <br>`optional` |  String consisting information related to this milestone. It can be up to 255 characters long.

### Returns

| Code      | Description | 
| ---:      |    :----    | 
**200** <br><span class = "success">`OK`</span> | Indicates that the operation was successful and milestone is updated successfully.
**400** <br> <span class = "error">`Bad Request`</span> | Bad Request error occurs when a request is malformed, syntactically incorrect, empty required parameters or any unknown parameter is passed.
**403** <br> <span class = "error">`Forbidden`</span> | Authorization failed due to insufficient permissions. This occurs when the user does not have enough access rights to perform this action. Access for each user can be controlled by an Administrator using eRS Cloud Application.
**404** <br><span class = "error">`Not Found`</span> | This status code indicates that the project or milestone does not exist.


<br><br>
### Delete a milestone

> **`DELETE /v1/projects/{ID}/milestones/{Milestone_ID}`**

Permanently deletes a milestone. It cannot be undone. 

> Example Request

```shell
curl -v -X DELETE \
"https://app.eresourcescheduler.cloud/rest/v1/projects/477/milestones/2" \
-H "Authorization: Bearer B8x5Vj1O65r6wnoV"
```


### Returns

| Code      | Description  
| :---      | :----
**200** <br><span class = "success">`OK`</span> | Indicates that the operation was successful and milestone is deleted successfully.
**403** <br> <span class = "error">`Forbidden`</span> | Authorization failed due to insufficient permissions. This occurs when the user does not have enough access rights to perform this action. Access for each user can be controlled by an Administrator using eRS Cloud Application.
**404** <br><span class = "error">`Not Found`</span> | This indicates that the project or milestone does not exist.

## Project Exception

>Example Response

```json
{
   "total_count":1,
   "data":[
      {
         "id":2,
         "name":"Working Sunday",
         "description":"Working Sunday",
         "date":"2018-11-17",
         "is_working_exception":true,
         "created_on":"2018-11-03T15:07:30.917087+05:30",
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
               "start_time":600,
               "end_time":1080
            }
         ]
      }
   ]
}
```

Exception is nothing but time duration that is different from a general schedule. eRS provides you the feature to add an exception to a project.

Let's say there's a project with a calendar that doesn't have Sunday as a working day. But for some reason, work has to be done on the project on Sunday. In this case, it's a working exception. So, in such a situation, exceptions come in handy.


eRS Cloud provides you two types of exceptions: 
    <ol><li>Working Exception : <p>&#160;&#160;&#160;&#160;&#160; Working Exception is added on a non-working day. </p></li> <li>Non-working Exception : <p>&#160;&#160;&#160;&#160;&#160; Non-working Exception is added on a working day. </p></li></ol>

_**Note**: Working Exception can be added without timings._

<span class="optional"><b>ATTRIBUTES</b></span>

Name         |  Description
 ---:        |    :----   
 **id** <br>`integer`   |  eRS Cloud generated unique identifier for the exceptions object.|
 **name**<br> `string` | This field describes name of exception.| 
 **description**<br> `string` | This field describes about the exception.|
 **date**<br> `string` | Date Field describes when will the exception get applied.|
 **is_working_exception**  <br><span class="required">`boolean`</span>|Is working exception describes whether exception is a working exception or non working exception. True value means that exception is working exception and false value means that exception is non working exception.
 **created_on** <br>`string` | Time at which  exception is created. |
 **modified_on** <br>`string` | Timestamp of the latest modification. |
 **created_by** <br> `object` | This field describes by whom exception is created .|
 **modified_by** <br>`object` | This field describes by whom the latest modification is done. |
 **timings** <br> `object` |Timings describe the timings of exception.



### Retrieving exceptions

> `GET v1/projects/{ID}/exceptions`

> Example Request

```shell
curl -v -X GET \
"https://app.eresourcescheduler.cloud/rest/v1/projects/12/exceptions" \
  -H "Authorization: Bearer B8x5Vj1O65r6wnoV"
```

> Example Response

```json
{
   "total_count":1,
   "data":[
      {
         "id":2,
         "name":"Working Sunday",
         "description":"Working Sunday",
         "date":"2018-11-17",
         "is_working_exception":true,
         "created_on":"2018-11-03T15:07:30.917087+05:30",
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
               "start_time":600,
               "end_time":1080
            }
         ]
      }
   ]
}
```

Retrieves the details of exceptions which are applied to the project. You only need to provide the unique project identifier that was returned upon project creation.



### Returns

| Code      | Description | 
| ---:        |    :----   | 
| **200** <br> <span class = "success">`OK`</span>     | This status code indicates that the operation was successful and exceptions retrieved successfully.  |
| **403** <br> <span class = "error">`Forbidden`</span> |Authorization failed due to insufficient permissions. This occurs when user does not have enough access rights to perform this action. Access for each user can be controlled by an Administrator using eRS Cloud Application.|
| **404** <br> <span class = "error">`Not Found`</span> | Not Found error occurs when requested project does not exist (i.e. There is no project with given ID). This may also occur when requesting a project that has been deleted. |


### Create an exception

> `POST v1/projects/{ID}/exceptions`

> Example Request

```shell
curl -v -X POST \
"https://app.eresourcescheduler.cloud/rest/v1/projects/12/exceptions" \
  -H "Authorization: Bearer B8x5Vj1O65r6wnoV" \
  -H "Content-Type: application/json" \
  -d '{ 
        "date": "2018-11-02", 
        "description": "Thursday 1", 
        "name": "Thursday 1", 
          "is_working_exception": true, 
          "timing_blocks":[ 
                  { 
                    "start_time":600, 
                    "end_time":1080 
                  } 
               ]  
       }'
```

<span class="optional"><b>REQUEST BODY PARAMETERS</b></span>

Name         |  Description
 ---:        |    :----   
**date**  <br><span class="required">`required`</span>| Date Field describes when will the exception get applied. It is a `Date` type of field. 
**description**  <br>`optional`|As the name shows it is a description which we want to give for the exception . This field is a `string` type of field. 
**name**  <br><span class="required">`required`</span>|Name describes the name of exception. This field is a `string` type of field.
**is_working_exception**  <br><span class="required">`required`</span>|Is working exception describes whether exception is a working exception or not. Accepts `true` if it is a working exception otherwise accepts `false` if it a non-working exception. This field is a `boolean` type of field.
**timing_blocks**  <br>`optional`|Timing blocks describes the timings of exception. This field can be passed `null`, as eRS Cloud provides you the facility to create an exception without timings. This field is a `Array of objects` type of field.
**timing_blocks.start_time**  <br>`optional`|Start time describes the start time of exception. This field can be passed `null`, as eRS Cloud provides you the facility to create an exception without timings. This field is a `Integer` type of field.  
**timing_blocks.end_time**  <br>`optional`|End time describes the end time of exception. This field can be passed `null`, as eRS Cloud provides you the facility to create an exception without timings. This field is a `Integer` type of field.  


### Returns
 
| Code      |Description |
 :---        |    :----   |
| **201** <br><span class = "success">`Created`</span> | This status code indicates that the operation was successful and exception created successfully.|
| **400** <br> <span class = "error">`Bad Request`</span> | Bad Request error occurs when a request is malformed, syntactically incorrect, missing required parameters are  or any unknown parameter is passed.  |
| **403** <br> <span class = "error">`Forbidden`</span> |Authorization failed due to insufficient permissions. This occurs when user does not have enough access rights to perform this action. Access for each user can be controlled by an Administrator using eRS Cloud Application.|
|  **404** <br><span class = "error">`Not Found`</span> |This status code indicates that project does not exist.|
### Update an exception


> `PUT v1/projects/{ID}/exceptions/{Exception_ID}`

> Example Request

```shell
curl -v -X PUT \
"https://app.eresourcescheduler.cloud/rest/v1/projects/12/exceptions/2" \
  -H "Authorization: Bearer B8x5Vj1O65r6wnoV" \
  -H "Content-Type: application/json" \
  -d '{ 
 	"date": "2018-11-02", 
	"description": "Thursday 1", 
	"name": "Thursday 1", 
    "is_working_exception": true, 
    "timing_blocks":[ 
            { 
               "start_time":600, 
               "end_time":1080 
            } 
         ]  
    }'
```



Updates the specified project's exception by setting the value of the parameter passed. You need to provide the unique project identifier that was returned upon project creation and unique exception identifier that was returned upon exception addition. If parameter is not provided then it will be left unchanged.

This request accepts mostly the same argument as the exception creation call.

<span class="optional"><b>REQUEST BODY PARAMETERS</b></span>


Name         |  Description
 ---:        |    :----   
**date**  <br><span class="required">`required`</span>| Date Field describes when will the exception get applied. It is a `Date` type of field. 
**description**  <br>`optional`|As the name shows it is a description which we want to give for the exception . This field is a `string` type of field. 
**name**  <br><span class="required">`required`</span>|Name describes the name of exception. This field is a `string` type of field.
**is_working_exception**  <br><span class="required">`required`</span>|Is working exception describes whether exception is working exception or not. Accepts `true` if it is working exception otherwise accepts `false` if it a non-working exception. This field is a `boolean` type of field
**timing_blocks**  <br>`optional`|Timing blocks describes the timings of exception. This field can be pass `null`, as eRS Cloud provides you the facility to create an exception without timings. This field is a `Array of objects` type of field.
**timing_blocks.start_time**  <br>`optional`|Start time describes the start time of exception. This field can be pass `null`, as eRS Cloud provides you the facility to create an exception without timings. This field is a `Integer` type of field.  
**timing_blocks.end_time**  <br>`optional`|End time describes the end time of exception. This field can be pass `null`, as eRS Cloud provides you the facility to create an exception without timings. This field is a `Integer` type of field.  

### Returns

| Code      | Description | 
| ---:        |    :----   | 
| **200** <br> <span class = "success">`OK`</span> | This indicates that the operation was successful and a exception updated successfully.|
| **400** <br> <span class = "error">`Bad Request`</span> | Bad Request occurs when a request is not well-formed, syntactically incorrect, empty required parameters or any unknown parameter is passed.|
| **403** <br> <span class = "error">`Forbidden`</span> |Authorization failed due to insufficient permissions. This occurs when user does not have enough access rights to perform this action. Access for each user can be controlled by an Administrator using eRS Cloud Application.|
| **404** <br><span class = "error">`Not Found`</span> |This status code indicates that project or exception does not exist.| 


### Delete an exception

> `DELETE v1/projects/{ID}/exceptions/{Exception_ID}`

Permanently deletes an applied exception. It cannot be undone. You need to provide the unique project identifier that was returned upon project creation and unique exception identifier that was returned upon exception addition.


> Example Request

```shell
curl -v -X DELETE \
"https://app.eresourcescheduler.cloud/rest/v1/projects/12/exceptions/2"\
  -H "Authorization: Bearer B8x5Vj1O65r6wnoV"
```



| Code      | Description  
| ---:        |    :----   
| **200** <br><span class = "success">`OK`</span> |This status code indicates that the operation was successful and exception deleted successfully. |
| **404** <br><span class = "error">`Not Found`</span> |This status code indicates that project or exception does not exist.| 

## Project Notes

To capture additional information about a project, eRS Cloud provides the `Notes`. If one has to provide any new information to a project which is not captured from the field, for such situations Notes are beneficial.

 eRS Cloud API allows you to perform *`POST`*, *`GET`*, *`PUT`*, *`DELETE`* operations on Notes. 

_**Note**: The Notes Of Archived Project remain available for the records._

<span class="optional"><b>ATTRIBUTES</b></span>

Name         |  Description
 ---:        |    :----   
 **id**<br>`integer` | eRS Cloud generated unique identifier for the notes. |
 **content** <br>`string` | Text written inside notes body.|
 **created_on** <br>`string` | Time at which the notes object is created. |
 **modified_on** <br>`string` | Describes the latest modification date.|
 **created_by** <br>`object` | This field describes by whom this note is created.|
 **modified_by** <br>`object` | This field describes by whom the modification is done.


### List notes

>` GET  v1/projects/{ID}/notes`


Retrieves the Notes list of specified project. You need to provide the unique project identifier that was returned upon project creation. The notes are returned which are sorted by lastly modified or added.

> Example Request

```shell
curl -v -X GET "https://app.eresourcescheduler.cloud/rest/v1/projects/8/notes"\
  -H "Authorization: Bearer B8x5Vj1O65r6wnoV"
```

>Example Request With Offset And Limit 

```shell 
curl -v -X GET \
"https://app.eresourcescheduler.cloud/rest/v1/projects/8/notes?offset=1&limit=10"\
 -H "Authorization: Bearer B8x5Vj1O65r6wnoV"
```
>Example Request With order_by

```shell 
curl -v -X GET \
"https://app.eresourcescheduler.cloud/rest/v1/projects/8/notes?offset=1&limit=10&order_by=created_on" \
 -H "Authorization: Bearer B8x5Vj1O65r6wnoV"
```

> Example Response

```json
{
  "total_count": 4,
  "limit": 10,
  "offset": 1,
  "data": [
    {
      "id": 20,
      "created_on": "2018-11-21T11:20:48.828322+05:30",
      "content": "<p>Updated Content Value Given</p>",
      "modified_on": null,
      "created_by": {
        "id": -99,
        "name": "Testing User",
        "image_uuid": null
      },
      "modified_by": {
        "id": null,
        "name": null
      }
    },
	{...},
	{...},
	{...},
  ]
}
```

<span class="optional"><b>REQUEST QUERY PARAMETERS</b></span>

|Name|Description|
|-:|:-|
|**limit**<br>`optional`| The limit keyword is used to limit the number of notes returned from a result set. <br>*The default value of `limit` is*  <span class="error">*`25`*</span>.<br>*Maximum value of limit can be* <span class="error">*`100.`*</span> *If value of Limit is more than*<span class="error">*`100`*</span>  *then it will set Maximum value of limit which is* <span class="error">*`100`*</span>. 
|**offset**<br>`optional`| The Offset value allows you to specify the ranking number of the first item on the page . The Offset value is most often used together with the Limit keyword.<br>*The default value of `offset` is* <span class="error">*`0`* </span>.|




### Ordering the notes

<span class="optional"><b>REQUEST QUERY PARAMETERS</b></span>

|Name|Options|Description|
|-:|:-:|:-
|**order_by**<br>`optional`|<li>**created_on** *(Default)*</li>|List of notes will be returned and sorted by it's created date.|
| |<li>modified_on</li> |List of notes will be returned and sorted by it's latest modified date.|


### Returns 


| Code      | Description | 
| ---:        |    :----   | 
| **200** <br> <span class = "success">`OK`</span> | This indicates that the operation was successful and returned list of notes.  |
| **400** <br> <span class = "error">`Bad Request`</span> | Bad Request may occur when offset and limit value is negative.|
| **403** <br> <span class = "error">`Forbidden`</span> | Authorization failed due to insufficient permissions. This occurs when user does not have enough access rights to perform this action. Access for each user can be controlled by an Administrator using eRS Cloud Application.|
| **404** <br><span class = "error">`Not Found`</span> | This status code indicates that project ID does not exist.| 


### Create a note

>` POST  v1/projects/{ID}/notes`


> Example Request

```shell

curl -v -X POST "https://app.eresourcescheduler.cloud/rest/v1/projects/8/notes"\
  -H "Authorization: Bearer B8x5Vj1O65r6wnoV"\
  -H "Content-Type: application/json"\
  -d '{"content": "Hello Enbraun"}'
```
<span class="optional"><b>REQUEST BODY PARAMETERS</b></span>


Name         |  Description
 ---:        |    :----   
**content**  <br><span class="required">`required`</span>  | To create new note you have to pass the body from content parameter. Content param accepts plain text. Also, you can pass text with HTML tags as Notes are Multi Line Rich Text.


### Returns
 
| Code      |Description |
 :---        |    :----   |
| **201** <br><span class = "success">`Created`</span> | This status code indicates that the operation was successful and created a note successfully.|
| **400** <br> <span class = "error">`Bad Request`</span> | Bad Request error occurs when a request is malformed, syntactically incorrect, missing required parameters are  or any unknown parameter is passed.  |
| **403** <br> <span class = "error">`Forbidden`</span> | Authorization failed due to insufficient permissions. This occurs when user does not have enough access rights to perform this action. Access for each user can be controlled by an Administrator using eRS Cloud Application.|
  **404** <br><span class = "error">`Not Found`</span> | This status code indicates that project does not exist.| 




### Update a note

>` PUT  v1/projects/{ID}/notes/{Note_ID}`

Updates the specified project's note by setting the value of the parameter passed. You need to  provide the unique project identifier that was returned upon project creation and unique note identifier that was returned upon note's creation. If parameter is not provided then it will be left unchanged.

This request accepts mostly the same argument as the note creation call.

> Example Request

```shell

curl -v -X PUT "https://app.eresourcescheduler.cloud/rest/v1/projects/8/notes/4"\
  -H "Authorization: Bearer B8x5Vj1O65r6wnoV"\
  -H "Content-Type: application/json"\
  -d '{"content": "Hello World"}'
```

<span class="optional"><b>REQUEST BODY PARAMETERS</b></span>


Name         |  Description
 ---:        |    :----   
 **content**  <br><span class="required">`required`</span>  | To update note you have to pass the body from `content` parameter.  Content param accepts plain text. Also, you can pass text with HTML tags as Notes are Multi Line Rich Text.


### Returns

| Code      | Description | 
| ---:        |    :----   | 
| **200** <br> <span class = "success">`OK`</span>    |  This indicates that the operation was successful and a note updated successfully.|
| **400** <br> <span class = "error">`Bad Request`</span> | Bad Request occurs when a request is not well-formed, syntactically incorrect, empty required parameters or any unknown parameter is passed.|
| **403** <br> <span class = "error">`Forbidden`</span> | Authorization failed due to insufficient permissions. This occurs when user does not have enough access rights to perform this action. Access for each user can be controlled by an Administrator using eRS Cloud Application.|
|  **404** <br><span class = "error">`Not Found`</span> | This status code indicates that project or note does not exist.| 


### Delete a note

>` DELETE  v1/projects/{ID}/notes/{Note_ID}`

Permanently deletes a Note. It cannot be undone. You need to  provide the unique project identifier that was returned upon project creation and unique note identifier that was returned upon note's creation.

> Example Request

```shell

curl -v -X DELETE "https://app.eresourcescheduler.cloud/rest/v1/projects/8/notes/5"\
  -H "Authorization: Bearer B8x5Vj1O65r6wnoV"
```

### Returns

| Code      | Description  
| ---:        |    :----   
| **200** <br><span class = "success">`OK`</span> |This status code indicates that the operation was successful and a note deleted successfully. |
| **403** <br> <span class = "error">`Forbidden`</span> | Authorization failed due to insufficient permissions. This occurs when user does not have enough access rights to perform this action. Access for each user can be controlled by an Administrator using eRS Cloud Application.|
|  **404** <br><span class = "error">`Not Found`</span> | This status code indicates that project or note does not exist.| 

