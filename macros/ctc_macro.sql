{% macro ctc_macro (salary, commission_pct) %}
     ({{ salary }} +  ( {{ salary }} * nvl( {{ commission_pct }} ,0)  ) ) * 12
{% endmacro %}