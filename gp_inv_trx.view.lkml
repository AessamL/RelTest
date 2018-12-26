view: gp_inv_trx {
  sql_table_name: pegasus.gp_inv_trx ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: cust_num {
    type: string
    sql: ${TABLE}.cust_num ;;
  }

  dimension_group: doc {
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
    sql: ${TABLE}.doc_date ;;
  }

  dimension: extdcost {
    type: number
    sql: ${TABLE}.extdcost ;;
  }

  dimension: item_num {
    type: string
    sql: ${TABLE}.item_num ;;
  }

  dimension: trx_num {
    type: string
    sql: ${TABLE}.trx_num ;;
  }

  dimension: trxloctn {
    type: string
    sql: ${TABLE}.trxloctn ;;
  }

  dimension: trxqty {
    type: number
    sql: ${TABLE}.trxqty ;;
  }

  dimension: unitcost {
    type: number
    sql: ${TABLE}.unitcost ;;
  }

  dimension: uom {
    type: string
    sql: ${TABLE}.uom ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
