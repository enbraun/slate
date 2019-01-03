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
**id** <br>`integer` |  eRS Cloud-generated unique identifier for the project object.
**title** <br>`string` | Represents title or name of the project.
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
 **project_type_id** <br> <span class="required">`required`</span> | Id of <a href="#project-type" class="api-ref">project-type</a> object. A project must be linked with one of <a href="#project-type" class="api-ref">project-type</a> defined in admin section (_using eRS Cloud Application_). Let’s assume there are two project types defined as `Medical` (_having id as 1_) and `Education` (_having id as 2_), now while creating a new project, if project_type_id is given as 1 then it will get created under Medical type and same for Education when project_type_id is given as 2.
**title** <br><span class="required">`required`</span> | String representing title / name of project. This can be a maximum of 100 characters long.
**email** <br>`optional` | String value representing email address of project object. Email address must be properly formatted with a maximum length of 254 characters.
**project_start_date**<br>`optional` | String value representing a date in ISO 8601 extended notation for date i.e. yyyy-MM-dd.
**end_date**<br>`optional` | String value representing a date in ISO 8601 extended notation for date i.e. yyyy-MM-dd.
**tags**  <br>`optional` | An optional array of strings which could be attached to this project object as labels. This can be useful for the purpose of filtering, identification or other information.
**udf_\*** <br>`optional` | A user with admin rights can add custom fields. These fields can be used to capture additional information in Projects. Different types of projects may have a different set of user-defined fields. The value for user defined field can be passed as shown in example request. In given example **_udf_progress_**</span> is a user defined field. <a href="#user-defined-fields" class="api-ref">Learn more</a>

### Returns

| Code      | Description |
| :---      |    :----    |
**201** <br><span class = "success">`Created`</span> | Indicates that the operation was successful and a project get created successfully.
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
| **200** <br> <span class = "success">`OK`</span>     | This status code indicates that the operation was successful and a project  get retrieved successfully .  |
| **403** <br> <span class = "error">`Forbidden`</span> |Authorization failed due to insufficient permissions. This occurs when user does not have enough access rights to perform this action. Access for each user can be controlled by an Administrator using eRS Cloud Application.|
| **404** <br> <span class = "error">`Not Found`</span> | Not Found error occurs when requested project does not exist (i.e. There is no project with given id). This may also occur when requesting a project which has been deleted. |

## Search projects
> **`POST /v1/projects/search`**

> Example Request For Filter In JSON Format

```shell
curl -X POST \
"https://app.eresourcescheduler.cloud/rest/v1/projects/search" \
-H "Content-Type: application/json" \
-H "Authorization: Bearer B8x5Vj1O65r6wnoV" \
-d '{ 
      "project_type_id:eq": 1 
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

Search Project API allows filtering the results returned in various ways. This enables a great power to find out what is needed. eRS Cloud API also allows filtering on custom defined fields with multiple operators and conditions to cover up complex scenarios for searching.

A filter condition consists of three components which are **_field_**, **_operator_** and **_value_**. For example fetching only those projects having project type id 1, could be achieved by adding project_type_id:eq=1 to your query.  If operator is not supplied, it takes default operator for field. <a href="#filters" class="api-ref">Read more</a>

Below is a list of available fields, which allow filtering projects:

> Example Request For Filter By Passing Multiple Rules In JSON Format

```shell
curl -X POST \
"https://app.eresourcescheduler.cloud/rest/v1/projects/search" \
-H "Content-Type: application/json" \
-H "Authorization: Bearer B8x5Vj1O65r6wnoV" \
-d '{ 
      "project_type_id:eq": 1, 
      "project_start_date:gt": "2015-04-02" 
    }'
