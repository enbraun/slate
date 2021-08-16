# Filters

## Definition 

The filter parameter allows for filtering the results returned from the various endpoint in various ways.

Filters are made up of rules, with a user-defined or system-defined field, a filter operator and a value.

A filter condition consists of three components which are **_field_**, **_operator_** and **_value_**. If operator is not supplied, it takes default operator for field.

## Operator

The full list of all operators is shown below.


| Operator | Meaning  
| -: |:-  |
| any | Checks whether field value exists in given set. |
| all | Checks whether field value contains all elements of given set. |
| has | Checks whether field value contains given phrase. |
| eq  | Checks whether field value is equal to given input. |
| gt  | Checks whether field value is greater than given input. |
| lt | Checks whether field value is lesser than given input. |
| bt | Checks whether field value is between given range. |
| ex | Checks whether field value is not in the given range. |
| none | Checks whether field value does not exist in given set. |
| miss | Checks whether field value does not contain given phrase. |
| neq  | Checks whether field value is not equal to given input. |

## Filters for User-defined fields

|**Field Type**| **Operators**  | **Example**|
|:--|:--|:--|
|**Simple Text**| <li class="nowrap">has *(default)* </li><li>miss</li><li>eq</li><li>neq</li> |`"simtext:has": "Simple Text"` <br>`"simtext:miss": "Simple Text"`<br>`"simtext:eq": "Simple Text Ed"`<br>`"simtext:neq": "Simple Text Ed"`
|**Integer Number**|<li>eq *(default)* </li><li>lt </li><li>  gt </li><li> bt </li><li> ex</li> |`"int_field:eq": 41` <br>`"int_field:lt": 41`<br>`"int_field:gt": 41`<br>`"int_field:lt": 41`<br>`"int_field:bt": [41,121]`<br>`"int_field:bt": 41`<br>`"int_field:ex": [41,121]`<br>`"int_field:ex": 41`
|**Fractional Number**|<li>eq *(default)* </li><li>lt </li><li>  gt </li><li> bt </li><li> ex</li> |`"float_field:eq": 12.1`<br>`"float_field:lt": 45.6`<br>`"float_field:gt": 121.1`<br>`"float_field:bt": [1.0,121.1]`<br>`"float_field:bt": 22.6`<br>`"float_field:ex": [15.7,45.6]`<br>`"float_field:ex": 45.6`
|**Date**| <li>eq *(default)* </li><li>lt </li><li>  gt </li><li> bt </li><li> ex</li> | `"emp_birthday:eq": "1992-02-12"`<br>`"emp_birthday:lt": "1992-02-12"`<br>`"emp_birthday:gt": "1992-02-12"`<br>`"emp_birthday:bt":[1992-02-12,1999-07-07]`<br>`"emp_birthday:bt": "1992-02-12"`<br>`"emp_birthday:ex" : [1992-02-12,1997-01-27]` <br>`"emp_birthday:ex": "1992-02-12"`
|**DateTime**|<li>eq *(default)* </li><li>lt </li><li>  gt </li><li> bt </li><li> ex</li> |`"date_time_field:eq": "2018-06-06T18:30:00Z"`<br>`"date_time_field:lt": "2018-06-06T18:30:00Z"`<br>`"date_time_field:gt": "2018-06-06T18:30:00Z"`<br>`"date_time_field:bt": [2018-06-06T18:30:00Z,2018-06-06T18:30:00Z]`<br>`"date_time_field:bt": "2018-06-06T18:30:00Z"`<br>`"date_time_field:ex": [2018-06-06T18:30:00Z,2018-06-06T18:30:00Z]`<br>`"date_time_field:ex": "2018-06-06T18:30:00Z"`
|**Email**|<li>has *(default)* </li><li>miss</li><li>eq</li><li>neq</li> |`"email:has": "a"`<br>`"email:miss": "a"`<br>`"email:eq": "ana@company.com"`<br>`"email:neq": "ana@company.com"`
|**Checkbox**|Default value is true, accepts value true and false |`"check_field": true`<br>`"check_field": false`
|**Checkbox Group**|<li>any *(default)* </li><li>none</li><li>all</li><li>ex</li>|`"check_group_field:any": [17,10]`<br>`"check_group_field:none": [17,10]`<br>`"check_group_field:all": [16,17]`<br>`"check_group_field:ex": [16,17]`
|**Radio Group**| <li>eq *(default)* </li><li>neq</li><li>any</li><li>none</li>|`"radio_field:eq": 15`<br>`"radio_field:neq": 15`<br>`"radio_field:any": [16,15]`<br>`"radio_field:none": [16,15]`
|**Label**|<li>eq *(default)* </li><li>neq</li><li>any</li><li>none</li> |`"label_field:eq": 18`<br>`"label_field:neq": 18`<br>`"label_field:any": [16,18]`<br>`"label_field:none": [16,18]`
|**Drop Down Single Select**| <li>eq *(default)* </li><li>neq</li><li>any</li><li>none</li>|`"ddss_field:eq": 15`<br>`"ddss_field:neq": 15`<br>`"ddss_field:any": [16,15]`<br>`"ddss_field:none": [16,15]`
|**Drop Down Multi Select**| <li>any *(default)* </li><li>none</li><li>all</li><li>ex</li></ul>|`"ddms_field:any": [20,21]`<br>`"ddms_field:none": [20,21]`<br>`"ddms_field:all": [20,21]`<br>`"ddms_field:ex": [20,21]`
|**User Single Select**| <li>eq *(default)* </li><li>neq</li><li>any</li><li>none</li>|`"uss_field:eq": 15`<br>`"uss_field:neq": 15`<br>`"uss_field:any": [16,15]`<br>`"uss_field:none": [16,15]`