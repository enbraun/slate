
# Booking Profile

## Booking Profile Object

Booking profile object represents booking profile.

> **`/v1/booking/fields`**

> Example Request

```shell
curl -v \
"https://app.eresourcescheduler.cloud/rest/v1/booking/fields" \
-H "Authorization: Bearer B8x5Vj1O65r6wnoV"
```
> Example Response 
 
```json
{
    "id": 29,
    "code": "effort",
    "display_name": "Effort",
    "field_type": "EFFORT",
    "minnum": 0,
    "is_required": false,
    "is_system_defined": true
},
{
    "id": 17,
    "code": "end_time",
    "display_name": "Ends",
    "field_type": "DATIM",
    "is_required": true,
    "is_system_defined": true
    "maxdate": "2099-12-31",
    "mindate": "1900-01-01"
},
{
    "id": 31,
    "code": "role_id",
    "display_name": "Performing Role",
    "field_type": "ROLEPS",
    "is_required": false,
    "is_system_defined": true
    "options": [
         {
            "id": 5,
            "name": "Architect",
            "description": null
         },
         {...},
         {...}
    ]
},
{
    "id": 3,
    "code": "project_id",
    "display_name": "Project",
    "field_type": "PRJSS",
    "is_required": true,
    "is_system_defined": true
},
{
    "id": 2,
    "code": "resource_id",
    "display_name": "Resource",
    "field_type": "RSRSS",
    "is_required": true,
    "is_system_defined": true
},
{
    "id": 16,
    "code": "start_time",
    "display_name": "Starts",
    "field_type": "DATIM",
    "is_required": true,
    "is_system_defined": true
    "maxdate": "2099-12-31",
    "mindate": "1900-01-01"
},
{
    "id": 32,
    "code": "tags",
    "display_name": "Tags",
    "field_type": "TAGS",
    "is_required": false,
    "is_system_defined": true
},
{
    "id": 30,
    "code": "task_id",
    "display_name": "Task",
    "field_type": "TSKSS",
    "is_required": false,
    "is_system_defined": true
},
{
    "id": 5,
    "code": "unit",
    "display_name": "Unit",
    "field_type": "UNIT",
    "minnum": 1,
    "maxnum": 5,
    "is_required": false,
    "is_system_defined": true
}

```



<span class="optional"><b>ATTRIBUTES</b></span>

Name | Description
| ---:  |  :----   |
**id**  <br>`integer` |  Represents unique identification number of this field, which can be used to refer or search it.
**code**  <br>`string` |  It represents the unique code of the field which is referred as API code. This code acts as `key` in API response and the same must be used as `key` to pass values for a POST or PUT request.
**field_type** <br>`string` | Represents the type of field. For example  TEXT (for Text Field), INT (for Integer Number field), DDSS (for Dropdown Single Select Field), etc. See <a href = "#user-defined-fields" class="api-ref">User Defined Fields</a> to know more about different field types.
**display_name**<br>`string` |Name of this field to identify it.
**is_system_defined**<br>`boolean` |  Indicates whether this field is system defined or a custom field. Fields which are system defined can not be customized.
**is_required**<br>`boolean` |Indicates whether this field is mandatory or not. If this field is a required field then a valid value for this field must be passed while creating such object and while updating object (if this field is intended to update).
**regex** <br>`string` |  Represents regular expression which must be matched by value for this field. <span class="warning">Only applicable for text fields</span>.
**fields.minlength** <br>`integer` |  Represents minimum no of characters in value this field can accept. <span class="warning"> Only applicable for text fields</span>.
**fields.maxlength** <br>`integer` |  Represents maximum no of characters in value this field can accept. <span class="warning">Only applicable for text fields<span>.
**minnum** <br>`integer` | Represents minimum value this field can accept. <span class="warning">Only applicable for numeric fields</span>.
**maxnum** <br>`integer` | Represents maximum value this field can accept. <span class="warning">Only applicable for numeric fields</span>.
**mindate** <br>`string` |Represents minimum value this field can accept. <span class="warning">Only applicable for date / date time fields</span>.
**maxdate** <br>`string` |Represents maximum value this field can accept. <span class="warning">Only applicable for date / date time fields</span>.
**options** <br> `array of objects` | Field types such as Dropdown Single Select, Dropdown Multi Select, Radio Group etc. ( See <a href="#user-defined-fields" class = "api-ref">User Defined Fields</a> to know more. ) Allows user to pick one or more from these available options.
**options.id** <br> `integer` |   Represents unique identification number for the individual option object.
**options.name** <br> `string` | Represents name or content of option object.
**options.color** <br> `string` | Allows a user to store color code of option object. <span class="warning">It is only available for LABEL type fields</span>.