{% macro discounted_amount(amount, discount_percentage, scale=2) %}
    (-1 * {{amount}} * {{discount_percentage}})::decimal(16, {{ scale }})
{% endmacro %}