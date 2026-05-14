# Mapping API


**API Request Structure Table**

| Name | Type | Mandatory | Default | Comments |
| --- | --- | --- | --- | --- |
| Headers |  |  |  |  |
| __ | __ | __ | __ | __ |
| Path |  |  |  |  |
| __ | __ | __ | __ | __ |
| Query |  |  |  |  |
| __ | __ | __ | __ | __ |
| Body |  |  |  |  |
| __ | __ | __ | __ | __ |

As an example of mappings, the following types of requests are presented below.

**GET method** “Get application information from Database”

| Name | Type | Mandatory | Default | Comments |
| --- | --- | --- | --- | --- |
| Path - no requirements |  |  |  |  |
| __ | __ | __ | __ | __ |
| Query |  |  |  |  |
| Limit | integer | y | 100 | The API supports pagination using `limit` and `offset` parameters.
Each request returns up to 100 records (`limit=100`). |
| offset | integer | y | 0 | To retrieve subsequent records, increase the `offset` value accordingly. |
| appl_number | integer | n | - | Application number |
| contract_id | integer | n | - | Contract (Agreement) identifier |
| client_phone | string | n | - | Client phone number |
| last_name | string | n | - | Client last name |
| first_name | string | n | - | Client first name |
| Body - no requirements |  |  |  |  |
| __ | __ | __ | __ | __ |

**POST method** “Sending request data to the system’s API gateway”

| Name | Type | Mandatory | Default | Comments |
| --- | --- | --- | --- | --- |
| Path - no requirements |  |  |  |  |
| __ | __ | __ | __ | __ |
| Query - no requirements |  |  |  |  |
| __ | __ | __ | __ | __ |
| **Body** |  |  |  |  |
| **applicatioa[]** | **massive** | **y** | **-** | **-** |
| *massive* | - | - | - |  |
| src_system | bool | y | 1 | 0 is API
1 is manually entered data |
| appl_number | string | y |  | Application number |
| appl_date | string | y |  | Datatime format 
dd-mm-yyyy hh:mm:ss |
| **person[]** | **massive** | **y** | **-** | **-** |
| *massive* | - | - | - | - |
| first_name | string | y |  |  |
| last_name | string | y |  |  |
| ssn | string | n |  |  |
| **contacts[]** | **massive** | **n** | **-** | **-** |
| *massive* | - | - | - | - |
| **client_phones[]** | **massive** | **n** | **-** | **-** |
| *massive* | - | - | - | - |
| number | string | n |  |  |
| **addresses[]** | **massive** | **n** | **-** | **-** |
| massive | - | - | - | - |
| address | string | n |  |  |
| **emails[]** | **massive** | **n** | **-** | **-** |
| *massive* | - | - | - | - |
| email | string | n |  |  |