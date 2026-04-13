{{ config(materialized='incremental',
          unique_key='CUSTOMER_ID') }}
select CUSTOMER_ID,
       NAME,
       GENDER,
       AGE,
       REGION,
       update_at
  from {{ source('staging','CUSTOMER_INFO') }}
  {% if is_incremental() %}
    where update_at > (SELECT MAX(update_at) FROM  {{ this }} )
  {% endif %}