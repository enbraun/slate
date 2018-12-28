# Project

## Project object
>Example Response  

```json
  {
    "id": 2,
    "modified_on": "2016-10-04T07:43:26.479769Z",
    "project_start_date": "2016-01-01",
    "type": {
        "name": "Medical",
        "description": null,
        "id": 101
    },
    "title": "Armenia",
    "end_date": "2019-12-31",
    "tags":[
        "Seattle"
    ],
    "created_on": "2015-12-23T16:30:52.246248Z",
    "modified_by": {
        "name": "Testing User",
        "id": 3
    },
    "image": "/img/null",
    "email": "ujjwal.pareek@enbraun.com",
    "created_by": {
        "name": "Testing User",
        "id": 3
    },
    "is_archive": false,
    "weblink": "https://www.abho.in" <- User defined field
  }
```
Creates a new project object.


<span style="color:#b93d6a">`Project`</span> object contains all the information about the project. The API allows you to create, delete, and update project. You can retrieve individual project as well as list of projects.

<span class="optional"><b>ATTRIBUTES</b></span>

Name         |  Description
 ---:        |    :---- 
**id** <br><span class="optional">`integer`</span>     |  eRS Cloud-generated unique identifier for the project object. 
**modified_on** <br><span class="optional">`string`</span> | Describes the latest modification date.
**project_start_date** <br><span class="optional">`string`</span> |  The date on which project will be started.
**type** <br><span class="optional">`object`</span> | It describes the type of project.
**title** <br><span class="optional">`string`</span> | The title of the project.
**end_date** <br><span class="optional">`string`</span> | The date on which project will be ended.
**tags** <br><span class="optional">`array of strings`</span> |Tags are the list of strings that could be used to organize the project.
**created_on** <br><span class="optional">`string`</span> |   Time at which the project object is created.
**modified_by** <br><span class="optional">`object`</span> | This field describes  whom the modification is done by.
**image** <br><span class="optional">`string`</span> | The  image or display picture of the project.
**email** <br><span class="optional">`string`</span> |  For Example this field is used to save email address of the project's manager.
**created_by** <br> <span class="optional">`object`</span> | This field describes whom project object is created by .|
**User defined fields** <br><span class="optional">`optional`</span>  | Custom user-defined fields used to capture additional information of project. <a href="#user-defined-fields" class="api-ref">Learn more</a>

## Create a project



>  `POST v1/projects`


> Example Request:

```shell
 curl -v -X GET \
 "https://app.eresourcescheduler.cloud/rest/v1/projects" \
  -H "Authorization: Bearer B8x5Vj1O65r6wnoV" \
  -H "Content-Type: application/json" \
  -d  '{ "title": "5 Faroe Islands", 
        "project_start_date: "2016-05-02", 
        "project_type_id": 1 , 
        "weblink": "https://www.abho.in" }' 
	  
```   
<span class="optional"><b>REQUEST BODY PARAMETERS</b></span>


Name               |  Description
 ---:        |    :----   
**title** <br> <span class="required">`required`</span>  |The title is a string which represents the  title of a project. It is a required field. This may be up to 100 characters. This will throw an error if you post an empty value.
**image_uuid**  <br><span class="optional">`optional`</span> | Project's image is an optional field. This field accepts the Base64 encoded PNG string.This will be blank if you POST an empty value.
**project_type_id** <br> <span class="required">`required`</span>| Project_type_id represents the id of project type. Let’s assume there are two types of project - Medical and Education. Project_type_id of Medical is 1 and project_type_id of Education is 2, then while creating a new project, all the projects whose project_type_id is given as 1 will get created under Medical type and same for Education when project_type_id is 2. It is a required field.
**project_start_date**<br><span class="optional">`optional`</span> |The date on which project has started. 
**tags**  <br><span class="optional">`optional`</span>  | Tags is an optional filed. It’s displayed alongside the project in your list and can be useful for searching and filtering. This may be up to 50 characters. This will be blank if you post an empty value.
**email** <br><span class="optional">`optional`</span>  |  This field is used to display email address of project's manager(for example)  .The maximum length of this field may be up to 254 characters. This will be blank if you POST an empty value.
**User defined fields** <br><span class="optional">`optional`</span>  | A user with admin rights can add such custom fields. These fields can be used to capture additional info in project. Different types of projects may have a different set of user-defined fields. The value for user defined field can be passed as shown in example request. Here in given example, <span style="color:#db7708">`weblink`</span> is a user defined field. <a href="#user-defined-fields" class="api-ref">Learn more</a>




