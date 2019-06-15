# Resource

## Resource object

>Example Response  

```json
{
    "id": 1,
    "first_name": "Andrew",
    "last_name": "Mooney",
    "name": "Andrew Mooney",
    "type": {
        "name": "Employee",
        "description": null,
        "id": 1,
        "is_human": true
    },
    "email": "andrew@enbraun.com",
    "start_date": "2018-01-01",
    "last_date": null,
    "image": "https://erscloud/img/7aca31f5-29ae205ba315",
    "phone": null,
    "roles": [{
        "name": "Quality Engineer",
        "description": null,
        "id": 3
    }, {
        "name": "Business Analyst",
        "description": null,
        "id": 1
    }],
    "tags": [],
    "created_on": "2018-08-20T09:22:02.728296Z",
    "created_by": {
        "name": "Rahul Sharma",
        "id": 118
    },
    "modified_on": "2018-11-20T11:55:48.880898Z",
    "modified_by": {
        "name": "Rahul Sharma",
        "id": 118
    },
    "udf_qualifications": [{
        "name": "B.Tech Computers",
        "description": null,
        "id": 15
    }, {
        "name": "PMP",
        "description": null,
        "id": 13
    }],
    "udf_employee_no": "ABC0001",
    "udf_office": {
        "name": "New York",
        "description": null,
        "id": 10
    },
    "udf_department": {
        "name": "Technical",
        "description": null,
        "id": 26
    }
}
```

<span style="color:#b93d6a">`Resource`</span> object represent resources (human / non-human) in your organization (i.e. Employees , Machines etc. ) which you want to schedule. Resources could be of multiple types with each type having its own custom attributes along with system defined attributes. The API allows you to list, search, create, delete, and update resources.

<span class="optional"><b>ATTRIBUTES</b></span>

Name         |  Description
 ---:        |    :---- 
**id** <br>`integer` | Auto generated unique identifier for resource object.
**first_name** <br>`string` | First name of resource.
**last_name** <br>`string` | Last name of resource.
**type** <br>`object` | Describes the type of resource. This is one of the type objects which an admin user creates using eRS Cloud Application.
**email** <br>`string` | Email address of resource object.
**start_date** <br>`string` | Represents the first working day of resource in organization. Resource does not have any availability before this date.
**last_date** <br>`string` | Represents the last working day of resource in organization. After this date, resource is considered archived and has no availability beyond this date.
**image** <br>`string`| String value representing URL of image file of resource.
**phone** <br>`string` | Phone number of the resource object.
**roles** <br>`array of objects` | List of role objects applied on this resource.
**tags** <br>`array of strings` | Tags are the list of strings (labels) attached to this resource object which could be used for the purpose of filtering, identification or other information.
**created_on** <br>`string` | Timestamp at which this resource object was created.
**created_by** <br> `object` | Object representing user who created this resource object.
**modified_on** <br>`string` | Represents latest modification timestamp.
**modified_by** <br>`object` | Object representing most recent user who modified this resource object.
**udf_\*** | Custom user-defined fields used to capture additional information of resource. User defined field can be of multiple types. Custom fields are very useful to configure resource objects to best fit requirements.  In given example response, all keys starting with prefix `udf_` are user defined custom fields. <a href ="#user-defined-fields" class="api-ref">Learn more</a>



## Create a resource

Creates a new resource object.
    
> **`POST /v1/resources`**

> Example Request for human type of resource:

```shell
 curl -v -X POST "https://app.eresourcescheduler.cloud/rest/v1/resources" \
 -H "Authorization: Bearer B8x5Vj1O65r6wnoV" \
 -H "Content-Type: application/json" \
 -d '{ 
       "first_name": "Andrew",
       "last_name": "Mooney",
       "resource_type_id": 1,
       "start_date": "2016-05-02",
       "email": "andrew@enbraun.com",
       "roles" : [1,3],
       "udf_employee_no": "ABC0001"
     }'
```

> Example Request for non-human resource:

```shell
 curl -v -X POST "https://app.eresourcescheduler.cloud/rest/v1/resources" \
 -H "Authorization: Bearer B8x5Vj1O65r6wnoV" \
 -H "Content-Type: application/json" \
 -d '{  
       "name": "Projector EX4300",
       "start_date": "2018-06-01",
       "resource_type_id": 2,
       "udf_battery_capacity": 4 
     }'
```

<span class="optional"><b>REQUEST BODY PARAMETERS</b></span>


Name         |  Description
 ---:        |    :----   
