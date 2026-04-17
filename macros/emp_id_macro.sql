{% macro emp_id_macro (column_name) %}
     'EMP_' || {{ column_name }}
{% endmacro %}