```
### Filters for System-defined fields

|**Field Code**| **Operator**  | **Example**|
|:--|:---|:--|
**project_type_id**|<li>**eq** (_default_)  </li><li>any</li>| `"project_type_id":1 `<br>`"project_type_id:any":1`
**email**|<li class="nowrap">**has** (_default_)&nbsp;&nbsp;</li><li>eq</li>|`"email":"abc"` <br>`"email:eq":"ujjwal@gmail.com"`
**project_start_date**|<li>**eq** (_default_)</li><li>lt</li><li>gt</li><li>bt</li><li>ex</li>|`"project_start_date:eq":"2015-02-02"`<br>`"project_start_date:lt":"2015-02-02"`<br>`"project_start_date:gt":"2015-02-02"`<br>`"project_start_date:bt":["2015-02-02","2015-04-05"]` <br>`"project_start_date:ex":["2015-02-02","2015-04-04"]`
**end_date**|<li>**eq** (_default_) </li><li>lt</li><li>gt</li><li>bt</li><li>ex</li>| `"end_date:eq":"2015-02-02"`<br>`"end_date:lt":"2015-02-02"`<br>`"end_date:gt":"2015-02-02"`<br>`"end_date:bt":["2015-02-02","2015-04-05"]`<br>`"end_date:ex":["2015-02-02","2015-04-04"]`
**tags**|<li>**any** (_default_) </li><li>all</li>|`"tags":"["tagA", "tagB"]`<br>`"tags:all":["tagB","tagC"]`
**is_archive**| N/A |`"is_archive":true` <br>`"is_archive":false`
 _For User-defined fields please <a href="#filters-for-user-defined-fields" class="api-ref">check here</a>._ 

## Update a project

Updates specified project by setting the values of the parameters passed. Any parameters  which is not provided remains unchanged. To unset existing value for a parameter, just pass an empty value i.e. `null` or `undefined`.

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
**title** <br> <span class="required">`required`</span>  |String representing the  title of a project. This may be up to 100 characters.
**project_start_date**<br>`optional` | String value representing a date in ISO 8601 extended notation for date i.e. yyyy-MM-dd. The project is started from this date.
**end_date** <br>`optional` | String value representing a date in ISO 8601 extended notation for date i.e. yyyy-MM-dd. The project is considered ended / completed on this date.
**tags**  <br>`optional`  | An optional array of strings which could be attached to this project object as labels. This can be useful for the purpose of filtering, identification or other information. This may be up to 50 characters.
**email** <br>`optional`  | String value representing email address associated with project object. Email address must be properly formatted with a maximum length of 254 characters.
**udf_\*** <br>`optional`  | A user with admin rights can add custom fields. These fields can be used to capture additional information in Project. Different types of projects may have a different set of user-defined fields. The value for user defined field can be passed as shown in example request. In first example **_udf_progress_** is a user defined field. <a href ="#user-defined-fields" class="api-ref">Learn more</a>


### Returns

| Code      | Description | 
| ---:        |    :----   | 
**200** <br> <span class = "success">`OK`</span> | Indicates that the operation was successful and project is updated successfully.
**400** <br> <span class = "error">`Bad Request`</span> | Bad Request occurs when a request is not well-formed, syntactically incorrect, empty required parameters or any unknown parameter is passed. <br> Additionally, Bad request may also occur when :<ul><li>User tries to update archived project.</li><li> User tries to update start date or last_date or both such that last date gets smaller than start date. </li></ul>
**403** <br> <span class = "error">`Forbidden`</span> | Authorization failed due to insufficient permissions. This occurs when user does not have enough access rights to perform this action. Access for each user can be controlled by an Administrator using eRS Cloud Application.
**404** <br><span class = "error">`Not Found`</span> | This status code indicates that project does not exist.