**resource_type_id** <br> <span class="required">`required`</span> | Id of <a href = "#resource-type" class ="api-ref">resource-type</a> object. Every resource must be linked to a <a href = "#resource-type" class ="api-ref">resource-type</a>. Let’s assume there are two resource types defined as Employee (_having id 1_) and Meeting Room (_having id 2_). While creating a new resource, all the resource whose `resource_type_id` is given as **1** will get created under Employee type and same for Meeting Room when `resource_type_id` is **2**.
**first_name** <br> <span class="required">`required`</span>  | String representing the first name of a resource. This may be up to 100 characters.<br> _**Note** : for non-human resources, this field is <span class="danger">not available</span>_.
**last_name** <br> `optional`  | String representing the last name of a resource. This may be up to 100 characters.<br> _**Note** : for non-human resources, this field is <span class="danger">not available</span>_.
**name** <br> <span class="required">`required`</span> | String representing the name of a resource. This may be up to 100 characters.<br> _**Note** : This field is only available for non-human resources and for human resources, this field is <span class="danger">not available</span>_.
**start_date**<br><span class="required">`required`</span>  |  String value representing a date in ISO 8601 extended notation for date i.e. yyyy-MM-dd. A resource is only available from its start date i.e system does not consider any capacity of resource before this date.
**last_date**<br>`optional` |  String value representing a date in ISO 8601 extended notation for date i.e. yyyy-MM-dd. A resource is only available till its last date i.e system does not consider any capacity of resource beyond this date (_if defined_).
**email**<br>`optional` |  String value representing email address of resource object. Email address must be properly formatted with a maximum length of 254 characters.
**phone**<br>`optional` | String representing phone number of resource. It’s displayed alongside the resource in your resource list.
**roles**<br>`optional` | An array of ids of Roles (which are defined by an admin user in eRS Cloud Application) to be assigned to this Resource. The first id in the array is considered as Primary Role of that Resource. Multiple performing roles can be applied to a resource. Resources can also be searched / filtered using performing roles.
**calendar**  <br>`optional` | Id of Calendar object which should be assigned to resource effective from its start date. Depending upon requirements, different calendars can be applied on different resources. If calendar is omitted then default calendar (as defined in admin settings) will get applied for this resource.
**tags**  <br>`optional` | An optional array of strings which could be attached to this resource object as labels. This can be useful for the purpose of filtering, identification or other information.
**udf_\*** <br>`optional` | A user with admin rights can add custom fields. These fields can be used to capture additional information in Resources. Different types of resources may have a different set of user-defined fields. The value for user defined field can be passed as shown in example request. In first example **_udf_employee_no_** is a user defined field. <a href ="#user-defined-fields" class="api-ref">Learn more</a>

### Returns
 
| Code      | Description |
| :---      |    :----    |
**201** <br><span class = "success">`Created`</span> | Indicates that the operation was successful and a resource get created successfully.
**400** <br> <span class = "error">`Bad Request`</span> | Bad Request error occurs when a request is  malformed, syntactically incorrect, missing required parameters or has any unknown parameter. Additionally, Bad request may also occur in one of these conditions :<ul><li>Resource's start date is after its end date.</li><li>Trying to create resources more than subscribed no of resources.</li></ul> 
**403** <br> <span class = "error">`Forbidden`</span> |Authorization failed due to insufficient permissions. This occurs when user does not have enough access rights to perform this action. Access for each user can be controlled by an Administrator using eRS Cloud Application.


## List resources

Returns a list of resources. The resources are returned sorted by name. 
	

>  **`GET /v1/resources`**


> Example Request

```shell
curl -v \
"https://app.eresourcescheduler.cloud/rest/v1/resources" \
-H "Authorization: Bearer B8x5Vj1O65r6wnoV"
```

>Example Request With Offset And Limit 

```shell 
curl -v \
"https://app.eresourcescheduler.cloud/rest/v1/resources?offset=1&limit=15" \
-H "Authorization: Bearer B8x5Vj1O65r6wnoV"
```


> Example Response

```json
{
  "total_count": 120,
  "offset": 1,
  "limit": 15,
  "data": [{
      "id": 1,
      "first_name": "Andrew",
      "last_name": "Mooney",
      "name": "Andrew Mooney",
      "type": {
        "name": "Employee",
        "description": null,
        "id": 1,
        "is_human": true
      },
      "email": "andrew@enbraun.com",
      "start_date": "2018-01-01",
      "last_date": null,
      "image": "https://erscloud/img/7aca31f5-29ae205ba315",
      "phone": null,
      "roles": [{
        "name": "Quality Engineer",
        "description": null,
        "id": 3
      }, {
        "name": "Business Analyst",
        "description": null,
        "id": 1
      }],
      "tags": [],
      "created_on": "2018-08-20T09:22:02.728296Z",
      "created_by": {
        "name": "Rahul Sharma",
        "id": 118
      },
      "modified_on": "2018-11-20T11:55:48.880898Z",
      "modified_by": {
        "name": "Rahul Sharma",
        "id": 118
      },
      "udf_qualifications": [{
        "name": "B.Tech Computers",
        "description": null,
        "id": 15
      }, {
        "name": "PMP",
        "description": null,
        "id": 13
      }],
      "udf_employee_no": "ABC0001",
      "udf_office": {
        "name": "New York",
        "description": null,
        "id": 10
      },
      "udf_department": {
        "name": "Technical",
        "description": null,
        "id": 26
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
**200** <br> <span class = "success">`OK`</span>  | Indicates that the operation was successful and  list of resources is returned. 
**400** <br> <span class = "error">`Bad Request` </span> | Bad Request may occur when offset and limit value is negative integer.
**403** <br> <span class = "error">`Forbidden`</span> | Authorization failed due to insufficient permissions. This occurs when user does not have enough access rights to perform this action. Access for each user can be controlled by an Administrator using eRS Cloud Application.


## Retrieve a resource 

> **`GET /v1/resources/{ID}`**

> Example Request

```shell
curl -v "https://app.eresourcescheduler.cloud/rest/v1/resources/1" \
-H "Authorization: Bearer B8x5Vj1O65r6wnoV"
```

> Example Response

```json
{
    "id": 1,
    "first_name": "Andrew",
    "last_name": "Mooney",
    "name": "Andrew Mooney",
    "type": {
        "name": "Employee",
        "description": null,
        "id": 1,
        "is_human": true
    },
    "email": "andrew@enbraun.com",
    "start_date": "2018-01-01",
    "last_date": null,
    "image": "https://erscloud/img/7aca31f5-29ae205ba315",
    "phone": null,
    "roles": [{
        "name": "Quality Engineer",
        "description": null,
        "id": 3
    }, {
        "name": "Business Analyst",
        "description": null,
        "id": 1
    }],
    "tags": [],
    "created_on": "2018-08-20T09:22:02.728296Z",
    "created_by": {
        "name": "Rahul Sharma",
        "id": 118
    },
    "modified_on": "2018-11-20T11:55:48.880898Z",
    "modified_by": {
        "name": "Rahul Sharma",
        "id": 118
    },
    "udf_qualifications": [{
        "name": "B.Tech Computers",
        "description": null,
        "id": 15
    }, {
        "name": "PMP",
        "description": null,
        "id": 13
    }],
    "udf_employee_no": "ABC0001",
    "udf_office": {
        "name": "New York",
        "description": null,
        "id": 10
    },
    "udf_department": {
        "name": "Technical",
        "description": null,
        "id": 26
    }
}
```


Retrieves the details of an existing resource. You only need to provide the unique resource identifier that was returned upon resource creation as request parameter .

### Returns

| Code      | Description | 
| ---:      |    :----    | 
**200** <br> <span class = "success">`OK`</span> | Indicates that the operation was successful and a resource is retrieved successfully .
**403** <br> <span class = "error">`Forbidden`</span> | Authorization failed due to insufficient permissions. This occurs when user does not have enough access rights to perform this action. Access for each user can be controlled by an Administrator using eRS Cloud Application.
**404** <br> <span class = "error">`Not Found`</span> | Not Found error occurs when requested resource does not exist (i.e. There is no resource with given id). This may also occur when requesting a resource which has been deleted.

## Search resources

> **`POST /v1/resources/search`**

> Example Request For Filter In JSON Format

```shell
curl -X POST \
"https://app.eresourcescheduler.cloud/rest/v1/resources/search" \
-H "Content-Type: application/json" \
-H "Authorization: Bearer B8x5Vj1O65r6wnoV" \
-d '{ 
      "resource_type_id:eq": 1  
    }'
