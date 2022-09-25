# crowdinScript
A helper tool for add a list of Crowdin strings sequentially 

According to Crowdin API https://developer.crowdin.com/api/v2/#operation/api.projects.strings.post
We can only add one single string at a time. Therefore, if we have a list of project id and file id and a list of strings, this script will add those strings to each project
First, list of projects with file id is required. It should be in JSON format
Example: 
[
  {
    "projectId": 23523,
    "fileId": 423
  },
  {
    "projectId": 53351,
    "fileId": 531
  }
]

Second, list of strings based on Crowdin API model. However, this model was customized so as to prevent manally copy and paste file ID in each model
Example:
[
  {
    "text": "identifier_test_01_text",
    "identifier": "identifier_test_01",
    "context": "",
    "isHidden": false,
    "maxLength": 0
  },
  {
    "text": "identifier_test_02_text",
    "identifier": "identifier_test_02",
    "context": "",
    "isHidden": false,
    "maxLength": 0
  }
]

Third, you must update your Crowdin token key for authorization in API Service
<img width="653" alt="image" src="https://user-images.githubusercontent.com/34263981/192140611-e40e08ad-c656-4f34-9fbc-88fa41b5d174.png">

Finally, update your local path to JSON files
<img width="731" alt="image" src="https://user-images.githubusercontent.com/34263981/192140648-f0150920-8cdf-4fe2-be6f-9b52bd8af955.png">


