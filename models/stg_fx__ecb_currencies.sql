with base as (

    select *
    from {{ ref('stg_fx__ecb_currencies_tmp') }}

), macro as (

    select
        {{
            fivetran_utils.fill_staging_columns(
                source_columns=adapter.get_columns_in_relation(ref('stg_fx__ecb_currencies_tmp')),
                staging_columns=get_contact_columns()
            )
        }}
    from base

), fields as (

    select
        code,
        obs_value,
        time_period

    from macro   
    
)

select *
from fields
