# Calendars

## Calendar Object

Calendar is used to define working-timing of resources. An Administrator user can define multiple calendars using eRS Cloud application. Each calendar may have different timings defined. Timings allow breaks and multiple timing blocks. In addition to timings, user can apply holidays and exceptions (working or non-working) on calendars. A particular calendar can be applied on a set of resources and a resource can also have multiple calendars on different time periods. eRS Cloud API allows getting details of calendars.

> Example Response

```json
{
    "id": 2,
    "name": "New York Calendar",
    "description": null,
    "is_default": false,    
    "timings": [{
        "day_num": 1,
        "start_time": 540,
        "end_time": 1020
    }, {
        "day_num": 2,
        "start_time": 540,
        "end_time": 1020
    }, {
        "day_num": 3,
        "start_time": 540,
        "end_time": 1020
    }, {
        "day_num": 4,
        "start_time": 540,
        "end_time": 1020
    }, {
        "day_num": 5,
        "start_time": 540,
        "end_time": 1020
    }],
    "holidays": [{
        "id": 1,
        "name": "Christmas Day",
        "description": null,
        "date": "2018-12-25",
        "tags": []
    }],
    "exceptions": [{
        "id": 1,
        "name": "Over Time",
        "description": null,
        "date": "2018-12-20",
        "is_working_exception": true,
        "tags": [],
        "timings": [{
            "start_time": 540,
            "end_time": 1140
        }]
    }],
    "created_on": "2018-08-21T10:03:08.650207+00:00",
    "modified_on": "2018-12-03T15:09:34.697541+00:00",
    "created_by": {
        "id": 118,
        "name": "John Doe"
    },
    "modified_by": {
        "id": 118,
        "name": "John doe"
    }
}
```

<span class="optional"><b>ATTRIBUTES</b></span>

Name | Description
---------: | :-----------
**id**  <br>`integer` |  Unique identifier for the object.
**name** <br>`string` |  A meaningful name to identify this calendar object.
**description**  <br>`string` |  Description for calendar object.
**is_default**<br> `boolean`| Indicates whether this calendar object is used as a default calendar or not. There can only be one (which can be changed from <a href="https://app.eresourcescheduler.cloud/#!/admin/calendars/settings" target="_blank" class="api-ref">Administrator calendar settings</a>) default calendar at a time. Default calendar gets applied as working calendar, if calendar is not specified while creating a resource.
**timings** <br> `array of objects` | List of timing objects applicable for this calendar object. Timing objects (or `timing_blocks`) are used to define working capacity for each day of week.
**timings.day_num** <br> `integer` | Represents day of week, starting from 0 (for Sunday) to 6 (for Saturday).
**timings.start_time** <br> `integer` | Represents start time for this timing block in minutes (since 12 AM) i.e. for 6:00 AM, value would be 6 * 60 = 360 and for 9:00 AM it would be 9 * 60 = 540.
**timings.end_time** <br> `integer` | Represents end time for this timing block in minutes (since 12 AM) i.e. for 5:00 PM, value would be (12+5) * 60 = 1020.
**holidays**<br>`array of objects` | List of holiday objects applied for this calendar. There can be multiple holidays applied on calendar. 
**holidays.id**<br>`integer` | Unique identifier for holiday object. 
**holidays.name**<br>`string` | Name of holiday.
**holidays.description**<br>`string` | Description for this holiday object.
**holidays.date**<br>`string`| Represents date on which holiday occurs. This is a string value in ISO 8601 extended Date format i.e. yyyy-mm-dd.
**holidays.tags**<br>`array of string` | Tags are the list of strings (labels) attached to this holiday object which could be used for the purpose of identification or other information.
**exceptions**<br>`array of objects`| List of exception objects that are applied on calendar object. Exceptions are used to override working timing of calendar for a specified day.
**exceptions.id**<br>`integer` | Unique identifier for exception object. 
**exceptions.name**<br>`string` | Name of exception object (which is to be displayed wherever referred).
**exceptions.description**<br>`string` | Description for exception object.
**exceptions.date**<br>`string` | Represents date on which exception is to be applied. This is a string value in ISO 8601 extended Date format i.e. yyyy-mm-dd.
**exceptions.is_working_exception**<br>`boolean` | Indicates whether this exception is working exception or non-working. A working exception is used to override timings of a working day and if applied on a non-working day, it turns it into working day. A non-working exception turns any working day into non-working.
**exceptions.timings**<br>`array of objects` | List of timing objects (or `timing_blocks`) for this exception. This defines working timings for this exception day. There are no timings if exception is a non-working exception.
**exceptions.timings.start_time** <br> `integer` | Represents start time for this timing block in minutes (since 12 AM) i.e. for 6:00 AM, value would be 6 * 60 = 360 and for 9:00 AM it would be 9 * 60 = 540.
**exceptions.timings.end_time** <br> `integer` | Represents end time for this timing block in minutes (since 12 AM) i.e. for 5:00 PM, value would be (12+5) * 60 = 1020.
**exceptions.tags**<br>`array of string` | Tags are the list of strings (labels) attached to this exception object which could be used for the purpose of identification or other information.
**created_on** <br>`string`  | Timestamp at which calendar object was created.
**modified_on** <br>`string` | Describes the latest modification timestamp.
**created_by** <br> `object` | Describes by whom calendar object was created.|
**modified_by** <br>`object` | This field describes by whom last modification was done.

