# Resource Types

##  Resource Type Object
 

> Example Response

```json
{
  "id": 1,
  "name": "Employee",
  "description": "",
  "is_human": true,
  "fields": [{
      "id": 52,
      "code": "udf_department",
      "display_name": "Department",
      "field_type": "DDSS",
      "is_required": false,
      "is_system_defined": false,
      "options": [{
          "id": 27,
          "name": "Service",
          "description": null
        },
        {
          "id": 26,
          "name": "Technical",
          "description": null
        },
        { ... }
      ]
    }, {
      "id": 11,
      "code": "email",
      "display_name": "Email",
      "field_type": "EMAIL",
      "placeholder_text": "Enter valid email id",
      "maxlength": 254,
      "regex": "^[a-zA-Z]+[a-zA-Z0-9._]+@[a-zA-Z]+\\.[a-zA-Z.]{2,5}$",
      "is_required": false,
      "is_system_defined": true
    }, {
      "id": 46,
      "code": "udf_employee_no",
      "display_name": "Employee No.",
      "field_type": "TEXT",
      "minlength": 1,
      "maxlength": 10,
      "is_required": false,
      "is_system_defined": false
    }, {
      "id": 7,
      "code": "first_name",
      "display_name": "First Name",
      "field_type": "TEXT",
      "help_text": "",
      "placeholder_text": "Enter first name",
      "minlength": 1,
      "maxlength": 100,
      "is_required": true,
      "is_system_defined": true
    }, {
      "id": 8,
      "code": "last_name",
      "display_name": "Last Name",
      "field_type": "TEXT",
      "placeholder_text": "Enter last name",
      "maxlength": 100,
      "is_required": false,
      "is_system_defined": true
    }, {
      "id": 14,
      "code": "last_date",
      "display_name": "Last Working Date",
      "field_type": "DATE",
      "is_required": false,
      "is_system_defined": true,
      "maxdate": "2099-12-31",
      "mindate": "1900-01-01"
    }, {
      "id": 45,
      "code": "udf_office",
      "display_name": "Office",
      "field_type": "DDSS",
      "is_required": false,
      "is_system_defined": false,
      "options": [{
          "id": 8,
          "name": "Chicago",
          "description": null
        }, {
          "id": 11,
          "name": "Dallas",
          "description": null
        }, {
          "id": 10,
          "name": "New York",
          "description": null
        }, {
          "id": 12,
          "name": "San Francisco",
          "description": null
        }, {
          "id": 9,
          "name": "Washington",
          "description": null
        },
        { ... }
      ]
    }, {
      "id": 26,
      "code": "phone",
      "display_name": "Phone",
      "field_type": "TEXT",
      "maxlength": 50,
      "is_required": false,
      "is_system_defined": true
    },
    { ... }
  ]
}
```

Resource type object represents the type of resource. In an organization, there can be multiple types of resources. Administrator can add multiple resource types using eRS Cloud application. Resource type can be categorized as human or non-human. Human type of resource can be `Employee`, `Contractor`, etc. and non-human can be `Meeting Rooms`, `Projectors` etc. Different resource type object can be configured to have different set of custom attributes as well, which allows customizing resource objects to fit your requirements.


<span class="optional"><b>ATTRIBUTES</b></span>

