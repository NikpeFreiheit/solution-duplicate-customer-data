# JSON messages

Request data is sent to the system’s API gateway.

The data is then sequentially transmitted via the POST method to the following URLs:

- http://Normalization_service.com/applications
- http://Validation_service.com/applications
- [http://CRM.com/applications](http://crm.com/applications)
- [http://Database.com/applications](http://database.com/applications)

# **POST method**

## Request

```json
POST https://americor_apigateway.com/applications
HTTPs
Host: americor_apigateway.com
Content-Type: application/json

{"application":{
    "src_system":"int",//0=API,1=manual default=1
    "appl_number":"int",//system-generated unique application ID
    "appl_date":"string",//dd-mm-yyyy hh:mm:ss API request sent date
    "person":{
       "first_name":"string",
        "last_name":"string",
        "ssn":"string",
        "contacts":{
            "client_phones":[{"number":"string"}],
            "addresses":[{"address":"string"}],
            "emails":[{"email":"string"}],
            }
        }
    }
}
```

This will ensure that the data enters the system, passes through normalization, validation, and grouping, and is then stored in the database.

## Responses

For the partner, the system will return two types of responses:

```json
//Response_1

201 Created

{"message":{
    "appl_number":"int",
    "description": "The application has been saved.",
    "save_date":"string",//dd-mm-yyyy hh:mm:ss Database insertion date of the request

//Response_2

201 Created

{"message":{
    "appl_number":"int",
    "description": "The application is marked as a duplicate and sent for manual review.",
    "save_date":"string",//dd-mm-yyyy hh:mm:ss Database insertion date of the request
}}
```

For the UI, the system will return two types of responses:

```json
//Response_1

201 Created

{"message":{
    "appl_number":"int",
    "description": "The application has been saved.",
    "save_date":"string",//dd-mm-yyyy hh:mm:ss Database insertion date of the request
}}

//Response_2

201 Created

{"message":{
    "appl_number":"int",
    "description": "The application is marked as a duplicate and sent for manual review.",
    "save_date":"string",//dd-mm-yyyy hh:mm:ss Database insertion date of the request
}}
```

## Errors

Bad Request

```json
400 Bad Request
{
  "status": "error",
  "code": "VALIDATION_ERROR",
  "message": "Request payload validation failed",
  "details": [
    {
      "field": "application.person.first_name",
      "issue": "Field is required"
    },
    {
      "field": "application.person.ssn",
      "issue": "Invalid SSN format"
    }
  ]
}
```

Internal Server Error

```json
500 Internal Server Error
{
  "status": "error",
  "code": "INTERNAL_ERROR",
  "message": "Unexpected error during application processing",
  "trace_id": "9f3c1a7b-22aa-4c11-bc77-91f12d8e8c44"
}
```

# **GET method**

## Request

The request for application data by ID for processing and/or modification from the UI to the CRM will be as follows:

```json
GET http://CRM.com/applications/{appl_number}
HTTP/1.1
Host: CRM.com

GET http://CRM.com/contracts/{contract_id}
HTTP/1.1
Host: CRM.com

GET http://CRM.com/contacts/{client_phone}
HTTP/1.1
Host: CRM.com

GET http://CRM.com/clients/{last_name}
HTTP/1.1
Host: CRM.com

GET http://CRM.com/clients/{first_name}
HTTP/1.1
Host: CRM.com
```

## Responses

In response to these requests, all client information will be returned:

```json
200 OK

{"application":{
    "id":"int",
    "src_system":"int",
    "appl_number":"int",
    "person":{
        "uid":"int",
        "first_name":"string",
        "last_name":"string",
        "ssn":"string",
        "create_at":"string",
        "contacts":{
            "client_phones":[{"number":"string"}],
            "addresses":[{"address":"string"}],
            "emails":[{"email":"string"}],
            }
        },
    "contract":{
        "id":"int",
        "number":"string",
        "amount":"string"
        }
    }
}
```

## Errors

400 Bad Request

```json
//Error for /clients/{first_name} and /clients/{last_name}

400 Bad Request
{
  "status": "error",
  "code": "AMBIGUOUS_QUERY",
  "message": "Search criteria is too broad, multiple clients found",
  "suggestion": "Use additional parameters such as last_name or ssn"
}
```

404 Not Found

```json
//Error for /contracts/{contract_id}

404 Not Found
{
  "status": "error",
  "code": "CONTRACT_NOT_FOUND",
  "message": "Contract not found",
  "contract_id": 98765
}

//Error for /contacts/{client_phone}

404 Not Found
{
  "status": "error",
  "code": "CONTACT_NOT_FOUND",
  "message": "No contact data found for specified phone number",
  "client_phone": "+1-202-555-0143"
}

//Error for /clients/{first_name} and /clients/{last_name}

404 Not Found
{
  "status": "error",
  "code": "CLIENT_NOT_FOUND",
  "message": "No clients found matching the given criteria",
  "query": "John"
}
```