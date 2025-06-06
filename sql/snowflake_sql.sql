
CREATE database UPI_PowerB1;

create schema UPI_PBI_Data;

CREATE OR REPLACE TABLE(
  TransactionID STRING,
  TransactionDate DATE,
  Amount FLOAT ,
  BankNameSent STRING,
  BankNameReceived STRING,
  RemainingBatance FLOAT,
  City STRING,
  Gender STRING,
  TransactionType STRING,
  Status STRING,
  TransactionTime TIME,
  DeviceType STRING,
  PaymentMethod STRING,
  MerchantName STRING,
  Purpose STRING,
  CustomerAge INTEGER,
  PaymentMode STRING,
  Currency STRING,
  CustomerAccountNumber STRING,
  MerchantAccountNumber STRING
  )

create stage UPI_PowerBI. pbi_stagel
url - 's3://secondbucket-powerbi/ '
storage_integration = UPI_PBI_Integration
list @pbi_stagel
UPI_POWERBI . UPI_PBI_DATA. PBI_STAGEI

copy into PBI_UPI_Dataset
from @pbi_stagel
file_format = (type='csv' skip_header=l)
on_error= ' continue '

SELECT * FROM PBI_UPI_Dataset