### Returns
 
| Code      |Description |
 :---        |    :----   |
| **201** <br><span class = "success">`Created`</span> | This status code indicates that the operation was successful and  a project get created successfully.|
| **400** <br> <span class = "error">`Bad Request`</span> | Bad Request error occurs when a request is malformed, syntactically incorrect, missing required parameters are  or any unknown parameter is passed.|
| **403** <br> <span class = "error">`Forbidden`</span> |Authorization failed due to insufficient permissions. This occurs when user does not have enough access rights to perform this action. Access for each user can be controlled by an Administrator using eRS Cloud Application.|



## List projects


Returns a list of projects. The projects are returned sorted by title and project id. 
	

>  `GET v1/projects`


> Example Request

```shell
curl "https://app.eresourcescheduler.cloud/rest/v1/projects" \
  -H "Authorization: Bearer B8x5Vj1O65r6wnoV"
```
>Example Request With Offset And Limit 

 ```shell 
curl "https://app.eresourcescheduler.cloud/rest/v1/projects?offset=1&limit=1" \
 -H "Authorization: Bearer B8x5Vj1O65r6wnoV"
```
> Example Response

```json
{
	"offset": 0,
	"total_count": 50,
	"limit": 25,
	"data": [
      {
	      "end_date": null,
        "title": "eRS - Development",
        "type": {
          "name": "Medical",
          "description": null,
          "id": 101
         },
        "id": 1,
        "email": "ujjwal.pareek@enbraun.com",
        "project_start_date": null,
        "modified_on": null,
        "image": "/img/null",
          "created_by": {
          "name": "Testing User",
          "id": -99
        },
        "tags": [],
        "created_on": "2015-11-28T09:57:58.835938Z",
        "min_cost": null,
        "is_archive": false,
        "modified_by": null,
        "weblink": "https://www.eresourcescheduler.com",<- User-defined field.
	    },
	    {...},
	    {...},
	    {...}
   ]
}
```

<span class="optional"><b>REQUEST QUERY PARAMETERS</b></span>

|Name|Description|
|-:|:-|
|**limit**<br><span class="optional">`optional`</span>|The limit keyword is used to limit the number of rows returned from a result set.<br>*The default value of `limit` is*  <span class="error">*`25`*</span><br>*Maximum value of limit can be* <span class="error">*`500.`*</span> *If value of limit is more than*<span class="error">*`500`*</span>  *then it will get set to maximum value of limit which is* <span class="error">*`500.`*</span> |
|**offset**<br><span class="optional">`optional`</span>|The Offset value allows you to specify the ranking number of the first item on the page.The Offset value is also most often used together with the Limit keyword..<br>*The default value of `offset` is* <span class="error">*`0`* </span>|


### Returns 


| Code      | Description | 
| ---:        |    :----   | 
| **200** <br> <span class = "success">`OK`</span>      |  This indicates that the operation was successful and returned list of projects.  |
**400** <br> <span class = "error">`Bad Request` </span>| Bad Request may occur when offset and limit value is negative integer.
| **403** <br> <span class = "error">`Forbidden`</span> |Authorization failed due to insufficient permissions. This occurs when user does not have enough access rights to perform this action. Access for each user can be controlled by an Administrator using eRS Cloud Application.|