```

> Example Request For Filter By Passing Multiple Rules In JSON Format

```shell
curl -X POST \
"https://app.eresourcescheduler.cloud/rest/v1/resources/search" \
-H "Content-Type: application/json" \
-H "Authorization: Bearer B8x5Vj1O65r6wnoV" \
-d '{ 
      "resource_type_id:eq": 1 , 
      "roles:all": [3,6] 
    }'
```

Search Resource API allows filtering the results returned in various ways. This enables a great power to find out what is needed. eRS Cloud API also allows filtering on custom defined fields with multiple operators and conditions to cover up complex scenarios for searching.

A filter condition consists of three components which are **_field_**, **_operator_** and **_value_**. For example, fetching only those resources having resource type id 1, could be achieved by adding resource_type_id:eq=1 to your query. If operator is not supplied, it takes default operator for field.

Below is a list of available fields, which allow filtering resources:


|**Field Code**| **Operator**  | **Example**|
|:--|:---|:--|
**resource_type_id**|<li>**eq** (_default_)  </li><li>any</li>| `"resource_type_id:eq": 1`<br>`"resource_type_id:any": [1,2]`
**name**|<li class="nowrap">**has** (_default_)&nbsp;&nbsp;</li><li>eq</li>|`"name:has": "c"`<br>`"name:eq": "Amy Jones"`
**roles**| <li>**any** (_default_)</li><li>all</li>|`"roles:any": [2,5]`<br>`"roles:all": [4,6]`
**tags**|<li>**any** (_default_)</li><li>all</li>| `"tags:any": ["tagA","tagB"]`<br>`"tags:all": ["tagA","tagB"]`</li>
**email**|<li>**has** (_default_)</li><li>eq</li>| `"email:has": "a"`<br>`"email:eq": "abc@mycompany.com"`
**phone**|<li>**has** (_default_)</li><li>eq</li>|`"phone:has": "753" `<br> `"phone:eq": "(485)555-0202"`
**start_Date**|<li>**eq** (_default_)</li><li>lt</li><li>gt</li><li> bt</li><li>ex</li>| `"start_date:eq": "2016-01-27"`<br>` "start_date:lt": "1999-12-22"`<br>` "start_date:gt": "1990-01-11"`<br>`"start_date:bt": ["2001-01-01", "2010-12-31"]`<br> `"start_date:ex": ["1992-02-12", "1997-01-27"]`
**last_date**|<li>**eq** (_default_)</li><li>lt</li><li>gt</li><li> bt</li><li>ex</li>| `"last_date:eq": "2016-05-17"` <br> `"last_date:lt": "2002-12-31"`<br>` "last_date:gt": "2010-01-01"` <br> `"last_date:bt": ["1995-12-31", "1999-01-01"]`<br> `"last_date:ex": ["2001-01-01", "2002-01-01"]`
 _For filtering using custom fields and operators please <a href="#filters-for-user-defined-fields" class="api-ref">check here</a>._ 

## Update a resource 

Updates specified resource by setting the values of the parameters passed. Any parameter which is not provided remains unchanged. To unset existing value for a parameter, just pass an empty value i.e. `null` or `undefined`.

This request accepts mostly the same arguments as `Create Resource` API.

>  **`PUT /v1/resources/{ID}`**

> Example Request

```shell 
curl -v -X PUT \
"https://app.eresourcescheduler.cloud/rest/v1/resources/1" \
-H "Authorization: Bearer B8x5Vj1O65r6wnoV" \
-H "Content-Type: application/json" \
-d '{ 
      "email": "andrew@enbraun.com",
      "roles" : [3,2],
      "udf_employee_no": "ABC0003"
    }'
