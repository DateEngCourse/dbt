select e.employee_id,
       e.emp_name,
       e.email,
       e.ph_number,
       d.department_id,
       d.department_name,
       d.city,
       d.state_province,
       d.country_name
  from {{ ref('emp') }} e,
       {{ ref('dep_loc_con') }} d
  where d.department_id = e.department_id