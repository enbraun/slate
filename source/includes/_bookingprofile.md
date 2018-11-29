
# Booking Profile

## Booking profile object

> Example Request

```shell
curl -v -X GET \
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

This is an object which represents booking-profile.

<span class="optional"><b>ATTRIBUTES</b></span>

Name | Description
| ---:  |  :----   |
**id**  <br><span class="optional">`Integer`</span> | Unique identifier for the field.
**code**  <br><span class="optional">`Integer`</span> | This is an object which represents the unique code which is referred to as API code.
**field_type** <br><span class="optional">`String`</span> |  This is an object which represents the field type of booking profile. For example UNIT,TSKSS etc.
**display_name**<br><span class="optional">`String`</span> | This is an object which represents name of object.
**is_system_defined**<br><span class="optional">`Boolean`</span> | `True` value of this object shows that it is system defined field and `false` value of this field shows that it is user defined field.
**is_filterable** <br> <span class ="optional">`Boolean`</span> |Value of this field represents that it is used for filter or not. |
**minnum** <br> <span class ="optional">`Integer`</span> | This is an object which represents minimum value of field.|
**maxnum** <br> <span class ="optional">`Integer`</span> | this is an object which represents maximum value of field.|
**mindate** <br> <span class ="optional">`String`</span> |This is an object which represents minimum date of field. |
**maxdate** <br> <span class = "optional">`String`</span> |This is an object which represents maximum date of field. |


