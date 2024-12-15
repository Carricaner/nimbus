import boto3
import json

client = boto3.client('lambda')

# payload
# {
#   "iterator": {
#     "index": 10,
#     "count": 12,
#     "targets": [
#       {
#         "type": "aws-lambda",
#         "function_name": "another-lambda-name",
#         "payload": {
#           "data": "twen"
#         }
#       }
#     ]
#   }
# }

def lambda_handler(event, context):
    index = event['iterator']['index'] + 1
    for target in event['iterator']['targets']:
        if target['type'] == 'aws-lambda':
            response = client.invoke(
                FunctionName=target['function_name'],
                InvocationType='Event',
                Payload=json.dumps(target['payload'])
            )
            print(response)
    
    return {
        'index': index,
        'continue': index < event['iterator']['count'],
        'count': event['iterator']['count'],
        'second': round( 60 / event['iterator']['count']),
        'targets': event['iterator']['targets']
    }