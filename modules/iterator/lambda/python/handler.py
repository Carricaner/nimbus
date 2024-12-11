import boto3

client = boto3.client('lambda')

def lambda_handler(event, context):
    index = event['iterator']['index'] + 1
    # response = client.invoke(
    #     FunctionName='LAMBDA_TO_INVOKE',
    #     InvocationType='Event'
    # )
    print(event)
    return {
        'index': index,
        'continue': index < event['iterator']['count'],
        'count': event['iterator']['count'],
        'second': round( 60 / event['iterator']['count'])
    }