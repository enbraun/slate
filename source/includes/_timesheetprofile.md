
# Timesheet Profile

## Timesheet profile object

Timesheet profile object represents timesheet profile.

> **`/v1/timesheet/fields`**

> Example Request

```shell
curl -v \
"https://app.eresourcescheduler.cloud/rest/v1/timesheet/fields" \
-H "Authorization: Bearer B8x5Vj1O65r6wnoV"
```
> Example Response 
 
```json
{
    "id": 62,
    "code": "date",
    "display_name": "Date",
    "field_type": "DATE",
    "is_system_defined": true,
    "is_required": true
},
{
    "id": 63,
    "code": "hours",
    "display_name": "Effort",
    "field_type": "TSEFFORT",
    "maxnum": 99999,
    "is_system_defined": true,
    "is_required": true
}
{
    "id": 65,
    "code": "time_end",
    "display_name": "End Time",
    "field_type": "TIMEWZ",
    "is_system_defined": true,
    "is_required": false
},
{
    "id": 31,
    "code": "role_id",
    "display_name": "Performing Role",
    "field_type": "ROLEPS",
    "is_required": false,
    "is_system_defined": true,
    "is_filterable": true,
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
    "is_system_defined": true,
    "is_filterable": false
},
{
    "id": 2,
    "code": "resource_id",
    "display_name": "Resource",
    "field_type": "RSRSS",
    "is_required": true,
    "is_system_defined": true,
    "is_filterable": false
},
{
    "id": 64,
    "code": "time_start",
    "display_name": "Start Time",
    "field_type": "TIMEWZ",
    "is_system_defined": true,
    "is_required": false
},
{
    "id": 32,
    "code": "tags",
    "display_name": "Tags",
    "field_type": "TAGS",
    "is_required": false,
    "is_system_defined": true,
    "is_filterable": true
},
{
    "id": 30,
    "code": "task_id",
    "display_name": "Task",
    "field_type": "TSKSS",
    "is_required": false,
    "is_system_defined": true,
    "is_filterable": false
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
**is_filterable** <br>`boolean` |Indicates whether this field is used for filtering or not. |
**is_required**<br>`boolean` |Indicates whether this field is mandatory or not. If this field is a `required` field then a valid value for this field must be passed while creating such object and while updating object (if this field is intended to update).
**minnum** <br>`integer` | Represents minimum value this field can accept (_only applicable for numeric fields_).
**maxnum** <br>`integer` | Represents maximum value this field can accept (_only applicable for numeric fields_).
**mindate** <br>`string` |Represents minimum value this field can accept (_only applicable for date / date time fields_).
**maxdate** <br>`string` |Represents maximum value this field can accept (_only applicable for date / date time fields_).


