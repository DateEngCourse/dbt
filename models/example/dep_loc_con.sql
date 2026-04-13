select d.department_id,
       d.department_name,
       l.city,
       l.state_province,
       c.country_name
  from {{ source('staging','DEPARTMENTS') }} d,
       {{ source('staging','LOCATIONS') }} l,
       {{ ref('country') }} c
  where d.location_id = l.location_id    
    and l.country_id  = c.country_id 