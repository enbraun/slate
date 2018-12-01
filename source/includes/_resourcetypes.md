# Resource Types

##  Resource type object
 

> Example Response

```json
{
      "id": 102,
      "name": "Contractor",
      "is_human": true,
      "description": "This is contractor resource type",
      "fields": [
        {
          "id": 11,
          "code": "email",
          "display_name": "Email",
          "field_type": "EMAIL",
          "is_required": false,
          "is_system_defined": true
        },
        {
          "id": 7,
          "code": "first_name",
          "display_name": "First Name",
          "field_type": "TEXT",
          "is_required": true,
          "is_system_defined": true
        },
        {
          "id": 8,
          "code": "last_name",
          "display_name": "Last Name",
          "field_type": "TEXT",
          "placeholder_text": "Enter last name",
          "maxlength": 100,
          "is_required": false,
          "is_system_defined": true
        },
        {
          "id": 14,
          "code": "last_date",
          "display_name": "Last Working Date",
          "field_type": "DATE",
          "is_required": false,
          "is_system_defined": true,
        },
        {
          "id": 26,
          "code": "phone",
          "display_name": "Phone",
          "field_type": "TEXT",
          "maxlength": 50,
          "is_required": false,
          "is_system_defined": true
        },
        {
          "id": 18,
          "code": "roles",
          "display_name": "Roles",
          "field_type": "ROLES",
          "placeholder_text": "Enter a role",
          "is_required": false,
          "is_system_defined": true,
          "options": [
                  {
                    "id": 5,
                    "name": "Architect",
                    "description": null
                  },
                  {
                    "id": 6,
                    "name": "Business Analyst",
                    "description": null
                  },
                ],
        },
        {
          "id": 12,
          "code": "start_date",
          "display_name": "Start Date",
          "field_type": "DATE",
          "is_required": true,
          "is_system_defined": true,
        },
        {...},
        {...}
     ]
}
```

This is an object which represents the type of resource. In an organization, there can be multiple types of resources.Resource type can be categorized as human or non-human. Human type of resource can be Employee, Contractors, etc. and non-human can be Machines,Computers,equipments,etc.

<span class="optional"><b>ATTRIBUTES</b></span>

Name | Description
---------: | :-----------
**id**  <br><span class="optional">`integer`</span>|  It is unique id for the object.It is used to search a object.
**name** <br><span class="optional">`string`</span>  | It represents name of resource type. 
**isHuman** <br><span class="optional">`boolean`</span>| It repr­esents whether resource type is human or non-human. For example, human type of resources are Employee, Contractor, etc. , where as non-human resources are Machines, Meeting Rooms, etc.
**fields** <br><span class="optional">`array of strings`</span> |Fields is an object which contains list of properties of field that are defined for a particular resource type. 
**fields.id**<br><span class="optional">`integer`</span> | It represents id for the particular field.
**fields.display_name** <br><span class="optional">`string`</span> | It represents name of the field.
**fields.field_type** <br><span class="optional">`string`</span> |  It represents type of the field. For example  Text, DDSS, DDMS, etc.
**fields.code** <br><span class="optional">`string`</span> |It represents the unique code of the field which is referred to as API code. It is used for filtering.
**fields.is_required** <br> <span class ="optional">`boolean`</span> |It represents that field is mandatory or not.Value of field must not be empty if is_required is true.
**fields.options** <br><span class="optional">`string`</span> |It represents the options of multi-selections fields. For Ex. DDMS,DDSS,etc.
**fields.options.id** <br><span class="optional">`integer`</span> | Unique identifier for the option.
**fields.option.name** <br><span class="optional">`string`</span> | It represents the name of the option.



## Get a Specific Resource Type



>  `GET v1/resourcetypes/{ID}`

Retrieves the details of an existing resource-type. You only need to  provide the unique resource-type identifier that was returned upon resource-type creation.

>Example Request

```shell
curl -v -X GET \
"https://app.eresourcescheduler.cloud/rest/v1/resourcetypes/103" \
  -H "Authorization: Bearer B8x5Vj1O65r6wnoV"
```

>Example Response


