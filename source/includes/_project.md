# Project

## Project object
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
      "name": "Rahul Sharma",
      "id": 118
    },
    "modified_on": "2018-09-28T12:32:44.896426Z",
    "modified_by": {
      "name": "Rahul Sharma",
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
**title** <br>`string` | Represents title or name of the project. This may be up to 255 characters.
**type** <br>`object` | Describes the type of project. This is one of the project type objects which an admin user creates using eRS Cloud Application.
**email** <br>`string` | An optional email address of project object.
**project_start_date** <br>`string` |  Date on which project is considered started.
**end_date** <br>`string` | Date on which project is considered ended / completed.
**image** <br>`string` | String value representing URL of image file of project.
**tags** <br>`array of strings` | Tags are the list of strings (labels) attached to this project object which could be used for the purpose of filtering, identification or other information.
**is_archive** <br>`boolean` | Boolean value representing whether this project is archived or not.
**created_on** <br>`string` | Timestamp at which this project object was created.
**created_by** <br> `object` | Object representing user who created this project object.
**modified_on** <br>`string` | Represents latest modification timestamp.
**disable_parallel_booking** <br>`boolean` | Boolean value defining if project can or cannot have multiple bookings at a time. Default value for `disable_parallel_booking` is false.
**modified_by** <br>`object` | Object representing most recent user who modified this project object.
**udf_\*** | Custom user-defined fields used to capture additional information of project. User defined field can be of multiple types. Custom fields are very useful to configure project objects to best fit requirements.  In given example response, all keys starting with prefix `udf_` are user defined custom fields. <a href="#user-defined-fields" class="api-ref">Learn more</a>

## Create a project

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
 **project_type_id** <br> <span class="required">`required`</span> | Id of <a href="#project-types" class="api-ref">project-type</a> object. A project must be linked with one of <a href="#project-types" class="api-ref">project-type</a> defined in admin section (_using eRS Cloud Application_). Let’s assume there are two project types defined as `Medical` (_having id as 1_) and `Education` (_having id as 2_), now while creating a new project, if project_type_id is given as 1 then it will get created under Medical type and same for Education when project_type_id is given as 2.
**title** <br><span class="required">`required`</span> | String representing title / name of project. This can be a maximum of 255 characters long.
**email**<br><span class="mandatoryFlag">&#9873;</span> <span class="removableFlag mln-2">&#9873;</span> | String value representing email address of project object. Email address must be properly formatted with a maximum length of 254 characters.
**project_start_date**<br><span class="mandatoryFlag">&#9873;</span> <span class="removableFlag mln-2">&#9873;</span> | String value representing a date in ISO 8601 extended notation for date i.e. yyyy-MM-dd.
**end_date**<br><span class="mandatoryFlag">&#9873;</span> <span class="removableFlag mln-2">&#9873;</span> | String value representing a date in ISO 8601 extended notation for date i.e. yyyy-MM-dd.
**tags**<br><span class="removableFlag mln-2">&#9873;</span> | An optional array of strings which could be attached to this project object as labels. This can be useful for the purpose of filtering, identification or other information.
**disable_parallel_booking** <br>`optional` | Boolean value defining if project can or cannot have multiple bookings at a time. Default value for `disable_parallel_booking` is false.
**udf_\*** <br><span class="mandatoryFlag">&#9873;</span> <span class="removableFlag mln-2">&#9873;</span> | A user with admin rights can add custom fields. These fields can be used to capture additional information in Projects. Different types of projects may have a different set of user-defined fields. The value for user defined field can be passed as shown in example request. In given example **_udf_progress_**</span> is a user defined field. <a href="#user-defined-fields" class="api-ref">Learn more</a><br><br>_**Note**: User with admin rights can make fields marked with <span class="mandatoryFlag iconInline">&#9873;</span> mandatory and remove fields marked with <span class="removableFlag iconInline">&#9873;</span>, from <a href ="#get-a-specific-project-type" class="api-ref">specific project type</a> using **eRS Cloud Application**. If mandatory fields are not passed with a valid value or removed fields are passed while creating project, the operation will fail with response code **400**_.

### Returns

| Code      | Description |
| :---      |    :----    |
**201** <br><span class = "success">`Created`</span> | Indicates that the operation was successful and a project created successfully.
**400** <br> <span class = "error">`Bad Request`</span> | Bad Request error occurs when a request is  malformed, syntactically incorrect, missing required parameters or has any unknown parameter. 
**403** <br> <span class = "error">`Forbidden`</span> | Authorization failed due to insufficient permissions. This occurs when user does not have enough access rights to perform this action. Access for each user can be controlled by an Administrator using eRS Cloud Application.


## List projects


Returns a list of projects. The projects are returned sorted by title. 
	

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
        "name": "Rahul Sharma",
        "id": 118
      },
      "modified_on": "2018-09-28T12:32:44.896426Z",
      "modified_by": {
        "name": "Rahul Sharma",
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
**limit**<br>`optional` | The limit keyword is used to limit the number of records returned from a result set. If a limit count is given, no more than that many records will be returned (but possibly less, if the query itself yields less records)<br>_Default value of `limit` is_ <span class="required">**`25`**</span><br>_Maximum value of `limit` can be_ <span class="required">**`500`**</span>
**offset**<br>`optional` | Offset keyword is used to skip n items. If offset value is given as 10, then first 10 records will be skipped from result set. Offset is often used together with the Limit keyword.<br>_Default value of `offset` is_ <span class="required">**`0`**</span>


### Returns 


| Code    | Description | 
| ---:    |    :----    | 
**200** <br> <span class = "success">`OK`</span>  | Indicates that the operation was successful and  list of projects is returned. 
**400** <br> <span class = "error">`Bad Request` </span> | Bad Request may occur when offset or limit value is negative.
**403** <br> <span class = "error">`Forbidden`</span> | Authorization failed due to insufficient permissions. This occurs when user does not have enough access rights to perform this action. Access for each user can be controlled by an Administrator using eRS Cloud Application.

## Retrieve a project


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
    "name": "Rahul Sharma",
    "id": 118
  },
  "modified_on": "2018-09-28T12:32:44.896426Z",
  "modified_by": {
    "name": "Rahul Sharma",
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
| **200** <br> <span class = "success">`OK`</span>     | This status code indicates that the operation was successful and project retrieved successfully .  |
| **403** <br> <span class = "error">`Forbidden`</span> |Authorization failed due to insufficient permissions. This occurs when user does not have enough access rights to perform this action. Access for each user can be controlled by an Administrator using eRS Cloud Application.|
| **404** <br> <span class = "error">`Not Found`</span> | Not Found error occurs when requested project does not exist (i.e. There is no project with given id). This may also occur when requesting a project which has been deleted. |

## Search projects
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
        "name": "Rahul Sharma",
        "id": 118
      },
      "modified_on": "2018-09-28T12:32:44.896426Z",
      "modified_by": {
        "name": "Rahul Sharma",
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
**limit**<br>`optional` | The limit keyword is used to limit the number of records returned from a result set. If a limit count is given, no more than that many records will be returned (but possibly less, if the query itself yields less records)<br>_Default value of `limit` is_ <span class="required">**`25`**</span><br>_Maximum value of `limit` can be_ <span class="required">**`500`**</span>
**offset**<br>`optional` | Offset keyword is used to skip n items. If offset value is given as 10, then first 10 records will be skipped from result set. Offset is often used together with the Limit keyword.<br>_Default value of `offset` is_ <span class="required">**`0`**</span>
<br><br>

Search Project API allows filtering the results returned in various ways. This enables a great power to find out what is needed. eRS Cloud API also allows filtering on custom defined fields with multiple operators and conditions to cover up complex scenarios for searching.

A filter condition consists of three components which are **_field_**, **_operator_** and **_value_**. For example fetching only those projects having project type id 1, could be achieved by adding project_type_id:eq=1 to your query.  If operator is not supplied, it takes default operator for field. <a href="#filters" class="api-ref">Read more</a>

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
**is_archive**| N/A |`"is_archive":true` <br>`"is_archive":false`
**disable_paralled_booking**|Accepts value true and false |`"disable_paralled_booking": true`<br>`"disable_paralled_booking": false`
**created_by**|<li>**eq** (_default_)</li><li>neq</li><li>any</li><li>none</li>| `"created_by:eq": 1`<br>`"created_by:neq": 1`<br>`"created_by:any": [1, 2]`<br>`"created_by:none": [1, 2]`
**modified_by**|<li>**eq** (_default_)</li><li>neq</li><li>any</li><li>none</li>| `"modified_by:eq": 1`<br>`"modified_by:neq": 1`<br>`"modified_by:any": [1, 2]`<br>`"modified_by:none": [1, 2]`
**created_on**|<li>**eq** (_default_)</li><li>lt</li><li>gt</li><li>bt</li><li>ex</li>| `"created_on:eq": ["2021-07-08T00:00:00]`<br>`"created_on:lt": ["2021-07-08T00:00:00]`<br>`"created_on:gt": ["2021-07-08T59:59:59"]`<br>`"created_on:bt": ["2021-07-08T00:00:00", "2021-07-10T23:59:59"]`<br>`"created_on:bt": ["2021-07-08T00:00:00", ""]` <br>`"created_on:bt": ["", "2021-07-10T23:59:59"]` <br>`"created_on:ex": ["2021-07-08T00:00:00", "2021-07-10T23:59:59"]` <br>`"created_on:ex": ["2021-07-08T00:00:00", ""]` <br>`"created_on:ex": ["", "2021-07-10T23:59:59"]]` 
**modified_on**|<li>**eq** (_default_)</li><li>lt</li><li>gt</li><li>bt</li><li>ex</li>| `"modified_on:eq": ["2021-07-08T00:00:00]`<br>`"modified_on:lt": ["2021-07-08T00:00:00]`<br>`"modified_on:gt": ["2021-07-08T59:59:59"]`<br>`"modified_on:bt": ["2021-07-08T00:00:00", "2021-07-10T23:59:59"]`<br>`"modified_on:bt": ["2021-07-08T00:00:00", ""]` <br>`"modified_on:bt": ["", "2021-07-10T23:59:59"]` <br>`"modified_on:ex": ["2021-07-08T00:00:00", "2021-07-10T23:59:59"]` <br>`"modified_on:ex": ["2021-07-08T00:00:00", ""]` <br>`"modified_on:ex": ["", "2021-07-10T23:59:59"]]` 
 _For User-defined fields please <a href="#filters-for-user-defined-fields" class="api-ref">check here</a>._ 

## Update a project

Updates specified project by setting the values of the parameters passed. Any parameters which are not provided remains unchanged. To unset existing value for a parameter, just pass an empty value i.e. `null`.

This request accepts mostly the same arguments as `Create Project` API.

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
**title** <br> <span class="required">`required`</span>  |String representing the  title of a project. This may be up to 255 characters.
**project_start_date**<br><span class="mandatoryFlag">&#9873;</span> <span class="removableFlag mln-2">&#9873;</span> | String value representing a date in ISO 8601 extended notation for date i.e. yyyy-MM-dd. The project is started from this date.
**end_date**<br><span class="mandatoryFlag">&#9873;</span> <span class="removableFlag mln-2">&#9873;</span> | String value representing a date in ISO 8601 extended notation for date i.e. yyyy-MM-dd. The project is considered ended / completed on this date.
**email**<br><span class="mandatoryFlag">&#9873;</span> <span class="removableFlag mln-2">&#9873;</span> | String value representing email address associated with project object. Email address must be properly formatted with a maximum length of 254 characters.
**tags**<br><span class="removableFlag mln-2">&#9873;</span> | An optional array of strings which could be attached to this project object as labels. This can be useful for the purpose of filtering, identification or other information. This may be up to 50 characters.
**disable_parallel_booking** <br>`optional` | Boolean value defining if project can or cannot have multiple bookings at a time. Default value for `disable_parallel_booking` is false.
**udf_\*** <br><span class="mandatoryFlag">&#9873;</span> <span class="removableFlag mln-2">&#9873;</span> | A user with admin rights can add custom fields. These fields can be used to capture additional information in Project. Different types of projects may have a different set of user-defined fields. The value for user defined field can be passed as shown in example request. In first example **_udf_progress_** is a user defined field. <a href ="#user-defined-fields" class="api-ref">Learn more</a><br><br>_**Note**: User with admin rights can make fields marked with <span class="mandatoryFlag iconInline">&#9873;</span> mandatory and remove fields marked with <span class="removableFlag iconInline">&#9873;</span>, from <a href ="#get-a-specific-project-type" class="api-ref">specific project type</a> using **eRS Cloud Application**. If mandatory fields are not passed with a valid value or removed fields are passed while updating project, the operation will fail with response code **400**_.


### Returns

| Code      | Description | 
| ---:        |    :----   | 
**200** <br> <span class = "success">`OK`</span> | Indicates that the operation was successful and project is updated successfully.
**400** <br> <span class = "error">`Bad Request`</span> | Bad Request occurs when a request is not well-formed, syntactically incorrect, empty required parameters or any unknown parameter is passed. <br> Additionally, Bad request may also occur when :<ul><li>User tries to update archived project.</li><li> User tries to update start date or end date or both such that end date gets earlier than start date. </li></ul>
**403** <br> <span class = "error">`Forbidden`</span> | Authorization failed due to insufficient permissions. This occurs when user does not have enough access rights to perform this action. Access for each user can be controlled by an Administrator using eRS Cloud Application.
**404** <br><span class = "error">`Not Found`</span> | This status code indicates that project does not exist.


## Delete a project

 Permanently deletes requested project. It cannot be undone. By default, this operation will fail if a project has any booking, timesheet or rate associated with it. To override this, forceful deletion can be used which will delete all bookings, timesheets and rates and then, ultimately deletes the project object.

> **`DELETE /v1/projects/{ID}`**


> Example Request
 
```shell
curl -v -X DELETE \
"https://app.eresourcescheduler.cloud/rest/v1/projects/1" \
-H "Authorization: Bearer B8x5Vj1O65r6wnoV"
```

> Example Request For Forcefull Delete 
 
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
**409** <br> <span class = "error">`Conflict`</span> |Conflict indicates that the project can not be deleted as there are bookings, timesheets or rates associated with this project. If you wish to delete it any way you must use force delete option by passing `true` for parameter `force_delete_bookings`, `force_delete_timesheet_entry` and `force_delete_rates` which will delete all associated bookings, timesheets and rates corresponding to the project. This operation deletes all bookings, timesheets and rates of requested project and project itself (shown in example request).
**403** <br> <span class = "error">`Forbidden`</span> | Authorization failed due to insufficient permissions. This occurs when user does not have enough access rights to perform this action. Access for each user can be controlled by an Administrator using eRS Cloud Application.
**404** <br><span class = "error">`Not Found`</span> |This status code indicates that requested project does not exist| |

## Tasks

A task is a single unit of work – an action to accomplish in a project, a single step in a multi-step project. Each project has it's own set of tasks.

This API allows you to list, create, delete, update tasks of any project.

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
        "name": "Rahul Sharma"
      },
      "modified_by": {
        "id": 118,
        "name": "Rahul Sharma"
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
 **ID** <br><span class="required">`Integer`</span> | Auto generated unique identifier for task object.
 **name** <br> <span class ="required">`String`</span> | Name of task object.
**start_time** <br>`String`| Represents start time of task object.
**end_time** <br>`String`| Represents end time of task object. 
**project_id** <br>`Integer` | Unique id of project object, which this task belongs to.


### Returns

| Code      | Description | 
| ---:        |    :----   | 
**200** <br> <span class = "success">`OK`</span> | This status code indicates that the operation was successful and list tasks retrieved successfully.
**403** <br> <span class = "error">`Forbidden`</span> |Authorization failed due to insufficient permissions. This occurs when user does not have enough access rights to perform this action. Access for each user can be controlled by an Administrator using eRS Cloud Application.
**404** <br> <span class = "error">`Not Found`</span> | Not Found error occurs when requested project does not exist (i.e. There is no project with given id). This may also occur when requesting tasks of project which has been deleted.

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
**name** <br> <span class ="required">`required`</span> | String representing the name of task. This may be up to 100 characters long.
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
**name** <br> <span class ="required">`required`</span> | String representing the name of task. This may be up to 100 characters long.
**start_time** <br>`optional`| String representing timestamp value for start time of task. This field takes input in ISO 8601 extended notation for date and time value i.e. yyyy-MM-ddTHH:mm:ssZ and supports time zone offset as well.
**end_time** <br>`optional`|  String representing timestamp value for end time of task. This field takes input in ISO 8601 extended notation for date and time value i.e. yyyy-MM-ddTHH:mm:ssZ and supports time zone offset as well.

### Returns

| Code      | Description | 
| ---:      |    :----    | 
**200** <br><span class = "success">`OK`</span> | Indicates that the operation was successful and task is updated successfully.
**400** <br> <span class = "error">`Bad Request`</span> | Bad Request error occurs when a request is malformed, syntactically incorrect, missing required parameters or any unknown parameter is passed. Additionally, Bad request may also occur if `start_time` becomes later then `end_time`.
**403** <br> <span class = "error">`Forbidden`</span> |Authorization failed due to insufficient permissions. This occurs when user does not have enough access rights to perform this action. Access for each user can be controlled by an Administrator using eRS Cloud Application.
**404** <br><span class = "error">`Not Found`</span> | This status code indicates that project or task does not exists.


<br><br>
### Delete a task

> **`DELETE /v1/projects/{ID}/task/{Task_ID}`**

Permanently deletes a task. It cannot be undone. By default, this operation will fail if a task has any booking or timesheet associated with it. To override this behavior, forceful removal can be used which will remove this task from all bookings and timesheets associated with it.

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

### Return

| Code      | Description  
| :---      | :----
**200** <br><span class = "success">`OK`</span> | Indicates that the operation was successful and task is deleted successfully.
**409** <br> <span class = "error">`Conflict`</span> | Conflict indicates that the task can not be deleted as there are bookings or timesheets associated with this task. If you wish to delete it any way you must use force delete option by passing <span class = "required">`true`</span> for parameters <span class = "required">`remove_from_bookings`</span> and <span class = "required">`remove_from_timesheet`</span>. This operation removes task from all associated bookings and timesheets, and then deletes the task itself. Example request is shown to right.
**403** <br> <span class = "error">`Forbidden`</span> |Authorization failed due to insufficient permissions. This occurs when user does not have enough access rights to perform this action. Access for each user can be controlled by an Administrator using eRS Cloud Application.
**404** <br><span class = "error">`Not Found`</span> | This indicates that project or task does not exist.

## Project Notes

To capture additional information about a project, eRS Cloud provides the `Notes`. If one has to provide any new information to a project which is not captured from the field, for such situations Notes are beneficial.

 eRS Cloud API allows you to perform *`POST`*, *`GET`*, *`PUT`*, *`DELETE`* operations on Notes. 

_**Note**: The Notes Of Archived Project remain available for the records._

<span class="optional"><b>ATTRIBUTES</b></span>

Name         |  Description
 ---:        |    :----   
 **id**<br>`integer` | eRS Cloud generated unique identifier for the notes. |
 **content** <br>`string` | Text written inside notes body .|
 **created_on** <br>`string` | Time at which the notes object is created. |
 **modified_on** <br>`string` | Describes the latest modification date.|
 **created_by** <br>`object` | This field describes by whom this note is created .|
 **modified_by** <br>`object` | This field describes by whom the modification is done.


### List notes

>` GET  v1/projects/{ID}/notes`


Retrieves the Notes list of specified project. You need to provide the unique project identifier that was returned upon project creation.The notes are returned which are sorted by lastly modified or added.

> Example Request

```shell
curl -v -X GET "https://app.eresourcescheduler.cloud/rest/v1/projects/8/notes"\
  -H "Authorization: Bearer B8x5Vj1O65r6wnoV"
```

>Example Request With Offset And Limit 

```shell 
curl -v -X GET \
"https://app.eresourcescheduler.cloud/rest/v1/projects/8/notes?offset=1&limit=1"\
 -H "Authorization: Bearer B8x5Vj1O65r6wnoV"
```
>Example Request With order_by

```shell 
curl -v -X GET \
"https://app.eresourcescheduler.cloud/rest/v1/projects/8/notes?offset=1&limit=1&order_by=created_on" \
 -H "Authorization: Bearer B8x5Vj1O65r6wnoV"
```

> Exmaple Response

```json
{
  "total_count": 3,
  "limit": 25,
  "offset": 0,
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
|**limit**<br>`optional`|The limit keyword is used to limit the number of notes returned from a result set.<br>*The default value of `limit` is*  <span class="error">*`25`*</span><br>*Maximum value of limit can be* <span class="error">*`100.`*</span> *If value of Limit is more than*<span class="error">*`100`*</span>  *then it will set Maximum value of limit which is* <span class="error">*`100.`*</span> 
|**offset**<br>`optional`|The Offset value allows you to specify the ranking number of the first item on the page .The Offset value is most often used together with the Limit keyword.<br>*The default value of `offset` is* <span class="error">*`0`* </span>|




### Ordering the notes

<span class="optional"><b>REQUEST QUERY PARAMETERS</b></span>

|Name|Options|Description|
|-:|:-:|:-
|**order_by**<br>`optional`|<li>created_on *(Default)*</li>|List of notes will be returned and sorted by it's created date.|
| |<li>modified_on</li> |List of notes will be returned and sorted by it's latest modified date|


### Returns 


| Code      | Description | 
| ---:        |    :----   | 
| **200** <br> <span class = "success">`OK`</span>      |  This indicates that the operation was successful and returned list of notes.  |
|**400** <br> <span class = "error">`Bad Request` </span>| Bad Request may occur when offset and limit value is negative.|
| **403** <br> <span class = "error">`Forbidden`</span> | Authorization failed due to insufficient permissions. This occurs when user does not have enough access rights to perform this action. Access for each user can be controlled by an Administrator using eRS Cloud Application.|
|  **404** <br><span class = "error">`Not Found`</span> |This status code indicates that project id does not exist| 


> Example Request


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
**content**  <br><span class="required">`required`</span>  | To create new note you have to pass the body from `content` parameter.  Content param accepts plain text. Also, you can pass text with HTML tags as Notes are Multi Line Rich Text.


### Returns
 
| Code      |Description |
 :---        |    :----   |
| **201** <br><span class = "success">`Created`</span> | This status code indicates that the operation was successful and created a note successfully.|
| **400** <br> <span class = "error">`Bad Request`</span> | Bad Request error occurs when a request is malformed, syntactically incorrect, missing required parameters are  or any unknown parameter is passed.  |
| **403** <br> <span class = "error">`Forbidden`</span> |Authorization failed due to insufficient permissions. This occurs when user does not have enough access rights to perform this action. Access for each user can be controlled by an Administrator using eRS Cloud Application.|
  **404** <br><span class = "error">`Not Found`</span> |This status code indicates that project does not exist| 




### Update a note

>` PUT  v1/projects/{ID}/notes/{Note_ID}`

Updates the specified project's note by setting the value of the parameter passed. You need to  provide the unique project identifier that was returned upon project creation and unique note identifier that was returend upon notes creation. If parameter is not provided then it will be left unchanged.

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
|  **404** <br><span class = "error">`Not Found`</span> |This status code indicates that project or notes does not exist| 


### Delete a note

>` DELETE  v1/projects/{ID}/notes/{Note_ID}`

Permanently deletes a Note. It cannot be undone.You need to  provide the unique project identifier that was returned upon project creation and unique note identifier that was returned upon notes creation.

> Example Request

```shell

curl -v -X DELETE "https://app.eresourcescheduler.cloud/rest/v1/projects/8/notes/5"\
  -H "Authorization: Bearer B8x5Vj1O65r6wnoV"
```

### Returns

| Code      | Description  
| ---:        |    :----   
| **200** <br><span class = "success">`OK`</span> |This status code indicates that the operation was successful and a note deleted successfully |
| **403** <br> <span class = "error">`Forbidden`</span> | Authorization failed due to insufficient permissions. This occurs when user does not have enough access rights to perform this action. Access for each user can be controlled by an Administrator using eRS Cloud Application.|
|  **404** <br><span class = "error">`Not Found`</span> |This status code indicates that project or notes does not exist| 

