{% snapshot  customer_scd_time %}

{{ config( unique_key='CUSTOMER_ID',
           strategy='timestamp',
           updated_at='UPDATE_AT' ) }}

select CUSTOMER_ID,
       NAME,
       GENDER,
       AGE,
       REGION,
       UPDATE_AT
  from {{ source('staging','CUSTOMER_INFO') }}

  {% endsnapshot  %}