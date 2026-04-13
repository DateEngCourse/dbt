{{ config(materialized='ephemeral') }}
select country_id,country_name,region_id
  from {{ source('staging','countries') }}