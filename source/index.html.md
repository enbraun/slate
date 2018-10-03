---
title: eRS Cloud API Reference


language_tabs: # must be one of https://git.io/vQNgJ
  - shell
  
toc_footers:

- <a href='#'>Sign Up for a Developer Key</a>
  - <a href='https://github.com/lord/slate'>Documentation Powered by Slate</a>

includes:
  - introduction
  - authentication
  - errors
  - resourcetypes
  - projecttypes
  - calendars
  - resource
  - udftypes
  - project
  - booking
  
search: true
---

        "name":"Start Date",
        "type":"Date",
        "code":"start_date"
      }, {
        "name":"Working Calendar",
        "type":"CALSS",
        "code":"calendar"
      }, {
  },
  {
    "id": 2,
    "name": "Contractor",
    "isHuman": true,
    "fields": [
      {
        "name": "First Name",
        "type": "TEXT",
        "code": "first_name"
      }, {
        "name": "Last Name",
        "type": "TEXT",
        "code": "last_name",
      }, {
        "name":"Start Date",
        "type":"Date",
        "code":"start_date"
      }, {
        "name":"Working Calendar",
        "type":"CALSS",
        "code":"calendar"
      }
    ]
      "name":"Start Date",
      "type":"Date",
      "code":"start_date"
    }, {
      "name":"Working Calendar",
      "type":"CALSS",
      "code":"calendar"
    }, {
# Projects Types
## Get All Projects Types

```shell
curl "https://app.eresourcescheduler.cloud/rest/v1/projecttype"
  -H "Authorization: Bearer B8x5Vj1O65r6wnoV"
```
> The above command returns JSON structured like this:

```json
[
  {
    "id": 1,
    "name": "Standard",
    "fields": [
      {
        "name": "Project Name",
        "type": "TEXT",
        "code": "title"
      },{
        "name":"Start Date",
        "type":"Date",
        "code":"project_start_date"
      },{
        "name":"Color",
        "type":"COLPICK",
        "code":"color"
      }
    ]
  },
  {
    "id": 2,
    "name": "Engineering",
    "fields": [
      {
        "name": "Project Name",
        "type": "TEXT",
        "code": "title"
      },{
        "name":"Start Date",
        "type":"Date",
        "code":"project_start_date"
      },{
        "name":"Color",
        "type":"COLPICK",
        "code":"color"
      }
    ]
  }
]
```
This endpoint retrieves all Projects Types.

### HTTP Request

`GET https://app.eresourcescheduler.cloud/rest/v1/projecttype`


## Get a Specific Project Type

```shell
curl "https://app.eresourcescheduler.cloud/rest/v1/projecttype/1"
  -H "Authorization: Bearer B8x5Vj1O65r6wnoV"
```

> The above command returns JSON structured like this:

```json
{
  "id": 1,
  "name": "Standard",
  "fields": [
    {
      "name": "Project Name",
      "type": "TEXT",
      "code": "title"
    },{
      "name":"Start Date",
      "type":"Date",
      "code":"project_start_date"
    },{
      "name":"Color",
      "type":"COLPICK",
      "code":"color"
    }
  ]
}
```

This endpoint retrieves a project type.

### HTTP Request

`GET https://app.eresourcescheduler.cloud/rest/v1/projecttype/<ID>`

### URL Parameters

Parameter | Description
--------- | -----------
ID | The ID of the project type to retrieve