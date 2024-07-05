# Project Types

##  Project type object

> Example Response 
 
```json
{
  "id": 1,
  "name": "Standard",
  "description": "",
  "color": "#000000;1",
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
        "maxlength": 255,
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
Project type object represents the type of project. In an organization, there can be multiple types of projects. Administrator can add multiple project types using eRS Cloud application. Different project type objects can be configured to have a different sets of custom attributes as well, which allows customizing project objects to fit your requirements.

<span class="optional"><b>ATTRIBUTES</b></span>

Name | Description
| ---:  |  :----   |
**id**  <br>`integer` |Unique identification number for the object, which allows referring to this object and can be used to search a particular project type.
**name** <br>`string` | Represents name for this object. This is used to identify object by using some meaningful phrase to describe type of projects like `Standard`, `Education` etc.
**description**  <br>`string` |  Description for project type object.
**color** <br>`String`| String representing hexadecimal color code assigned to the project type.
**fields** <br>`array of objects` |Represents collection of fields (or attributes) that are available for this project type. Each <a href = "#project" class="api-ref">Project</a> object of this project type can store / update values for these field. While creating or updating a <a href = "#project" class="api-ref">Project</a> user must pass arguments which are available for intended project type object. 
**fields.id**<br>`integer` | Represents unique identification number of this field, which can be used to refer or search it.
**fields.display_name** <br>`string` |Name of this field to identify it.
**fields.field_type** <br>`string` |   Represents the type of field. For example  TEXT (for Text Field), INT (for Integer Number field), DDSS (for Dropdown Single Select Field), etc. See <a href = "#user-defined-fields" class="api-ref">User Defined Fields</a> to know more about different field types.
**fields.code** <br>`string` | It represents the unique code of the field which is referred as API code. This code acts as `key` in API response and the same must be used as `key` to pass values for a POST or PUT request.
**fields.minlength** <br>`integer` |  Represents minimum no of characters in value this field can accept. <span class="warning">Only applicable for text fields</span>.
**fields.maxlength** <br>`integer` |  Represents maximum no of characters in value this field can accept. <span class="warning">Only applicable for text fields</span>.
**fields.regex** <br>`string` |  Represents regular expression which must be matched by value for this field. <span class="warning">Only applicable for text fields</span>.
**fields.minnum** <br>`integer` |  Represents minimum value this field can accept. <span class="warning">Only applicable for numeric fields</span>.
**fields.maxnum** <br>`integer` |  Represents maximum value this field can accept. <span class="warning">Only applicable for numeric fields</span>.
**fields.mindate** <br>`string` |  Represents minimum value this field can accept. <span class="warning">Only applicable for date / date time fields</span>.
**fields.maxdate** <br>`string` |  Represents maximum value this field can accept. <span class="warning">Only applicable for date / date time field</span>.
**fields.is_required** <br>`boolean` |Indicates whether this field is mandatory or not. If this field is a required field then a valid value for this field must be passed while creating such object and while updating object (if this field is intended to update).
**is_system_defined** <br> `boolean` | Indicates whether this field is system defined or a custom field. Fields which are system defined can not be customized.
**fields.options** <br>`string` |Field types such as Dropdown Single Select, Dropdown Multi Select, Radio Group etc. ( See <a href = "#user-defined-fields" class="api-ref">User Defined Fields</a> to know more. ) Allows user to pick one or more from these available options.
**fields.options.id** <br>`integer` |  Represents unique identification number for the individual option object.
**fields.options.name** <br>`string` | Represents name or content of option object.
**fields.options.color** <br> `string` | Allows a user to store color code of option object. <span class="warning">It is only available for LABEL type fields</span>.




## Get a Specific Project Type

Retrieves the details of an existing project-type. You only need to  provide the unique project-type identifier that was returned upon project-type creation.


> **`GET /v1/projecttypes/{ID}`**

>Example Request

```shell
curl -v \
"https://app.eresourcescheduler.cloud/rest/v1/projecttypes/3" \
-H "Authorization: Bearer B8x5Vj1O65r6wnoV"

```

> Example Response

```json
{
    
    "id": 3,
    "name": "Education",
    "description": "",
    "color": "#000000;1",
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
      {
        "id": 10,
        "code": "title",
        "display_name": "Project Name",
        "field_type": "ENAME",
        "minlength": 1,
        "maxlength": 255,
        "is_required": true,
        "is_system_defined": true
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
| **403** <br> <span class = "error">`Forbidden`</span> | Authorization failed due to insufficient permissions. This occurs when user does not have enough access rights to perform this action. Access for each user can be controlled by an Administrator using eRS Cloud Application.|
|  **404** <br><span class = "error">`Not Found`</span> |This status code indicates that project-type ID does not exist.|


## Get All Project Types

Returns a list of project-types. The project-types are returned sorted by name.

> **`GET /v1/projecttypes`**

> Example Request

```shell
curl -v \
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
      "color": "#000000;1",
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
        {
        "id": 10,
        "code": "title",
        "display_name": "Project Name",
        "field_type": "ENAME",
        "minlength": 1,
        "maxlength": 255,
        "is_required": true,
        "is_system_defined": true
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
| **403** <br> <span class = "error">`Forbidden`</span> | Authorization failed due to insufficient permissions. This occurs when user does not have enough access rights to perform this action. Access for each user can be controlled by an Administrator using eRS Cloud Application.|
