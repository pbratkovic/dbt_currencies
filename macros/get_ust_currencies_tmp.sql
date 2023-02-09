{% macro get_ust_columns() %}

{% set columns = [
    {"name": "code", "datatype": dbt_utils.type_string()},
    {"name": "obs_value", "datatype": dbt_utils.type_float()},
    {"name": "time_period", "datatype": dbt_utils.type_timestamp()}
] %}

{{ fivetran_utils.add_pass_through_columns(columns, var('hubspot__contact_pass_through_columns')) }}

{{ return(columns) }}

{% endmacro %}