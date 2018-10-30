# Resource

## Resource object

Creates a new resource object.



>Example Response  

```json
{
   "id":1,
   "modified_on":"2018-10-04T07:43:26.479769Z",
   "roles":[
      {
         "id":1,
         "name":"Software Developer",
         "description":null
      }
   ],
   "last_name":"Gray",
   "type":{
      "id":1,
      "name":"Employee",
      "description":null,
      "isHuman":true
   },
   "created_by":{
      "id":2,
      "name":"Patrick Wilson"
   },
   "last_date":null,
   "tags":[
     "Seattle"
   ],
   "created_on":"2018-10-03T11:55:48.551594Z",
   "phone":"(555) 555-1234",
   "name":"Christian Gray",
   "modified_by":{
     "id":2,
      "name":"Patrick Wilson"
   },
   "first_name":"Christian",
   "image_uuid":"resource_default",
   "email":"christian.gray@mycompany.com",
   "start_date":"2016-01-08",
   "emp_birthday": "1991-01-27" <- User defined field
}
```

<span style="color:#b93d6a">`Resource`</span> object contains all the information about the resource. The API allows you to create, delete, and update resources. You can retrieve individual resource as well as a list of all your resources.

<span class="optional"><b>ATTRIBUTES</b></span>

Name         |  Description
 ---:        |    :---- 