## Delete a project

 Permanently deletes requested project. It cannot be undone. By default, this operation will get failed if a project has any booking associated with it. To override this, forceful delete can be used which will delete all bookings and then ultimately delete the project object.

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
"https://app.eresourcescheduler.cloud/rest/v1/rpojects/1?\
force_delete_bookings=true" \
-H "Authorization: Bearer B8x5Vj1O65r6wnoV" 
```

### Returns


| Code      | Description  
| ---:        |    :----   
**200** <br><span class = "success">`OK`</span> |This status code indicates that the operation was successful and a project get deleted successfully.
**409** <br> <span class = "error">`Conflict`</span> |Conflict indicates that the project can not be deleted as there are bookings associated with this project. If you wish to delete it any way you must use force delete option by passing <span class = "error">`true`</span> for parameter `force_delete_bookings`. This operation deletes all bookings of requested project and project itself (shown in example request).
**403** <br> <span class = "error">`Forbidden`</span> | Authorization failed due to insufficient permissions. This occurs when user does not have enough access rights to perform this action. Access for each user can be controlled by an Administrator using eRS Cloud Application.
**404** <br><span class = "error">`Not Found`</span> |This status code indicates that requested project does not exist| |

## Tasks

>` GET v1/projects/{ID}/tasks`

Task is assignments or jobs that are to be covered in the project.

eRS Cloud API allows you to perform *`POST`*, *`GET`*, *`PUT`*, *`DELETE`*  operation on Tasks.

### List Tasks

Retrieves the Tasks list of specified project. The tasks are returned sorted by name.


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
	"data": [
	{
		"id": 9,
		"name": "TASK- 2A",
		"start_time": null,
		"end_time": null,
		"project_id": 2,
		"created_by": {
			"id": null,
			"name": null
		},
		"modified_by": {
			"id": null,
			"name": null
    },
	{...},
	{...},
	]
}
```
<span class="optional"><b>ATTRIBUTES</b></span>


Name         |  Description
 ---:        |    :----   
 **ID** <br><span class="required">`Integer`</span> | The eRS Cloud generated ID for the task which is used to uniquely identified task object.
 **name** <br> <span class ="required">`String`</span> | Name describes the name of task. This field is a `string` type of field 
**start_time** <br>`String` | Start time describes the start time of task.  
**end_time** <br>`String`| End time describes the end time of task. 
**project_id** <br>`Integer` | eRS Cloud generated unique identifier for the project object.


### Returns

| Code      | Description | 
| ---:        |    :----   | 
| **200** <br> <span class = "success">`OK`</span>     | This status code indicates that the operation was successful and  tasks get retrieved successfully .  |
| **403** <br> <span class = "error">`Forbidden`</span> |Authorization failed due to insufficient permissions. This occurs when user does not have enough access rights to perform this action. Access for each user can be controlled by an Administrator using eRS Cloud Application.|
| **404** <br> <span class = "error">`Not Found`</span> | Not Found error occurs when requested project does not exist (i.e. There is no project with given id). This may also occur when requesting a project which has been deleted. | 

<br><br><br>

### Create a task
 
Creates a new task assignment object.
>`POST v1/projects/{ID}/tasks`

>Example Request

 ```shell
 curl -v -X POST \
 "https://app.eresourcescheduler.cloud/rest/v1/projects/2/tasks" \
  -H "Authorization: Bearer B8x5Vj1O65r6wnoV" \
  -H "Content-Type: application/json" \
  -d '{"name": "TASK- 2A"}'
  ```

<span class="optional"><b>REQUEST BODY PARAMETERS</b></span>


Name         |  Description
 ---:        |    :----   
 **name** <br> <span class ="required">`required`</span> | Name describes the name of task. This field is a `string` type of field 
**start_time** <br>`optional`| Start time describes the start time of task. This filed can be passed null, as eRS Cloud provids you the facility to create an task without start time. This field is a `String` type of field.  
**end_time** <br>`optional`| End time describes the end time of task. This filed can be passed null,as eRS Cloud provides you the facility to create an task without end time.This field is a `String` type of field.

### Returns
 
| Code      |Description |
 :---        |    :----   |
