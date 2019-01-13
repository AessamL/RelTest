view: sql_runner_queryasmeasure {
  derived_table: {
    sql: SELECT
        mwo_raw_data.rfr_no  AS `mwo_raw_data.rfr_no`,
        CAST(MIN(mwo_raw_data.start_time)  AS CHAR) AS `mwo_raw_data.Min_MWO_Start`
      FROM pegasus.mwo_raw_data  AS mwo_raw_data

      GROUP BY 1
      ORDER BY MIN(mwo_raw_data.start_time)  DESC

       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: mwo_raw_data_rfr_no {
    type: string
    sql: ${TABLE}.`mwo_raw_data.rfr_no` ;;
  }

  dimension: mwo_raw_data_min_mwo_start {
    type: string
    sql: ${TABLE}.`mwo_raw_data.Min_MWO_Start` ;;
  }

  set: detail {
    fields: [mwo_raw_data_rfr_no, mwo_raw_data_min_mwo_start]
  }
}
