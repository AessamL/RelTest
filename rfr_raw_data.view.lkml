view: rfr_raw_data {
  sql_table_name: pegasus.rfr_raw_data ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: commodity {
    type: string
    sql: ${TABLE}.commodity ;;
  }

  dimension: driver {
    type: string
    sql: ${TABLE}.driver ;;
  }

  dimension_group: end {
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
    sql: ${TABLE}.end_date ;;
  }

  dimension: issue {
    type: string
    sql: ${TABLE}.issue ;;
  }

  dimension: issue_status {
    type: string
    sql: ${TABLE}.issue_status ;;
  }

  dimension: km {
    type: number
    sql: ${TABLE}.km ;;
  }

  dimension: location {
    type: string
    sql: ${TABLE}.location ;;
  }

  dimension: mwo {
    type: string
    sql: ${TABLE}.mwo ;;
  }

  dimension_group: notification {
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
    sql: ${TABLE}.notification_date ;;
  }

  dimension: project {
    type: string
    sql: ${TABLE}.project ;;
  }

  dimension_group: reply {
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
    sql: ${TABLE}.reply_date ;;
  }

  dimension: rfr_condition {
    type: string
    sql: ${TABLE}.rfr_condition ;;
  }

  dimension: rfr_no {
    type: string
    sql: ${TABLE}.rfr_no ;;
  }

  dimension: rfr_status {
    type: string
    sql: ${TABLE}.rfr_status ;;
  }

  dimension: telephone {
    type: string
    sql: ${TABLE}.telephone ;;
  }

  dimension: trailer {
    type: string
    sql: ${TABLE}.trailer ;;
  }

  dimension: truck {
    type: string
    sql: ${TABLE}.truck ;;
  }

  dimension: weight {
    type: number
    sql: ${TABLE}.weight ;;
  }

  dimension: wo {
    type: string
    sql: ${TABLE}.wo ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
