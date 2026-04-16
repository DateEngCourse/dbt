{{ 
   config(pre_hook= ["Delete from audit_log where model_name='emp'",
                     "Insert into audit_log values ('emp','Start',current_timestamp)"],
          post_hook="Insert into audit_log values ('emp','End',current_timestamp)") 
}}

select {{ emp_id_macro('employee_id')  }} employee_id,
       first_name|| ' ' || last_name emp_name,
       {{ email_id_macro('email') }} email,
       replace(phone_number,'.') ph_number,
       hire_date,
       datediff('Year',hire_date,current_date()) exp,
       job_id,
       salary as monthly_salary,
       salary*12 as annual_salary,
       {{ ctc_macro('salary','commission_pct') }} ctc,
       commission_pct,
       manager_id,
       department_id
  from {{ source('staging','employees') }}