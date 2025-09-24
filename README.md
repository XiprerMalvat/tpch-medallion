# tpch-medallion
Build a medallion architecture with fact and dimension tables in Snowflake and transformations with dbt.
The dataset used is the TPCH one, which is available in Snowflake by default.


# Relevant commmands
dbt run
dbt snapshot

# Changes
dbt_project.yml has the source changed to a replica of the TPCH original dataset to enable UPDATES
and test SCD.