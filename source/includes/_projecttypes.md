# Projects Types

## The project type object

> Example Request

```shell
curl -v -X GET
"https://app.eresourcescheduler.cloud/rest/v1/projecttypes"\
  -H "Authorization: Bearer B8x5Vj1O65r6wnoV"
```

> Example Response 
 
```json
{
   "id":1,
   "name":"Standard",
   "fields":[
      {
         "name":"Project Name",
         "type":"TEXT",
         "code":"title"
      },
      {
         "name":"Start Date",
         "type":"Date",
         "code":"project_start_date"
      },
      {
         "name":"Color",
         "type":"COLPICK",
         "code":"color"
      }
   ]
}
```

    
 This is an object which represents the type of project. In an organization, there can be multiple types of projects. 

<span class="optional"><b>ATTRIBUTES</b></span>

Name | Description
| ---:  |  :----   |
**id**  <br><span class="optional">`integer`</span> | Unique identifier for the object.
**name** <br><span class="optional">`string`</span> | This is an object which represents the name of the project type. Also, the name of the project we will find in add project form. Where we have select which type of project we have to create. There be can multiple types of project types.
**fields** <br><span class="optional">`array of strings`</span>  | Fields are the list of objects representing filed that are present is eRS Cloud to be mapped with Resource type, Project type, and Booking profile to represent attributes of  Resource type, Project type, and Booking profile respectively.
**fields.name** <br><span class="optional">`string`</span> | This is an object which represents field name of project type.
**fields. type** <br><span class="optional">`string`</span> |  This is an object which represents the filed type of project type. For example, Text, DDSS, DDMS, etc.
**fields. code**  <br><span class="optional">`integer`</span> | This is an object which represents the unique code which is referred to as API code.




## Get a Specific Project Type

>  `GET v1/projecttypes/{ID}`


>Example Request

```shell
curl -v -X GET
"https://app.eresourcescheduler.cloud/rest/v1/projecttypes/1"\
  -H "Authorization: Bearer B8x5Vj1O65r6wnoV"

```

> Example Response

```json
{
   "id":1,
   "name":"Standard",
   "fields":[
      {
         "name":"Project Name",
         "type":"TEXT",
         "code":"title"
      },
      {
         "name":"Start Date",
         "type":"Date",
         "code":"project_start_date"
      },
      {
         "name":"Color",
         "type":"COLPICK",
         "code":"color"
      }
   ]
}
```


<span class="optional"><b>ARGUMENTS</b></span>

Name | Description
 ---:        |    :---- 
 **ID** <br><span class="required">`required`</span> | The eRS Cloud-generated ID for the project-type which is used to uniquely identified project-type object.


### Returns

| Code      | Description | 
| ---:        |    :----   | 
| **200** <br> <span class = "success">`OK`</span>     | This status code indicates that the operation was successful and a project-type  get retrieved successfully .  |
| **403** <br> <span class = "error">`Forbidden`</span> |Authorization failed due to insufficient permissions, this may be caused by user may not have rights to perform the operation.   |


## Get All Projects Types

>  `GET v1/projecttypes`

> Example Request

```shell
curl -v -X GET
"https://app.eresourcescheduler.cloud/rest/v1/projecttypes"\
  -H "Authorization: Bearer B8x5Vj1O65r6wnoV"
```

>Example Response

```json
[
   {
      "id":1,
      "name":"Standard",
      "fields":[
         {
            "name":"Project Name",
            "type":"TEXT",
            "code":"title"
         },
         {
            "name":"Start Date",
            "type":"Date",
            "code":"project_start_date"
         },
         {
            "name":"Color",
            "type":"COLPICK",
            "code":"color"
         }
      ]
   },
   {
      "id":2,
      "name":"Engineering",
      "fields":[
         {
            "name":"Project Name",
            "type":"TEXT",
            "code":"title"
         },
         {
            "name":"Start Date",
            "type":"Date",
            "code":"project_start_date"
         },
         {
            "name":"Color",
            "type":"COLPICK",
            "code":"color"
         }
      ]
   },
   {...},
   {...}
]
```

<span class="optional"><b>ARGUMENTS</b></span>

Name    | Description
-------: | :------------
**id** <br><span class="required">`required`</span> |  Unique identifier for the object.
**name** <br><span class="optional">`optional`</span> | This is an object which represents the name of the project type. Also, the name of the project we will find in add project form. Where we have select which type of project we have to create. There be can multiple types of project types.
**fields** <br><span class="optional">`optional`</span> | Fields are the list of objects representing filed that are present is eRS Cloud to be mapped with Resource type, Project type, and Booking profile to represent attributes of  Resource, Project, and Booking respectively.
**fields.name**  <br><span class="optional">`optional`</span> | This is an object which represents field name of project type.
**fileds.type** <br><span class="optional">`optional`</span> | This is an object which represents the filed type of project type. For example,  Text, DDSS, DDMS, etc.
**fields.code** <br><span class="optional">`optional`</span> |  This is an object which represents the unique code which is referred to as API code.



### Returns

| Code      | Description | 
| ---:        |    :----   | 
| **200** <br> <span class = "success">`OK`</span>      |  This indicates that the operation was successful and a list of project-types is returned.  |
