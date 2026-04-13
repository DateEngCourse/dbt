select e.employee_id,
       e.emp_name,
       e.email,
       e.ph_number,
       e.department_id,
       e.department_name,
       e.city,
       e.state_province,
       e.country_name,
       r.region_name
  from {{ ref('emp_dtls') }} e,
       {{ ref('country') }} c,
       {{ ref('region') }} r
  where e.country_name = c.country_name
    and c.region_id = r.region_id