```

<span class="optional"><b>REQUEST BODY PARAMETERS</b></span>

|Name     |  Description |
| ---:    |    :----     |
**first_name** <br> <span class="required">`required`</span>  | String representing the first name of a resource. This may be up to 100 characters.<br> _**Note** : for non-human resources, this field is <span class="danger">not available</span>_.
**last_name** <br> `optional`  | String representing the last name of a resource. This may be up to 100 characters.<br> _**Note** : for non-human resources, this field is <span class="danger">not available</span>_.
**name** <br> <span class="required">`required`</span> | String representing the name of a resource. This may be up to 100 characters.<br> _**Note** : This field is only available for non-human resources and for human resources, this is <span class="danger">not available</span>_.
**start_date**<br><span class="required">`required`</span>  |  String value representing a date in ISO 8601 extended notation for date i.e. yyyy-MM-dd. A resource is only available from its start date i.e system does not consider any capacity of resource before this date.
**last_date**<br>`optional` |  String value representing a date in ISO 8601 extended notation for date i.e. yyyy-MM-dd. A resource is only available till its last date i.e system does not consider any capacity of resource beyond this date (_if defined_).
**email**<br>`optional` |  String value representing email address of resource object. Email address must be properly formatted with a maximum length of 254 characters.
**phone**<br>`optional` | String representing phone number of resource. It’s displayed alongside the resource in your resource list.
**roles**<br>`optional` | An array of ids of Roles (which are defined by an admin user in eRS Cloud Application) to be assigned to this Resource. The first id in the array is considered as Primary Role of that Resource. Multiple performing roles can be applied to a resource. Resources can also be searched / filtered using performing roles.
**tags**  <br>`optional` | An optional array of strings which could be attached to this resource object as labels. This can be useful for the purpose of filtering, identification or other information.
**udf_\*** <br>`optional` | A user with admin rights can add custom fields. These fields can be used to capture additional information in Resources. Different types of resources may have a different set of user-defined fields. The value for user defined field can be passed as shown in example request. In first example **_udf_employee_no_** is a user defined field. <a href ="#user-defined-fields" class="api-ref">Learn more</a>

### Returns

| Code      | Description | 
| ---:      |    :----    | 
**200** <br> <span class = "success">`OK`</span> | Indicates that the operation was successful and requested resource is successfully updated.|
**400** <br> <span class = "error">`Bad Request`</span> | Bad Request occurs when a request is not well-formed, syntactically incorrect, empty required parameters or any unknown parameter is passed. <br> Additionally, Bad request may also occur in one of these conditions :<li>Trying to update an archived resource.</li><li>Trying to change start_date or last_date such that last_date gets smaller than start_date.</li><li>Trying to update start date and last date of a resource such that existing booking of that resource do not fit in given range.</li>
**403** <br> <span class = "error">`Forbidden`</span> | Authorization failed due to insufficient permissions. This occurs when user does not have enough access rights to perform this action. Access for each user can be controlled by an Administrator using eRS Cloud Application.
**404** <br> <span class = "error">`Not Found`</span> | Not Found error occurs when requested resource does not exist (i.e. There is no resource with given id). This may also occur when updating a resource which has been deleted.


## Delete a resource 

 Permanently deletes requested resource. It cannot be undone. By default, this operation will get failed if a resource has any booking or rate associated with it. To override this, forceful delete can be used which will delete all bookings and rates and then, ultimately delete the resource object.

> **`DELETE /v1/resources/{ID}`**


> Example Request
 
```shell
curl -v -X DELETE \
"https://app.eresourcescheduler.cloud/rest/v1/resources/1" \
-H "Authorization: Bearer B8x5Vj1O65r6wnoV"
```


> Example Request For Forceful Delete 
 
```shell
curl -v -X DELETE \
"https://app.eresourcescheduler.cloud/rest/v1/resources/1/?\
force_delete_bookings=true&force_delete_rates=true" \
-H "Authorization: Bearer B8x5Vj1O65r6wnoV" 
```

### Returns


| Code      | Description  
| ---:        |    :----   
**200** <br><span class = "success">`OK`</span> | This status code indicates that the operation was successful and a resource get deleted successfully.
**409** <br> <span class = "error">`Conflict`</span> | Conflict indicates that the resource can not be deleted as there are bookings or rates associated with this resource. If you wish to delete it anyway, you must use force delete option by passing `true` for parameter `force_delete_bookings` and `force_delete_rates` which will delete associated bookings and associated rates corresponding to the resource. This operation deletes all bookings and rates of requested resource and resource itself (shown in example request).
| **403** <br> <span class = "error">`Forbidden`</span> | Authorization failed due to insufficient permissions. This occurs when user does not have enough access rights to perform this action. Access for each user can be controlled by an Administrator using eRS Cloud Application.|
| **404** <br> <span class = "error">`Not Found`</span> | Not Found error occurs when requested resource does not exist.

## Timings

> Example Response 

```json
  {
         "id": 5,
         "name": "Part Time",
         "effective_date": "2018-11-15",
         "applied_on": "2018-11-03T15:06:15.454+05:30",
         "created_on": "2018-11-03T15:06:15.484913+05:30",
         "modified_on": null,
         "created_by": {
            "id": 2,
            "name": "Patrick Wilson"
         },
         "modified_by": {
            "id": null,
            "name": null
         },
         "timings": [
            {
               "day_num": 2,
               "start_time": 600,
               "end_time": 840
            }
          ] 
      
  }