Name | Description
---------: | :-----------
**id**  <br>`integer` |  Unique identification number for the object, which allows referring to this object and can be used to search a particular resource type.
**name** <br> `string` | Represent name for this object. This is used to identify object by using some meaningful phrase to describe type of resources like `Employee`, `Machine` etc.
**isHuman** <br> `boolean` | Indicates whether this resource type is `human` or `non-human`. For example, `Employee` could be a human resource type while `Machine`, `Meeting Rooms` etc. can be non-human resource type.
**fields** <br> `array of object`  | Represent collection of fields (or attributes) that are available for this resource type. Each [Resource] (#resource) object of this resource type can store / update values for these filed. While creating or updating a [Resource] (#resource) user must pass arguments which are available for intended resource type object. 
**field.id**<br> `integer` | Represents unique identification number of this field, which can be used to refer or search it.
**field.display_name** <br> `string`  | Name of this field to identify it.
**field.field_type** <br>`string` |  Represents the type of field. For example  TEXT (for Text Field), INT (for Integer Number field), DDSS (for Dropdown Single Select Field), etc. See [User Defined Fields] (#user-defined-fields) to know more about different field types.
**field.code** <br>`string` | It represents the unique code of the field which is referred to as API code. This code acts as `key` in API response and the same must be used as `key` to pass values for a POST or PUT request.
**field.minlength** <br>`integer` |  Represents minimum no of characters in value this field can accept (_only applicable for text fields_).
**field.maxlength** <br>`integer` |  Represents maximum no of characters in value this field can accept (_only applicable for text fields_).
**field.regex** <br>`string` |  Represents regular expression which must be matched by value for this field (_only applicable for text fields_).
**field.minnum** <br>`integer` |  Represents minimum value this field can accept (_only applicable for numeric fields_).
**field.maxnum** <br>`integer` |  Represents maximum value this field can accept (_only applicable for numeric fields_).
**field.mindate** <br>`string` |  Represents minimum value this field can accept (_only applicable for date / date time fields_).
**field.maxdate** <br>`string` |  Represents maximum value this field can accept (_only applicable for date / date time fields_).
**field.is_required** <br> `boolean` | Indicates whether this field is mandatory or not. If this field is a `required` field then a valid value for this field must be passed while creating such object and while updating object (if this field is intended to update).
**is_system_defined** <br> `boolean` | Indicates whether this field is system defined or a custom field. Fields which are system defined can not be customized.
**field.options** <br> `array of objects` | Field types such as Dropdown Single Select, Dropdown Multi Select, Radio Group etc. ( See [User Defined Fields](#user_defined_fields) to know more.) allow user to pick one or more from these available options.
**field.option.id** <br> `integer` |   Represents unique identification number for the individual option object.
**field.option.name** <br> `string` | Represents name or content of option object.



## Get a Specific Resource Type

>  `GET /v1/resourcetypes/{ID}`

Retrieves the details of an existing resource-type. You only need to  provide the unique resource-type identifier of required resource-type.

>Example Request

```shell
curl -v \
"https://app.eresourcescheduler.cloud/rest/v1/resourcetypes/2"\
 -H "Authorization: Bearer B8x5Vj1O65r6wnoV"
```

>Example Response


```json
{
  "id": 1,
  "name": "Employee",
  "description": "",
  "is_human": true,
  "fields": [{
      "id": 52,
      "code": "udf_department",
      "display_name": "Department",
      "field_type": "DDSS",
      "is_required": false,
      "is_system_defined": false,
      "options": [{
          "id": 27,
          "name": "Service",
          "description": null
        },
        {
          "id": 26,
          "name": "Technical",
          "description": null
        },
        { ... }
      ]
    }, {
      "id": 11,
      "code": "email",
      "display_name": "Email",
      "field_type": "EMAIL",
      "placeholder_text": "Enter valid email id",
      "maxlength": 254,
      "regex": "^[a-zA-Z]+[a-zA-Z0-9._]+@[a-zA-Z]+\\.[a-zA-Z.]{2,5}$",
      "is_required": false,
      "is_system_defined": true
    }, {
      "id": 46,
      "code": "udf_employee_no",
      "display_name": "Employee No.",
      "field_type": "TEXT",
      "minlength": 1,
      "maxlength": 10,
      "is_required": false,
      "is_system_defined": false
    }, {
      "id": 7,
      "code": "first_name",
      "display_name": "First Name",
      "field_type": "TEXT",
      "help_text": "",
      "placeholder_text": "Enter first name",
      "minlength": 1,
      "maxlength": 100,
      "is_required": true,
      "is_system_defined": true
    }, {
      "id": 8,
      "code": "last_name",
      "display_name": "Last Name",
      "field_type": "TEXT",
      "placeholder_text": "Enter last name",
      "maxlength": 100,
      "is_required": false,
      "is_system_defined": true
    }, {
      "id": 14,
      "code": "last_date",
      "display_name": "Last Working Date",
      "field_type": "DATE",
      "is_required": false,
      "is_system_defined": true,
      "maxdate": "2099-12-31",
      "mindate": "1900-01-01"
    }, {
      "id": 45,
      "code": "udf_office",
      "display_name": "Office",
      "field_type": "DDSS",
      "is_required": false,
      "is_system_defined": false,
      "options": [{
          "id": 8,
          "name": "Chicago",
          "description": null
        }, {
          "id": 11,
          "name": "Dallas",
          "description": null
        }, {
          "id": 10,
          "name": "New York",
          "description": null
        }, {
          "id": 12,
          "name": "San Francisco",
          "description": null
        }, {
          "id": 9,
          "name": "Washington",
          "description": null
        },
        { ... }
      ]
    }, {
      "id": 26,
      "code": "phone",
      "display_name": "Phone",
      "field_type": "TEXT",
      "maxlength": 50,
      "is_required": false,
      "is_system_defined": true
    },
    { ... }
  ]
}
```


### Returns

| Code      | Description | 
| ---:      |    :----    | 
| **200** <br> <span class = "success">`OK`</span> | Indicates that operation was successful and  retrieved a resource-type successfully.  |
|  **404** <br><span class = "error">`Not Found`</span> | Indicates that no resource-type object was found with provided identifier.


## Get All Resource Types

>  `GET /v1/resourcetypes`

Returns a list of all resource-types sorted by name.

> Example Request

```shell
curl -v "https://app.eresourcescheduler.cloud/rest/v1/resourcetypes"\
 -H "Authorization: Bearer B8x5Vj1O65r6wnoV"
```

> Example Response

```json
{
  "total_count": 4,
  "data": [{
      "id": 1,
      "name": "Employee",
      "description": "",
      "is_human": true,
      "fields": [{
          "id": 52,
          "code": "udf_department",
          "display_name": "Department",
          "field_type": "DDSS",
          "is_required": false,
          "is_system_defined": false,
          "options": [{
              "id": 27,
              "name": "Service",
              "description": null
            },
            {
              "id": 26,
              "name": "Technical",
              "description": null
            },
            { ... }
          ]
        }, {
          "id": 11,
          "code": "email",
          "display_name": "Email",
          "field_type": "EMAIL",
          "placeholder_text": "Enter valid email id",
          "maxlength": 254,
          "regex": "^[a-zA-Z]+[a-zA-Z0-9._]+@[a-zA-Z]+\\.[a-zA-Z.]{2,5}$",
          "is_required": false,
          "is_system_defined": true
        }, {
          "id": 46,
          "code": "udf_employee_no",
          "display_name": "Employee No.",
          "field_type": "TEXT",
          "minlength": 1,
          "maxlength": 10,
          "is_required": false,
          "is_system_defined": false
        }, {
          "id": 7,
          "code": "first_name",
          "display_name": "First Name",
          "field_type": "TEXT",
          "help_text": "",
          "placeholder_text": "Enter first name",
          "minlength": 1,
          "maxlength": 100,
          "is_required": true,
          "is_system_defined": true
        }, {
          "id": 8,
          "code": "last_name",
          "display_name": "Last Name",
          "field_type": "TEXT",
          "placeholder_text": "Enter last name",
          "maxlength": 100,
          "is_required": false,
          "is_system_defined": true
        }, {
          "id": 14,
          "code": "last_date",
          "display_name": "Last Working Date",
          "field_type": "DATE",
          "is_required": false,
          "is_system_defined": true,
          "maxdate": "2099-12-31",
          "mindate": "1900-01-01"
        }, {
          "id": 26,
          "code": "phone",
          "display_name": "Phone",
          "field_type": "TEXT",
          "maxlength": 50,
          "is_required": false,
          "is_system_defined": true
        },
        { ... }
      ]
    },
    { ... }
  ]
}

```



### Returns

| Code      | Description | 
| ---:        |    :----   | 
| **200** <br> <span class = "success">`OK`</span>      |  This indicates that the operation was successful and  list of resource-types is returned.  |