```json
{
    "id": 103,
    "name": "Education",
    "is_human": true,
    "description": "",
    "fields": [
      {
        "id": 11,
        "code": "email",
        "display_name": "Email",
        "field_type": "EMAIL",
        "is_required": false,
        "is_system_defined": true
      },
      {
        "id": 7,
        "code": "first_name",
        "display_name": "First Name",
        "field_type": "TEXT",
        "is_required": true,
        "is_system_defined": true
      },
      {
        "id": 8,
        "code": "last_name",
        "display_name": "Last Name",
        "field_type": "TEXT",
        "placeholder_text": "Enter last name",
        "maxlength": 100,
        "is_required": false,
        "is_system_defined": true
       },
      {
        "id": 14,
        "code": "last_date",
        "display_name": "Last Working Date",
        "field_type": "DATE",
        "is_required": false,
        "is_system_defined": true,
        "maxdate": "2099-12-31",
        "mindate": "1900-01-01"
      },
      {
        "id": 18,
        "code": "roles",
        "display_name": "Roles",
        "field_type": "ROLES",
        "placeholder_text": "Enter a role",
        "is_required": false,
        "is_system_defined": true,
        "options": [
              {
                "id": 5,
                "name": "Architect",
                "description": null
              },
              {...}
           ],
      },
      {
        "id": 34,
        "code": "calendar",
        "display_name": "Working Calendar",
        "field_type": "CALSS",
        "is_required": false,
        "is_system_defined": true
      },
      {...}
    ]
}


```


### Returns

| Code      | Description | 
| ---:        |    :----   | 
| **200** <br> <span class = "success">`OK`</span>     | This status code indicates that the operation was successful and  retrieved a resource-type successfully .  |
|  **404** <br><span class = "error">`Not Found`</span> |This status code indicates that resource-type id  does not exist|


## Get All Resource Types

>  `GET v1/resourcetypes`

Returns a list of resource-types. The resource-types are returned sorted by name.

> Example Request


```shell
curl -v -X GET "https://app.eresourcescheduler.cloud/rest/v1/resourcetypes"\
  -H "Authorization: Bearer B8x5Vj1O65r6wnoV"
```

> Example Response

```json
{
  "total_count": 4,
  "data": [
   {
      "id": 102,
      "name": "Contractor",
      "is_human": true,
      "description": "This is contractor resource type",
      "fields": [
        {
          "id": 11,
          "code": "email",
          "display_name": "Email",
          "field_type": "EMAIL",
          "is_required": false,
          "is_system_defined": true
        },
        {
          "id": 7,
          "code": "first_name",
          "display_name": "First Name",
          "field_type": "TEXT",
          "is_required": true,
          "is_system_defined": true
        },
        {
          "id": 8,
          "code": "last_name",
          "display_name": "Last Name",
          "field_type": "TEXT",
          "placeholder_text": "Enter last name",
          "maxlength": 100,
          "is_required": false,
          "is_system_defined": true
        },
        {
          "id": 14,
          "code": "last_date",
          "display_name": "Last Working Date",
          "field_type": "DATE",
          "is_required": false,
          "is_system_defined": true,
        },
        {
          "id": 26,
          "code": "phone",
          "display_name": "Phone",
          "field_type": "TEXT",
          "maxlength": 50,
          "is_required": false,
          "is_system_defined": true
        },
        {
          "id": 18,
          "code": "roles",
          "display_name": "Roles",
          "field_type": "ROLES",
          "placeholder_text": "Enter a role",
          "is_required": false,
          "is_system_defined": true,
          "options": [
                {
                  "id": 5,
                  "name": "Architect",
                  "description": null
                },
                {
                  "id": 6,
                  "name": "Business Analyst",
                  "description": null
                }
           ],
        },
        {
          "id": 12,
          "code": "start_date",
          "display_name": "Start Date",
          "field_type": "DATE",
          "is_required": true,
          "is_system_defined": true,
        },
        {...},
        {...}
      ]
    },
    {...},
    {...},
  ]
}

```



### Returns

| Code      | Description | 
| ---:        |    :----   | 
| **200** <br> <span class = "success">`OK`</span>      |  This indicates that the operation was successful and  list of resource-types is returned.  |