```

To capture timings about a resource, eRS Cloud provides Timings. One resource may work in different timings as per his availability or requirement, for such situations Timings are beneficial.

Let say, If a resource works on a full-time profile but then for a certain time of period he switched his timings from full-time to part-time. Then for that certain period “Part Time” calendar will get applied along with its effective date. Timings are beneficial to apply multiple calendars on a resource. 

eRS Cloud API allows you to perform *`POST`*, *`GET`*, *`PUT`*, *`DELETE`* operations on Notes.

<span class="optional"><b>ATTRIBUTES</b></span>

Name         |  Description
 ---:        |    :----   
 **id**<br>`integer` | eRS Cloud-generated unique identifier for the calendar object. |
 **name**<br>`string` | This field describes name of calendar object. |
 **effective_date**<br> `string` | Effective date is the date on which the calendar will come into effect on applied resources.
 **applied_on**<br> `string` |This field describes when calendar is applied. 
 **created_on** <br>`string` |  Time at which the calendar object is created.
 **created_by** <br> `object` | This field describes by whom calendar object is created.|
 **modified_on** <br>`string` | Describes the latest modification date.
 **modified_by** <br>`object` | This field describes by whom the modification is done.
 **timings** <br>`array of strings` | Timings are list of days in which day_num is defined day(For example-0 for sunday,1 for monday) and start time and end time  are  defined start time and end time for a particular day respectively, also we can calculate no of working-hours on that day.|



### Retrieving the timings

> `GET v1/resources/{ID}/timings`

> Example Request

```shell
curl -v -X GET "https://app.eresourcescheduler.cloud/rest/v1/resources/12/timings"\
  -H "Authorization: Bearer B8x5Vj1O65r6wnoV"
```

> Example Response


```json
{
   "total_count": 2,
   "data": [
      {
         "id": 5,
         "name": "Part Time",
         "effective_date": "2018-11-15",
         "applied_on": "2018-11-03T15:06:15.454+05:30",
         "created_on": "2018-11-03T15:06:15.484913+05:30",
         "modified_on": null,
         "created_by": {
            "id": 2,
            "name": "Patrick Wilson"
         },
         "modified_by": {
            "id": null,
            "name": null
         },
         "timings": [
            {
               "day_num": 2,
               "start_time": 600,
               "end_time": 840
            },
            {...},
            {...}, 	            
          ]
      },
      {...},
      {...} 
   ]
}
```

Retrieves the details of timings which are applied to the resource. You only need to provide the unique resource identifier that was returned upon resource creation.


### Returns

| Code      | Description | 
| ---:        |    :----   | 
| **200** <br> <span class = "success">`OK`</span>     | This status code indicates that the operation was successful and timings  get retrieved successfully .  |
| **403** <br> <span class = "error">`Forbidden`</span> |Authorization failed due to insufficient permissions. This occurs when user does not have enough access rights to perform this action. Access for each user can be controlled by an Administrator using eRS Cloud Application.|
| **404** <br> <span class = "error">`Not Found`</span> | Not Found error occurs when requested resource does not exist (i.e. There is no resource with given id). This may also occur when requesting a resource which has been deleted. |

<br><br><br><br><br><br><br><br>
<br><br><br><br><br><br><br><br>

### Applying new timing (POST)

> `POST v1/resources/{ID}/timings`

> Example Request

```shell
curl -v -X POST "https://app.eresourcescheduler.cloud/rest/v1/resources/12/timings" \
  -H "Authorization: Bearer B8x5Vj1O65r6wnoV" \
  -H "Content-Type: application/json" \
  -d '{ 
 	    "applied_on": "2018-12-04T08:14:41.109Z", 
	    "calendar_id": "5", 
	    "effective_date": "2018-02-02" 
      }'
```

<span class="optional"><b>REQUEST BODY PARAMETERS</b></span>


Name         |  Description
 ---:        |    :----   
**applied_on**  <br><span class="required">`required`</span>| Applied_on Field describes when calendar is applied. It is a `DateTime` type of field. 
**calendar_id**  <br><span class="required">`required`</span>|As the name shows it is a calendar id which we have to pass. You will get this id at the time of calendar creation. This field accepts `Integer` only. 
**effective_date**  <br><span class="required">`required`</span>|Effective date is the date on which the calendar will come into effect on applied resources. This field accepts `Date` only.


### Returns
 
| Code      |Description |
 :---        |    :----   |
| **201** <br><span class = "success">`Created`</span> | This status code indicates that the operation was successful and timing get applied successfully.|
| **400** <br> <span class = "error">`Bad Request`</span> | Bad Request error occurs when a request is malformed, syntactically incorrect, missing required parameters are  or any unknown parameter is passed.  |
| **403** <br> <span class = "error">`Forbidden`</span> |Authorization failed due to insufficient permissions. This occurs when user does not have enough access rights to perform this action. Access for each user can be controlled by an Administrator using eRS Cloud Application.|
| **404** <br> <span class = "error">`Not Found`</span> | Not Found error occurs when requested resource does not exist.


### Update timings


> `PUT v1/resources/{ID}/timings/{Timing_ID}`

> Example Request

```shell
curl -v -PUT "https://app.eresourcescheduler.cloud/rest/v1/resources/12/timings/2" \
  -H "Authorization: Bearer B8x5Vj1O65r6wnoV" \
  -H "Content-Type: application/json" \
  -d '{ 
 	    "applied_on": "2018-12-04T08:14:41.109Z", 
	    "calendar_id": "5", 
	    "effective_date": "2018-02-02" 
      }' 