## Retrieve a project


>  `GET v1/projects/{ID}`

> Example Request

```shell
curl -v -X GET \
"https://app.eresourcescheduler.cloud/rest/v1/projects/1"\
  -H "Authorization: Bearer B8x5Vj1O65r6wnoV"
```

> Example Response

```json
  {
  "modified_on": "2018-10-29T13:10:06.993223Z",
  "end_date": "2017-03-15",
  "color": "#8f9499;0",
  "title": "eRS - Development",
  "type": {
    "name": "Standard",
    "description": null,
    "id": 1
  },
  "created_by": {
    "name": "Testing User",
    "id": 12
  },
  "tags": [],
  "created_on": "2018-10-04T10:43:43.36441Z",
  "is_archive": false,
  "modified_by": {
    "name": "Testing User",
    "id": 12
  },
  "id": 1,
  "image_uuid": "/img/4b4eb176-aec9-471a-8e19-02c603f7d31b",
  "email": "ujjwal.pareek@enbraun.com",
  "project_start_date": "2016-01-01",
}

```

Retrieves the details of an existing project. You only need to provide the unique project identifier that was returned upon project creation.


### Returns

| Code      | Description | 
| ---:        |    :----   | 
| **200** <br> <span class = "success">`OK`</span>     | This status code indicates that the operation was successful and a project  get retrieved successfully .  |
| **403** <br> <span class = "error">`Forbidden`</span> |Authorization failed due to insufficient permissions. This occurs when user does not have enough access rights to perform this action. Access for each user can be controlled by an Administrator using eRS Cloud Application.|
| **404** <br> <span class = "error">`Not Found`</span> | Not Found error occurs when requested project does not exist (i.e. There is no project with given id). This may also occur when requesting a project which has been deleted. |

## Search projects
>  `POST v1/projects/search`

Filtering API responses to retrieve specific data.


> Example Request For Filter In JSON Format

```shell
curl -v -X POST \
 "https://app.eresourcescheduler.cloud/rest/v1/projects/search" \
-H "Content-Type: application/json" \
-H "Authorization: Bearer B8x5Vj1O65r6wnoV" \
-d '{ 
      "project_type_id:eq": 1 
    }'
```
The filter parameter allows for filtering the results returned from the various endpoint in various ways. For example fetching only projects having project type id 1 by adding project_type_id:eq=1 to your query. <a href="#filters" class="api-ref">Read more</a>

> Example Request For Filter By Passing Multiple Rules In JSON Format

```shell
curl -v -X POST \
"https://app.eresourcescheduler.cloud/rest/v1/resources/search" \
-H "Content-Type: application/json" \
-H "Authorization: Bearer B8x5Vj1O65r6wnoV" \
-d '{ 
      "project_type_id:eq": 1, 
      "project_start_date:gt": "2015-04-02" 
    }'
```
### Filters for System-defined fields

 **Field Type**| **Operators** | **Example** |
 :--|:--| :----- |
**project_type_id**|<li>eq *(default)*</li><li>any</li>|-d "project_type_id":1 <br> -d "project_type_id:any":1
**email**|<li>has *(default)* </li><li>eq</li>| -d "email":"abc" <br> -d "email:eq":"ujjwal@gmail.com"
**project_start_date**|<li>eq *(default)* </li><li>lt </li><li>  gt </li><li> bt </li><br><li> ex</li> |-d "project_start_date:eq":"2015-02-02"<br>-d "project_start_date:lt":"2015-02-02"<br>-d "project_start_date:gt":"2015-02-02"<br> -d "project_start_date:bt":["2015-02-02","2015-04-05"] <br> -d "project_start_date:ex":["2015-02-02","2015-04-04"]
**end_date**|<li>eq *(default)* </li><li>lt </li><li>  gt </li><li> bt </li><br><li> ex</li>|-d "end_date:eq":"2015-02-02"<br>-d "end_date:lt":"2015-02-02"<br>-d "end_date:gt":"2015-02-02"<br> -d "end_date:bt":["2015-02-02","2015-04-05"] <br> -d "end_date:ex":["2015-02-02","2015-04-04"]
**tags**|<li>any *(default)* </li><li>all</li>|-d "tags":"1&#124;2&#124;3" <br> -d "tags:all":"4&#124;6"
**is_archive**| N/A | -d "is_archive":true <br> -d "is_archive":false
 _For User-defined fields please <a href="#filters-for-user-defined-fields" class="api-ref">check here</a>._ 

