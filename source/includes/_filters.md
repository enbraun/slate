# Filter

> POST https://app.eresourcescheduler.cloud/rest/v1/resources/search 

Filtering API responses to retrieve specific data.


## Getting started with filters 

``` 
curl "https://app.eresourcescheduler.cloud/rest/v1/resources/se"\
  -H "Authorization: Bearer B8x5Vj1O65r6wnoV" 
```
The filter parameter allows for filtering the results returned from the various endpoint in various ways. For example fetching only resources having resource type id 1 by adding resource_type_id:eq=1 to your query.

Filters are made up of rules, with a user-defined or system-defined field, a filter operator and a value.

Where a field-name is a user-defined or system-defined field you want to filter against, e.g. “resource_type_id”, the value is what you want to match e.g. 1 and filter operator could be like ”eq” for ‘Equal To’ operation, ‘lt’ for “Less Than” operation and so on.

when specifying a filter, the field-name and filter operator is always separated by a colon: If an operator is omitted, then default operator (which could be different depending upon field type.) will get applied.

## Filters with multiple rules 



## Operator

The full list of all operators is shown below.


| Operator | Meaning  
| -: |:-  |
| any | Any occrances within given value. |
| all | all |
| has | has |
| eq  | equal |
| gt  | greater than |
| lt | less than |
| bt | between |
| ex | exclude |



## Filters for System-defined fields

|**Field Type**| **Available Operator**  | **Description & Example**|
|:--|:--|:--|
|**Resource Type**|eq(defualt), any|**Example:** <br><ul><li>-d resource_type_id=1 </li><li>-d resource_type_id:eq=2  </li><li>-d resource_type_id:any=1\ &#124;2 </li></ul> 
|**Name**| has(default), eq |**Example:** <br><ul><li>-d name="Chris" </li><li>-d name:eq="Amy Jones" </li><li>--d name:has="c" </li></ul> 
|**Roles**| any(default), all|**Example:** <br><ul><li>-d roles=1\ &#124;2\  &#124;3</li><li>-d roles:any=2 &#124;5</li><li>-d roles:all=4\ &#124;6</li></ul>
|**Tags**| any(default), all|**Example:** <br><ul><li>-d tags=1\ &#124;2\  &#124;3</li><li>-d tags:any=2 &#124;5</li><li>-d tags:all=4\ &#124;6</li></ul>
|**Email**| has(default), eq |**Example:** <br><ul><li>-d email='@'</li><li>-d email:has='a' </li><li>-d email:eq='ana.steele@mycompany.com' </li></ul>  
|**Phone**| has(default), eq |**Example:** <br><ul><li>-d phone=999 </li><li>-d phone:eq='(485)555-0202' </li><li>-d phone:has=753 </li></ul> 
|**Start Date**|  eq(default), lt, gt, bt, ex |**Example:** <br><ul><li>-d start_date=2016-01-27</li><li>-d start_date:eq=2016-01-27</li><li>-d start_date:lt=1999-12-22 </li><li>-d start_date:gt=1990-01-11 </li><li>-d start_date:bt=2001-01-01\ &#124;2010-12-31</li><li>-d start_date:bt=2001-01-01 </li><li>-d start_date:ex=1992-02-12\ &#124;1997-01-27 </li><li>-d start_date:ex=1992-02-12 </li></ul>
|**Last Working Date**|  eq(default), lt, gt, bt, ex |**Example:** <br><ul><li>-d last_date=2018-04-19</li><li>-d last_date:eq=2016-05-17</li><li>-d last_date:lt=2002-12-31 </li><li>-d last_date:gt=2010-01-01 </li><li>-d last_date:bt=1995-12-31\ &#124;1999-01-01</li><li>-d last_date:bt=1995-12-31 </li><li>-d last_date:ex=2001-01-01\ &#124;2002-01-01 </li><li>-d last_date:ex=2003-01-01 </li></ul>  
  




## Filters for User-defined fields

