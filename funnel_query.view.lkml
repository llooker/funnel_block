view: funnel_query {
  derived_table: {
    sql: select * from funnel_aggregated_all_dates
      ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  measure: total_clicks {
    type:  sum
    sql: ${clicks} ;;
  }

  measure: total_impressions {
    type:  sum
    sql: ${impressions} ;;
  }

  measure: total_cost {
    type:  sum
    sql: ${cost} ;;
  }

  dimension_group: date {
    type: time
    sql: ${TABLE}.date ;;
  }

  dimension: platform {
    type: string
    sql: ${TABLE}.platform ;;
  }

  dimension: ad_account {
    type: string
    sql: ${TABLE}.ad_account ;;
  }

  dimension: market {
    type: string
    sql: ${TABLE}.market ;;
  }

  dimension: manufacturer {
    type: string
    sql: ${TABLE}.manufacturer ;;
  }

  dimension: tactic {
    type: string
    sql: ${TABLE}.tactic ;;
  }

  dimension: product_type {
    type: string
    sql: ${TABLE}.product_type ;;
  }

  dimension: media_type {
    type: string
    sql: ${TABLE}.media_type ;;
  }

  dimension: traffic_source {
    type: string
    sql: ${TABLE}.traffic_source ;;
  }

  dimension: paid_organic {
    type: string
    sql: ${TABLE}.paid_organic ;;
  }

  dimension: campaign {
    type: string
    sql: ${TABLE}.campaign ;;
  }

  dimension: cost {
    type: number
    value_format_name: usd
    sql: ${TABLE}.cost ;;
  }

  dimension: clicks {
    type: number
    sql: ${TABLE}.clicks ;;
  }

  dimension: impressions {
    type: number
    sql: ${TABLE}.impressions ;;
  }

  set: detail {
    fields: [
      date_time,
      platform,
      ad_account,
      market,
      manufacturer,
      tactic,
      product_type,
      media_type,
      traffic_source,
      paid_organic,
      campaign,
      cost,
      clicks,
      impressions
    ]
  }
}
