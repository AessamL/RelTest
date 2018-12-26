view: mwo_items {
  sql_table_name: pegasus.mwo_items ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension_group: dispatch {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.dispatch_date ;;
  }

  dimension: item_code {
    type: string
    sql: ${TABLE}.item_code ;;
  }

  dimension: item_desc {
    type: string
    sql: ${TABLE}.item_desc ;;
  }

  dimension: mwo {
    type: string
    sql: ${TABLE}.mwo ;;
  }

  dimension: qty {
    type: number
    sql: ${TABLE}.qty ;;
  }

  dimension_group: request {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.request_date ;;
  }

  dimension: requested_by {
    type: string
    sql: ${TABLE}.requested_by ;;
  }

  dimension: vehicle_logo {
    type: string
    sql: ${TABLE}.vehicle_logo ;;
  }

  dimension: wh {
    type: string
    sql: ${TABLE}.wh ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
