{% macro email_id_macro(column_name) %}
   lower( {{ column_name }} ) || '@gmail.com'
{% endmacro %}