```



Updates the specified resource's calendar by setting the value of the parameter passed. You need to provide the unique resource identifier that was returned upon resource creation and unique timing identifier that was returend upon timing addition. If parameter is not provided then it will be left unchanged.

This request accepts mostly the same argument as the note creation call.


<span class="optional"><b>REQUEST BODY PARAMETERS</b></span>


Name         |  Description
 ---:        |    :----   
**applied_on**  <br><span class="required">`required`</span>| Applied_on Field describes when calendar is applied. It is a `DateTime` type of field. 
**calendar_id**  <br><span class="required">`required`</span>|As the name shows it is a calendar id which we have to pass. You will get this id at the time of calendar creation. This field accepts `Integer` only. 
**effective_date**  <br><span class="required">`required`</span>|Effective date is the date on which the calendar will come into effect on applied resources. This field accepts `Date`only.

### Returns

| Code      | Description | 
| ---:        |    :----   | 
| **200** <br> <span class = "success">`OK`</span>    |  This indicates that the operation was successful and a timing get updated successfully.|
| **400** <br> <span class = "error">`Bad Request`</span> | Bad Request occurs when a request is not well-formed, syntactically incorrect, empty required parameters or any unknown parameter is passed.|
| **403** <br> <span class = "error">`Forbidden`</span> |Authorization failed due to insufficient permissions. This occurs when user does not have enough access rights to perform this action. Access for each user can be controlled by an Administrator using eRS Cloud Application.|
| **404** <br> <span class = "error">`Not Found`</span> | Not Found error occurs when requested resource id or timing id does not exist.

### Delete timings


> `DELETE v1/resources/{ID}/timings/{Timing_ID}`

Permanently deletes a applied Calendar. It cannot be undone. You need to provide the unique resource identifier that was returned upon resource creation and unique timing identifier that was returend upon timing addition.


> Example Request

```shell
curl -v -X DELETE \
"https://app.eresourcescheduler.cloud/rest/v1/resources/12/timings/2" \
  -H "Authorization: Bearer B8x5Vj1O65r6wnoV"
```

### Returns

| Code      | Description  
| ---:        |    :----   
| **200** <br><span class = "success">`OK`</span> |This status code indicates that the operation was successful and a applied calendar get deleted successfully |
| **404** <br> <span class = "error">`Not Found`</span> | Not Found error occurs when requested resource id or timing id does not exist.

## Exceptions

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

Exception is nothing but timing-duration that is different from a general schedule. eRS provides you the feature to add an exception to a resource.

Let's say, a resource having calendar which does not have Sunday working. But for some reason, resource has to work on Sunday then this a case of exception. So in such situation exception comes handy.

eRS Cloud provides you two types of exceptions: 
    <ol><li>Working Exception : <p>&#160;&#160;&#160;&#160;&#160; Working Exception is get added on a non-working day. </p></li> <li>Non-working Exception : <p>&#160;&#160;&#160;&#160;&#160; Non-working Exception is get added on a working day. </p></li></ol>

__*Working Exception can be added without timings*__

<span class="optional"><b>ATTRIBUTES</b></span>

Name         |  Description
 ---:        |    :----   
 **id** <br>`integer`   |  eRS Cloud-generated unique identifier for the exceptions object.|
 **name**<br> `string` | This field describes name of exception.| 
 **description**<br> `string` | This field describes about the exception.|
 **date**<br> `string` | Date Field describes when will exception get applied.|
 **is_working_exception**  <br><span class="required">`boolean`</span>|Is working exception describes whether exception is a working exception or non working exception. True value means that exception is working exception and false value means that exception is non working exception.
 **created_on** <br>`string` | Time at which  exception is created. |
 **modified_on** <br>`string` | Describes the latest modification date. |
 **created_by** <br> `object` | This field describes by whom exception is created .|
 **modified_by** <br>`object` | This field describes by whom the modification is done. |
 **timings** <br> `object` |Timings describes the timings of exception.



### Retrieving exceptions

> `GET v1/resources/{ID}/exceptions`

> Example Request

```shell
curl -v -X GET \
"https://app.eresourcescheduler.cloud/rest/v1/resources/12/exceptions" \
  -H "Authorization: Bearer B8x5Vj1O65r6wnoV"
```


Retrieves the details of exceptions which are applied to the resource. You only need to provide the unique resource identifier that was returned upon resource creation.



### Returns

| Code      | Description | 
| ---:        |    :----   | 
| **200** <br> <span class = "success">`OK`</span>     | This status code indicates that the operation was successful and exceptions  get retrieved successfully .  |
| **403** <br> <span class = "error">`Forbidden`</span> |Authorization failed due to insufficient permissions. This occurs when user does not have enough access rights to perform this action. Access for each user can be controlled by an Administrator using eRS Cloud Application.|
| **404** <br> <span class = "error">`Not Found`</span> | Not Found error occurs when requested resource does not exist (i.e. There is no resource with given id). This may also occur when requesting a resource which has been deleted. |


### Create an exception

> `POST v1/resources/{ID}/exceptions`

> Example Request

```shell
curl -v -X POST \
"https://app.eresourcescheduler.cloud/rest/v1/resources/12/exceptions" \
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
**date**  <br><span class="required">`required`</span>| Date Field describes when will exception get applied. It is a `Date` type of field. 
**descirption**  <br>`optional`|As the name shows it is a description which we want to give for the exception . This field is a `string` type of field. 
**name**  <br><span class="required">`required`</span>|Name describes the name of exception. This field is a `string` type of field
**is_working_exception**  <br><span class="required">`required`</span>|Is working exception describes whether exception is a working exception or not. Accepts `true` if it is a working exception otherwise accepts `false` if it a non-working exception. This field is a `boolean` type of field
**timing_blocks**  <br>`optional`|Timing_blocks describes the timings of exception. This filed can be passed null, as eRS Cloud provids you the facility to create an exception without timings. This field is a `Array of objects` type of field
**timings.start_time**  <br>`optional`|Start time describes the start time of exception. This filed can be passed null, as eRS Cloud provids you the facility to create an exception without timings. This field is a `Integer` type of field.  
**timings.end_time**  <br>`optional`|End time describes the end time of exception. This filed can be passed null, as eRS Cloud provids you the facility to create an exception without timings. This field is a `Integer` type of field.  


