connection: "reliancelooker"

# include all the views
include: "*.view"

datagroup: test_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: test_default_datagroup

explore: gp_inv_trx {}

explore: mwo_items {}

explore: mwo_raw_data {}

explore: rfr_raw_data {}

explore: test {}
