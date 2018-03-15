connection: "funnel_demo_data"

# include all the views
include: "*.view"

# include all the dashboards
include: "*.dashboard"

datagroup: funnel_demo_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: funnel_demo_default_datagroup

explore: funnel_aggregated_all_dates {}
