connection: "reliancelooker"

# include all the views
include: "*.view"

datagroup: test_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: test_default_datagroup

explore: gp_inv_trx {
  hidden: yes

}

explore: mwo_items {
  hidden: yes

}
explore: sql_runner_queryasmeasure {
join: mwo_raw_data {
  sql_on: ${sql_runner_queryasmeasure.mwo_raw_data_rfr_no} = ${mwo_raw_data.rfr_no} ;;
  relationship: one_to_one
}
}

explore: mwo_raw_data {
  join: sql_runner_queryasmeasure {
    sql_on: ${sql_runner_queryasmeasure.mwo_raw_data_rfr_no} = ${mwo_raw_data.rfr_no} ;;
    relationship: one_to_one
  }
  hidden: no

}

explore: rfr_raw_data {
  hidden: yes

}

explore: test {
  hidden: yes

}
