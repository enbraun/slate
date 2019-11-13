# Filters

## Definition 

The filter parameter allows for filtering the results returned from the various endpoint in various ways.

Filters are made up of rules, with a user-defined or system-defined field, a filter operator and a value.

A filter condition consists of three components which are **_field_**, **_operator_** and **_value_**. If operator is not supplied, it takes default operator for field.

## Operator

The full list of all operators is shown below.


| Operator | Meaning  
| -: |:-  |
| any | Result will be displayed if it contains any occurrence within given values from record set. |
| all | Result will be displayed if it contains all occurrence of given values from record set. |
| has | Result will be displayed if it has the given value from record set. |
| eq  | Result will be displayed if it has equal value to given input from record set. |
| gt  | Result will be displayed of if it has  greater values for given input from record set. |
| lt | Result will be displayed of if it has lesser values for given input from record set. |
| bt | Result will be displayed for values which vary between given  range from record set. |
| ex | Result will be displayed for values which vary excluding given  range from record set. |
| none | Result will be displayed if it does not contain any occurrence within given values from record set. |
| miss | Result will be displayed if it does not have the given value from record set. |
| neq  | Result will be displayed if it does not have value equal to given input from record set. |

## Filters for User-defined fields

|**Field Type**| **Operators**  | **Example**|
|:--|:--|:--|
|**Simple Text**| <li class="nowrap">has *(default)* </li><li>miss</li><li>eq</li><li>neq</li> |`-d "simtext:has": "Simple Text"` <br>`-d "simtext:miss": "Simple Text"`<br>`-d "simtext:eq": "Simple Text Ed"`<br>`-d "simtext:neq": "Simple Text Ed"`
|**Integer Number**|<li>eq *(default)* </li><li>lt </li><li>  gt </li><li> bt </li><li> ex</li> |<li>-d "int_field:eq": 41 </li><li>-d "int_field:lt": 41</li><li>-d "int_field:gt": 41</li><li>-d "int_field:lt":      41</li><li>-d "int_field:bt": "41&#124;121"</li><li>-d "int_field:bt": 41</li><li>-d "int_field:ex": "41&#124;121"</li><li>-d "int_field:ex": 41</li>
|**Fractional Number**|<li>eq *(default)* </li><li>lt </li><li>  gt </li><li> bt </li><li> ex</li> |<li>-d "float_field:eq": 12.1 </li><li>-d "float_field:lt": 45.6</li><li>-d "float_field:gt": 121.1</li><li>-d "float_field:bt": "1.0&#124;121.1"</li><li>-d "float_field:bt": 22.6</li><li>-d "float_field:ex": "15.7&#124;45.6"</li><li>-d "float_field:ex": 45.6</li>
|**Date**| <li>eq *(default)* </li><li>lt </li><li>  gt </li><li> bt </li><li> ex</li> | `-d "emp_birthday:eq": "1992-02-12"`<br>`-d "emp_birthday:lt": "1992-02-12"`<br>`-d "emp_birthday:gt": "1992-02-12"`<br>`-d "emp_birthday:bt":[1992-02-12,1999-07-07]`<br>`-d "emp_birthday:bt": "1992-02-12"`<br>`-d "emp_birthday:ex" : [1992-02-12,1997-01-27]` <br>`-d "emp_birthday:ex": "1992-02-12"`
|**DateTime**|<li>eq *(default)* </li><li>lt </li><li>  gt </li><li> bt </li><li> ex</li> |<li>-d "date_time_field:eq": "2018-06-06T18:30:00Z"</li><li>-d "date_time_field:lt": "2018-06-06T18:30:00Z"</li><li>-d "date_time_field:gt": "2018-06-06T18:30:00Z"</li><li>-d "date_time_field:bt": "2018-06-06T18:30:00Z&#124; 2018-06-06T18:30:00Z" </li><li>-d "date_time_field:bt": "2018-06-06T18:30:00Z"</li><li>-d "date_time_field:ex": "2018-06-06T18:30:00Z&#124; 2018-06-06T18:30:00Z" </li><li>-d "date_time_field:ex":  "2018-06-06T18:30:00Z" </li> 
|**Email**|<li>has *(default)* </li><li>miss</li><li>eq</li><li>neq</li> |<li>-d "email:has": "a" </li><li>-d "email:miss": "a" </li><li>-d "email:eq":    "ana@company.com" </li><li>-d "email:neq":    "ana@company.com" </li>
|**Checkbox**|Default value is true, accepts value true and false |<li>-d "check_field": true </li><li>-d "check_field": false </li> 
|**Checkbox Group**|<li>any *(default)* </li><li>none</li><li>all</li><li>ex</li>|<li>-d "check_group_field:any": "17&#124;10"</li><li>-d "check_group_field:none": "17&#124;10"</li><li>-d "check_group_field:all": "16&#124;17"</li><li>-d "check_group_field:ex": "16&#124;17"</li>   
|**Radio Group**| <li>eq *(default)* </li><li>neq</li><li>any</li><li>none</li>|<li>-d "radio_field:eq": 15 </li><li>-d "radio_field:neq": 15 </li><li>-d "radio_field:any": "16&#124;15" </li><li>-d "radio_field:none": "16&#124;15" </li> 
|**Label**|<li>eq *(default)* </li><li>neq</li><li>any</li><li>none</li> |<li>-d "label_field:eq": 18 </li><li>-d "label_field:neq": 18 </li><li>-d "label_field:any": "16&#124;18" </li><li>-d "label_field:none": "16&#124;18" </li>
|**Drop Down Single Select**| <li>eq *(default)* </li><li>neq</li><li>any</li><li>none</li>|<li>-d "ddss_field:eq": 15 </li><li>-d "ddss_field:neq": 15 </li><li>-d "ddss_field:any": "16&#124;15" </li><li>-d "ddss_field:none": "16&#124;15" </li>
|**Drop Down Multi Select**| <li>any *(default)* </li><li>none</li><li>all</li><li>ex</li></ul>|<li>-d "ddms_field:any": "20&#124;21"</li><li>-d "ddms_field:none": "20&#124;21"</li><li>-d "ddms_field:all": "20&#124;21"</li><li>-d "ddms_field:ex": "20&#124;21"</li>