## List Calendars


Retrieves all available list of calendars. 


> **`GET /v1/calendars`**


> Example Request

```shell
curl -v \
"https://app.eresourcescheduler.cloud/rest/v1/calendars" \
-H "Authorization: Bearer B8x5Vj1O65r6wnoV"
```


> Example Response

```json
{
  "total_count": 4,
  "data": [{
      "id": 2,
      "name": "New York Calendar",
      "description": null,
      "is_default": false,
      "timings": [{
        "day_num": 1,
        "start_time": 540,
        "end_time": 1020
      }, {
        "day_num": 2,
        "start_time": 540,
        "end_time": 1020
      }, {
        "day_num": 3,
        "start_time": 540,
        "end_time": 1020
      }, {
        "day_num": 4,
        "start_time": 540,
        "end_time": 1020
      }, {
        "day_num": 5,
        "start_time": 540,
        "end_time": 1020
      }],
      "created_on": "2018-08-21T10:03:08.650207+00:00",
      "modified_on": "2018-12-03T15:09:34.697541+00:00",
      "created_by": {
        "id": 118,
        "name": "John Doe"
      },
      "modified_by": {
        "id": 118,
        "name": "John doe"
      }
    },
    { ... },
    { ... },
    { ... }
  ]
}
```


### Returns 


| Code      | Description | 
| ---:        |    :----   | 
| **200** <br> <span class = "success">`OK`</span>      |  Indicates that the operation was successful and list of calendars has been returned successfully. |




## Retrieve a Calendar

Retrieves the specified calendar along with exceptions and holidays applied on it. 


> **`GET /v1/calendars/{ID}`**

> Example Request

```shell
curl -v \
"https://app.eresourcescheduler.cloud/rest/v1/calendars/1" \
-H "Authorization: Bearer B8x5Vj1O65r6wnoV"
```

> Example Response

```json
{
    "id": 1,
    "name": "New York Calendar",
    "description": null,
    "is_default": false,    
    "timings": [{
        "day_num": 1,
        "start_time": 540,
        "end_time": 1020
    }, {
        "day_num": 2,
        "start_time": 540,
        "end_time": 1020
    }, {
        "day_num": 3,
        "start_time": 540,
        "end_time": 1020
    }, {
        "day_num": 4,
        "start_time": 540,
        "end_time": 1020
    }, {
        "day_num": 5,
        "start_time": 540,
        "end_time": 1020
    }],
    "holidays": [{
        "id": 1,
        "name": "Christmas Day",
        "description": null,
        "date": "2018-12-25",
        "tags": []
    }],
    "exceptions": [{
        "id": 1,
        "name": "Over Time",
        "description": null,
        "date": "2018-12-20",
        "is_working_exception": true,
        "tags": [],
        "timings": [{
            "start_time": 540,
            "end_time": 1140
        }]
    }],
    "created_on": "2018-08-21T10:03:08.650207+00:00",
    "modified_on": "2018-12-03T15:09:34.697541+00:00",
    "created_by": {
        "id": 118,
        "name": "John Doe"
    },
    "modified_by": {
        "id": 118,
        "name": "John doe"
    }
}
```


### Returns

| Code      | Description | 
| ---:        |    :----   | 
| **200** <br> <span class = "success">`OK`</span>     | Indicates that the operation was successful and requested calendar has been returned successfully.
|  **404** <br><span class = "error">`Not Found`</span> | indicates that calendar object with specified calendar ID does not exist or has been deleted already.