**id** <br><span class="optional">`integer`</span>     |  eRS Cloud-generated unique identifier for the resource object. 
**modified_on** <br><span class="optional">`datetime`</span> | Describes the latest modification date.
**start_date** <br><span class="optional">`date`</span> |  The date on which resource has joined the Organization.
**type** <br><span class="optional">`object`</span> | It describes the type of resource.
**isHuman** <br><span class="optional">`boolean`</span> | Has the value `true` if the resource is human <br>or the value `false` if the resource is non-human.
**last_name** <br><span class="optional">`string`</span> | The last name of the resource.
**last_date** <br><span class="optional">`date`</span> |  This field indicates last working date of resource. 
**tags** <br><span class="optional">`array of strings`</span> |Tags are the list of strings that could be used to organize the resource.
**created_on** <br><span class="optional">`string`</span> |   Time at which the resource object is created.
**phone** <br><span class="optional">`string`</span> |The phone number of the resource.
**name** <br><span class="optional">`string`</span>  | The full name of the resource.
**modified_by** <br><span class="optional">`string`</span> | This field describes by whom the modification is done by.
**first_name** <br><span class="optional">`string`</span> | The first name of the resource.
**image_uuid** <br><span class="optional">`string`</span> | The  image or display picture of the resource.
**email** <br><span class="optional">`string`</span> | The email address of the resource.
**User defined fields** <br><span class="optional">`optional`</span>  | Custom user-defined fields used to capture additional information of resource. [Learn more] (#user-defined-fields)



## Create a resource
    



>  `POST v1/resources`


> Example Request:

```shell
 curl -v -X POST "https://app.eresourcescheduler.cloud/rest/v1/resources/1"\
  -H "Authorization: Bearer B8x5Vj1O65r6wnoV"\
  -d  "first_name= Amy"\
  -d  "start_date= 2016-05-02"\
  -d  "resource_type_id= 1"\
  -d  "emp_birthday = 1991-01-27" <- User defined field
```

> Example Request for non-human resource:

```shell
 curl -v -X POST "https://app.eresourcescheduler.cloud/rest/v1/resources/2"\
  -H "Authorization: Bearer B8x5Vj1O65r6wnoV"\
  -d  "name= La La Land"\
  -d  "start_date= 2018-08-05"\
  -d  "resource_type_id= 2"\
  -d  "capacity = 15" <- User defined field
```

<span class="optional"><b>ARGUMENTS</b></span>


Name               |  Description
 ---:        |    :----   
**calendar**  <br><span class="optional">`optional`</span>  |The calendar used to assign a particular resource’s working calendar. It may vary from resource to resource as per its requirements. With the help of calendar, working timing of a resource can be defined. It is the integer id of calendar. The default calendar will be set if you post an empty value.
**email** <br><span class="optional">`optional`</span>  |  Resource's email address is an optional field. It’s displayed alongside the resource in your resource list and can be useful for filtering purpose. The maximum lenght of this field may be up to 254 characters. This will be blank if you POST an empty value.
**first_name** <br> <span class="required">`required`</span>  |The first name is a string which represents the first name of a resource. It is a required field. This may be up to 100 characters.  This will be blank if you POST an empty value.<br> <span class = "error"> For non-human type of resource this field is  <span class="required">**`unavailable`**</span>.</span>
**image_uuid**  <br><span class="optional">`optional`</span> | Resource's image is an optional field. This field accepts the Base64 encoded PNG string. It's displayed alongside the resource list.This will be blank if you POST an empty value.
**last_name**  <br><span class="optional">`optional`</span>  |  The last name is a string which represents the last name of a resource. It is an optional field. This may be up to 100 characters.  This will be blank if you POST an empty value.<br> <span class = "error"> For non-human type of resource this field is  <span class="required">**`unavailable`**</span>.</span>
**phone**  <br><span class="optional">`optional`</span>  |Resource's phone is an optional field. It’s displayed alongside the resource in your resource list and can be useful for filtering purpose. This may be up to 50 characters. This will be blank if you POST an empty value.
**resource_type_id** <br> <span class="required">`required`</span>| Resource type id represents the id of its type. Let’s assume there are two types of resources Employee and Meeting rooms. Type id of Employee is 1 and Type id of Meeting Room type is 2, then while creating a new resource, all the resource whose  id is given as 1 will get created under Employee type and same for Meeting Room when id is 2. It is a required field.
**roles**  <br><span class="optional">`optional`</span>  |  An array of ids of Role to be assigned to this Resource. The first id in the array is considered as Primary Role of that Resource. You can apply multiple performing roles to a resource. Resources can also be searched / filtered using performing roles. No role will get applied if the empty array or null value is passed.
**start_date**<br><span class="required">`required`</span>  |  The date on which resource has joined the organization. You can create the booking from the start date of a resource. You can not create the booking before the start date. It is a required field. This will throw an error if you post an empty value.
**tags**  <br><span class="optional">`optional`</span>  | Tags is an optional filed. It’s displayed alongside the resource in your list and can be useful for searching and filtering. This may be up to 50 characters. This will be blank if you post an empty value.
**name**<span class = "error">*</span> <br><span class="optional">`optional`</span>|  Its concatenation of the first name and last name of human type resource. While for non-human type resource Name is <span class="required">`required`</span> field.<br><span class = "error">* Indicates for the non-human type of resource it is a required field.</span>  
**User defined fields** <br><span class="optional">`optional`</span>  | A user with admin rights can add such custom fields. These fields can be used to capture additional info in Resources. Different types of resources may have a different set of user-defined fields. The value for user defined field can be passed as shown in example request. Here in given example, <span style="color:#db7708">`emp_birthday`</span> is a user defined field. [Learn more] (#user-defined-fields)



### Returns
 
| Code      |Description |
 :---        |    :----   |
| **201** <br><span class = "success">`Created`</span> | This status code indicates that the operation was successful and created a resource successfully.|
| **400** <br> <span class = "error">`Bad Request`</span> | Bad Request error occurs when a request is not malformed, syntactically incorrect, missing required parameters are  or any unknown parameter is passed. <br> Additionally, Bad request may also occur in one of these conditions :<ul><li>Invalid image file is provided.</li><li>Resource's start date is after its end date.</li></ul> |
| **403** <br> <span class = "error">`Forbidden`</span> |Authorization failed due to insufficient permissions, this may be caused by user may not have rights to perform the operation.|




## List resources

Returns a list of resources. The resources are returned sorted by name. 
	

>  `GET v1/resources/`


> Example Request

```shell
curl "https://app.eresourcescheduler.cloud/rest/v1/resources"\
  -H "Authorization: Bearer B8x5Vj1O65r6wnoV"
```

>Example Request With Offset And Limit 

```shell 
curl "https://app.eresourcescheduler.cloud/rest/v1/resources?offset=1&limit=1"\
 -H "Authorization: Bearer B8x5Vj1O65r6wnoV"
```


> Example Response

```json
{
   "totalcount":7,
   "offset":1,
   "limit":25,
   "resources":[
      {
         "id":2,
         "roles":[
            {
               "name":"Network Engineer",
               "description":"Network Engineer",
               "id":3
            },
            {
               "name":"Web Developer",
               "description":"Web Developer",
               "id":5
            }
         ],
         "type":{
            "name":"Employee",
            "description":"Employee Type",
            "id":1,
            "is_human":true
         },
         "last_date":null,
         "first_name":"Anastasia",
         "image_uuid":"/img/8945d093-0f76-4347-a9ae-b2f3c13ea281",
         "email":"ana.steele@mycompany.com",
         "start_date":"2016-01-27",
         "modified_on":"2018-10-30T09:15:38.422688Z",
         "last_name":"Steele",
         "created_by":{
            "name":"Patrick Wilson",
            "id":2
         },
         "emp_birthday":"2018-01-08", <- User-defined field.
         "tags":[
            "Santa Clara",
            "San Diego"
         ],
         "created_on":"2018-10-03T11:56:39.885256Z",
         "phone":"(485)555-9876",
         "name":"Anastasia Steele",
         "modified_by":{
            "name":"Patrick Wilson",
            "id":2
         }
      },
      {...},
      {...},
      {...}
   ]
}
```

### Limit and Offset



<span class="optional"><b>ARGUMENTS</b></span>

|Name|Description|
|-:|:-|
|**limit**<br><span class="optional">`optional`</span>|The limit keyword is used to limit the number of rows returned from a result set.<br><br>The limit number can be any from zero going upwards. When zero is specified as the limit, no rows are returned from the result set.<br><br>Let’s suppose that we want to display 20 records per page to avoid confusion. The limit comes in handy in such situations. We could be able to limit the results returned from query params to 20 records only per page.<br><br>*The default value of limit is*  <span class="error">*`25`*</span><br>*Maximum value of limit can be* <span class="error">*`1000.`*</span> *If Limit value is exceeds than*<span class="error">*`1000`*</span>  *then it will get set to* <span class="error">*`1000`*</span> *which is Maximum value for limit.* |
|**offset**<br><span class="optional">`optional`</span>|The Offset value allows specifying which row to start from retrieving data. <br><br>The Offset value is also most often used together with the Limit keyword.<br><br>The offset number can be any from zero going upwards. When zero is specified as the offset, records from first row are returned from the result set.<br><br>Let’s suppose that we want to display records from third row. The Offset comes in handy in such situations. We could be able to apply offset on the results returned from query params to display  records from third row.<br><br>*The default value of offset is* <span class="error">*`0`* </span>|



### Returns 


| Code      | Description | 
| ---:        |    :----   | 
| **200** <br> <span class = "success">`OK`</span>      |  This indicates that the operation was successful and a list of resources is returned.  |
**400** <br> <span class = "error">`Bad Request` </span>| Bad Request may occur when offset and limit value is given as negative integer.



## Retrieve a resource 


>  `GET v1/resources/{ID}`

> Example Request

```shell
curl "https://app.eresourcescheduler.cloud/rest/v1/resources/1"\
  -H "Authorization: Bearer B8x5Vj1O65r6wnoV"
```

> Example Response

```json
{
   "id":1,
   "modified_on":"2018-10-04T07:43:26.479769Z",
   "roles":[
      {
         "id":1,
         "name":"Software Developer",
         "description":null
      }
   ],
   "last_name":"Gray",
   "type":{
      "id":1,
      "name":"Employee",
      "description":null,
      "isHuman":true
   },
   "created_by":{
      "id":2,
      "name":"Patrick Wilson"
   },
   "last_date":null,
   "tags":[
     "Seattle"
   ],
   "created_on":"2018-10-03T11:55:48.551594Z",
   "phone":"(555) 555-1234",
   "name":"Christian Gray",
   "modified_by":{
     "id":2,
      "name":"Patrick Wilson"
   },
   "first_name":"Christian",
   "image_uuid":"resource_default",
   "email":"christian.gray@mycompany.com",
   "start_date":"2016-01-08",
   "emp_birthday": "1991-01-27" <- User defined field
}
```

Retrieves the details of an existing resource. You only need to  provide the unique resource identifier that was returned upon resource creation.

<span class="optional"><b>ARGUMENTS</b></span>

Name | Description
 ---:        |    :---- 
 **ID** <br><span class="required">`required`</span> | The eRS Cloud-generated ID for the resource which is used to uniquely identified resource object.


### Returns

| Code      | Description | 
| ---:        |    :----   | 
| **200** <br> <span class = "success">`OK`</span>     | This status code indicates that the operation was successful and a resource  get retrieved successfully .  |
| **403** <br> <span class = "error">`Forbidden`</span> |Authorization failed due to insufficient permissions, this may be caused by user may not have rights to perform the operation.   |
| **404** <br> <span class = "error">`Not Found`</span> | Not Found error occurs when requested resource does not exist (i.e. There is no resource with given id). This may also occur when requesting a resource which has been deleted. |

## Search resources

>  `POST v1/resources/search`

Filtering API responses to retrieve specific data.


### Getting started with filters 

> Example Request For Filter In x-www-form-urlencoded Format

```shell
curl -X POST  "https://app.eresourcescheduler.cloud/rest/v1/resources/search"\
-H "Authorization: Bearer eYPpTTKgsWW1mhjt"\
-d "resource_type_id:eq=1" 
```

> Example Request For Filter In JSON Format

```shell
curl -X POST  "https://app.eresourcescheduler.cloud/rest/v1/resources/search"\
-H "Content-Type: application/json"\
-H "Authorization: Bearer eYPpTTKgsWW1mhjt"\
-d '{
      "resource_type_id:eq":1 
    }'
```

The filter parameter allows for filtering the results returned from the various endpoint in various ways. For example fetching only resources having resource type id 1 by adding resource_type_id:eq=1 to your query.

Filters are made up of rules, with a user-defined or system-defined field, a filter operator and a value.

Where a field-name is a user-defined or system-defined field you want to filter against, e.g. “resource_type_id”, the value is what you want to match e.g. 1 and filter operator could be like ”eq” for ‘Equal To’ operation, ‘lt’ for “Less Than” operation and so on.

when specifying a filter, the field-name and filter operator is always separated by a colon: If an operator is omitted, then default operator (which could be different depending upon field type.) will get applied.

### Filters with multiple rules 

You can combine rules using multiple “ -d ” parameter. If  you’d like to find all resources that are having resource_type_id is equal to 1 and having role 3, then you can POST 2 rules via CURL, which represents as shown in example. <span style="font-size:24px; font-weight:bold;">￼&#x1f449;</span>

> Example Request For Filter By Passing Multiple Rules In x-www-form-urlencoded Format

```shell
curl -X POST  "https://app.eresourcescheduler.cloud/rest/v1/resources/search"\
-H "Authorization: Bearer eYPpTTKgsWW1mhjt"\
-d "resource_type_id:eq=1"\ 
-d "roles:all=3" 
```

> Example Request For Filter By Passing Multiple Rules In JSON Format

```shell
curl -X POST  "https://app.eresourcescheduler.cloud/rest/v1/resources/search"\
-H "Content-Type: application/json"\
-H "Authorization: Bearer eYPpTTKgsWW1mhjt"\
-d '{
      "resource_type_id:eq":1 ,
      "roles:all":3
    }'
```


### Operator

The full list of all operators is shown below.


| Operator | Meaning  
| -: |:-  |
| any | Result will be displayed if it contains any occurrence within given values from record set. |
| all | Result will be displayed if it contains all occurrence of given values from record set. |
| has | Result will be displayed if it has the given value from record set. |
| eq  | Result will be displayed if it has equal value to given input from record set. |
| gt  | Result will be displayed of if it has  greater values for given input from record set. |
| lt | Result will be displayed of if it has lesser values for given input from record set. |
| bt | Result will be displayed for values which vary between given  range from record set. |
| ex | Result will be displayed for values which vary excluding given  range from record set. |



### Filters for System-defined fields

|**Field Type**| **Available Operator**  | **Description & Example**|
|:--|:--|:--|
|**Resource Type**|<ul> <li>eq *(default)* </li><li>any</li></ul>|**Example:** <br><ul><li>-d resource_type_id=1 </li><li>-d resource_type_id:eq=2  </li><li>-d resource_type_id:any="1&#124;2" </li></ul> 
|**Name**| <ul> <li>has *(default)* </li><li>eq</li></ul>|**Example:** <br><ul><li>-d name="Chris" </li><li>-d name:eq="Amy Jones" </li><li>--d name:has="c" </li></ul> 
|**Roles**| <ul> <li>any *(default)* </li><li>all</li></ul>|**Example:** <br><ul><li>-d roles="1&#124;2&#124;3"</li><li>-d roles:any="2&#124;5"</li><li>-d roles:all="4&#124;6"</li></ul>
|**Tags**| <ul> <li>any *(default)* </li><li>all</li></ul>|**Example:** <br><ul><li>-d tags="1&#124;2&#124;3"</li><li>-d tags:any="2&#124;5"</li><li>-d tags:all="4&#124;6"</li></ul>
|**Email**| <ul> <li>has *(default)* </li><li>eq</li></ul> |**Example:** <br><ul><li>-d email='@'</li><li>-d email:has='a' </li><li>-d email:eq='ana.steele@mycompany.com' </li></ul>  
|**Phone**| <ul> <li>has *(default)* </li><li>eq</li></ul> |**Example:** <br><ul><li>-d phone=999 </li><li>-d phone:eq='(485)555-0202' </li><li>-d phone:has=753 </li></ul> 
|**Start Date**| <ul><li>eq *(default)* </li><li>lt </li><li>  gt </li><li> bt </li><li> ex</li>   |**Example:** <br><ul><li>-d start_date=2016-01-27</li><li>-d start_date:eq=2016-01-27</li><li>-d start_date:lt=1999-12-22 </li><li>-d start_date:gt=1990-01-11 </li><li>-d start_date:bt="2001-01-01&#124;2010-12-31"</li><li>-d start_date:bt=2001-01-01 </li><li>-d start_date:ex="1992-02-12&#124;1997-01-27" </li><li>-d start_date:ex=1992-02-12 </li></ul>
|**Last Working Date**| <ul><li>eq *(default)* </li><li>lt </li><li>  gt </li><li> bt </li><li> ex</li>  |**Example:** <br><ul><li>-d last_date=2018-04-19</li><li>-d last_date:eq=2016-05-17</li><li>-d last_date:lt=2002-12-31 </li><li>-d last_date:gt=2010-01-01 </li><li>-d last_date:bt="1995-12-31&#124;1999-01-01"</li><li>-d last_date:bt=1995-12-31 </li><li>-d last_date:ex="2001-01-01&#124;2002-01-01" </li><li>-d last_date:ex=2003-01-01 </li></ul>

 _For User-defined fields please [check here] (##filters-for-user-defined-fields)._ 
## Update a resource 

Updates the specified resource by setting the values of the parameters passed. Any parameters not provided will be left unchanged. 

This request accepts mostly the same arguments as the resource creation call.

>  `PUT v1/resources/{ID}`

> Example Request

```shell
curl "https://app.eresourcescheduler.cloud/rest/v1/resources/1"\
  -H "Authorization: Bearer B8x5Vj1O65r6wnoV"
  -X PUT
```

<span class="optional"><b>ARGUMENTS</b></span>



Name               |  Description
 ---:        |    :----   
 **ID** <br><span class="required">`required`</span> |  The eRS Cloud-generated ID for the resource which is used to perform updation operation.
**email** <br><span class="optional">`optional`</span>  |  Resource's email address is an optional field. It’s displayed alongside the resource in your resource list and can be useful for filtering purpose. The maximum lenght of this field may be up to 254 characters. This will be blank if you POST an empty value.
**first_name** <br> <span class="required">`required`</span>  |The first name is a string which represents the first name of a resource. It is a required field. This may be up to 100 characters.  This will be blank if you POST an empty value.<br> <span class = "error"> For non-human type of resource this field is  <span class="required">**`unavailable`**</span>.</span>
**image_uuid**  <br><span class="optional">`optional`</span> | Resource's image is an optional field. It's displayed alongside the resource list.This will be blank if you POST an empty value.
**last_name**  <br><span class="optional">`optional`</span>  |  The last name is a string which represents the last name of a resource. It is an optional field. This may be up to 100 characters.  This will be blank if you POST an empty value.<br> <span class = "error"> For non-human type of resource this field is  <span class="required">**`unavailable`**</span>.</span>
**phone**  <br><span class="optional">`optional`</span>  |Resource's phone is an optional field. It’s displayed alongside the resource in your resource list and can be useful for filtering purpose. This may be up to 50 characters. This will be blank if you POST an empty value.
**roles**  <br><span class="optional">`optional`</span>  |  An array of ids of Role to be assigned to this Resource. The first id in the array is considered as Primary Role of that Resource. You can apply multiple performing roles to a resource. Resources can also be searched / filtered using performing roles. No role will get applied if the empty array or null value is passed.
**start_date**<br><span class="required">`required`</span>  |  The date on which resource has joined the organization. You can create the booking from the start date of a resource. You can not create the booking before the start date. It is a required field. This will throw an error if you post an empty value.
**tags**  <br><span class="optional">`optional`</span>  | Tags is the optional filed. It’s displayed alongside the resource in your list and can be useful for searching and filtering. This may be up to 50 characters. This will be blank if you post an empty value.
**name**<span class = "error">*</span> <br><span class="optional">`optional`</span>|  Its concatenation of the first name and last name of human type resource. While for non-human type resource Name is <span class="required">`required`</span> field.<br><span class = "error">* Indicates for the non-human type of resource it is a required field.</span>  
**User defined fields** <br><span class="optional">`optional`</span>  | A user with admin rights can add such custom fields. These fields can be used to capture additional info in Resources. The value for user defined field can be passed as shown in example request. Here in given example, <span style="color:#db7708">`emp_birthday`</span> is a user defined field. [Learn more] (#user-defined-fields)


### Returns

| Code      | Description | 
| ---:        |    :----   | 
| **200** <br> <span class = "success">`OK`</span>    |  This indicates that the operation was successful and a resource get updated successfully.|
| **400** <br> <span class = "error">`Bad Request`</span> | Bad Request occurs when a request is not well-formed, syntactically incorrect, empty required parameters or any unknown parameter is passed. <br> Additionally, Bad request may also occur in one of these conditions :<ul><li>Providing start date of a resource as a null.</li><li>User tries to update archived resource.</li><li>User tries to update start date and last date of a resource such that existing booking of that resource do not fit in given range.</li></ul> |
| **403** <br> <span class = "error">`Forbidden`</span> | Authorization failed due to insufficient permissions, this may be caused by user may not have rights to perform the operation.   |




## Delete a resource 

 Permanently deletes a resource. It cannot be undone. By default, this operation will get failed if a resource has any booking associated with it. To override this behaviour, forcefull delete can be used which will delete all bookings and then ultimately delete the resource object.

> `DELETE v1/resources/{ID}`


> Example Request
 
```shell
curl "https://app.eresourcescheduler.cloud/rest/v1/resources/1"\
  -H "Authorization: Bearer B8x5Vj1O65r6wnoV"\
  -X DELETE
```


<span class="optional"><b>ARGUMENTS</b></span>

Name | Description
 ---:        |    :---- 
**ID** <br><span class="required">`required`</span> | The eRS Cloud-generated ID for the resource which is used to uniquely identified resource object.


> Example Request For Forcefull Delete 
 
```shell
curl "https://app.eresourcescheduler.cloud/rest/v1/resources/1 \
      ?forceDeleteBookings=true" \
-H "Authorization: Bearer B8x5Vj1O65r6wnoV" \
-X DELETE
```

### Returns


| Code      | Description  
| ---:        |    :----   
| **200** <br><span class = "success">`OK`</span> |This status code indicates that the operation was successful and a resource get deleted successfully |
| **409** <br> <span class = "error">`Conflict`</span> |Conflict indicates that the resource can not be deleted as there are bookings associated with this resource. If you wish to delete it any way you must use force delete option by passing <span class = "error">`true`</span> for parameter <span class = "error">`force_delete_booking`</span>. This operation deletes all bookings of requested resource and resource itself. This can not be undone. Example shown <span style="font-size:24px; font-weight:bold;">￼&#x1f449;</span>|