|**Field Type**| **Available Operator**  | **Description & Example**|
|:--|:--|:--|
|**Simple Text**| has *(default)*, eq |**Example:** <br><ul><li>-d simtext='Simple Text' (default) </li><li>-d simtext:has='Simple Text' </li><li>-d simtext:eq='Simple Text Ed' </li></ul> 
|**Integer Number**| eq(default), lt, gt, bt, ex |**Example:** <br><ul><li>-d int_test=41 </li><li>-d int_test:eq=41 </li><li>-d int_test:lt=41</li><li>-d int_test:gt=41</li><li>-d int_test:lt=41</li><li>-d int_test:bt=41\ &#124;121</li><li>-d int_test:bt=41</li><li>-d int_test:ex=41\ &#124;121</li><li>-d int_test:ex=41</li></ul>  
|**Fractional Number**| eq(default), lt, gt, bt, ex |**Example:** <br><ul><li>-d float_test=12.1 </li><li>-d float_test:eq=12.1 </li><li>-d float_test:lt=45.6</li><li>-d float_test:gt=121.1</li><li>-d float_test:bt=1.0\ &#124;121.1</li><li>-d float_test:bt=22.6</li><li>-d float_test:ex=15.7\ &#124;45.6</li><li>-d float_test:ex=45.6</li></ul>  
|**Date**|  eq(default), lt, gt, bt, ex |**Example:** <br><ul><li>-d emp_birthday=1992-02-12</li><li>-d emp_birthday:eq=1992-02-12</li><li>-d emp_birthday:lt=1992-02-12 </li><li>-d emp_birthday:gt=1992-02-12 </li><li>-d emp_birthday:bt=1992-02-12\ &#124;1999-07-07</li><li>-d emp_birthday:bt=1992-02-12 </li><li>-d emp_birthday:ex=1992-02-12\ &#124;1997-01-27 </li><li>-d emp_birthday:ex=1992-02-12 </li></ul>  
|**DateTime**| eq(default), lt, gt, bt, ex |**Example:** <br><ul><li>-d date_time_test="2018-06-06T18:30:00Z" </li><li>-d date_time_test:eq="2018-06-06T18:30:00Z"</li><li>-d date_time_test:lt="2018-06-06T18:30:00Z"</li><li>-d date_time_test:gt="2018-06-06T18:30:00Z"</li><li>-d date_time_test:bt=2018-06-06T18:30:00Z\ &#124; 2018-06-06T18:30:00Z </li><li>-d date_time_test:bt="2018-06-06T18:30:00Z"</li><li>-d date_time_test:ex="2018-06-06T18:30:00Z\ &#124; 2018-06-06T18:30:00Z </li><li>-d date_time_test:ex="2018-06-06T18:30:00Z" </li></ul>  
|**Email**| has(default), eq |**Example:** <br><ul><li>-d email='@'</li><li>-d email:has='a' </li><li>-d email:eq='ana.steele@mycompany.com' </li></ul>  
|**Checkbox**|Default value is true, accepts value true and false |**Example:** <br><ul><li>-d check_test=true </li><li>-d check_test=false </li></ul> 
|**Checkbox Group**| any(default), all|**Example:** <br><ul><li>-d check_group_test=16\ &#124;18</li><li>-d check_group_test:any=17\ &#124;10</li><li>-d check_group_test:all=16\ &#124;17</li></ul>    
|**Radio Group**|eq(default), any |**Example:** <br><ul><li>-d radio_test=15 </li><li>-d radio_test:eq=15 </li><li>-d radio_test:any=15 </li></ul>  
|**Label**|eq(default), any |**Example:** <br><ul><li>-d label_test=18 </li><li>-d label_test:eq=18 </li><li>-d label_test:any=18 </li></ul>  
|**Drop Down Single Select**| eq(default), any |**Example:** <br><ul><li>-d ddss_test=15 </li><li>-d ddss_test:eq=15 </li><li>-d ddss_test:any=15 </li></ul>  
|**Drop Down Multi Select**| any(default), all|**Example:** <br><ul><li>-d ddms_test=20\ &#124;21</li><li>-d ddms_test:any=20\ &#124;21</li><li>-d ddms_test:all=20\ &#124;21</li></ul>  



## Filters for System-defined fields - JSON FORMAT

|**Field Type**| **Available Operator**  | **Description & Example**|
|:--|:--|:--|
|**Resource Type**|eq(defualt), any|**Example:** <br><ul><li>-d resource_type_id=1 </li><li>-d resource_type_id:eq=2  </li><li>-d resource_type_id:any=1\ &#124;2 </li></ul> 
|**Name**| has(default), eq |**Example:** <br><ul><li>-d name="Chris" </li><li>-d name:eq="Amy Jones" </li><li>--d name:has="c" </li></ul> 
|**Roles**| any(default), all|**Example:** <br><ul><li>-d roles=1\ &#124;2\  &#124;3</li><li>-d roles:any=2 &#124;5</li><li>-d roles:all=4\ &#124;6</li></ul>
|**Tags**| any(default), all|**Example:** <br><ul><li>-d tags=1\ &#124;2\  &#124;3</li><li>-d tags:any=2 &#124;5</li><li>-d tags:all=4\ &#124;6</li></ul>
|**Email**| has(default), eq |**Example:** <br><ul><li>-d email='@'</li><li>-d email:has='a' </li><li>-d email:eq='ana.steele@mycompany.com' </li></ul>  
|**Phone**| has(default), eq |**Example:** <br><ul><li>-d phone=999 </li><li>-d phone:eq='(485)555-0202' </li><li>-d phone:has=753 </li></ul> 
|**Start Date**|  eq(default), lt, gt, bt, ex |**Example:** <br><ul><li>-d start_date=2016-01-27</li><li>-d start_date:eq=2016-01-27</li><li>-d start_date:lt=1999-12-22 </li><li>-d start_date:gt=1990-01-11 </li><li>-d start_date:bt=2001-01-01\ &#124;2010-12-31</li><li>-d start_date:bt=2001-01-01 </li><li>-d start_date:ex=1992-02-12\ &#124;1997-01-27 </li><li>-d start_date:ex=1992-02-12 </li></ul>
|**Last Working Date**|  eq(default), lt, gt, bt, ex |**Example:** <br><ul><li>-d last_date=2018-04-19</li><li>-d last_date:eq=2016-05-17</li><li>-d last_date:lt=2002-12-31 </li><li>-d last_date:gt=2010-01-01 </li><li>-d last_date:bt=1995-12-31\ &#124;1999-01-01</li><li>-d last_date:bt=1995-12-31 </li><li>-d last_date:ex=2001-01-01\ &#124;2002-01-01 </li><li>-d last_date:ex=2003-01-01 </li></ul> 