## Update a project

Updates the specified project by setting the values of the parameters passed. Any parameters not provided will be left unchanged. 

This request accepts mostly the same arguments as the project creation call.

>  `PUT v1/projects/{ID}`

> Example Request

```shell 
curl -v -X PUT \
"https://app.eresourcescheduler.cloud/rest/v1/projects/1" \
  -H "Authorization: Bearer B8x5Vj1O65r6wnoV" \
  -H "Content-Type: application/json" \
  -d '{"title": "Angola"}' 
```


<span class="optional"><b>REQUEST BODY PARAMETERS</b></span>



Name               |  Description
 ---:        |    :----   
**title** <br> <span class="required">`required`</span>  |The title is a string which represents the  title of a project. It is a required field. This may be up to 100 characters. This will throw an error if you post an empty value.
**image_uuid**  <br><span class="optional">`optional`</span> | Project's image is an optional field. This field accepts the Base64 encoded PNG string.This will be blank if you POST an empty value.
**project_start_date**<br><span class="required">`optional`</span> |The date on which project has started. 
**tags**  <br><span class="optional">`optional`</span>  | Tags is an optional filed. It’s displayed alongside the project in your list and can be useful for searching and filtering. This may be up to 50 characters. This will be blank if you post an empty value.
**email** <br><span class="optional">`optional`</span>  |  This field is used to display email address of project manager(for example)  .The maximum length of this field may be up to 254 characters. This will be blank if you POST an empty value.
**User defined fields** <br><span class="optional">`optional`</span>  | A user with admin rights can add such custom fields. These fields can be used to capture additional info in project. Different types of projects may have a different set of user-defined fields. <a href="#user-defined-fields" class="api-ref">Learn more</a>


### Returns

| Code      | Description | 
| ---:        |    :----   | 
| **200** <br> <span class = "success">`OK`</span>    |  This indicates that the operation was successful and project get updated successfully.|
| **400** <br> <span class = "error">`Bad Request`</span> | Bad Request occurs when a request is not well-formed, syntactically incorrect, empty required parameters or any unknown parameter is passed. <br> Additionally, Bad request may also occur when :<ul><li>User tries to update archived project.</li><li> User tries to update start date which is after last date.</li><li> User tries to update last date which is before start date. </li></ul> |
| **403** <br> <span class = "error">`Forbidden`</span> | Authorization failed due to insufficient permissions. This occurs when user does not have enough access rights to perform this action. Access for each user can be controlled by an Administrator using eRS Cloud Application.|
|  **404** <br><span class = "error">`Not Found`</span> |This status code indicates that project does not exist| |


## Delete a project
 Permanently deletes a project. It cannot be undone. By default, this operation will get failed if a project has any booking associated with it. To override this behaviour, forcefull delete can be used which will delete all bookings and then ultimately delete the project object.

> `DELETE v1/projects/{ID}`


> Example Request
 
```shell
curl -v -X DELETE "https://app.eresourcescheduler.cloud/rest/v1/projects/1" \
  -H "Authorization: Bearer B8x5Vj1O65r6wnoV"
```

> Example Request For Forcefull Delete 
 
