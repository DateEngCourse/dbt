{{ config(materialized='incremental',
          unique_key='ORDER_ID',
          incremental_strategy='append') }}
select ORDER_ID,
       CUSTOMER_ID,
       ORDER_DATE,
       STATUS,
       DELIVERY_DATE,
       update_at
  from {{ source('staging','ORDER_INFO') }}
  {% if is_incremental() %}
    where update_at > (SELECT MAX(update_at) FROM  {{ this }} )
  {% endif %}