### Returns
 
| Code      |Description |
 :---        |    :----   |
| **201** <br><span class = "success">`Created`</span> | This status code indicates that the operation was successful and exception get created successfully.|
| **400** <br> <span class = "error">`Bad Request`</span> | Bad Request error occurs when a request is malformed, syntactically incorrect, missing required parameters are  or any unknown parameter is passed.  |
| **403** <br> <span class = "error">`Forbidden`</span> |Authorization failed due to insufficient permissions. This occurs when user does not have enough access rights to perform this action. Access for each user can be controlled by an Administrator using eRS Cloud Application.|
|  **404** <br><span class = "error">`Not Found`</span> |This status code indicates that resource does not exist|
### Update an exception


> `PUT v1/resources/{ID}/exceptions/{Exception_ID}`

> Example Request

```shell
curl -v -PUT \
"https://app.eresourcescheduler.cloud/rest/v1/resources/12/exceptions/2" \
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



Updates the specified resource's exception by setting the value of the parameter passed. You need to provide the unique resource identifier that was returned upon resource creation and unique exception identifier that was returend upon exception addition. If parameter is not provided then it will be left unchanged.

This request accepts mostly the same argument as the exception creation call.

<span class="optional"><b>REQUEST BODY PARAMETERS</b></span>


Name         |  Description
 ---:        |    :----   
**date**  <br><span class="required">`required`</span>| Date Field describes when will exceptiob get applied. It is a `Date` type of field. 
**descirption**  <br>`optional`|As the name shows it is a description which we want to give for the exception . This field is a `string` type of field. 
**name**  <br><span class="required">`required`</span>|Name describes the name of exception. This field is a `string` type of field
**is_working_exception**  <br><span class="required">`required`</span>|Is working exception describes whether exception is working exception or not. Accepts `true` if it is working exception otherwise accepts `false` if it a non-working exception. This field is a `boolean` type of field
**timing_blocks**  <br>`optional`|Timing_blocks describes the timings of exception. This filed can be pass null, as eRS Cloud provids you the facility to create an exception without timings. This field is a `Array of objects` type of field
**timings.start_time**  <br>`optional`|Start time describes the start time of exception. This filed can be pass null, as eRS Cloud provids you the facility to create an exception without timings. This field is a `Integer` type of field.  
**timings.end_time**  <br>`optional`|End time describes the end time of exception. This filed can be pass null, as eRS Cloud provids you the facility to create an exception without timings. This field is a `Integer` type of field.  

### Returns

| Code      | Description | 
| ---:        |    :----   | 
| **200** <br> <span class = "success">`OK`</span>    |  This indicates that the operation was successful and a exception get updated successfully.|
| **400** <br> <span class = "error">`Bad Request`</span> | Bad Request occurs when a request is not well-formed, syntactically incorrect, empty required parameters or any unknown parameter is passed.|
| **403** <br> <span class = "error">`Forbidden`</span> |Authorization failed due to insufficient permissions. This occurs when user does not have enough access rights to perform this action. Access for each user can be controlled by an Administrator using eRS Cloud Application.|
|  **404** <br><span class = "error">`Not Found`</span> |This status code indicates that resource or exception does not exist| 


### Delete an exception

> `DELETE v1/resources/{ID}/exceptions/{Exception_ID}`

Permanently deletes a applied exception. It cannot be undone. You need to provide the unique resource identifier that was returned upon resource creation and unique exception identifier that was returend upon exception addition.


> Example Request

```shell
curl -v -X DELETE \
"https://app.eresourcescheduler.cloud/rest/v1/resources/12/exceptions/2"\
  -H "Authorization: Bearer B8x5Vj1O65r6wnoV"
```



| Code      | Description  
| ---:        |    :----   
| **200** <br><span class = "success">`OK`</span> |This status code indicates that the operation was successful and exception get deleted successfully |
|  **404** <br><span class = "error">`Not Found`</span> |This status code indicates that resource or exception does not exist| 

## Notes

> Exmaple Response

```json
{
   "total_count":3,
   "limit":25,
   "offset":0,
   "data":[
      {
         "id":8,
         "created_on":"2018-09-02T17:41:14.642026+05:30",
         "content":"<p>Awarded by  &#34;Employee Of The Month&#34; 
                    award on Aug  09, 2017<br> </p>",
         "modified_on":null,
         "created_by":{
            "id":2,
            "name":"Patrick Wilson"
         },
         "modified_by":{
            "id":null,
            "name":null
         }
      },
      {...},
      {...}
   ]
}
```

To capture additional information about a resource, eRS Cloud provides the `Notes`. If one has to provide any new information to a resource which is not captured from the filed, for such situations Notes are beneficial.

Let's say, If a resource has role "A", but after a certain time his role get changed or new role gets added to his profile. Roles field gives us the ability to add, update or delete a role. But it does not give brief information when the role get added, deleted or updated. The Notes comes in handy in such situations. Notes are handy to maintain the history of a resource.   

eRS Cloud API allows you to perform *`POST`*, *`GET`*, *`PUT`*, *`DELETE`* operations on Notes. 

*The Notes Of Archived Resource remain available for the records.*

<span class="optional"><b>ATTRIBUTES</b></span>

Name         |  Description
 ---:        |    :----   
 **id**<br> `integer` | eRS Cloud generated unique identifier for the notes. |
 **content** <br> `string` | Text written inside notes body .|
 **created_on** <br>`string` |   Time at which the notes object is created. |
 **modified_on** <br>`string` | Describes the latest modification date.|
 **created_by** <br> `object` | This field describes by whom notes is created  .|
 **modified_by** <br>`object` | This field describes by whom the modification is done .

### List notes

>` GET  v1/resources/{ID}/notes`


Retrieves the Notes list of specified resource. You need to provide the unique resource identifier that was returned upon resource creation.The notes are returned which sorted by lastly modified or added.

> Example Request

```shell
curl -v -X GET \
"https://app.eresourcescheduler.cloud/rest/v1/resources/8/notes" \
  -H "Authorization: Bearer B8x5Vj1O65r6wnoV"
