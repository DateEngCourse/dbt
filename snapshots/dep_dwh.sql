{% snapshot dep_dwh %}

 {{ config(target_database = 'PROJECT1',
        target_schema   = 'DATA_WAREHOUSE',
        unique_key      = 'DEPARTMENT_ID',
        strategy        = 'timestamp',
        updated_at      = 'UPDATED_AT'
        ) }}

 select DEPARTMENT_ID,
        DEPARTMENT_NAME,
        MANAGER_ID,
        LOCATION_ID,
        FILE_NAME,
        UPDATED_AT
   from {{ source('project1','dep_stage') }}

{% endsnapshot %}