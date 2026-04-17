{% snapshot  customer_scd %}

{{ config( unique_key='CUSTOMER_ID',
           strategy='check',
           check_cols=['Name','Region'] ) }}

select CUSTOMER_ID,
       NAME,
       GENDER,
       AGE,
       REGION,
  from {{ source('staging','CUSTOMER_INFO') }}

  {% endsnapshot  %}