| **201** <br><span class = "success">`Created`</span> | This status code indicates that the operation was successful and task get created successfully.|
| **400** <br> <span class = "error">`Bad Request`</span> | Bad Request error occurs when a request is not malformed, syntactically incorrect, missing required parameters are  or any unknown parameter is passed.<br> Additionally, Bad request may also occur when :<ul><li> User gives start time after end time </li> </ul> |
| **403** <br> <span class = "error">`Forbidden`</span> |Authorization failed due to insufficient permissions. This occurs when user does not have enough access rights to perform this action. Access for each user can be controlled by an Administrator using eRS Cloud Application.|

### Update a task

>`PUT v1/projects/{ID}/tasks/{Task_ID}`

Updates the specified task by setting the values of the parameters passed. Any parameters not provided will be left unchanged. 

This request accepts mostly the same arguments as the task creation call.

>Example Request

 ```shell
 curl -v -X PUT \
 "https://app.eresourcescheduler.cloud/rest/v1/projects/8/tasks/9" \
  -H "Authorization: Bearer B8x5Vj1O65r6wnoV" \
  -H "Content-Type: application/json" \
  -d '{"name": "TASK- 2B"}'
  ```

<span class="optional"><b>REQUEST BODY PARAMETERS</b></span>

Name         |  Description
 ---:        |    :----   
**name** <br> <span class ="required">`required`</span> | Name describes the name of task. This field is a `string` type of field.This will throw an error if you post an empty value.
**start_time** <br>`optional` | Start time describes the start time of task. This filed can be passed null, as eRS Cloud provids you the facility to create an task without start time. This field is a `String` type of field.  
**end_time** <br>`optional` | End time describes the end time of task. This filed can be passed null,as eRS Cloud provides you the facility to create an task without end time.This field is a `String` type of field.

### Returns

| Code      | Description | 
| ---:        |    :----   | 
| **200** <br> <span class = "success">`OK`</span>    |  This indicates that the operation was successful and a task get updated successfully.|
| **400** <br> <span class = "error">`Bad Request`</span> | Bad Request occurs when a request is not well-formed, syntactically incorrect, empty required parameters or any unknown parameter is passed. <br> Additionally, Bad request may also occur when :<ul><li> User tries to update start time that values after end time. </li> <li> User tries to update end time that values before start time.</li></ul>|
| **403** <br> <span class = "error">`Forbidden`</span> | Authorization failed due to insufficient permissions. This occurs when user does not have enough access rights to perform this action. Access for each user can be controlled by an Administrator using eRS Cloud Application.|
|  **404** <br><span class = "error">`Not Found`</span> |This status code indicates that project or task does not exist| |


### Delete a task

> `DELETE v1/projects/{ID}/task/{Task_ID}`

Permanently deletes a task. It cannot be undone. By default, this operation will get failed if a task has any booking associated with it. To override this behaviour, forcefull remove can be used which will remove all task from bookings.

> Example Request

```shell
curl -v -X DELETE \
"https://app.eresourcescheduler.cloud/rest/v1/projects/1/tasks/2"\
  -H "Authorization: Bearer B8x5Vj1O65r6wnoV"
```
> Example Request For Forcefull Delete 
 
```shell
curl -v -X DELETE \
"https://app.eresourcescheduler.cloud/rest/v1/projects/1/tasks/2?remove_from_bookings=true"\
  -H "Authorization: Bearer B8x5Vj1O65r6wnoV"
```

### Return

| Code      | Description  
| ---:        |    :----   
| **200** <br><span class = "success">`OK`</span> |This status code indicates that the operation was successful and task get deleted successfully |
| **409** <br> <span class = "error">`Conflict`</span> |Conflict indicates that the task can not be deleted as there are bookings associated with this task. If you wish to delete it any way you must use force delete option by passing <span class = "error">`true`</span> for parameter <span class = "error">`remove_from_bookings`</span>. This operation removes all task from bookings. This can not be undone. Example shown <span style="font-size:24px; font-weight:bold;">￼&#x1f449;</span>|
| **403** <br> <span class = "error">`Forbidden`</span> |Authorization failed due to insufficient permissions. This occurs when user does not have enough access rights to perform this action. Access for each user can be controlled by an Administrator using eRS Cloud Application.|
|  **404** <br><span class = "error">`Not Found`</span> |This status code indicates that project or task does not exist| 