```

>Example Request With Offset And Limit 

```shell 
curl -v -X GET \
"https://app.eresourcescheduler.cloud/rest/v1/resources/8/notes?offset=1&limit=1" \
 -H "Authorization: Bearer B8x5Vj1O65r6wnoV"
```
>Example Request With orderBy 

```shell 
curl -v -X GET \
 "https://app.eresourcescheduler.cloud/rest/v1/resources/8/notes?offset=1&limit=1&order_by=created_on" \
 -H "Authorization: Bearer B8x5Vj1O65r6wnoV"
```


<span class="optional"><b>REQUEST QUERY PARAMETERS</b></span>

|Name|Description|
|-:|:-|
|**limit**<br>`optional`|The limit keyword is used to limit the number of notes returned from a result set.<br>*The default value of limit is*  <span class="error">*`25`*</span><br>*Maximum value of limit can be* <span class="error">*`100.`*</span> *If Limit value is exceeds than*<span class="error">*`100`*</span>  *then it will set to* <span class="error">*`100`*</span> *which is Maximum value for limit.* |
|**offset**<br>`optional`|The Offset value allows specifying which note to start from retrieving data.The Offset value is also most often used together with the Limit keyword.<br>*The default value of offset is* <span class="error">*`0`* </span>|


### Ordering the notes

<span class="optional"><b>REQUEST QUERY PARAMETERS</b></span>

|Name|Options|Description|
|-:|:-:|:-
|**Order_by**<br>`optional`|<li>created_on *(Default)*</li>|List of notes will be returned and sorted by it's created date.|
| |<li>modified_on</li>|List of notes will be returned and sorted by it's latest modified date|


### Returns 


| Code      | Description | 
| ---:        |    :----   | 
| **200** <br> <span class = "success">`OK`</span>      |  This indicates that the operation was successful and a list of notes is returned.  |
**400** <br> <span class = "error">`Bad Request` </span>| Bad Request may occur when offset and limit value is given as negative integer. |
**403** <br> <span class = "error">`Forbidden`</span> | Authorization failed due to insufficient permissions. This occurs when user does not have enough access rights to perform this action. Access for each user can be controlled by an Administrator using eRS Cloud Application.|
**404** <br><span class = "error">`Not Found`</span> |This status code indicates that resource does not exist| 

> Example Request


### Create a note

>` POST  v1/resources/{ID}/notes`


> Example Request

```shell

curl -v -X POST \
"https://app.eresourcescheduler.cloud/rest/v1/resources/8/notes"\
  -H "Authorization: Bearer B8x5Vj1O65r6wnoV"\
  -H "Content-Type: application/json"\
  -d '{"content": "Hello Enbraun"}'
```

> Example Request With HTML Tag

```shell

curl -v -X POST \
"https://app.eresourcescheduler.cloud/rest/v1/resources/8/notes" \
  -H "Authorization: Bearer B8x5Vj1O65r6wnoV" \
  -H "Content-Type: application/json" \
  -d '{"content": "<p>Hello Enbraun</p>"}'
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
|  **404** <br><span class = "error">`Not Found`</span> |This status code indicates that resource does not exist| 




### Update a note

>` PUT  v1/resources/{ID}/notes/{Note_ID}`

Updates the specified resource's note by setting the value of the parameter passed. You need to provide the unique resource identifier that was returned upon resource creation and unique note identifier that was returend upon notes creation. If parameter is not provided then it will be left unchanged.

This request accepts mostly the same argument as the note creation call.

> Example Request

```shell

curl -v -X PUT \
"https://app.eresourcescheduler.cloud/rest/v1/resources/8/notes/4" \
  -H "Authorization: Bearer B8x5Vj1O65r6wnoV" \
  -H "Content-Type: application/json" \
  -d '{"content": "Hello World"}'
```

> Example Request With HTML Tags.

```shell

curl -v -X PUT \
"https://app.eresourcescheduler.cloud/rest/v1/resources/8/notes/4" \
  -H "Authorization: Bearer B8x5Vj1O65r6wnoV"\
  -H "Content-Type: application/json" \
  -d '{"content": "<p>Hello World</p>"}' 
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
|  **404** <br><span class = "error">`Not Found`</span> |This status code indicates that resource or notes does not exist| 


### Delete a note

>` DELETE  v1/resources/{ID}/notes/{Note_ID}`

Permanently deletes a Note. It cannot be undone.You need to  provide the unique resource identifier that was returned upon resource creation and unique note identifier that was returend upon notes creation.

> Example Request

```shell

curl -v -X DELETE \
"https://app.eresourcescheduler.cloud/rest/v1/resources/8/notes/5" \
  -H "Authorization: Bearer B8x5Vj1O65r6wnoV"
```



| Code      | Description  
| ---:        |    :----   
| **200** <br><span class = "success">`OK`</span> |This status code indicates that the operation was successful and a note get deleted successfully |
| **403** <br> <span class = "error">`Forbidden`</span> | Authorization failed due to insufficient permissions. This occurs when user does not have enough access rights to perform this action. Access for each user can be controlled by an Administrator using eRS Cloud Application.|
|  **404** <br><span class = "error">`Not Found`</span> |This status code indicates that resource or notes does not exist| 
