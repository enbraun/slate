# Projects Types

##  project type object

> Example Request

```shell
curl -v -X GET \
"https://app.eresourcescheduler.cloud/rest/v1/projecttypes" \
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

Retrieves the details of an existing project-type. You only need to  provide the unique project-type identifier that was returned upon project-type creation.

>Example Request

```shell
curl -v -X GET \
"https://app.eresourcescheduler.cloud/rest/v1/projecttypes/1" \
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

### Returns

| Code      | Description | 
| ---:        |    :----   | 
| **200** <br> <span class = "success">`OK`</span>     | This status code indicates that the operation was successful and a project-type  get retrieved successfully .  |
|  **404** <br><span class = "error">`Not Found`</span> |This status code indicates that project-type id does not exist|


## Get All Projects Types

>  `GET v1/projecttypes`

Returns a list of project-types. The project-types are returned sorted by name.

> Example Request

```shell
curl -v -X GET \
"https://app.eresourcescheduler.cloud/rest/v1/projecttypes" \
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


### Returns

| Code      | Description | 
| ---:        |    :----   | 
| **200** <br> <span class = "success">`OK`</span>      |  This indicates that the operation was successful and  list of project-types is returned.  |
