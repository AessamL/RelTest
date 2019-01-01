view: mwo_raw_data {
  sql_table_name: pegasus.mwo_raw_data ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: access_time {
    description: "Time Between RFR and First Assessment by an Engineer "
   # type: string
  type: date_time
    sql: ${TABLE}.access_time ;;
  }

  dimension: assess_dur {
    type: string
    sql: ${TABLE}.assess_dur ;;
  }

  dimension_group: assess {
    description: "The Start of Assessment"
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
    sql: ${TABLE}.assess_time ;;
  }

  dimension: bds {
    type: string
    sql: ${TABLE}.bds ;;
  }

  dimension: cause {
    type: string
    sql: ${TABLE}.cause ;;
  }

  dimension: comments {
    type: string
    sql: ${TABLE}.comments ;;
  }

  dimension_group: end {
    description: "Task End Time"
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
    sql: ${TABLE}.end_time ;;
  }

  dimension: issue_status {
    type: string
    sql: ${TABLE}.issue_status ;;
  }

  dimension: issues_order {
    type: number
    sql: ${TABLE}.issues_order ;;
  }

  dimension: location {
    type: string
    sql: ${TABLE}.location ;;
  }

  dimension: mode {
    type: string
    sql: ${TABLE}.mode ;;
  }

  dimension_group: notif {
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
    sql: ${TABLE}.notif_time ;;
  }

  dimension: plan_dur {
    type: string
    sql: ${TABLE}.plan_dur ;;
  }

  dimension_group: plan {
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
    sql: ${TABLE}.plan_time ;;
  }

  dimension: pm_type {
    type: string
    sql: ${TABLE}.pm_type ;;
  }

  dimension_group: rfr {
    description: "Actuall Notification Time"
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
    sql: ${TABLE}.rfr_date ;;
  }

  dimension: rfr_decision {
    type: string
    sql: ${TABLE}.rfr_decision ;;
  }

  dimension: rfr_no {
    type: string
    sql: ${TABLE}.rfr_no ;;
  }

  dimension: rfr_status {
    type: string
    sql: ${TABLE}.rfr_status ;;
  }

  dimension: sort {
    type: string
    sql: ${TABLE}.sort ;;
  }

  dimension_group: start {
    description: "Task Start Time"
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
    sql: ${TABLE}.start_time ;;
  }

  dimension: task_dur {
    type: date_time
    sql: ${TABLE}.task_dur ;;
    description: "Work Order Duration"
  }

  dimension: total_time {
    type: string
    sql: ${TABLE}.total_time ;;
  }


  dimension: vehicle_logo {
    type: string
    sql: ${TABLE}.vehicle_logo ;;
  }
  dimension: AssetType {
    type: string
    sql:
    CASE
        WHEN ${TABLE}.vehicle_logo LIKE '%Truck%' THEN 'Truck'
        WHEN ${TABLE}.vehicle_logo LIKE '%Trailer%' THEN 'Trailer'
        ELSE 'NA'
      END ;;
  }
  dimension: VehicleLogo {
    type: string
    sql:CASE
        WHEN ${TABLE}.vehicle_logo LIKE '%Truck%' THEN SUBSTRING (${TABLE}.vehicle_logo, 5, 20)
        WHEN ${TABLE}.vehicle_logo LIKE '%Trailer%' THEN SUBSTRING (${TABLE}.vehicle_logo , 7, 20)
        ELSE 'NA'
      END
        ;;
  }

  dimension: wo {
    type: string
    sql: ${TABLE}.wo ;;
  }

  dimension: wo_closedby {
    type: string
    sql: ${TABLE}.wo_closedby ;;
  }

  dimension: wo_km {
    type: number
    sql: ${TABLE}.wo_km ;;
  }

  dimension: wo_type {
    type: string
    sql: ${TABLE}.wo_type ;;
  }

  measure:  Min_MWO_Start {
    type: date_time
    sql: MIN(${TABLE}.start_time) ;;
    convert_tz: no

  }

  measure: Max_MWO_Task_End {
    type: date_time
    sql:MAX(${TABLE}.end_time);;
    convert_tz: no

  }
measure: WODurationHour {
  sql: TIMESTAMPDIFF(HOUR,${Min_MWO_Start},${Max_MWO_Task_End}) ;;
}
measure: WODurationTIME {
  sql: TIME_FORMAT(TIMEDIFF(${Max_MWO_Task_End},${Min_MWO_Start}), '%H:%i') ;;
  #We Can Add More Formating if Needed
}

  measure: count {
    type: count
    drill_fields: [id]
  }
}