```shell
curl -v -X DELETE \
"https://app.eresourcescheduler.cloud/rest/v1/rpojects/1?force_delete_bookings=true" 
-H "Authorization: Bearer B8x5Vj1O65r6wnoV" 
```

### Returns


| Code      | Description  
| ---:        |    :----   
| **200** <br><span class = "success">`OK`</span> |This status code indicates that the operation was successful and a project get deleted successfully |
| **409** <br> <span class = "error">`Conflict`</span> |Conflict indicates that the project can not be deleted as there are bookings associated with this project. If you wish to delete it any way you must use force delete option by passing <span class = "error">`true`</span> for parameter <span class = "error">`force_delete_bookings`</span>. This operation deletes all bookings of requested project and project itself. This can not be undone. Example shown <span style="font-size:24px; font-weight:bold;">￼&#x1f449;</span>|
| **403** <br> <span class = "error">`Forbidden`</span> | Authorization failed due to insufficient permissions. This occurs when user does not have enough access rights to perform this action. Access for each user can be controlled by an Administrator using eRS Cloud Application.|
|  **404** <br><span class = "error">`Not Found`</span> |This status code indicates that project does not exist| |

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
**start_time** <br> <span class="optional">`String`</span> | Start time describes the start time of task.  
**end_time** <br> <span class="optional">`String`</span>| End time describes the end time of task. 
**project_id** <br> <span class ="optional">`Integer`</span> | eRS Cloud generated unique identifier for the project object.


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
**start_time** <br> <span class="optional">`optional`</span> | Start time describes the start time of task. This filed can be passed null, as eRS Cloud provids you the facility to create an task without start time. This field is a `String` type of field.  
**end_time** <br> <span class="optional">`optional`</span>| End time describes the end time of task. This filed can be passed null,as eRS Cloud provides you the facility to create an task without end time.This field is a `String` type of field.

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
**start_time** <br> <span class="optional">`optional`</span> | Start time describes the start time of task. This filed can be passed null, as eRS Cloud provids you the facility to create an task without start time. This field is a `String` type of field.  
**end_time** <br> <span class="optional">`optional`</span>| End time describes the end time of task. This filed can be passed null,as eRS Cloud provides you the facility to create an task without end time.This field is a `String` type of field.

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
|**limit**<br><span class="optional">`optional`</span>|The limit keyword is used to limit the number of notes returned from a result set.<br>*The default value of `limit` is*  <span class="error">*`25`*</span><br>*Maximum value of limit can be* <span class="error">*`100.`*</span> *If value of Limit is more than*<span class="error">*`100`*</span>  *then it will get set Maximum value of limit which is* <span class="error">*`100.`*</span> 
|**offset**<br><span class="optional">`optional`</span>|The Offset value allows you to specify the ranking number of the first item on the page .The Offset value is most often used together with the Limit keyword.<br>*The default value of `offset` is* <span class="error">*`0`* </span>|


### Ordering the notes

<span class="optional"><b>REQUEST QUERY PARAMETERS</b></span>

|Name|Options|Description|
|-:|:-:|:-
|**Order_by**<br><span class="optional">`optional`</span>|<li>created_on *(Default)*</li>|List of notes will be returned and sorted by it's created date.|
| |<li>modified_on</li> |List of notes will be returned and sorted by it's latest modified date|

<span class="optional"><b>ATTRIBUTES</b></span>

Name         |  Description
 ---:        |    :----   
 **id**<br> <span class="optional">`integer`</span> | eRS Cloud generated unique identifier for the notes. |
 **created_on** <br><span class="optional">`string`</span> | Time at which the notes object is created. |
 **content** <br> <span class="optional">`string`</span> | Text written inside notes body .|
 **modified_on** <br><span class="optional">`string`</span> | Describes the latest modification date.|
 **created_by** <br> <span class="optional">`object`</span> | This field describes by whom notes is created .|
 **modified_by** <br><span class="optional">`object`</span> | This field describes by whom the modification is done.

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