## Project Notes

To capture additional information about a project, eRS Cloud provides the `Notes`. If one has to provide any new information to a project which is not captured from the filed, for such situations Notes are beneficial.

 eRS Cloud API allows you to perform *`POST`*, *`GET`*, *`PUT`*, *`DELETE`* operations on Notes. 

*The Notes Of Archived Project remain available for the records.*


### List notes

>` GET  v1/projects/{ID}/notes`


Retrieves the Notes list of specified project. You need to provide the unique project identifier that was returned upon project creation.The notes are returned which sorted by lastly modified or added.

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
|**limit**<br>`optional`|The limit keyword is used to limit the number of notes returned from a result set.<br>*The default value of `limit` is*  <span class="error">*`25`*</span><br>*Maximum value of limit can be* <span class="error">*`100.`*</span> *If value of Limit is more than*<span class="error">*`100`*</span>  *then it will get set Maximum value of limit which is* <span class="error">*`100.`*</span> 
|**offset**<br>`optional`|The Offset value allows you to specify the ranking number of the first item on the page .The Offset value is most often used together with the Limit keyword.<br>*The default value of `offset` is* <span class="error">*`0`* </span>|


### Ordering the notes

<span class="optional"><b>REQUEST QUERY PARAMETERS</b></span>

|Name|Options|Description|
|-:|:-:|:-
|**Order_by**<br>`optional`|<li>created_on *(Default)*</li>|List of notes will be returned and sorted by it's created date.|
| |<li>modified_on</li> |List of notes will be returned and sorted by it's latest modified date|

<span class="optional"><b>ATTRIBUTES</b></span>

Name         |  Description
 ---:        |    :----   
 **id**<br>`integer` | eRS Cloud generated unique identifier for the notes. |
 **content** <br>`string` | Text written inside notes body .|
 **created_on** <br>`string` | Time at which the notes object is created. |
 **modified_on** <br>`string` | Describes the latest modification date.|
 **created_by** <br>`object` | This field describes by whom notes is created .|
 **modified_by** <br>`object` | This field describes by whom the modification is done.

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
| **200** <br> <span class = "success">`OK`</span>    |  This indicates that the operation was successful and a note get updated successfully.|
| **400** <br> <span class = "error">`Bad Request`</span> | Bad Request occurs when a request is not well-formed, syntactically incorrect, empty required parameters or any unknown parameter is passed.|
| **403** <br> <span class = "error">`Forbidden`</span> | Authorization failed due to insufficient permissions. This occurs when user does not have enough access rights to perform this action. Access for each user can be controlled by an Administrator using eRS Cloud Application.|
|  **404** <br><span class = "error">`Not Found`</span> |This status code indicates that project or notes does not exist| 


### Delete a note

>` DELETE  v1/projects/{ID}/notes/{Note_ID}`

Permanently deletes a Note. It cannot be undone.You need to  provide the unique project identifier that was returned upon project creation and unique note identifier that was returend upon notes creation.

> Example Request

```shell

curl -v -X DELETE "https://app.eresourcescheduler.cloud/rest/v1/projects/8/notes/5"\
  -H "Authorization: Bearer B8x5Vj1O65r6wnoV"
```

### Returns

| Code      | Description  
| ---:        |    :----   
| **200** <br><span class = "success">`OK`</span> |This status code indicates that the operation was successful and a note get deleted successfully |
| **403** <br> <span class = "error">`Forbidden`</span> | Authorization failed due to insufficient permissions. This occurs when user does not have enough access rights to perform this action. Access for each user can be controlled by an Administrator using eRS Cloud Application.|
|  **404** <br><span class = "error">`Not Found`</span> |This status code indicates that project or notes does not exist| 

