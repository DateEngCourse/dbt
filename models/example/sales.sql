{{ config(materialized='incremental',
          unique_key='ORDER_ID',
          incremental_strategy='delete+insert') }}
select ORDER_ID,
       PRODUCT_NAME,
       CATEGORY,
       QUANTITY,
       UNIT_PRICE,
       TOTAL_PRICE,
       update_at
  from {{ source('staging','SALES_INFO') }}
  {% if is_incremental() %}
    where update_at > (SELECT MAX(update_at) FROM  {{ this }} )
  {% endif %}