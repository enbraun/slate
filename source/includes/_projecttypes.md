# Projects Types

##  Project type object

> Example Response 
 
```json
{
  "id": 1,
  "name": "Standard",
  "description": "",
  "fields": [
      {
        "id": 39,
        "code": "is_archive",
        "display_name": "Archive",
        "field_type": "ARCH",
        "is_required": false,
        "is_system_defined": true
      },
      {
        "id": 40,
        "code": "color",
        "display_name": "Color",
        "field_type": "COLPICK",
        "is_required": false,
        "is_system_defined": false
      },
      {
        "id": 11,
        "code": "email",
        "display_name": "Email",
        "field_type": "EMAIL",
        "placeholder_text": "Enter valid email id",
        "maxlength": 254,
        "regex": "^[a-zA-Z]+[a-zA-Z0-9._]+@[a-zA-Z]+\.[a-zA-Z.]{2,5}$",
        "is_required": false,
        "is_system_defined": true
      },
      {
        "id": 15,
        "code": "end_date",
        "display_name": "End Date",
        "field_type": "DATE",
        "is_required": false,
        "is_system_defined": true,
        "mindate": "1900-01-01",
        "maxdate": "2099-12-31"
      },
      {
        "id": 10,
        "code": "title",
        "display_name": "Project Name",
        "field_type": "ENAME",
        "minlength": 1,
        "maxlength": 100,
        "is_required": true,
        "is_system_defined": true
      },
      {
        "id": 101,
        "code": "manager",
        "display_name": "Manager",
        "field_type": "DDSS",
        "is_required": false,
        "is_system_defined": false,
        "options": [
            {
              "id": 107,
              "name": "Chester Norman",
              "description": null
            },
            {...}
        ]
      },
      {
        "id": 13,
        "code": "project_start_date",
        "display_name": "Start Date",
        "field_type": "DATE",
        "is_required": false,
        "is_system_defined": true,
        "mindate": "1900-01-01",
        "maxdate": "2099-12-31"
      },
      {
        "id": 32,
        "code": "tags",
        "display_name": "Tags",
        "field_type": "TAGS",
        "is_required": false,
        "is_system_defined": true
      }
    ]
}
```

    
 This is an object which represents the type of project. In an organization, there can be multiple types of projects. 

<span class="optional"><b>ATTRIBUTES</b></span>

Name | Description
| ---:  |  :----   |
**id**  <br><span class="optional">`integer`</span> | Unique identifier for the object.
**name** <br><span class="optional">`string`</span> | It represents name of project type.
**fields** <br><span class="optional">`array of strings`</span> |Fields is an object which contains list of properties of field that are defined for a particular project type. 
**fields.id**<br><span class="optional">`integer`</span> | It represents id for the particular field.
**fields.display_name** <br><span class="optional">`string`</span> | It represents name of the field.
**fields.field_type** <br><span class="optional">`string`</span> |  It represents type of the field. For example  Text, DDSS, DDMS, etc.
**fields.code** <br><span class="optional">`string`</span> |It represents the unique code of the field which is referred to as API code. It is used for filtering.
**fields.is_required** <br> <span class ="optional">`boolean`</span> |It represents that field is mandatory or not. Value of field must not be empty if is_required is true.
**fields.options** <br><span class="optional">`string`</span> |It represents the options of multi-selections fields. For Ex. DDMS,DDSS,etc.
**fields.options.id** <br><span class="optional">`integer`</span> | Unique identifier for the option.
**fields.option.name** <br><span class="optional">`string`</span> | It represents the name of the option.




## Get a Specific Project Type

>  `GET v1/projecttypes/{ID}`

Retrieves the details of an existing project-type. You only need to  provide the unique project-type identifier that was returned upon project-type creation.

>Example Request

```shell
curl -v -X GET \
"https://app.eresourcescheduler.cloud/rest/v1/projecttypes/3" \
  -H "Authorization: Bearer B8x5Vj1O65r6wnoV"

```

> Example Response

```json
{
    
    "id": 3,
    "name": "Education",
    "description": "",
    "fields": [
      {
        "id": 39,
        "code": "is_archive",
        "display_name": "Archive",
        "field_type": "ARCH",
        "is_required": false,
        "is_system_defined": true
      },
      {
        "id": 104,
        "code": "department",
        "display_name": "Department",
        "field_type": "RDGRP",
        "is_required": false,
        "is_system_defined": false,
        "options": [
             {
                "id": 117,
                "name": "Accounts",
                "description": null
             },
             {...}   
          ],
      },
      {
        "id": 11,
        "code": "email",
        "display_name": "Email",
        "field_type": "EMAIL",
        "placeholder_text": "Enter valid email id",
        "maxlength": 254,
        "regex": "^[a-zA-Z]+[a-zA-Z0-9._]+@[a-zA-Z]+\.[a-zA-Z.]{2,5}$",
        "is_required": false,
        "is_system_defined": true
      },
      {
        "id": 15,
        "code": "end_date",
        "display_name": "End Date",
        "field_type": "DATE",
        "is_required": false,
        "is_system_defined": true,
        "mindate": "1900-01-01",
        "maxdate": "2099-12-31"
      },
      {...},
      {...} 
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
{
  "total_count": 4,
  "data": [
    {
      "id": 3,
      "name": "Education",
      "description": "",
      "fields": [
        {
          "id": 39,
          "code": "is_archive",
          "display_name": "Archive",
          "field_type": "ARCH",
          "is_required": false,
          "is_system_defined": true
        },
        {
          "id": 104,
          "code": "department",
          "display_name": "Department",
          "field_type": "RDGRP",
          "is_required": false,
          "is_system_defined": false,
          "options": [
              {
                  "id": 117,
                  "name": "Accounts",
                  "description": null
              },
              {...}   
            ],
        },
        {
          "id": 11,
          "code": "email",
          "display_name": "Email",
          "field_type": "EMAIL",
          "placeholder_text": "Enter valid email id",
          "maxlength": 254,
          "regex": "^[a-zA-Z]+[a-zA-Z0-9._]+@[a-zA-Z]+\.[a-zA-Z.]{2,5}$",
          "is_required": false,
          "is_system_defined": true
        },
        {
          "id": 15,
          "code": "end_date",
          "display_name": "End Date",
          "field_type": "DATE",
          "is_required": false,
          "is_system_defined": true,
          "mindate": "1900-01-01",
          "maxdate": "2099-12-31"
        },
        {...},
        {...} 
      ]
    },
    {...},
    {...}
  ]
}
```


### Returns

| Code      | Description | 
| ---:        |    :----   | 
| **200** <br> <span class = "success">`OK`</span>      |  This indicates that the operation was successful and  list of project-types is returned.  |
