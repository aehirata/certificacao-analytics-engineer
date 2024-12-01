/*
    This is an adaptation of the codegen package that generates SQL for a base model, following the Indicium Code Style.
    Additionally,it converts the modifieddate field from a string to a timestamp,
    as this conversion is needed across all tables in the AdventureWorks database.

    Package: https://github.com/dbt-labs/dbt-codegen/tree/0.12.1/#generate_source-source
    Code Style: https://bitbucket.org/indiciumtech/indicium-code-style/src/master/sql_style_guide.md
*/


{% macro generate_base_model(source_name, table_name, leading_commas=True, case_sensitive_cols=False, materialized=None) %}
  {{ return(adapter.dispatch('generate_base_model', 'codegen')(source_name, table_name, leading_commas, case_sensitive_cols, materialized)) }}
{% endmacro %}

{% macro default__generate_base_model(source_name, table_name, leading_commas, case_sensitive_cols, materialized) %}

{%- set source_relation = source(source_name, table_name) -%}

{%- set columns = adapter.get_columns_in_relation(source_relation) -%}
{% set column_names=columns | map(attribute='name') %}
{%- set base_model_sql -%}
with
    source as (
        select * 
        from {% raw %}{{ source({% endraw %}'{{ source_name }}', '{{ table_name }}'{% raw %}) }}{% endraw %}
    )

    , renamed as (
        select
            {%- if leading_commas -%}
            {%- for column in column_names %}
            {{", " if not loop.first}}{% if not case_sensitive_cols %}{% if column == 'MODIFIEDDATE'%}cast({{ column | lower }} as timestamp) as {{ column | lower }}{%else%}{{ column | lower }}{%endif%}{% elif target.type == "bigquery" %}{{ column }}{% else %}{{ "\"" ~ column ~ "\"" }}{% endif %}
            {%- endfor %}
            {%- else -%}
            {%- for column in column_names %}
            {% if not case_sensitive_cols %}{{ column | lower }}{% elif target.type == "bigquery" %}{{ column }}{% else %}{{ "\"" ~ column ~ "\"" }}{% endif %}{{"," if not loop.last}}
            {%- endfor -%}
            {%- endif %}
        from source
    )

select * 
from renamed
{%- endset -%}

{% if execute %}

{{ print(base_model_sql) }}
{% do return(base_model_sql) %}

{% endif %}
{% endmacro %}