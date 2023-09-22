
# Requirement Profile

## Requirement Profile Object

Requirement profile object represents requirement profile.

> **`/v1/requirement/fields`**

> Example Request

```shell
curl -v \
"https://app.eresourcescheduler.cloud/rest/v1/requirement/fields" \
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
    "is_system_defined":true,
    "is_required": true
},
{
    "id": 17,
    "code": "end_time",
    "display_name": "Ends",
    "field_type": "DATIM",
    "is_required": true,
    "is_system_defined": true,
    "maxdate": "2099-12-31",
    "mindate": "1900-01-01"
},
{
    "id": 31,
    "code": "role_id",
    "display_name": "Performing Role",
    "field_type": "ROLEPS",
    "is_required": false,
    "is_system_defined": true,
    "options": [
         {
            "id":6,
            "name":"Accountant",
            "description": null
         },
         {
            "id":7,
            "name":"Business Analyst",
            "description":null},
         {
            "id":4,
            "name":"Consultant",
            "description":null},
         {
            "id":5,
            "name":"Project Manager",
            "description":null},
         {
            "id":3,
            "name":"Tax Manager",
            "description":null}
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
    "id": 16,
    "code": "start_time",
    "display_name": "Starts",
    "field_type": "DATIM",
    "is_required": true,
    "is_system_defined": true,
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
    "is_required": false,
    "is_system_defined": true
}

```



<span class="optional"><b>ATTRIBUTES</b></span>

Name | Description
| ---:  |  :----   |
**id**  <br>`integer` |  Represents unique identification number of this field, which can be used to refer or search it.
**code**  <br>`string` |  It represents the unique code of the field which is referred as API code. This code acts as `key` in API response and the same must be used as `key` to pass values for a POST or PUT request.
**field_type** <br>`string` |  Represents the type of field. For example  TEXT (for Text Field), INT (for Integer Number field), DDSS (for Dropdown Single Select Field), etc. 
**display_name**<br>`string` |Name of this field to identify it.
**is_system_defined**<br>`boolean` |  Indicates whether this field is system defined or a custom field. Fields which are system defined can not be customized.
**is_required**<br>`boolean` |Indicates whether this field is mandatory or not. If this field is a required field then a valid value for this field must be passed while creating such object and while updating object (if this field is intended to update).
**minnum** <br>`integer` | Represents minimum value this field can accept. <span class="warning">Only applicable for numeric fields</span>.
**maxnum** <br>`integer` | Represents maximum value this field can accept. <span class="warning">Only applicable for numeric fields</span>.
**mindate** <br>`string` |Represents minimum value this field can accept. <span class="warning">Only applicable for date / date time fields</span>.
**maxdate** <br>`string` |Represents maximum value this field can accept. <span class="warning">Only applicable for date / date time fields</span>.
**options** <br> `array of objects` | Field types such as Dropdown Single Select, Dropdown Multi Select, Radio Group etc.
**options.id** <br> `integer` |   Represents unique identification number for the individual option object.
**options.name** <br> `string` | Represents name or content of option object.
