import boto3
import pandas as pd

s3_client = boto3.client('s3')

for bucket in s3_client.buckets.all():
    print(bucket.name)

# s3_client.upload_file('florestas.csv','datalake-brunor-igti-edc','data/florestas_s3.csv')
# s3_client.download_file('datalake-brunor-igti-edc','data/florestas_s3.csv','florestas_s3_down.csv')

# df = pd.read_csv('florestas_s3_down.csv',sep=";")
# print(df)