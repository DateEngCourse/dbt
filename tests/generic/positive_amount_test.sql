{% test positive_amount_test(model, column_name) %}

select *
  from {{ model }}
 where NVL( {{ column_name }}, -1) < 0

{% endtest %}