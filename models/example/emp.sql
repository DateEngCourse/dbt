select employee_id,
       first_name|| ' ' || last_name emp_name,
       lower(email)||'@gmail.com' email,
       replace(phone_number,'.') ph_number,
       hire_date,
       datediff('Year',hire_date,current_date()) exp,
       job_id,
       salary as monthly_salary,
       salary*12 as annual_salary,
       commission_pct,
       manager_id,
       department_id
  from {{ source('staging','employees') }}