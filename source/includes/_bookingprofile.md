
# Booking Profile

## Booking profile object

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
    "is_mandatory_required": false,
    "is_system_defined": true,
    "is_filterable": false
},
{
    "id": 17,
    "code": "end_time",
    "display_name": "Ends",
    "field_type": "DATIM",
    "is_mandatory_required": true,
    "is_system_defined": true,
    "is_filterable": false,
    "maxdate": "2099-12-31",
    "mindate": "1900-01-01"
},
{
    "id": 31,
    "code": "role_id",
    "display_name": "Performing Role",
    "field_type": "ROLEPS",
    "is_mandatory_required": false,
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
    "is_mandatory_required": true,
    "is_system_defined": true,
    "is_filterable": false
},
{
    "id": 2,
    "code": "resource_id",
    "display_name": "Resource",
    "field_type": "RSRSS",
    "is_mandatory_required": true,
    "is_system_defined": true,
    "is_filterable": false
},
{
    "id": 16,
    "code": "start_time",
    "display_name": "Starts",
    "field_type": "DATIM",
    "is_mandatory_required": true,
    "is_system_defined": true,
    "is_filterable": false,
    "maxdate": "2099-12-31",
    "mindate": "1900-01-01"
},
{
    "id": 32,
    "code": "tags",
    "display_name": "Tags",
    "field_type": "TAGS",
    "is_mandatory_required": false,
    "is_system_defined": true,
    "is_filterable": true
},
{
    "id": 30,
    "code": "task_id",
    "display_name": "Task",
    "field_type": "TSKSS",
    "is_mandatory_required": false,
    "is_system_defined": true,
    "is_filterable": false
},
{
    "id": 5,
    "code": "unit",
    "display_name": "Unit",
    "field_type": "UNIT",
    "minnum": 1,
    "maxnum": 5,
    "is_mandatory_required": false,
    "is_system_defined": true,
    "is_filterable": false
}

```



<span class="optional"><b>ATTRIBUTES</b></span>

Name | Description
| ---:  |  :----   |
**id**  <br><span class="optional">`integer`</span> |  Represents unique identification number of this field, which can be used to refer or search it.
**code**  <br><span class="optional">`integer`</span> |  It represents the unique code of the field which is referred to as API code. This code acts as `key` in API response and the same must be used as `key` to pass values for a POST or PUT request.
**field_type** <br><span class="optional">`string`</span> | Represents the type of field. For example  TEXT (for Text Field), INT (for Integer Number field), DDSS (for Dropdown Single Select Field), etc. See [User Defined Fields] (#user-defined-fields) to know more about different field types.
**display_name**<br><span class="optional">`string`</span> |Name of this field to identify it.
**is_system_defined**<br><span class="optional">`boolean`</span> |  Indicates whether this field is system defined or a custom field. Fields which are system defined can not be customized.
**is_filterable** <br> <span class ="optional">`boolean`</span> |Indicates whether this field is used for filtering or not. |
**is_mandatory_required**<br> <span class ="optional">`boolean`</span> |Indicates whether this field is mandatory or not. If this field is a `required` field then a valid value for this field must be passed while creating such object and while updating object (if this field is intended to update).
**minnum** <br> <span class ="optional">`integer`</span> | Represents minimum value this field can accept (_only applicable for numeric fields_).
**maxnum** <br> <span class ="optional">`integer`</span> | Represents maxmum value this field can accept (_only applicable for numeric fields_).
**mindate** <br> <span class ="optional">`string`</span> |Represents minimum value this field can accept (_only applicable for date / date time fields_).
**maxdate** <br> <span class = "optional">`string`</span> |Represents maxmum value this field can accept (_only applicable for date / date time fields_).


