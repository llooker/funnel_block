#
# demo data from account:  https://app.funnel.io/#/account/-Ka9LtSHV1be2nsQYVVd/exports/
# bigquery database:https://bigquery.cloud.google.com/dataset/firebase-funnel:funnel_looker_demo
#

view: funnel_demo_view {
  derived_table: {
    sql:
select timestamp(date) as date,
sourceType as platform,
sourceName as ad_account,
'noop' as market,
'noop' as manufacturer,
'noop' as tactic,
'noop' as product_type,
'noop' as media_type,
traffic_source,
paid_organic,
campaign,
common_cost as cost,
common_clicks as clicks,
common_impressions as impressions,
common_cost,
common_clicks,
common_impressions,
googleanalytics_ga_transactionRevenue,
googleanalytics_ga_transactions,
googleanalytics_ga_sessions
FROM `firebase-funnel.funnel_looker_demo.funnel_data_*`;;
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
    value_format_name: usd

  }

  measure: ctr {
    type:  number
    sql: ${total_clicks} / ${total_impressions} ;;
  }

  measure: cpc {
    type:  number
    sql: ${total_cost} / ${total_clicks} ;;
  }

  measure: total_transactions {
    type:  sum
    sql:  ${googleanalytics_ga_transactions} ;;
  }

  measure: total_revenue {
    type:  sum
    sql:  ${googleanalytics_ga_transactionRevenue} ;;
    value_format_name: usd
  }

  measure: total_sessions {
    type:  sum
    sql:  ${googleanalytics_ga_sessions} ;;
    value_format_name: decimal_0
  }

  dimension_group: date {
    type: time
    sql: ${TABLE}.date ;;
  }

  dimension: platform {
    type: string
    sql: ${TABLE}.platform ;;
  }

  dimension: date_year_num {
    type: number
    sql: ${TABLE}.date_year ;;
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
    drill_fields: [campaign]
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

  dimension: googleanalytics_ga_transactionRevenue {
    label: "Transaction revenue"
    hidden: yes
    type: number
    sql: ${TABLE}.googleanalytics_ga_transactionRevenue ;;
  }

  dimension: googleanalytics_ga_transactions {
    label: "Transactions"
    hidden: yes
    type: number
    sql: ${TABLE}.googleanalytics_ga_transactions ;;
  }

  dimension: googleanalytics_ga_sessions {
    label: "Sessions"
    hidden: yes
    type: number
    sql: ${TABLE}.googleanalytics_ga_sessions ;;
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

  # this shizzle is to to date period comparisons

  dimension: timestamp {
    type:  date
    sql:  ${TABLE}.date ;;
  }

  filter: date_filter {
    description: "Use this date filter in combination with the timeframes dimension for dynamic date filtering"
    type: date
  }

  dimension_group: filter_start_date {
    type: time
    timeframes: [raw,date]
    sql: CASE WHEN {% date_start date_filter %} IS NULL THEN '1970-01-01' ELSE CAST({% date_start date_filter %} AS DATE) END;;
  }

  dimension_group: filter_end_date {
    type: time
    timeframes: [raw,date]
    sql: CASE WHEN {% date_end date_filter %} IS NULL THEN CURRENT_DATE ELSE CAST({% date_end date_filter %} AS DATE) END;;
  }

  dimension: interval {
    type: number
    sql: DATE_DIFF(${filter_start_date_raw}, ${filter_end_date_raw}, DAY);;
  }

  dimension: previous_start_date {
    type: string
    sql: DATE_ADD(${filter_start_date_raw}, INTERVAL ${interval} DAY) ;;
  }


  dimension: is_current_period {
    type: yesno
    sql: ${timestamp} >= ${filter_start_date_date} AND ${timestamp} < ${filter_end_date_date} ;;
  }

  dimension: is_previous_period {
    type: yesno
    sql: ${timestamp} >= ${previous_start_date} AND ${timestamp} < ${filter_start_date_date} ;;
  }

  dimension: timeframes {
    description: "Use this field in combination with the date filter field for dynamic date filtering"
    suggestions: ["period","previous period"]
    type: string
    case:  {
      when:  {
        sql: ${is_current_period} = true;;
        label: "Selected Period"
      }
      when: {
        sql: ${is_previous_period} = true;;
        label: "Previous Period"
      }
      else: "Not in time period"
    }
  }

##################################################################
# Generated by Funnel
##################################################################

  #
  # Facebook
  #

  dimension: facebook_video_10_sec_watched_actions_video_view {
    type:number
    hidden:yes
    sql: ${TABLE}.facebook_video_10_sec_watched_actions_video_view;;
    label: "10-Second Video Views"
    group_label: "facebook-videos"
    description: "This shows the number of total views of at least 10 seconds or to the end of your video, whichever occurs first."
  }

  dimension: facebook_video_15_sec_watched_actions_video_view {
    type:number
    hidden:yes
    sql: ${TABLE}.facebook_video_15_sec_watched_actions_video_view;;
    label: "15-Second Video Views"
    group_label: "facebook-videos"
    description: "The number of times your video was viewed more than 15 seconds, including views that skipped to this point."
  }

  dimension: facebook_actions_video_view {
    type:number
    hidden:yes
    sql: ${TABLE}.facebook_actions_video_view;;
    label: "3-second video views"
    group_label: "facebook-videos"
    description: "The number of times your video was viewed for 3 seconds or more."
  }

  dimension: facebook_video_30_sec_watched_actions_video_view {
    type:number
    hidden:yes
    sql: ${TABLE}.facebook_video_30_sec_watched_actions_video_view;;
    label: "30-Second Video Views"
    group_label: "facebook-videos"
    description: "This shows the number of total views of at least 30 seconds or to the end of your video, whichever occurs first."
  }

  dimension: facebook_actions_app_engagement {
    type:number
    hidden:yes
    sql: ${TABLE}.facebook_actions_app_engagement;;
    label: "App engagement"
    group_label: "facebook-apps"
    description: "The number of actions, including app installs, credit spends and uses as a result of your ad."
  }

  dimension: facebook_app_store_clicks {
    type:number
    hidden:yes
    sql: ${TABLE}.facebook_app_store_clicks;;
    label: "App store clicks"
    group_label: "facebook-apps"
    description: "The numbers of clicks that go to app store after user clicks your ads."
  }

  dimension: facebook_call_to_action_clicks {
    type:number
    hidden:yes
    sql: ${TABLE}.facebook_call_to_action_clicks;;
    label: "Call to action clicks"
    group_label: "facebook-clicks"
    description: "The number of clicks on the call to action button your ad receives."
  }

  dimension: facebook_actions_checkin {
    type:number
    hidden:yes
    sql: ${TABLE}.facebook_actions_checkin;;
    label: "Check-ins"
    group_label: "facebook-engagement-actions"
    description: "The number of check-ins to your Page as a result of your ad. This is only available to Pages that are associated with a physical address."
  }

  dimension: facebook_clicks {
    type:number
    hidden:yes
    sql: ${TABLE}.facebook_clicks;;
    label: "Clicks (All)"
    group_label: "facebook-clicks"
    description: "The number of clicks that your ad got."
  }

  dimension: facebook_actions_video_play {
    type:number
    hidden:yes
    sql: ${TABLE}.facebook_actions_video_play;;
    label: "Clicks to play video"
    group_label: "facebook-videos"
    description: "The number of clicks to play a video as a result of your ad."
  }

  dimension: facebook_video_complete_watched_actions_video_view {
    type:number
    hidden:yes
    sql: ${TABLE}.facebook_video_complete_watched_actions_video_view;;
    label: "Complete Video Views"
    group_label: "facebook-videos"
    description: "This shows the number of total views of at least 30 seconds or to the end of your video, whichever occurs first."
  }

  dimension: facebook_cost {
    type:number
    hidden:yes
    sql: ${TABLE}.facebook_cost;;
    label: "Cost"
    group_label: "facebook-performance"
    description: "Amount spent in Facebook"
  }

  dimension: facebook_deeplink_clicks {
    type:number
    hidden:yes
    sql: ${TABLE}.facebook_deeplink_clicks;;
    label: "Deeplink clicks"
    group_label: "facebook-clicks"
    description: "The numbers of clicks that go to app after user clicks your ads."
  }

  dimension: facebook_actions_app_install {
    type:number
    hidden:yes
    sql: ${TABLE}.facebook_actions_app_install;;
    label: "Desktop App Installs"
    group_label: "facebook-apps"
    description: "The number of app installs as a result of your ad."
  }

  dimension: facebook_actions_app_story {
    type:number
    hidden:yes
    sql: ${TABLE}.facebook_actions_app_story;;
    label: "Desktop App Story Engagement"
    group_label: "facebook-apps"
    description: "The number of actions related to the application story as a result of your ad."
  }

  dimension: facebook_actions_app_use {
    type:number
    hidden:yes
    sql: ${TABLE}.facebook_actions_app_use;;
    label: "Desktop App Uses"
    group_label: "facebook-apps"
    description: "The number of uses of your app as a result of your ad. This includes number of times your app was used for a minimum of 4 minutes in the last 14 days, or at least twice by the same person with one of those times occurring in the past 14 days."
  }

  dimension: facebook_actions_rsvp {
    type:number
    hidden:yes
    sql: ${TABLE}.facebook_actions_rsvp;;
    label: "Event responses"
    group_label: "facebook-events"
    description: "The number of people who responded going or interested in your event as a result of your ad."
  }

  dimension: facebook_actions_gift_sale {
    type:number
    hidden:yes
    sql: ${TABLE}.facebook_actions_gift_sale;;
    label: "Gift sales"
    group_label: "facebook-engagement-actions"
    description: "The number of gifts you sold on Facebook as result of your ad."
  }

  dimension: facebook_action_values_gift_sale {
    type:number
    hidden:yes
    sql: ${TABLE}.facebook_action_values_gift_sale;;
    label: "Gift sales conversion value"
    group_label: "facebook-engagement-conversion-values"
    description: "The total value returned from the gift sale conversions as a result of your ad."
  }

  dimension: facebook_impressions {
    type:number
    hidden:yes
    sql: ${TABLE}.facebook_impressions;;
    label: "Impressions"
    group_label: "facebook-performance"
    description: "Number of Facebook impressions"
  }

  dimension: facebook_inline_link_clicks {
    type:number
    hidden:yes
    sql: ${TABLE}.facebook_inline_link_clicks;;
    label: "Inline link clicks"
    group_label: "facebook-clicks"
    description: "The number of inline link clicks that your ad got."
  }

  dimension: facebook_inline_post_engagement {
    type:number
    hidden:yes
    sql: ${TABLE}.facebook_inline_post_engagement;;
    label: "Inline post engagement"
    group_label: "facebook-engagement-actions"
    description: "The number of inline post engagement that your ad got."
  }

  dimension: facebook_actions_leadgen_other {
    type:number
    hidden:yes
    sql: ${TABLE}.facebook_actions_leadgen_other;;
    label: "Leads (Form)"
    group_label: "facebook-engagement-actions"
    description: "The number of leads registered from your Lead Ads."
  }

  dimension: facebook_actions_link_click {
    type:number
    hidden:yes
    sql: ${TABLE}.facebook_actions_link_click;;
    label: "Link clicks"
    group_label: "facebook-engagement-actions"
    description: "The number of clicks on links appearing on your ad or Page that direct people to your sites off Facebook as a result of your ad."
  }

  dimension: facebook_actions_mobile_app_install {
    type:number
    hidden:yes
    sql: ${TABLE}.facebook_actions_mobile_app_install;;
    label: "Mobile app installs"
    group_label: "facebook-apps"
    description: "The number of installs from a mobile device as a result of your ad."
  }

  dimension: facebook_actions_receive_offer {
    type:number
    hidden:yes
    sql: ${TABLE}.facebook_actions_receive_offer;;
    label: "Offer claims"
    group_label: "facebook-engagement-actions"
    description: "The number of claims on your offers as a result of your ad."
  }

  dimension: facebook_action_values_offsite_conversion_other {
    type:number
    hidden:yes
    sql: ${TABLE}.facebook_action_values_offsite_conversion_other;;
    label: "Other website conversion value (Conversion Tracking Pixel)"
    group_label: "facebook-website-conversion-values"
    description: "The total value returned from other conversions on your website as a result of your ad."
  }

  dimension: facebook_actions_offsite_conversion_other {
    type:number
    hidden:yes
    sql: ${TABLE}.facebook_actions_offsite_conversion_other;;
    label: "Other website conversions (Conversion Tracking Pixel)"
    group_label: "facebook-website-actions"
    description: "The number of other conversions on your website that happened as a result of your ad."
  }

  dimension: facebook_actions_page_engagement {
    type:number
    hidden:yes
    sql: ${TABLE}.facebook_actions_page_engagement;;
    label: "Page engagement"
    group_label: "facebook-engagement-actions"
    description: "The number of actions related to the Page and your Page's posts as a result of your ad."
  }

  dimension: facebook_actions_like {
    type:number
    hidden:yes
    sql: ${TABLE}.facebook_actions_like;;
    label: "Page likes"
    group_label: "facebook-engagement-actions"
    description: "The number of likes on your Page as a result of your ad."
  }

  dimension: facebook_actions_mention {
    type:number
    hidden:yes
    sql: ${TABLE}.facebook_actions_mention;;
    label: "Page mentions"
    group_label: "facebook-engagement-actions"
    description: "The number of mentions of your Page as a result of your ad."
  }

  dimension: facebook_actions_tab_view {
    type:number
    hidden:yes
    sql: ${TABLE}.facebook_actions_tab_view;;
    label: "Page tab views"
    group_label: "facebook-engagement-actions"
    description: "The number of views of tabs on your Page as a result of your ad."
  }

  dimension: facebook_actions_photo_view {
    type:number
    hidden:yes
    sql: ${TABLE}.facebook_actions_photo_view;;
    label: "Photo views"
    group_label: "facebook-engagement-actions"
    description: "The number of views of your photos as a result of your ad."
  }

  dimension: facebook_actions_comment {
    type:number
    hidden:yes
    sql: ${TABLE}.facebook_actions_comment;;
    label: "Post comments"
    group_label: "facebook-engagement-actions"
    description: "The number of comments on your Page's posts as a result of your ad."
  }

  dimension: facebook_actions_post_engagement {
    type:number
    hidden:yes
    sql: ${TABLE}.facebook_actions_post_engagement;;
    label: "Post engagement"
    group_label: "facebook-engagement-actions"
    description: "The number of actions related to your Page's posts as a result of your ad."
  }

  dimension: facebook_actions_post_like {
    type:number
    hidden:yes
    sql: ${TABLE}.facebook_actions_post_like;;
    label: "Post likes"
    group_label: "facebook-engagement-actions"
    description: "The number of likes on your Page's posts as a result of your ad."
  }

  dimension: facebook_actions_post {
    type:number
    hidden:yes
    sql: ${TABLE}.facebook_actions_post;;
    label: "Post shares"
    group_label: "facebook-engagement-actions"
    description: "The number of shares of your Page's posts as a result of your ad."
  }

  dimension: facebook_actions_vote {
    type:number
    hidden:yes
    sql: ${TABLE}.facebook_actions_vote;;
    label: "Question answers"
    group_label: "facebook-engagement-actions"
    description: "The number of answers to your questions as a result of your ad."
  }

  dimension: facebook_actions_follow {
    type:number
    hidden:yes
    sql: ${TABLE}.facebook_actions_follow;;
    label: "Question follows"
    group_label: "facebook-engagement-actions"
    description: "The number of follows of your questions as a result of your ad."
  }

  dimension: facebook_social_clicks {
    type:number
    hidden:yes
    sql: ${TABLE}.facebook_social_clicks;;
    label: "Social clicks"
    group_label: "facebook-clicks"
    description: "The number of clicks your ad receives when it's shown with social information (ex: Jane Doe likes this)."
  }

  dimension: facebook_social_impressions {
    type:number
    hidden:yes
    sql: ${TABLE}.facebook_social_impressions;;
    label: "Social impressions"
    group_label: "facebook-performance"
    description: "The number of times your ad was served, with social information. For example, if 3 people are served an ad 2 times each and it includes information about a friend liking your Page, it counts as 6 social impressions."
  }

  dimension: facebook_social_spend {
    type:number
    hidden:yes
    sql: ${TABLE}.facebook_social_spend;;
    label: "Social spend"
    group_label: "facebook-performance"
    description: "The total amount you've spent so far for your ads showed with social information (ex: Jane Doe likes this)."
  }

  dimension: facebook_total_actions {
    type:number
    hidden:yes
    sql: ${TABLE}.facebook_total_actions;;
    label: "Total actions"
    group_label: "facebook-performance"
    description: "The number of actions taken on your ad, Page, app or event after your ad was served to someone, even if they didn't click on it. Actions include Page likes, app installs, conversions, event responses and more. For example, 2 Page likes and 2 comments would be counted as 4 actions."
  }

  dimension: facebook_actions_unlike {
    type:number
    hidden:yes
    sql: ${TABLE}.facebook_actions_unlike;;
    label: "Unlikes"
    group_label: "facebook-engagement-actions"
    description: "The number of unlikes of your Page as a result of your ad."
  }

  dimension: facebook_video_p100_watched_actions_video_view {
    type:number
    hidden:yes
    sql: ${TABLE}.facebook_video_p100_watched_actions_video_view;;
    label: "Video watches at 100%"
    group_label: "facebook-videos"
    description: "The number of times your video was viewed to 100% of its length, including views that skipped to this point."
  }

  dimension: facebook_video_p25_watched_actions_video_view {
    type:number
    hidden:yes
    sql: ${TABLE}.facebook_video_p25_watched_actions_video_view;;
    label: "Video watches at 25%"
    group_label: "facebook-videos"
    description: "The number of times your video was viewed to 25% of its length, including views that skipped to this point."
  }

  dimension: facebook_video_p50_watched_actions_video_view {
    type:number
    hidden:yes
    sql: ${TABLE}.facebook_video_p50_watched_actions_video_view;;
    label: "Video watches at 50%"
    group_label: "facebook-videos"
    description: "The number of times your video was viewed to 50% of its length, including views that skipped to this point."
  }

  dimension: facebook_video_p75_watched_actions_video_view {
    type:number
    hidden:yes
    sql: ${TABLE}.facebook_video_p75_watched_actions_video_view;;
    label: "Video watches at 75%"
    group_label: "facebook-videos"
    description: "The number of times your video was viewed to 75% of its length, including views that skipped to this point."
  }

  dimension: facebook_video_p95_watched_actions_video_view {
    type:number
    hidden:yes
    sql: ${TABLE}.facebook_video_p95_watched_actions_video_view;;
    label: "Video watches at 95%"
    group_label: "facebook-videos"
    description: "The number of times your video was viewed to 95% of its length, including views that skipped to this point."
  }

  dimension: facebook_actions_offsite_conversion_fb_pixel_add_payment_info {
    type:number
    hidden:yes
    sql: ${TABLE}.facebook_actions_offsite_conversion_fb_pixel_add_payment_info;;
    label: "Website Adds of Payment Info"
    group_label: "facebook-website-actions"
    description: "The number of times payment information was entered tracked by your Facebook pixel on your website after people clicked or viewed your ad."
  }

  dimension: facebook_actions_offsite_conversion_fb_pixel_add_payment_info_1d_click {
    type:number
    hidden:yes
    sql: ${TABLE}.facebook_actions_offsite_conversion_fb_pixel_add_payment_info_1d_click;;
    label: "Website Adds of Payment Info (1-day click)"
    group_label: "facebook-website-actions"
    description: "The number of times payment information was entered tracked by your Facebook pixel on your website after people clicked or viewed your ad."
  }

  dimension: facebook_actions_offsite_conversion_fb_pixel_add_payment_info_1d_view {
    type:number
    hidden:yes
    sql: ${TABLE}.facebook_actions_offsite_conversion_fb_pixel_add_payment_info_1d_view;;
    label: "Website Adds of Payment Info (1-day view)"
    group_label: "facebook-website-actions"
    description: "The number of times payment information was entered tracked by your Facebook pixel on your website after people clicked or viewed your ad."
  }

  dimension: facebook_actions_offsite_conversion_fb_pixel_add_payment_info_28d_click {
    type:number
    hidden:yes
    sql: ${TABLE}.facebook_actions_offsite_conversion_fb_pixel_add_payment_info_28d_click;;
    label: "Website Adds of Payment Info (28-day click)"
    group_label: "facebook-website-actions"
    description: "The number of times payment information was entered tracked by your Facebook pixel on your website after people clicked or viewed your ad."
  }

  dimension: facebook_actions_offsite_conversion_fb_pixel_add_payment_info_28d_view {
    type:number
    hidden:yes
    sql: ${TABLE}.facebook_actions_offsite_conversion_fb_pixel_add_payment_info_28d_view;;
    label: "Website Adds of Payment Info (28-day view)"
    group_label: "facebook-website-actions"
    description: "The number of times payment information was entered tracked by your Facebook pixel on your website after people clicked or viewed your ad."
  }

  dimension: facebook_actions_offsite_conversion_fb_pixel_add_payment_info_7d_click {
    type:number
    hidden:yes
    sql: ${TABLE}.facebook_actions_offsite_conversion_fb_pixel_add_payment_info_7d_click;;
    label: "Website Adds of Payment Info (7-day click)"
    group_label: "facebook-website-actions"
    description: "The number of times payment information was entered tracked by your Facebook pixel on your website after people clicked or viewed your ad."
  }

  dimension: facebook_actions_offsite_conversion_fb_pixel_add_payment_info_7d_view {
    type:number
    hidden:yes
    sql: ${TABLE}.facebook_actions_offsite_conversion_fb_pixel_add_payment_info_7d_view;;
    label: "Website Adds of Payment Info (7-day view)"
    group_label: "facebook-website-actions"
    description: "The number of times payment information was entered tracked by your Facebook pixel on your website after people clicked or viewed your ad."
  }

  dimension: facebook_actions_offsite_conversion_fb_pixel_add_to_cart {
    type:number
    hidden:yes
    sql: ${TABLE}.facebook_actions_offsite_conversion_fb_pixel_add_to_cart;;
    label: "Website Adds to Cart"
    group_label: "facebook-website-actions"
    description: "The number of times an item was added to a shopping cart tracked by your Facebook pixel on your website after people clicked or viewed your ad."
  }

  dimension: facebook_actions_offsite_conversion_fb_pixel_add_to_cart_1d_click {
    type:number
    hidden:yes
    sql: ${TABLE}.facebook_actions_offsite_conversion_fb_pixel_add_to_cart_1d_click;;
    label: "Website Adds to Cart (1-day click)"
    group_label: "facebook-website-actions"
    description: "The number of times an item was added to a shopping cart tracked by your Facebook pixel on your website after people clicked or viewed your ad."
  }

  dimension: facebook_actions_offsite_conversion_fb_pixel_add_to_cart_1d_view {
    type:number
    hidden:yes
    sql: ${TABLE}.facebook_actions_offsite_conversion_fb_pixel_add_to_cart_1d_view;;
    label: "Website Adds to Cart (1-day view)"
    group_label: "facebook-website-actions"
    description: "The number of times an item was added to a shopping cart tracked by your Facebook pixel on your website after people clicked or viewed your ad."
  }

  dimension: facebook_actions_offsite_conversion_fb_pixel_add_to_cart_28d_click {
    type:number
    hidden:yes
    sql: ${TABLE}.facebook_actions_offsite_conversion_fb_pixel_add_to_cart_28d_click;;
    label: "Website Adds to Cart (28-day click)"
    group_label: "facebook-website-actions"
    description: "The number of times an item was added to a shopping cart tracked by your Facebook pixel on your website after people clicked or viewed your ad."
  }

  dimension: facebook_actions_offsite_conversion_fb_pixel_add_to_cart_28d_view {
    type:number
    hidden:yes
    sql: ${TABLE}.facebook_actions_offsite_conversion_fb_pixel_add_to_cart_28d_view;;
    label: "Website Adds to Cart (28-day view)"
    group_label: "facebook-website-actions"
    description: "The number of times an item was added to a shopping cart tracked by your Facebook pixel on your website after people clicked or viewed your ad."
  }

  dimension: facebook_actions_offsite_conversion_fb_pixel_add_to_cart_7d_click {
    type:number
    hidden:yes
    sql: ${TABLE}.facebook_actions_offsite_conversion_fb_pixel_add_to_cart_7d_click;;
    label: "Website Adds to Cart (7-day click)"
    group_label: "facebook-website-actions"
    description: "The number of times an item was added to a shopping cart tracked by your Facebook pixel on your website after people clicked or viewed your ad."
  }

  dimension: facebook_actions_offsite_conversion_fb_pixel_add_to_cart_7d_view {
    type:number
    hidden:yes
    sql: ${TABLE}.facebook_actions_offsite_conversion_fb_pixel_add_to_cart_7d_view;;
    label: "Website Adds to Cart (7-day view)"
    group_label: "facebook-website-actions"
    description: "The number of times an item was added to a shopping cart tracked by your Facebook pixel on your website after people clicked or viewed your ad."
  }

  dimension: facebook_actions_offsite_conversion_add_to_cart {
    type:number
    hidden:yes
    sql: ${TABLE}.facebook_actions_offsite_conversion_add_to_cart;;
    label: "Website Adds to Cart (Conversion Tracking Pixel)"
    group_label: "facebook-website-actions"
    description: "The number of times something was added to a shopping cart on your website as a result of your ad."
  }

  dimension: facebook_action_values_offsite_conversion_fb_pixel_add_to_cart {
    type:number
    hidden:yes
    sql: ${TABLE}.facebook_action_values_offsite_conversion_fb_pixel_add_to_cart;;
    label: "Website Adds to Cart Conversion Value"
    group_label: "facebook-website-conversion-values"
    description: "The total value of the adds-to-cart tracked by your Facebook pixel on your website after people viewed or clicked on your ad. This is based on the value assigned to the adds-to-cart event in your Facebook pixel code."
  }

  dimension: facebook_action_values_offsite_conversion_fb_pixel_add_to_cart_1d_click {
    type:number
    hidden:yes
    sql: ${TABLE}.facebook_action_values_offsite_conversion_fb_pixel_add_to_cart_1d_click;;
    label: "Website Adds to Cart Conversion Value (1-day click)"
    group_label: "facebook-website-conversion-values"
    description: "The total value of the adds-to-cart tracked by your Facebook pixel on your website after people viewed or clicked on your ad. This is based on the value assigned to the adds-to-cart event in your Facebook pixel code."
  }

  dimension: facebook_action_values_offsite_conversion_fb_pixel_add_to_cart_1d_view {
    type:number
    hidden:yes
    sql: ${TABLE}.facebook_action_values_offsite_conversion_fb_pixel_add_to_cart_1d_view;;
    label: "Website Adds to Cart Conversion Value (1-day view)"
    group_label: "facebook-website-conversion-values"
    description: "The total value of the adds-to-cart tracked by your Facebook pixel on your website after people viewed or clicked on your ad. This is based on the value assigned to the adds-to-cart event in your Facebook pixel code."
  }

  dimension: facebook_action_values_offsite_conversion_fb_pixel_add_to_cart_28d_click {
    type:number
    hidden:yes
    sql: ${TABLE}.facebook_action_values_offsite_conversion_fb_pixel_add_to_cart_28d_click;;
    label: "Website Adds to Cart Conversion Value (28-day click)"
    group_label: "facebook-website-conversion-values"
    description: "The total value of the adds-to-cart tracked by your Facebook pixel on your website after people viewed or clicked on your ad. This is based on the value assigned to the adds-to-cart event in your Facebook pixel code."
  }

  dimension: facebook_action_values_offsite_conversion_fb_pixel_add_to_cart_28d_view {
    type:number
    hidden:yes
    sql: ${TABLE}.facebook_action_values_offsite_conversion_fb_pixel_add_to_cart_28d_view;;
    label: "Website Adds to Cart Conversion Value (28-day view)"
    group_label: "facebook-website-conversion-values"
    description: "The total value of the adds-to-cart tracked by your Facebook pixel on your website after people viewed or clicked on your ad. This is based on the value assigned to the adds-to-cart event in your Facebook pixel code."
  }

  dimension: facebook_action_values_offsite_conversion_fb_pixel_add_to_cart_7d_click {
    type:number
    hidden:yes
    sql: ${TABLE}.facebook_action_values_offsite_conversion_fb_pixel_add_to_cart_7d_click;;
    label: "Website Adds to Cart Conversion Value (7-day click)"
    group_label: "facebook-website-conversion-values"
    description: "The total value of the adds-to-cart tracked by your Facebook pixel on your website after people viewed or clicked on your ad. This is based on the value assigned to the adds-to-cart event in your Facebook pixel code."
  }

  dimension: facebook_action_values_offsite_conversion_fb_pixel_add_to_cart_7d_view {
    type:number
    hidden:yes
    sql: ${TABLE}.facebook_action_values_offsite_conversion_fb_pixel_add_to_cart_7d_view;;
    label: "Website Adds to Cart Conversion Value (7-day view)"
    group_label: "facebook-website-conversion-values"
    description: "The total value of the adds-to-cart tracked by your Facebook pixel on your website after people viewed or clicked on your ad. This is based on the value assigned to the adds-to-cart event in your Facebook pixel code."
  }

  dimension: facebook_action_values_offsite_conversion_add_to_cart {
    type:number
    hidden:yes
    sql: ${TABLE}.facebook_action_values_offsite_conversion_add_to_cart;;
    label: "Website Adds to Cart Conversion Value (Conversion Tracking Pixel)"
    group_label: "facebook-website-conversion-values"
    description: "The total value returned when items were added to a cart on your website as a result of your ad."
  }

  dimension: facebook_actions_offsite_conversion_fb_pixel_add_to_wishlist {
    type:number
    hidden:yes
    sql: ${TABLE}.facebook_actions_offsite_conversion_fb_pixel_add_to_wishlist;;
    label: "Website Adds to Wishlist"
    group_label: "facebook-website-actions"
    description: "The number of times an item was added to a wishlist tracked by your Facebook pixel on your website after people viewed or clicked on your ad."
  }

  dimension: facebook_actions_offsite_conversion_fb_pixel_add_to_wishlist_1d_click {
    type:number
    hidden:yes
    sql: ${TABLE}.facebook_actions_offsite_conversion_fb_pixel_add_to_wishlist_1d_click;;
    label: "Website Adds to Wishlist (1-day click)"
    group_label: "facebook-website-actions"
    description: "The number of times an item was added to a wishlist tracked by your Facebook pixel on your website after people viewed or clicked on your ad."
  }

  dimension: facebook_actions_offsite_conversion_fb_pixel_add_to_wishlist_1d_view {
    type:number
    hidden:yes
    sql: ${TABLE}.facebook_actions_offsite_conversion_fb_pixel_add_to_wishlist_1d_view;;
    label: "Website Adds to Wishlist (1-day view)"
    group_label: "facebook-website-actions"
    description: "The number of times an item was added to a wishlist tracked by your Facebook pixel on your website after people viewed or clicked on your ad."
  }

  dimension: facebook_actions_offsite_conversion_fb_pixel_add_to_wishlist_28d_click {
    type:number
    hidden:yes
    sql: ${TABLE}.facebook_actions_offsite_conversion_fb_pixel_add_to_wishlist_28d_click;;
    label: "Website Adds to Wishlist (28-day click)"
    group_label: "facebook-website-actions"
    description: "The number of times an item was added to a wishlist tracked by your Facebook pixel on your website after people viewed or clicked on your ad."
  }

  dimension: facebook_actions_offsite_conversion_fb_pixel_add_to_wishlist_28d_view {
    type:number
    hidden:yes
    sql: ${TABLE}.facebook_actions_offsite_conversion_fb_pixel_add_to_wishlist_28d_view;;
    label: "Website Adds to Wishlist (28-day view)"
    group_label: "facebook-website-actions"
    description: "The number of times an item was added to a wishlist tracked by your Facebook pixel on your website after people viewed or clicked on your ad."
  }

  dimension: facebook_actions_offsite_conversion_fb_pixel_add_to_wishlist_7d_click {
    type:number
    hidden:yes
    sql: ${TABLE}.facebook_actions_offsite_conversion_fb_pixel_add_to_wishlist_7d_click;;
    label: "Website Adds to Wishlist (7-day click)"
    group_label: "facebook-website-actions"
    description: "The number of times an item was added to a wishlist tracked by your Facebook pixel on your website after people viewed or clicked on your ad."
  }

  dimension: facebook_actions_offsite_conversion_fb_pixel_add_to_wishlist_7d_view {
    type:number
    hidden:yes
    sql: ${TABLE}.facebook_actions_offsite_conversion_fb_pixel_add_to_wishlist_7d_view;;
    label: "Website Adds to Wishlist (7-day view)"
    group_label: "facebook-website-actions"
    description: "The number of times an item was added to a wishlist tracked by your Facebook pixel on your website after people viewed or clicked on your ad."
  }

  dimension: facebook_actions_offsite_conversion_checkout {
    type:number
    hidden:yes
    sql: ${TABLE}.facebook_actions_offsite_conversion_checkout;;
    label: "Website Checkouts (Conversion Tracking Pixel)"
    group_label: "facebook-website-actions"
    description: "The number of times a checkout was completed on your website as a result of your ad."
  }

  dimension: facebook_action_values_offsite_conversion_checkout {
    type:number
    hidden:yes
    sql: ${TABLE}.facebook_action_values_offsite_conversion_checkout;;
    label: "Website Checkouts Conversion Value (Conversion Tracking Pixel)"
    group_label: "facebook-website-conversion-values"
    description: "The total value returned from checkout conversions on your website as a result of your ad."
  }

  dimension: facebook_actions_offsite_conversion_fb_pixel_initiate_checkout {
    type:number
    hidden:yes
    sql: ${TABLE}.facebook_actions_offsite_conversion_fb_pixel_initiate_checkout;;
    label: "Website Checkouts Initiated"
    group_label: "facebook-website-actions"
    description: "The number of checkout initiations tracked by your Facebook pixel on your website after people viewed or clicked on your ad."
  }

  dimension: facebook_actions_offsite_conversion_fb_pixel_initiate_checkout_1d_click {
    type:number
    hidden:yes
    sql: ${TABLE}.facebook_actions_offsite_conversion_fb_pixel_initiate_checkout_1d_click;;
    label: "Website Checkouts Initiated (1-day click)"
    group_label: "facebook-website-actions"
    description: "The number of checkout initiations tracked by your Facebook pixel on your website after people viewed or clicked on your ad."
  }

  dimension: facebook_actions_offsite_conversion_fb_pixel_initiate_checkout_1d_view {
    type:number
    hidden:yes
    sql: ${TABLE}.facebook_actions_offsite_conversion_fb_pixel_initiate_checkout_1d_view;;
    label: "Website Checkouts Initiated (1-day view)"
    group_label: "facebook-website-actions"
    description: "The number of checkout initiations tracked by your Facebook pixel on your website after people viewed or clicked on your ad."
  }

  dimension: facebook_actions_offsite_conversion_fb_pixel_initiate_checkout_28d_click {
    type:number
    hidden:yes
    sql: ${TABLE}.facebook_actions_offsite_conversion_fb_pixel_initiate_checkout_28d_click;;
    label: "Website Checkouts Initiated (28-day click)"
    group_label: "facebook-website-actions"
    description: "The number of checkout initiations tracked by your Facebook pixel on your website after people viewed or clicked on your ad."
  }

  dimension: facebook_actions_offsite_conversion_fb_pixel_initiate_checkout_28d_view {
    type:number
    hidden:yes
    sql: ${TABLE}.facebook_actions_offsite_conversion_fb_pixel_initiate_checkout_28d_view;;
    label: "Website Checkouts Initiated (28-day view)"
    group_label: "facebook-website-actions"
    description: "The number of checkout initiations tracked by your Facebook pixel on your website after people viewed or clicked on your ad."
  }

  dimension: facebook_actions_offsite_conversion_fb_pixel_initiate_checkout_7d_click {
    type:number
    hidden:yes
    sql: ${TABLE}.facebook_actions_offsite_conversion_fb_pixel_initiate_checkout_7d_click;;
    label: "Website Checkouts Initiated (7-day click)"
    group_label: "facebook-website-actions"
    description: "The number of checkout initiations tracked by your Facebook pixel on your website after people viewed or clicked on your ad."
  }

  dimension: facebook_actions_offsite_conversion_fb_pixel_initiate_checkout_7d_view {
    type:number
    hidden:yes
    sql: ${TABLE}.facebook_actions_offsite_conversion_fb_pixel_initiate_checkout_7d_view;;
    label: "Website Checkouts Initiated (7-day view)"
    group_label: "facebook-website-actions"
    description: "The number of checkout initiations tracked by your Facebook pixel on your website after people viewed or clicked on your ad."
  }

  dimension: facebook_action_values_offsite_conversion_fb_pixel_initiate_checkout {
    type:number
    hidden:yes
    sql: ${TABLE}.facebook_action_values_offsite_conversion_fb_pixel_initiate_checkout;;
    label: "Website Checkouts Initiated Conversion Value"
    group_label: "facebook-website-conversion-values"
    description: "The total value of the checkout actions tracked by your Facebook pixel on your website after people viewed or clicked on your ad. This is based on the value assigned to the checkout event in your Facebook pixel code."
  }

  dimension: facebook_action_values_offsite_conversion_fb_pixel_initiate_checkout_1d_click {
    type:number
    hidden:yes
    sql: ${TABLE}.facebook_action_values_offsite_conversion_fb_pixel_initiate_checkout_1d_click;;
    label: "Website Checkouts Initiated Conversion Value (1-day click)"
    group_label: "facebook-website-conversion-values"
    description: "The total value of the checkout actions tracked by your Facebook pixel on your website after people viewed or clicked on your ad. This is based on the value assigned to the checkout event in your Facebook pixel code."
  }

  dimension: facebook_action_values_offsite_conversion_fb_pixel_initiate_checkout_1d_view {
    type:number
    hidden:yes
    sql: ${TABLE}.facebook_action_values_offsite_conversion_fb_pixel_initiate_checkout_1d_view;;
    label: "Website Checkouts Initiated Conversion Value (1-day view)"
    group_label: "facebook-website-conversion-values"
    description: "The total value of the checkout actions tracked by your Facebook pixel on your website after people viewed or clicked on your ad. This is based on the value assigned to the checkout event in your Facebook pixel code."
  }

  dimension: facebook_action_values_offsite_conversion_fb_pixel_initiate_checkout_28d_click {
    type:number
    hidden:yes
    sql: ${TABLE}.facebook_action_values_offsite_conversion_fb_pixel_initiate_checkout_28d_click;;
    label: "Website Checkouts Initiated Conversion Value (28-day click)"
    group_label: "facebook-website-conversion-values"
    description: "The total value of the checkout actions tracked by your Facebook pixel on your website after people viewed or clicked on your ad. This is based on the value assigned to the checkout event in your Facebook pixel code."
  }

  dimension: facebook_action_values_offsite_conversion_fb_pixel_initiate_checkout_28d_view {
    type:number
    hidden:yes
    sql: ${TABLE}.facebook_action_values_offsite_conversion_fb_pixel_initiate_checkout_28d_view;;
    label: "Website Checkouts Initiated Conversion Value (28-day view)"
    group_label: "facebook-website-conversion-values"
    description: "The total value of the checkout actions tracked by your Facebook pixel on your website after people viewed or clicked on your ad. This is based on the value assigned to the checkout event in your Facebook pixel code."
  }

  dimension: facebook_action_values_offsite_conversion_fb_pixel_initiate_checkout_7d_click {
    type:number
    hidden:yes
    sql: ${TABLE}.facebook_action_values_offsite_conversion_fb_pixel_initiate_checkout_7d_click;;
    label: "Website Checkouts Initiated Conversion Value (7-day click)"
    group_label: "facebook-website-conversion-values"
    description: "The total value of the checkout actions tracked by your Facebook pixel on your website after people viewed or clicked on your ad. This is based on the value assigned to the checkout event in your Facebook pixel code."
  }

  dimension: facebook_action_values_offsite_conversion_fb_pixel_initiate_checkout_7d_view {
    type:number
    hidden:yes
    sql: ${TABLE}.facebook_action_values_offsite_conversion_fb_pixel_initiate_checkout_7d_view;;
    label: "Website Checkouts Initiated Conversion Value (7-day view)"
    group_label: "facebook-website-conversion-values"
    description: "The total value of the checkout actions tracked by your Facebook pixel on your website after people viewed or clicked on your ad. This is based on the value assigned to the checkout event in your Facebook pixel code."
  }

  dimension: facebook_actions_offsite_conversion_fb_pixel_view_content {
    type:number
    hidden:yes
    sql: ${TABLE}.facebook_actions_offsite_conversion_fb_pixel_view_content;;
    label: "Website Content Views"
    group_label: "facebook-website-actions"
    description: "The number of content views tracked by your Facebook pixel on your website after people viewed or clicked on your ad."
  }

  dimension: facebook_actions_offsite_conversion_fb_pixel_view_content_1d_click {
    type:number
    hidden:yes
    sql: ${TABLE}.facebook_actions_offsite_conversion_fb_pixel_view_content_1d_click;;
    label: "Website Content Views (1-day click)"
    group_label: "facebook-website-actions"
    description: "The number of content views tracked by your Facebook pixel on your website after people viewed or clicked on your ad."
  }

  dimension: facebook_actions_offsite_conversion_fb_pixel_view_content_1d_view {
    type:number
    hidden:yes
    sql: ${TABLE}.facebook_actions_offsite_conversion_fb_pixel_view_content_1d_view;;
    label: "Website Content Views (1-day view)"
    group_label: "facebook-website-actions"
    description: "The number of content views tracked by your Facebook pixel on your website after people viewed or clicked on your ad."
  }

  dimension: facebook_actions_offsite_conversion_fb_pixel_view_content_28d_click {
    type:number
    hidden:yes
    sql: ${TABLE}.facebook_actions_offsite_conversion_fb_pixel_view_content_28d_click;;
    label: "Website Content Views (28-day click)"
    group_label: "facebook-website-actions"
    description: "The number of content views tracked by your Facebook pixel on your website after people viewed or clicked on your ad."
  }

  dimension: facebook_actions_offsite_conversion_fb_pixel_view_content_28d_view {
    type:number
    hidden:yes
    sql: ${TABLE}.facebook_actions_offsite_conversion_fb_pixel_view_content_28d_view;;
    label: "Website Content Views (28-day view)"
    group_label: "facebook-website-actions"
    description: "The number of content views tracked by your Facebook pixel on your website after people viewed or clicked on your ad."
  }

  dimension: facebook_actions_offsite_conversion_fb_pixel_view_content_7d_click {
    type:number
    hidden:yes
    sql: ${TABLE}.facebook_actions_offsite_conversion_fb_pixel_view_content_7d_click;;
    label: "Website Content Views (7-day click)"
    group_label: "facebook-website-actions"
    description: "The number of content views tracked by your Facebook pixel on your website after people viewed or clicked on your ad."
  }

  dimension: facebook_actions_offsite_conversion_fb_pixel_view_content_7d_view {
    type:number
    hidden:yes
    sql: ${TABLE}.facebook_actions_offsite_conversion_fb_pixel_view_content_7d_view;;
    label: "Website Content Views (7-day view)"
    group_label: "facebook-website-actions"
    description: "The number of content views tracked by your Facebook pixel on your website after people viewed or clicked on your ad."
  }

  dimension: facebook_action_values_offsite_conversion_fb_pixel_view_content {
    type:number
    hidden:yes
    sql: ${TABLE}.facebook_action_values_offsite_conversion_fb_pixel_view_content;;
    label: "Website Content Views Conversion Value"
    group_label: "facebook-website-conversion-values"
    description: "The total value of the content views tracked by your Facebook pixel on your website after people viewed or clicked on your ad. This is based on the value assigned to the content view event in your Facebook pixel code."
  }

  dimension: facebook_action_values_offsite_conversion_fb_pixel_view_content_1d_click {
    type:number
    hidden:yes
    sql: ${TABLE}.facebook_action_values_offsite_conversion_fb_pixel_view_content_1d_click;;
    label: "Website Content Views Conversion Value (1-day click)"
    group_label: "facebook-website-conversion-values"
    description: "The total value of the content views tracked by your Facebook pixel on your website after people viewed or clicked on your ad. This is based on the value assigned to the content view event in your Facebook pixel code."
  }

  dimension: facebook_action_values_offsite_conversion_fb_pixel_view_content_1d_view {
    type:number
    hidden:yes
    sql: ${TABLE}.facebook_action_values_offsite_conversion_fb_pixel_view_content_1d_view;;
    label: "Website Content Views Conversion Value (1-day view)"
    group_label: "facebook-website-conversion-values"
    description: "The total value of the content views tracked by your Facebook pixel on your website after people viewed or clicked on your ad. This is based on the value assigned to the content view event in your Facebook pixel code."
  }

  dimension: facebook_action_values_offsite_conversion_fb_pixel_view_content_28d_click {
    type:number
    hidden:yes
    sql: ${TABLE}.facebook_action_values_offsite_conversion_fb_pixel_view_content_28d_click;;
    label: "Website Content Views Conversion Value (28-day click)"
    group_label: "facebook-website-conversion-values"
    description: "The total value of the content views tracked by your Facebook pixel on your website after people viewed or clicked on your ad. This is based on the value assigned to the content view event in your Facebook pixel code."
  }

  dimension: facebook_action_values_offsite_conversion_fb_pixel_view_content_28d_view {
    type:number
    hidden:yes
    sql: ${TABLE}.facebook_action_values_offsite_conversion_fb_pixel_view_content_28d_view;;
    label: "Website Content Views Conversion Value (28-day view)"
    group_label: "facebook-website-conversion-values"
    description: "The total value of the content views tracked by your Facebook pixel on your website after people viewed or clicked on your ad. This is based on the value assigned to the content view event in your Facebook pixel code."
  }

  dimension: facebook_action_values_offsite_conversion_fb_pixel_view_content_7d_click {
    type:number
    hidden:yes
    sql: ${TABLE}.facebook_action_values_offsite_conversion_fb_pixel_view_content_7d_click;;
    label: "Website Content Views Conversion Value (7-day click)"
    group_label: "facebook-website-conversion-values"
    description: "The total value of the content views tracked by your Facebook pixel on your website after people viewed or clicked on your ad. This is based on the value assigned to the content view event in your Facebook pixel code."
  }

  dimension: facebook_action_values_offsite_conversion_fb_pixel_view_content_7d_view {
    type:number
    hidden:yes
    sql: ${TABLE}.facebook_action_values_offsite_conversion_fb_pixel_view_content_7d_view;;
    label: "Website Content Views Conversion Value (7-day view)"
    group_label: "facebook-website-conversion-values"
    description: "The total value of the content views tracked by your Facebook pixel on your website after people viewed or clicked on your ad. This is based on the value assigned to the content view event in your Facebook pixel code."
  }

  dimension: facebook_actions_offsite_conversion {
    type:number
    hidden:yes
    sql: ${TABLE}.facebook_actions_offsite_conversion;;
    label: "Website Conversions"
    group_label: "facebook-website-actions"
    description: "The total number of actions tracked by your Facebook pixel or conversion pixels on your website after people clicked or viewed your ad."
  }

  dimension: facebook_actions_offsite_conversion_key_page_view {
    type:number
    hidden:yes
    sql: ${TABLE}.facebook_actions_offsite_conversion_key_page_view;;
    label: "Website Key Page Views (Conversion Tracking Pixel)"
    group_label: "facebook-website-actions"
    description: "The number of times a key page was viewed on your website as a result of your ad."
  }

  dimension: facebook_action_values_offsite_conversion_key_page_view {
    type:number
    hidden:yes
    sql: ${TABLE}.facebook_action_values_offsite_conversion_key_page_view;;
    label: "Website Key Page Views Conversion Value (Conversion Tracking Pixel)"
    group_label: "facebook-website-conversion-values"
    description: "The total value returned when a key page was viewed on your website as a result of your ad."
  }

  dimension: facebook_actions_offsite_conversion_fb_pixel_lead {
    type:number
    hidden:yes
    sql: ${TABLE}.facebook_actions_offsite_conversion_fb_pixel_lead;;
    label: "Website Leads"
    group_label: "facebook-website-actions"
    description: "The number of leads tracked by your Facebook pixel on your website after people viewed or clicked on your ad."
  }

  dimension: facebook_actions_offsite_conversion_fb_pixel_lead_1d_click {
    type:number
    hidden:yes
    sql: ${TABLE}.facebook_actions_offsite_conversion_fb_pixel_lead_1d_click;;
    label: "Website Leads (1-day click)"
    group_label: "facebook-website-actions"
    description: "The number of leads tracked by your Facebook pixel on your website after people viewed or clicked on your ad."
  }

  dimension: facebook_actions_offsite_conversion_fb_pixel_lead_1d_view {
    type:number
    hidden:yes
    sql: ${TABLE}.facebook_actions_offsite_conversion_fb_pixel_lead_1d_view;;
    label: "Website Leads (1-day view)"
    group_label: "facebook-website-actions"
    description: "The number of leads tracked by your Facebook pixel on your website after people viewed or clicked on your ad."
  }

  dimension: facebook_actions_offsite_conversion_fb_pixel_lead_28d_click {
    type:number
    hidden:yes
    sql: ${TABLE}.facebook_actions_offsite_conversion_fb_pixel_lead_28d_click;;
    label: "Website Leads (28-day click)"
    group_label: "facebook-website-actions"
    description: "The number of leads tracked by your Facebook pixel on your website after people viewed or clicked on your ad."
  }

  dimension: facebook_actions_offsite_conversion_fb_pixel_lead_28d_view {
    type:number
    hidden:yes
    sql: ${TABLE}.facebook_actions_offsite_conversion_fb_pixel_lead_28d_view;;
    label: "Website Leads (28-day view)"
    group_label: "facebook-website-actions"
    description: "The number of leads tracked by your Facebook pixel on your website after people viewed or clicked on your ad."
  }

  dimension: facebook_actions_offsite_conversion_fb_pixel_lead_7d_click {
    type:number
    hidden:yes
    sql: ${TABLE}.facebook_actions_offsite_conversion_fb_pixel_lead_7d_click;;
    label: "Website Leads (7-day click)"
    group_label: "facebook-website-actions"
    description: "The number of leads tracked by your Facebook pixel on your website after people viewed or clicked on your ad."
  }

  dimension: facebook_actions_offsite_conversion_fb_pixel_lead_7d_view {
    type:number
    hidden:yes
    sql: ${TABLE}.facebook_actions_offsite_conversion_fb_pixel_lead_7d_view;;
    label: "Website Leads (7-day view)"
    group_label: "facebook-website-actions"
    description: "The number of leads tracked by your Facebook pixel on your website after people viewed or clicked on your ad."
  }

  dimension: facebook_actions_offsite_conversion_lead {
    type:number
    hidden:yes
    sql: ${TABLE}.facebook_actions_offsite_conversion_lead;;
    label: "Website Leads (Conversion Tracking Pixel)"
    group_label: "facebook-website-actions"
    description: "The number of new leads you acquired on your website as a result of your ad."
  }

  dimension: facebook_action_values_offsite_conversion_fb_pixel_lead {
    type:number
    hidden:yes
    sql: ${TABLE}.facebook_action_values_offsite_conversion_fb_pixel_lead;;
    label: "Website Leads Conversion Value"
    group_label: "facebook-website-conversion-values"
    description: "The total value of the leads tracked by your Facebook pixel on your website after people viewed or clicked on your ad. This is based on the value assigned to the website lead event in your Facebook pixel code."
  }

  dimension: facebook_action_values_offsite_conversion_fb_pixel_lead_1d_click {
    type:number
    hidden:yes
    sql: ${TABLE}.facebook_action_values_offsite_conversion_fb_pixel_lead_1d_click;;
    label: "Website Leads Conversion Value (1-day click)"
    group_label: "facebook-website-conversion-values"
    description: "The total value of the leads tracked by your Facebook pixel on your website after people viewed or clicked on your ad. This is based on the value assigned to the website lead event in your Facebook pixel code."
  }

  dimension: facebook_action_values_offsite_conversion_fb_pixel_lead_1d_view {
    type:number
    hidden:yes
    sql: ${TABLE}.facebook_action_values_offsite_conversion_fb_pixel_lead_1d_view;;
    label: "Website Leads Conversion Value (1-day view)"
    group_label: "facebook-website-conversion-values"
    description: "The total value of the leads tracked by your Facebook pixel on your website after people viewed or clicked on your ad. This is based on the value assigned to the website lead event in your Facebook pixel code."
  }

  dimension: facebook_action_values_offsite_conversion_fb_pixel_lead_28d_click {
    type:number
    hidden:yes
    sql: ${TABLE}.facebook_action_values_offsite_conversion_fb_pixel_lead_28d_click;;
    label: "Website Leads Conversion Value (28-day click)"
    group_label: "facebook-website-conversion-values"
    description: "The total value of the leads tracked by your Facebook pixel on your website after people viewed or clicked on your ad. This is based on the value assigned to the website lead event in your Facebook pixel code."
  }

  dimension: facebook_action_values_offsite_conversion_fb_pixel_lead_28d_view {
    type:number
    hidden:yes
    sql: ${TABLE}.facebook_action_values_offsite_conversion_fb_pixel_lead_28d_view;;
    label: "Website Leads Conversion Value (28-day view)"
    group_label: "facebook-website-conversion-values"
    description: "The total value of the leads tracked by your Facebook pixel on your website after people viewed or clicked on your ad. This is based on the value assigned to the website lead event in your Facebook pixel code."
  }

  dimension: facebook_action_values_offsite_conversion_fb_pixel_lead_7d_click {
    type:number
    hidden:yes
    sql: ${TABLE}.facebook_action_values_offsite_conversion_fb_pixel_lead_7d_click;;
    label: "Website Leads Conversion Value (7-day click)"
    group_label: "facebook-website-conversion-values"
    description: "The total value of the leads tracked by your Facebook pixel on your website after people viewed or clicked on your ad. This is based on the value assigned to the website lead event in your Facebook pixel code."
  }

  dimension: facebook_action_values_offsite_conversion_fb_pixel_lead_7d_view {
    type:number
    hidden:yes
    sql: ${TABLE}.facebook_action_values_offsite_conversion_fb_pixel_lead_7d_view;;
    label: "Website Leads Conversion Value (7-day view)"
    group_label: "facebook-website-conversion-values"
    description: "The total value of the leads tracked by your Facebook pixel on your website after people viewed or clicked on your ad. This is based on the value assigned to the website lead event in your Facebook pixel code."
  }

  dimension: facebook_action_values_offsite_conversion_lead {
    type:number
    hidden:yes
    sql: ${TABLE}.facebook_action_values_offsite_conversion_lead;;
    label: "Website Leads Conversion Value (Conversion Tracking Pixel)"
    group_label: "facebook-website-conversion-values"
    description: "The total value returned from acquiring new leads on your website as a result of your ad."
  }

  dimension: facebook_actions_offsite_conversion_fb_pixel_purchase {
    type:number
    hidden:yes
    sql: ${TABLE}.facebook_actions_offsite_conversion_fb_pixel_purchase;;
    label: "Website Purchases"
    group_label: "facebook-website-actions"
    description: "The number of times a purchase was made tracked by your Facebook pixel on your website after people viewed or clicked on your ad."
  }

  dimension: facebook_actions_offsite_conversion_fb_pixel_purchase_1d_click {
    type:number
    hidden:yes
    sql: ${TABLE}.facebook_actions_offsite_conversion_fb_pixel_purchase_1d_click;;
    label: "Website Purchases (1-day click)"
    group_label: "facebook-website-actions"
    description: "The number of times a purchase was made tracked by your Facebook pixel on your website after people viewed or clicked on your ad."
  }

  dimension: facebook_actions_offsite_conversion_fb_pixel_purchase_1d_view {
    type:number
    hidden:yes
    sql: ${TABLE}.facebook_actions_offsite_conversion_fb_pixel_purchase_1d_view;;
    label: "Website Purchases (1-day view)"
    group_label: "facebook-website-actions"
    description: "The number of times a purchase was made tracked by your Facebook pixel on your website after people viewed or clicked on your ad."
  }

  dimension: facebook_actions_offsite_conversion_fb_pixel_purchase_28d_click {
    type:number
    hidden:yes
    sql: ${TABLE}.facebook_actions_offsite_conversion_fb_pixel_purchase_28d_click;;
    label: "Website Purchases (28-day click)"
    group_label: "facebook-website-actions"
    description: "The number of times a purchase was made tracked by your Facebook pixel on your website after people viewed or clicked on your ad."
  }

  dimension: facebook_actions_offsite_conversion_fb_pixel_purchase_28d_view {
    type:number
    hidden:yes
    sql: ${TABLE}.facebook_actions_offsite_conversion_fb_pixel_purchase_28d_view;;
    label: "Website Purchases (28-day view)"
    group_label: "facebook-website-actions"
    description: "The number of times a purchase was made tracked by your Facebook pixel on your website after people viewed or clicked on your ad."
  }

  dimension: facebook_actions_offsite_conversion_fb_pixel_purchase_7d_click {
    type:number
    hidden:yes
    sql: ${TABLE}.facebook_actions_offsite_conversion_fb_pixel_purchase_7d_click;;
    label: "Website Purchases (7-day click)"
    group_label: "facebook-website-actions"
    description: "The number of times a purchase was made tracked by your Facebook pixel on your website after people viewed or clicked on your ad."
  }

  dimension: facebook_actions_offsite_conversion_fb_pixel_purchase_7d_view {
    type:number
    hidden:yes
    sql: ${TABLE}.facebook_actions_offsite_conversion_fb_pixel_purchase_7d_view;;
    label: "Website Purchases (7-day view)"
    group_label: "facebook-website-actions"
    description: "The number of times a purchase was made tracked by your Facebook pixel on your website after people viewed or clicked on your ad."
  }

  dimension: facebook_action_values_offsite_conversion_fb_pixel_purchase {
    type:number
    hidden:yes
    sql: ${TABLE}.facebook_action_values_offsite_conversion_fb_pixel_purchase;;
    label: "Website Purchases Conversion Value"
    group_label: "facebook-website-conversion-values"
    description: "The total value of the purchase actions tracked by your Facebook pixel on your website after people viewed or clicked on your ad. This is based on the value assigned to the purchase detail event in your Facebook pixel code."
  }

  dimension: facebook_action_values_offsite_conversion_fb_pixel_purchase_1d_click {
    type:number
    hidden:yes
    sql: ${TABLE}.facebook_action_values_offsite_conversion_fb_pixel_purchase_1d_click;;
    label: "Website Purchases Conversion Value (1-day click)"
    group_label: "facebook-website-conversion-values"
    description: "The total value of the purchase actions tracked by your Facebook pixel on your website after people viewed or clicked on your ad. This is based on the value assigned to the purchase detail event in your Facebook pixel code."
  }

  dimension: facebook_action_values_offsite_conversion_fb_pixel_purchase_1d_view {
    type:number
    hidden:yes
    sql: ${TABLE}.facebook_action_values_offsite_conversion_fb_pixel_purchase_1d_view;;
    label: "Website Purchases Conversion Value (1-day view)"
    group_label: "facebook-website-conversion-values"
    description: "The total value of the purchase actions tracked by your Facebook pixel on your website after people viewed or clicked on your ad. This is based on the value assigned to the purchase detail event in your Facebook pixel code."
  }

  dimension: facebook_action_values_offsite_conversion_fb_pixel_purchase_28d_click {
    type:number
    hidden:yes
    sql: ${TABLE}.facebook_action_values_offsite_conversion_fb_pixel_purchase_28d_click;;
    label: "Website Purchases Conversion Value (28-day click)"
    group_label: "facebook-website-conversion-values"
    description: "The total value of the purchase actions tracked by your Facebook pixel on your website after people viewed or clicked on your ad. This is based on the value assigned to the purchase detail event in your Facebook pixel code."
  }

  dimension: facebook_action_values_offsite_conversion_fb_pixel_purchase_28d_view {
    type:number
    hidden:yes
    sql: ${TABLE}.facebook_action_values_offsite_conversion_fb_pixel_purchase_28d_view;;
    label: "Website Purchases Conversion Value (28-day view)"
    group_label: "facebook-website-conversion-values"
    description: "The total value of the purchase actions tracked by your Facebook pixel on your website after people viewed or clicked on your ad. This is based on the value assigned to the purchase detail event in your Facebook pixel code."
  }

  dimension: facebook_action_values_offsite_conversion_fb_pixel_purchase_7d_click {
    type:number
    hidden:yes
    sql: ${TABLE}.facebook_action_values_offsite_conversion_fb_pixel_purchase_7d_click;;
    label: "Website Purchases Conversion Value (7-day click)"
    group_label: "facebook-website-conversion-values"
    description: "The total value of the purchase actions tracked by your Facebook pixel on your website after people viewed or clicked on your ad. This is based on the value assigned to the purchase detail event in your Facebook pixel code."
  }

  dimension: facebook_action_values_offsite_conversion_fb_pixel_purchase_7d_view {
    type:number
    hidden:yes
    sql: ${TABLE}.facebook_action_values_offsite_conversion_fb_pixel_purchase_7d_view;;
    label: "Website Purchases Conversion Value (7-day view)"
    group_label: "facebook-website-conversion-values"
    description: "The total value of the purchase actions tracked by your Facebook pixel on your website after people viewed or clicked on your ad. This is based on the value assigned to the purchase detail event in your Facebook pixel code."
  }

  dimension: facebook_actions_offsite_conversion_registration {
    type:number
    hidden:yes
    sql: ${TABLE}.facebook_actions_offsite_conversion_registration;;
    label: "Website Registrations (Conversion Tracking Pixel)"
    group_label: "facebook-website-actions"
    description: "The number of times a registration was completed on your website as a result of your ad."
  }

  dimension: facebook_actions_offsite_conversion_fb_pixel_complete_registration {
    type:number
    hidden:yes
    sql: ${TABLE}.facebook_actions_offsite_conversion_fb_pixel_complete_registration;;
    label: "Website Registrations Completed"
    group_label: "facebook-website-actions"
    description: "The number of registrations tracked by your Facebook pixel on your website after people viewed or clicked on your ad."
  }

  dimension: facebook_actions_offsite_conversion_fb_pixel_complete_registration_1d_click {
    type:number
    hidden:yes
    sql: ${TABLE}.facebook_actions_offsite_conversion_fb_pixel_complete_registration_1d_click;;
    label: "Website Registrations Completed (1-day click)"
    group_label: "facebook-website-actions"
    description: "The number of registrations tracked by your Facebook pixel on your website after people viewed or clicked on your ad."
  }

  dimension: facebook_actions_offsite_conversion_fb_pixel_complete_registration_1d_view {
    type:number
    hidden:yes
    sql: ${TABLE}.facebook_actions_offsite_conversion_fb_pixel_complete_registration_1d_view;;
    label: "Website Registrations Completed (1-day view)"
    group_label: "facebook-website-actions"
    description: "The number of registrations tracked by your Facebook pixel on your website after people viewed or clicked on your ad."
  }

  dimension: facebook_actions_offsite_conversion_fb_pixel_complete_registration_28d_click {
    type:number
    hidden:yes
    sql: ${TABLE}.facebook_actions_offsite_conversion_fb_pixel_complete_registration_28d_click;;
    label: "Website Registrations Completed (28-day click)"
    group_label: "facebook-website-actions"
    description: "The number of registrations tracked by your Facebook pixel on your website after people viewed or clicked on your ad."
  }

  dimension: facebook_actions_offsite_conversion_fb_pixel_complete_registration_28d_view {
    type:number
    hidden:yes
    sql: ${TABLE}.facebook_actions_offsite_conversion_fb_pixel_complete_registration_28d_view;;
    label: "Website Registrations Completed (28-day view)"
    group_label: "facebook-website-actions"
    description: "The number of registrations tracked by your Facebook pixel on your website after people viewed or clicked on your ad."
  }

  dimension: facebook_actions_offsite_conversion_fb_pixel_complete_registration_7d_click {
    type:number
    hidden:yes
    sql: ${TABLE}.facebook_actions_offsite_conversion_fb_pixel_complete_registration_7d_click;;
    label: "Website Registrations Completed (7-day click)"
    group_label: "facebook-website-actions"
    description: "The number of registrations tracked by your Facebook pixel on your website after people viewed or clicked on your ad."
  }

  dimension: facebook_actions_offsite_conversion_fb_pixel_complete_registration_7d_view {
    type:number
    hidden:yes
    sql: ${TABLE}.facebook_actions_offsite_conversion_fb_pixel_complete_registration_7d_view;;
    label: "Website Registrations Completed (7-day view)"
    group_label: "facebook-website-actions"
    description: "The number of registrations tracked by your Facebook pixel on your website after people viewed or clicked on your ad."
  }

  dimension: facebook_action_values_offsite_conversion_fb_pixel_complete_registration {
    type:number
    hidden:yes
    sql: ${TABLE}.facebook_action_values_offsite_conversion_fb_pixel_complete_registration;;
    label: "Website Registrations Completed Conversion Value"
    group_label: "facebook-website-conversion-values"
    description: "The total value of the registrations tracked by your Facebook pixel on your website after people viewed or clicked on your ad. This is based on the value assigned to the registration event in your Facebook pixel code."
  }

  dimension: facebook_action_values_offsite_conversion_fb_pixel_complete_registration_1d_click {
    type:number
    hidden:yes
    sql: ${TABLE}.facebook_action_values_offsite_conversion_fb_pixel_complete_registration_1d_click;;
    label: "Website Registrations Completed Conversion Value (1-day click)"
    group_label: "facebook-website-conversion-values"
    description: "The total value of the registrations tracked by your Facebook pixel on your website after people viewed or clicked on your ad. This is based on the value assigned to the registration event in your Facebook pixel code."
  }

  dimension: facebook_action_values_offsite_conversion_fb_pixel_complete_registration_1d_view {
    type:number
    hidden:yes
    sql: ${TABLE}.facebook_action_values_offsite_conversion_fb_pixel_complete_registration_1d_view;;
    label: "Website Registrations Completed Conversion Value (1-day view)"
    group_label: "facebook-website-conversion-values"
    description: "The total value of the registrations tracked by your Facebook pixel on your website after people viewed or clicked on your ad. This is based on the value assigned to the registration event in your Facebook pixel code."
  }

  dimension: facebook_action_values_offsite_conversion_fb_pixel_complete_registration_28d_click {
    type:number
    hidden:yes
    sql: ${TABLE}.facebook_action_values_offsite_conversion_fb_pixel_complete_registration_28d_click;;
    label: "Website Registrations Completed Conversion Value (28-day click)"
    group_label: "facebook-website-conversion-values"
    description: "The total value of the registrations tracked by your Facebook pixel on your website after people viewed or clicked on your ad. This is based on the value assigned to the registration event in your Facebook pixel code."
  }

  dimension: facebook_action_values_offsite_conversion_fb_pixel_complete_registration_28d_view {
    type:number
    hidden:yes
    sql: ${TABLE}.facebook_action_values_offsite_conversion_fb_pixel_complete_registration_28d_view;;
    label: "Website Registrations Completed Conversion Value (28-day view)"
    group_label: "facebook-website-conversion-values"
    description: "The total value of the registrations tracked by your Facebook pixel on your website after people viewed or clicked on your ad. This is based on the value assigned to the registration event in your Facebook pixel code."
  }

  dimension: facebook_action_values_offsite_conversion_fb_pixel_complete_registration_7d_click {
    type:number
    hidden:yes
    sql: ${TABLE}.facebook_action_values_offsite_conversion_fb_pixel_complete_registration_7d_click;;
    label: "Website Registrations Completed Conversion Value (7-day click)"
    group_label: "facebook-website-conversion-values"
    description: "The total value of the registrations tracked by your Facebook pixel on your website after people viewed or clicked on your ad. This is based on the value assigned to the registration event in your Facebook pixel code."
  }

  dimension: facebook_action_values_offsite_conversion_fb_pixel_complete_registration_7d_view {
    type:number
    hidden:yes
    sql: ${TABLE}.facebook_action_values_offsite_conversion_fb_pixel_complete_registration_7d_view;;
    label: "Website Registrations Completed Conversion Value (7-day view)"
    group_label: "facebook-website-conversion-values"
    description: "The total value of the registrations tracked by your Facebook pixel on your website after people viewed or clicked on your ad. This is based on the value assigned to the registration event in your Facebook pixel code."
  }

  dimension: facebook_action_values_offsite_conversion_registration {
    type:number
    hidden:yes
    sql: ${TABLE}.facebook_action_values_offsite_conversion_registration;;
    label: "Website Registrations Conversion Value (Conversion Tracking Pixel)"
    group_label: "facebook-website-conversion-values"
    description: "The total value returned from completed registration conversions on your website as a result of your ad."
  }

  dimension: facebook_actions_offsite_conversion_fb_pixel_search {
    type:number
    hidden:yes
    sql: ${TABLE}.facebook_actions_offsite_conversion_fb_pixel_search;;
    label: "Website Searches"
    group_label: "facebook-website-actions"
    description: "The number of searches tracked by your Facebook pixel on your website after people viewed or clicked on your ad."
  }

  dimension: facebook_actions_offsite_conversion_fb_pixel_search_1d_click {
    type:number
    hidden:yes
    sql: ${TABLE}.facebook_actions_offsite_conversion_fb_pixel_search_1d_click;;
    label: "Website Searches (1-day click)"
    group_label: "facebook-website-actions"
    description: "The number of searches tracked by your Facebook pixel on your website after people viewed or clicked on your ad."
  }

  dimension: facebook_actions_offsite_conversion_fb_pixel_search_1d_view {
    type:number
    hidden:yes
    sql: ${TABLE}.facebook_actions_offsite_conversion_fb_pixel_search_1d_view;;
    label: "Website Searches (1-day view)"
    group_label: "facebook-website-actions"
    description: "The number of searches tracked by your Facebook pixel on your website after people viewed or clicked on your ad."
  }

  dimension: facebook_actions_offsite_conversion_fb_pixel_search_28d_click {
    type:number
    hidden:yes
    sql: ${TABLE}.facebook_actions_offsite_conversion_fb_pixel_search_28d_click;;
    label: "Website Searches (28-day click)"
    group_label: "facebook-website-actions"
    description: "The number of searches tracked by your Facebook pixel on your website after people viewed or clicked on your ad."
  }

  dimension: facebook_actions_offsite_conversion_fb_pixel_search_28d_view {
    type:number
    hidden:yes
    sql: ${TABLE}.facebook_actions_offsite_conversion_fb_pixel_search_28d_view;;
    label: "Website Searches (28-day view)"
    group_label: "facebook-website-actions"
    description: "The number of searches tracked by your Facebook pixel on your website after people viewed or clicked on your ad."
  }

  dimension: facebook_actions_offsite_conversion_fb_pixel_search_7d_click {
    type:number
    hidden:yes
    sql: ${TABLE}.facebook_actions_offsite_conversion_fb_pixel_search_7d_click;;
    label: "Website Searches (7-day click)"
    group_label: "facebook-website-actions"
    description: "The number of searches tracked by your Facebook pixel on your website after people viewed or clicked on your ad."
  }

  dimension: facebook_actions_offsite_conversion_fb_pixel_search_7d_view {
    type:number
    hidden:yes
    sql: ${TABLE}.facebook_actions_offsite_conversion_fb_pixel_search_7d_view;;
    label: "Website Searches (7-day view)"
    group_label: "facebook-website-actions"
    description: "The number of searches tracked by your Facebook pixel on your website after people viewed or clicked on your ad."
  }

  dimension: facebook_action_values_offsite_conversion_fb_pixel_search {
    type:number
    hidden:yes
    sql: ${TABLE}.facebook_action_values_offsite_conversion_fb_pixel_search;;
    label: "Website Searches Conversion Value"
    group_label: "facebook-website-conversion-values"
    description: "The total value of the searches tracked by your Facebook pixel on your website after people viewed or clicked on your ad. This is based on the value assigned to the search event in your Facebook pixel code."
  }

  dimension: facebook_action_values_offsite_conversion_fb_pixel_search_1d_click {
    type:number
    hidden:yes
    sql: ${TABLE}.facebook_action_values_offsite_conversion_fb_pixel_search_1d_click;;
    label: "Website Searches Conversion Value (1-day click)"
    group_label: "facebook-website-conversion-values"
    description: "The total value of the searches tracked by your Facebook pixel on your website after people viewed or clicked on your ad. This is based on the value assigned to the search event in your Facebook pixel code."
  }

  dimension: facebook_action_values_offsite_conversion_fb_pixel_search_1d_view {
    type:number
    hidden:yes
    sql: ${TABLE}.facebook_action_values_offsite_conversion_fb_pixel_search_1d_view;;
    label: "Website Searches Conversion Value (1-day view)"
    group_label: "facebook-website-conversion-values"
    description: "The total value of the searches tracked by your Facebook pixel on your website after people viewed or clicked on your ad. This is based on the value assigned to the search event in your Facebook pixel code."
  }

  dimension: facebook_action_values_offsite_conversion_fb_pixel_search_28d_click {
    type:number
    hidden:yes
    sql: ${TABLE}.facebook_action_values_offsite_conversion_fb_pixel_search_28d_click;;
    label: "Website Searches Conversion Value (28-day click)"
    group_label: "facebook-website-conversion-values"
    description: "The total value of the searches tracked by your Facebook pixel on your website after people viewed or clicked on your ad. This is based on the value assigned to the search event in your Facebook pixel code."
  }

  dimension: facebook_action_values_offsite_conversion_fb_pixel_search_28d_view {
    type:number
    hidden:yes
    sql: ${TABLE}.facebook_action_values_offsite_conversion_fb_pixel_search_28d_view;;
    label: "Website Searches Conversion Value (28-day view)"
    group_label: "facebook-website-conversion-values"
    description: "The total value of the searches tracked by your Facebook pixel on your website after people viewed or clicked on your ad. This is based on the value assigned to the search event in your Facebook pixel code."
  }

  dimension: facebook_action_values_offsite_conversion_fb_pixel_search_7d_click {
    type:number
    hidden:yes
    sql: ${TABLE}.facebook_action_values_offsite_conversion_fb_pixel_search_7d_click;;
    label: "Website Searches Conversion Value (7-day click)"
    group_label: "facebook-website-conversion-values"
    description: "The total value of the searches tracked by your Facebook pixel on your website after people viewed or clicked on your ad. This is based on the value assigned to the search event in your Facebook pixel code."
  }

  dimension: facebook_action_values_offsite_conversion_fb_pixel_search_7d_view {
    type:number
    hidden:yes
    sql: ${TABLE}.facebook_action_values_offsite_conversion_fb_pixel_search_7d_view;;
    label: "Website Searches Conversion Value (7-day view)"
    group_label: "facebook-website-conversion-values"
    description: "The total value of the searches tracked by your Facebook pixel on your website after people viewed or clicked on your ad. This is based on the value assigned to the search event in your Facebook pixel code."
  }

  dimension: facebook_action_values_offsite_conversion {
    type:number
    hidden:yes
    sql: ${TABLE}.facebook_action_values_offsite_conversion;;
    label: "Website action value (All)"
    group_label: "facebook-website-conversion-values"
    description: "The total value of the actions tracked by your Facebook pixel or conversion pixels on your website after people viewed or clicked on your ad."
  }

  dimension: facebook_website_clicks {
    type:number
    hidden:yes
    sql: ${TABLE}.facebook_website_clicks;;
    label: "Website clicks"
    group_label: "facebook-clicks"
    description: "The numbers of clicks that go to web after user clicks your ads."
  }

  measure: total_facebook_video_10_sec_watched_actions_video_view {
    type: sum
    sql: ${facebook_video_10_sec_watched_actions_video_view} ;;
    label: "10-Second Video Views"
    group_label: "facebook-videos"
    description: "This shows the number of total views of at least 10 seconds or to the end of your video, whichever occurs first."
  }

  measure: total_facebook_video_15_sec_watched_actions_video_view {
    type: sum
    sql: ${facebook_video_15_sec_watched_actions_video_view} ;;
    label: "15-Second Video Views"
    group_label: "facebook-videos"
    description: "The number of times your video was viewed more than 15 seconds, including views that skipped to this point."
  }

  measure: total_facebook_actions_video_view {
    type: sum
    sql: ${facebook_actions_video_view} ;;
    label: "3-second video views"
    group_label: "facebook-videos"
    description: "The number of times your video was viewed for 3 seconds or more."
  }

  measure: total_facebook_video_30_sec_watched_actions_video_view {
    type: sum
    sql: ${facebook_video_30_sec_watched_actions_video_view} ;;
    label: "30-Second Video Views"
    group_label: "facebook-videos"
    description: "This shows the number of total views of at least 30 seconds or to the end of your video, whichever occurs first."
  }

  measure: total_facebook_actions_app_engagement {
    type: sum
    sql: ${facebook_actions_app_engagement} ;;
    label: "App engagement"
    group_label: "facebook-apps"
    description: "The number of actions, including app installs, credit spends and uses as a result of your ad."
  }

  measure: total_facebook_app_store_clicks {
    type: sum
    sql: ${facebook_app_store_clicks} ;;
    label: "App store clicks"
    group_label: "facebook-apps"
    description: "The numbers of clicks that go to app store after user clicks your ads."
  }

  measure: total_facebook_call_to_action_clicks {
    type: sum
    sql: ${facebook_call_to_action_clicks} ;;
    label: "Call to action clicks"
    group_label: "facebook-clicks"
    description: "The number of clicks on the call to action button your ad receives."
  }

  measure: total_facebook_actions_checkin {
    type: sum
    sql: ${facebook_actions_checkin} ;;
    label: "Check-ins"
    group_label: "facebook-engagement-actions"
    description: "The number of check-ins to your Page as a result of your ad. This is only available to Pages that are associated with a physical address."
  }

  measure: total_facebook_clicks {
    type: sum
    sql: ${facebook_clicks} ;;
    label: "Clicks (All)"
    group_label: "facebook-clicks"
    description: "The number of clicks that your ad got."
  }

  measure: total_facebook_actions_video_play {
    type: sum
    sql: ${facebook_actions_video_play} ;;
    label: "Clicks to play video"
    group_label: "facebook-videos"
    description: "The number of clicks to play a video as a result of your ad."
  }

  measure: total_facebook_video_complete_watched_actions_video_view {
    type: sum
    sql: ${facebook_video_complete_watched_actions_video_view} ;;
    label: "Complete Video Views"
    group_label: "facebook-videos"
    description: "This shows the number of total views of at least 30 seconds or to the end of your video, whichever occurs first."
  }

  measure: total_facebook_cost {
    type: sum
    sql: ${facebook_cost} ;;
    label: "Cost"
    group_label: "facebook-performance"
    description: "Amount spent in Facebook"
  }

  measure: total_facebook_deeplink_clicks {
    type: sum
    sql: ${facebook_deeplink_clicks} ;;
    label: "Deeplink clicks"
    group_label: "facebook-clicks"
    description: "The numbers of clicks that go to app after user clicks your ads."
  }

  measure: total_facebook_actions_app_install {
    type: sum
    sql: ${facebook_actions_app_install} ;;
    label: "Desktop App Installs"
    group_label: "facebook-apps"
    description: "The number of app installs as a result of your ad."
  }

  measure: total_facebook_actions_app_story {
    type: sum
    sql: ${facebook_actions_app_story} ;;
    label: "Desktop App Story Engagement"
    group_label: "facebook-apps"
    description: "The number of actions related to the application story as a result of your ad."
  }

  measure: total_facebook_actions_app_use {
    type: sum
    sql: ${facebook_actions_app_use} ;;
    label: "Desktop App Uses"
    group_label: "facebook-apps"
    description: "The number of uses of your app as a result of your ad. This includes number of times your app was used for a minimum of 4 minutes in the last 14 days, or at least twice by the same person with one of those times occurring in the past 14 days."
  }

  measure: total_facebook_actions_rsvp {
    type: sum
    sql: ${facebook_actions_rsvp} ;;
    label: "Event responses"
    group_label: "facebook-events"
    description: "The number of people who responded going or interested in your event as a result of your ad."
  }

  measure: total_facebook_actions_gift_sale {
    type: sum
    sql: ${facebook_actions_gift_sale} ;;
    label: "Gift sales"
    group_label: "facebook-engagement-actions"
    description: "The number of gifts you sold on Facebook as result of your ad."
  }

  measure: total_facebook_action_values_gift_sale {
    type: sum
    sql: ${facebook_action_values_gift_sale} ;;
    label: "Gift sales conversion value"
    group_label: "facebook-engagement-conversion-values"
    description: "The total value returned from the gift sale conversions as a result of your ad."
  }

  measure: total_facebook_impressions {
    type: sum
    sql: ${facebook_impressions} ;;
    label: "Impressions"
    group_label: "facebook-performance"
    description: "Number of Facebook impressions"
  }

  measure: total_facebook_inline_link_clicks {
    type: sum
    sql: ${facebook_inline_link_clicks} ;;
    label: "Inline link clicks"
    group_label: "facebook-clicks"
    description: "The number of inline link clicks that your ad got."
  }

  measure: total_facebook_inline_post_engagement {
    type: sum
    sql: ${facebook_inline_post_engagement} ;;
    label: "Inline post engagement"
    group_label: "facebook-engagement-actions"
    description: "The number of inline post engagement that your ad got."
  }

  measure: total_facebook_actions_leadgen_other {
    type: sum
    sql: ${facebook_actions_leadgen_other} ;;
    label: "Leads (Form)"
    group_label: "facebook-engagement-actions"
    description: "The number of leads registered from your Lead Ads."
  }

  measure: total_facebook_actions_link_click {
    type: sum
    sql: ${facebook_actions_link_click} ;;
    label: "Link clicks"
    group_label: "facebook-engagement-actions"
    description: "The number of clicks on links appearing on your ad or Page that direct people to your sites off Facebook as a result of your ad."
  }

  measure: total_facebook_actions_mobile_app_install {
    type: sum
    sql: ${facebook_actions_mobile_app_install} ;;
    label: "Mobile app installs"
    group_label: "facebook-apps"
    description: "The number of installs from a mobile device as a result of your ad."
  }

  measure: total_facebook_actions_receive_offer {
    type: sum
    sql: ${facebook_actions_receive_offer} ;;
    label: "Offer claims"
    group_label: "facebook-engagement-actions"
    description: "The number of claims on your offers as a result of your ad."
  }

  measure: total_facebook_action_values_offsite_conversion_other {
    type: sum
    sql: ${facebook_action_values_offsite_conversion_other} ;;
    label: "Other website conversion value (Conversion Tracking Pixel)"
    group_label: "facebook-website-conversion-values"
    description: "The total value returned from other conversions on your website as a result of your ad."
  }

  measure: total_facebook_actions_offsite_conversion_other {
    type: sum
    sql: ${facebook_actions_offsite_conversion_other} ;;
    label: "Other website conversions (Conversion Tracking Pixel)"
    group_label: "facebook-website-actions"
    description: "The number of other conversions on your website that happened as a result of your ad."
  }

  measure: total_facebook_actions_page_engagement {
    type: sum
    sql: ${facebook_actions_page_engagement} ;;
    label: "Page engagement"
    group_label: "facebook-engagement-actions"
    description: "The number of actions related to the Page and your Page's posts as a result of your ad."
  }

  measure: total_facebook_actions_like {
    type: sum
    sql: ${facebook_actions_like} ;;
    label: "Page likes"
    group_label: "facebook-engagement-actions"
    description: "The number of likes on your Page as a result of your ad."
  }

  measure: total_facebook_actions_mention {
    type: sum
    sql: ${facebook_actions_mention} ;;
    label: "Page mentions"
    group_label: "facebook-engagement-actions"
    description: "The number of mentions of your Page as a result of your ad."
  }

  measure: total_facebook_actions_tab_view {
    type: sum
    sql: ${facebook_actions_tab_view} ;;
    label: "Page tab views"
    group_label: "facebook-engagement-actions"
    description: "The number of views of tabs on your Page as a result of your ad."
  }

  measure: total_facebook_actions_photo_view {
    type: sum
    sql: ${facebook_actions_photo_view} ;;
    label: "Photo views"
    group_label: "facebook-engagement-actions"
    description: "The number of views of your photos as a result of your ad."
  }

  measure: total_facebook_actions_comment {
    type: sum
    sql: ${facebook_actions_comment} ;;
    label: "Post comments"
    group_label: "facebook-engagement-actions"
    description: "The number of comments on your Page's posts as a result of your ad."
  }

  measure: total_facebook_actions_post_engagement {
    type: sum
    sql: ${facebook_actions_post_engagement} ;;
    label: "Post engagement"
    group_label: "facebook-engagement-actions"
    description: "The number of actions related to your Page's posts as a result of your ad."
  }

  measure: total_facebook_actions_post_like {
    type: sum
    sql: ${facebook_actions_post_like} ;;
    label: "Post likes"
    group_label: "facebook-engagement-actions"
    description: "The number of likes on your Page's posts as a result of your ad."
  }

  measure: total_facebook_actions_post {
    type: sum
    sql: ${facebook_actions_post} ;;
    label: "Post shares"
    group_label: "facebook-engagement-actions"
    description: "The number of shares of your Page's posts as a result of your ad."
  }

  measure: total_facebook_actions_vote {
    type: sum
    sql: ${facebook_actions_vote} ;;
    label: "Question answers"
    group_label: "facebook-engagement-actions"
    description: "The number of answers to your questions as a result of your ad."
  }

  measure: total_facebook_actions_follow {
    type: sum
    sql: ${facebook_actions_follow} ;;
    label: "Question follows"
    group_label: "facebook-engagement-actions"
    description: "The number of follows of your questions as a result of your ad."
  }

  measure: total_facebook_social_clicks {
    type: sum
    sql: ${facebook_social_clicks} ;;
    label: "Social clicks"
    group_label: "facebook-clicks"
    description: "The number of clicks your ad receives when it's shown with social information (ex: Jane Doe likes this)."
  }

  measure: total_facebook_social_impressions {
    type: sum
    sql: ${facebook_social_impressions} ;;
    label: "Social impressions"
    group_label: "facebook-performance"
    description: "The number of times your ad was served, with social information. For example, if 3 people are served an ad 2 times each and it includes information about a friend liking your Page, it counts as 6 social impressions."
  }

  measure: total_facebook_social_spend {
    type: sum
    sql: ${facebook_social_spend} ;;
    label: "Social spend"
    group_label: "facebook-performance"
    description: "The total amount you've spent so far for your ads showed with social information (ex: Jane Doe likes this)."
  }

  measure: total_facebook_total_actions {
    type: sum
    sql: ${facebook_total_actions} ;;
    label: "Total actions"
    group_label: "facebook-performance"
    description: "The number of actions taken on your ad, Page, app or event after your ad was served to someone, even if they didn't click on it. Actions include Page likes, app installs, conversions, event responses and more. For example, 2 Page likes and 2 comments would be counted as 4 actions."
  }

  measure: total_facebook_actions_unlike {
    type: sum
    sql: ${facebook_actions_unlike} ;;
    label: "Unlikes"
    group_label: "facebook-engagement-actions"
    description: "The number of unlikes of your Page as a result of your ad."
  }

  measure: total_facebook_video_p100_watched_actions_video_view {
    type: sum
    sql: ${facebook_video_p100_watched_actions_video_view} ;;
    label: "Video watches at 100%"
    group_label: "facebook-videos"
    description: "The number of times your video was viewed to 100% of its length, including views that skipped to this point."
  }

  measure: total_facebook_video_p25_watched_actions_video_view {
    type: sum
    sql: ${facebook_video_p25_watched_actions_video_view} ;;
    label: "Video watches at 25%"
    group_label: "facebook-videos"
    description: "The number of times your video was viewed to 25% of its length, including views that skipped to this point."
  }

  measure: total_facebook_video_p50_watched_actions_video_view {
    type: sum
    sql: ${facebook_video_p50_watched_actions_video_view} ;;
    label: "Video watches at 50%"
    group_label: "facebook-videos"
    description: "The number of times your video was viewed to 50% of its length, including views that skipped to this point."
  }

  measure: total_facebook_video_p75_watched_actions_video_view {
    type: sum
    sql: ${facebook_video_p75_watched_actions_video_view} ;;
    label: "Video watches at 75%"
    group_label: "facebook-videos"
    description: "The number of times your video was viewed to 75% of its length, including views that skipped to this point."
  }

  measure: total_facebook_video_p95_watched_actions_video_view {
    type: sum
    sql: ${facebook_video_p95_watched_actions_video_view} ;;
    label: "Video watches at 95%"
    group_label: "facebook-videos"
    description: "The number of times your video was viewed to 95% of its length, including views that skipped to this point."
  }

  measure: total_facebook_actions_offsite_conversion_fb_pixel_add_payment_info {
    type: sum
    sql: ${facebook_actions_offsite_conversion_fb_pixel_add_payment_info} ;;
    label: "Website Adds of Payment Info"
    group_label: "facebook-website-actions"
    description: "The number of times payment information was entered tracked by your Facebook pixel on your website after people clicked or viewed your ad."
  }

  measure: total_facebook_actions_offsite_conversion_fb_pixel_add_payment_info_1d_click {
    type: sum
    sql: ${facebook_actions_offsite_conversion_fb_pixel_add_payment_info_1d_click} ;;
    label: "Website Adds of Payment Info (1-day click)"
    group_label: "facebook-website-actions"
    description: "The number of times payment information was entered tracked by your Facebook pixel on your website after people clicked or viewed your ad."
  }

  measure: total_facebook_actions_offsite_conversion_fb_pixel_add_payment_info_1d_view {
    type: sum
    sql: ${facebook_actions_offsite_conversion_fb_pixel_add_payment_info_1d_view} ;;
    label: "Website Adds of Payment Info (1-day view)"
    group_label: "facebook-website-actions"
    description: "The number of times payment information was entered tracked by your Facebook pixel on your website after people clicked or viewed your ad."
  }

  measure: total_facebook_actions_offsite_conversion_fb_pixel_add_payment_info_28d_click {
    type: sum
    sql: ${facebook_actions_offsite_conversion_fb_pixel_add_payment_info_28d_click} ;;
    label: "Website Adds of Payment Info (28-day click)"
    group_label: "facebook-website-actions"
    description: "The number of times payment information was entered tracked by your Facebook pixel on your website after people clicked or viewed your ad."
  }

  measure: total_facebook_actions_offsite_conversion_fb_pixel_add_payment_info_28d_view {
    type: sum
    sql: ${facebook_actions_offsite_conversion_fb_pixel_add_payment_info_28d_view} ;;
    label: "Website Adds of Payment Info (28-day view)"
    group_label: "facebook-website-actions"
    description: "The number of times payment information was entered tracked by your Facebook pixel on your website after people clicked or viewed your ad."
  }

  measure: total_facebook_actions_offsite_conversion_fb_pixel_add_payment_info_7d_click {
    type: sum
    sql: ${facebook_actions_offsite_conversion_fb_pixel_add_payment_info_7d_click} ;;
    label: "Website Adds of Payment Info (7-day click)"
    group_label: "facebook-website-actions"
    description: "The number of times payment information was entered tracked by your Facebook pixel on your website after people clicked or viewed your ad."
  }

  measure: total_facebook_actions_offsite_conversion_fb_pixel_add_payment_info_7d_view {
    type: sum
    sql: ${facebook_actions_offsite_conversion_fb_pixel_add_payment_info_7d_view} ;;
    label: "Website Adds of Payment Info (7-day view)"
    group_label: "facebook-website-actions"
    description: "The number of times payment information was entered tracked by your Facebook pixel on your website after people clicked or viewed your ad."
  }

  measure: total_facebook_actions_offsite_conversion_fb_pixel_add_to_cart {
    type: sum
    sql: ${facebook_actions_offsite_conversion_fb_pixel_add_to_cart} ;;
    label: "Website Adds to Cart"
    group_label: "facebook-website-actions"
    description: "The number of times an item was added to a shopping cart tracked by your Facebook pixel on your website after people clicked or viewed your ad."
  }

  measure: total_facebook_actions_offsite_conversion_fb_pixel_add_to_cart_1d_click {
    type: sum
    sql: ${facebook_actions_offsite_conversion_fb_pixel_add_to_cart_1d_click} ;;
    label: "Website Adds to Cart (1-day click)"
    group_label: "facebook-website-actions"
    description: "The number of times an item was added to a shopping cart tracked by your Facebook pixel on your website after people clicked or viewed your ad."
  }

  measure: total_facebook_actions_offsite_conversion_fb_pixel_add_to_cart_1d_view {
    type: sum
    sql: ${facebook_actions_offsite_conversion_fb_pixel_add_to_cart_1d_view} ;;
    label: "Website Adds to Cart (1-day view)"
    group_label: "facebook-website-actions"
    description: "The number of times an item was added to a shopping cart tracked by your Facebook pixel on your website after people clicked or viewed your ad."
  }

  measure: total_facebook_actions_offsite_conversion_fb_pixel_add_to_cart_28d_click {
    type: sum
    sql: ${facebook_actions_offsite_conversion_fb_pixel_add_to_cart_28d_click} ;;
    label: "Website Adds to Cart (28-day click)"
    group_label: "facebook-website-actions"
    description: "The number of times an item was added to a shopping cart tracked by your Facebook pixel on your website after people clicked or viewed your ad."
  }

  measure: total_facebook_actions_offsite_conversion_fb_pixel_add_to_cart_28d_view {
    type: sum
    sql: ${facebook_actions_offsite_conversion_fb_pixel_add_to_cart_28d_view} ;;
    label: "Website Adds to Cart (28-day view)"
    group_label: "facebook-website-actions"
    description: "The number of times an item was added to a shopping cart tracked by your Facebook pixel on your website after people clicked or viewed your ad."
  }

  measure: total_facebook_actions_offsite_conversion_fb_pixel_add_to_cart_7d_click {
    type: sum
    sql: ${facebook_actions_offsite_conversion_fb_pixel_add_to_cart_7d_click} ;;
    label: "Website Adds to Cart (7-day click)"
    group_label: "facebook-website-actions"
    description: "The number of times an item was added to a shopping cart tracked by your Facebook pixel on your website after people clicked or viewed your ad."
  }

  measure: total_facebook_actions_offsite_conversion_fb_pixel_add_to_cart_7d_view {
    type: sum
    sql: ${facebook_actions_offsite_conversion_fb_pixel_add_to_cart_7d_view} ;;
    label: "Website Adds to Cart (7-day view)"
    group_label: "facebook-website-actions"
    description: "The number of times an item was added to a shopping cart tracked by your Facebook pixel on your website after people clicked or viewed your ad."
  }

  measure: total_facebook_actions_offsite_conversion_add_to_cart {
    type: sum
    sql: ${facebook_actions_offsite_conversion_add_to_cart} ;;
    label: "Website Adds to Cart (Conversion Tracking Pixel)"
    group_label: "facebook-website-actions"
    description: "The number of times something was added to a shopping cart on your website as a result of your ad."
  }

  measure: total_facebook_action_values_offsite_conversion_fb_pixel_add_to_cart {
    type: sum
    sql: ${facebook_action_values_offsite_conversion_fb_pixel_add_to_cart} ;;
    label: "Website Adds to Cart Conversion Value"
    group_label: "facebook-website-conversion-values"
    description: "The total value of the adds-to-cart tracked by your Facebook pixel on your website after people viewed or clicked on your ad. This is based on the value assigned to the adds-to-cart event in your Facebook pixel code."
  }

  measure: total_facebook_action_values_offsite_conversion_fb_pixel_add_to_cart_1d_click {
    type: sum
    sql: ${facebook_action_values_offsite_conversion_fb_pixel_add_to_cart_1d_click} ;;
    label: "Website Adds to Cart Conversion Value (1-day click)"
    group_label: "facebook-website-conversion-values"
    description: "The total value of the adds-to-cart tracked by your Facebook pixel on your website after people viewed or clicked on your ad. This is based on the value assigned to the adds-to-cart event in your Facebook pixel code."
  }

  measure: total_facebook_action_values_offsite_conversion_fb_pixel_add_to_cart_1d_view {
    type: sum
    sql: ${facebook_action_values_offsite_conversion_fb_pixel_add_to_cart_1d_view} ;;
    label: "Website Adds to Cart Conversion Value (1-day view)"
    group_label: "facebook-website-conversion-values"
    description: "The total value of the adds-to-cart tracked by your Facebook pixel on your website after people viewed or clicked on your ad. This is based on the value assigned to the adds-to-cart event in your Facebook pixel code."
  }

  measure: total_facebook_action_values_offsite_conversion_fb_pixel_add_to_cart_28d_click {
    type: sum
    sql: ${facebook_action_values_offsite_conversion_fb_pixel_add_to_cart_28d_click} ;;
    label: "Website Adds to Cart Conversion Value (28-day click)"
    group_label: "facebook-website-conversion-values"
    description: "The total value of the adds-to-cart tracked by your Facebook pixel on your website after people viewed or clicked on your ad. This is based on the value assigned to the adds-to-cart event in your Facebook pixel code."
  }

  measure: total_facebook_action_values_offsite_conversion_fb_pixel_add_to_cart_28d_view {
    type: sum
    sql: ${facebook_action_values_offsite_conversion_fb_pixel_add_to_cart_28d_view} ;;
    label: "Website Adds to Cart Conversion Value (28-day view)"
    group_label: "facebook-website-conversion-values"
    description: "The total value of the adds-to-cart tracked by your Facebook pixel on your website after people viewed or clicked on your ad. This is based on the value assigned to the adds-to-cart event in your Facebook pixel code."
  }

  measure: total_facebook_action_values_offsite_conversion_fb_pixel_add_to_cart_7d_click {
    type: sum
    sql: ${facebook_action_values_offsite_conversion_fb_pixel_add_to_cart_7d_click} ;;
    label: "Website Adds to Cart Conversion Value (7-day click)"
    group_label: "facebook-website-conversion-values"
    description: "The total value of the adds-to-cart tracked by your Facebook pixel on your website after people viewed or clicked on your ad. This is based on the value assigned to the adds-to-cart event in your Facebook pixel code."
  }

  measure: total_facebook_action_values_offsite_conversion_fb_pixel_add_to_cart_7d_view {
    type: sum
    sql: ${facebook_action_values_offsite_conversion_fb_pixel_add_to_cart_7d_view} ;;
    label: "Website Adds to Cart Conversion Value (7-day view)"
    group_label: "facebook-website-conversion-values"
    description: "The total value of the adds-to-cart tracked by your Facebook pixel on your website after people viewed or clicked on your ad. This is based on the value assigned to the adds-to-cart event in your Facebook pixel code."
  }

  measure: total_facebook_action_values_offsite_conversion_add_to_cart {
    type: sum
    sql: ${facebook_action_values_offsite_conversion_add_to_cart} ;;
    label: "Website Adds to Cart Conversion Value (Conversion Tracking Pixel)"
    group_label: "facebook-website-conversion-values"
    description: "The total value returned when items were added to a cart on your website as a result of your ad."
  }

  measure: total_facebook_actions_offsite_conversion_fb_pixel_add_to_wishlist {
    type: sum
    sql: ${facebook_actions_offsite_conversion_fb_pixel_add_to_wishlist} ;;
    label: "Website Adds to Wishlist"
    group_label: "facebook-website-actions"
    description: "The number of times an item was added to a wishlist tracked by your Facebook pixel on your website after people viewed or clicked on your ad."
  }

  measure: total_facebook_actions_offsite_conversion_fb_pixel_add_to_wishlist_1d_click {
    type: sum
    sql: ${facebook_actions_offsite_conversion_fb_pixel_add_to_wishlist_1d_click} ;;
    label: "Website Adds to Wishlist (1-day click)"
    group_label: "facebook-website-actions"
    description: "The number of times an item was added to a wishlist tracked by your Facebook pixel on your website after people viewed or clicked on your ad."
  }

  measure: total_facebook_actions_offsite_conversion_fb_pixel_add_to_wishlist_1d_view {
    type: sum
    sql: ${facebook_actions_offsite_conversion_fb_pixel_add_to_wishlist_1d_view} ;;
    label: "Website Adds to Wishlist (1-day view)"
    group_label: "facebook-website-actions"
    description: "The number of times an item was added to a wishlist tracked by your Facebook pixel on your website after people viewed or clicked on your ad."
  }

  measure: total_facebook_actions_offsite_conversion_fb_pixel_add_to_wishlist_28d_click {
    type: sum
    sql: ${facebook_actions_offsite_conversion_fb_pixel_add_to_wishlist_28d_click} ;;
    label: "Website Adds to Wishlist (28-day click)"
    group_label: "facebook-website-actions"
    description: "The number of times an item was added to a wishlist tracked by your Facebook pixel on your website after people viewed or clicked on your ad."
  }

  measure: total_facebook_actions_offsite_conversion_fb_pixel_add_to_wishlist_28d_view {
    type: sum
    sql: ${facebook_actions_offsite_conversion_fb_pixel_add_to_wishlist_28d_view} ;;
    label: "Website Adds to Wishlist (28-day view)"
    group_label: "facebook-website-actions"
    description: "The number of times an item was added to a wishlist tracked by your Facebook pixel on your website after people viewed or clicked on your ad."
  }

  measure: total_facebook_actions_offsite_conversion_fb_pixel_add_to_wishlist_7d_click {
    type: sum
    sql: ${facebook_actions_offsite_conversion_fb_pixel_add_to_wishlist_7d_click} ;;
    label: "Website Adds to Wishlist (7-day click)"
    group_label: "facebook-website-actions"
    description: "The number of times an item was added to a wishlist tracked by your Facebook pixel on your website after people viewed or clicked on your ad."
  }

  measure: total_facebook_actions_offsite_conversion_fb_pixel_add_to_wishlist_7d_view {
    type: sum
    sql: ${facebook_actions_offsite_conversion_fb_pixel_add_to_wishlist_7d_view} ;;
    label: "Website Adds to Wishlist (7-day view)"
    group_label: "facebook-website-actions"
    description: "The number of times an item was added to a wishlist tracked by your Facebook pixel on your website after people viewed or clicked on your ad."
  }

  measure: total_facebook_actions_offsite_conversion_checkout {
    type: sum
    sql: ${facebook_actions_offsite_conversion_checkout} ;;
    label: "Website Checkouts (Conversion Tracking Pixel)"
    group_label: "facebook-website-actions"
    description: "The number of times a checkout was completed on your website as a result of your ad."
  }

  measure: total_facebook_action_values_offsite_conversion_checkout {
    type: sum
    sql: ${facebook_action_values_offsite_conversion_checkout} ;;
    label: "Website Checkouts Conversion Value (Conversion Tracking Pixel)"
    group_label: "facebook-website-conversion-values"
    description: "The total value returned from checkout conversions on your website as a result of your ad."
  }

  measure: total_facebook_actions_offsite_conversion_fb_pixel_initiate_checkout {
    type: sum
    sql: ${facebook_actions_offsite_conversion_fb_pixel_initiate_checkout} ;;
    label: "Website Checkouts Initiated"
    group_label: "facebook-website-actions"
    description: "The number of checkout initiations tracked by your Facebook pixel on your website after people viewed or clicked on your ad."
  }

  measure: total_facebook_actions_offsite_conversion_fb_pixel_initiate_checkout_1d_click {
    type: sum
    sql: ${facebook_actions_offsite_conversion_fb_pixel_initiate_checkout_1d_click} ;;
    label: "Website Checkouts Initiated (1-day click)"
    group_label: "facebook-website-actions"
    description: "The number of checkout initiations tracked by your Facebook pixel on your website after people viewed or clicked on your ad."
  }

  measure: total_facebook_actions_offsite_conversion_fb_pixel_initiate_checkout_1d_view {
    type: sum
    sql: ${facebook_actions_offsite_conversion_fb_pixel_initiate_checkout_1d_view} ;;
    label: "Website Checkouts Initiated (1-day view)"
    group_label: "facebook-website-actions"
    description: "The number of checkout initiations tracked by your Facebook pixel on your website after people viewed or clicked on your ad."
  }

  measure: total_facebook_actions_offsite_conversion_fb_pixel_initiate_checkout_28d_click {
    type: sum
    sql: ${facebook_actions_offsite_conversion_fb_pixel_initiate_checkout_28d_click} ;;
    label: "Website Checkouts Initiated (28-day click)"
    group_label: "facebook-website-actions"
    description: "The number of checkout initiations tracked by your Facebook pixel on your website after people viewed or clicked on your ad."
  }

  measure: total_facebook_actions_offsite_conversion_fb_pixel_initiate_checkout_28d_view {
    type: sum
    sql: ${facebook_actions_offsite_conversion_fb_pixel_initiate_checkout_28d_view} ;;
    label: "Website Checkouts Initiated (28-day view)"
    group_label: "facebook-website-actions"
    description: "The number of checkout initiations tracked by your Facebook pixel on your website after people viewed or clicked on your ad."
  }

  measure: total_facebook_actions_offsite_conversion_fb_pixel_initiate_checkout_7d_click {
    type: sum
    sql: ${facebook_actions_offsite_conversion_fb_pixel_initiate_checkout_7d_click} ;;
    label: "Website Checkouts Initiated (7-day click)"
    group_label: "facebook-website-actions"
    description: "The number of checkout initiations tracked by your Facebook pixel on your website after people viewed or clicked on your ad."
  }

  measure: total_facebook_actions_offsite_conversion_fb_pixel_initiate_checkout_7d_view {
    type: sum
    sql: ${facebook_actions_offsite_conversion_fb_pixel_initiate_checkout_7d_view} ;;
    label: "Website Checkouts Initiated (7-day view)"
    group_label: "facebook-website-actions"
    description: "The number of checkout initiations tracked by your Facebook pixel on your website after people viewed or clicked on your ad."
  }

  measure: total_facebook_action_values_offsite_conversion_fb_pixel_initiate_checkout {
    type: sum
    sql: ${facebook_action_values_offsite_conversion_fb_pixel_initiate_checkout} ;;
    label: "Website Checkouts Initiated Conversion Value"
    group_label: "facebook-website-conversion-values"
    description: "The total value of the checkout actions tracked by your Facebook pixel on your website after people viewed or clicked on your ad. This is based on the value assigned to the checkout event in your Facebook pixel code."
  }

  measure: total_facebook_action_values_offsite_conversion_fb_pixel_initiate_checkout_1d_click {
    type: sum
    sql: ${facebook_action_values_offsite_conversion_fb_pixel_initiate_checkout_1d_click} ;;
    label: "Website Checkouts Initiated Conversion Value (1-day click)"
    group_label: "facebook-website-conversion-values"
    description: "The total value of the checkout actions tracked by your Facebook pixel on your website after people viewed or clicked on your ad. This is based on the value assigned to the checkout event in your Facebook pixel code."
  }

  measure: total_facebook_action_values_offsite_conversion_fb_pixel_initiate_checkout_1d_view {
    type: sum
    sql: ${facebook_action_values_offsite_conversion_fb_pixel_initiate_checkout_1d_view} ;;
    label: "Website Checkouts Initiated Conversion Value (1-day view)"
    group_label: "facebook-website-conversion-values"
    description: "The total value of the checkout actions tracked by your Facebook pixel on your website after people viewed or clicked on your ad. This is based on the value assigned to the checkout event in your Facebook pixel code."
  }

  measure: total_facebook_action_values_offsite_conversion_fb_pixel_initiate_checkout_28d_click {
    type: sum
    sql: ${facebook_action_values_offsite_conversion_fb_pixel_initiate_checkout_28d_click} ;;
    label: "Website Checkouts Initiated Conversion Value (28-day click)"
    group_label: "facebook-website-conversion-values"
    description: "The total value of the checkout actions tracked by your Facebook pixel on your website after people viewed or clicked on your ad. This is based on the value assigned to the checkout event in your Facebook pixel code."
  }

  measure: total_facebook_action_values_offsite_conversion_fb_pixel_initiate_checkout_28d_view {
    type: sum
    sql: ${facebook_action_values_offsite_conversion_fb_pixel_initiate_checkout_28d_view} ;;
    label: "Website Checkouts Initiated Conversion Value (28-day view)"
    group_label: "facebook-website-conversion-values"
    description: "The total value of the checkout actions tracked by your Facebook pixel on your website after people viewed or clicked on your ad. This is based on the value assigned to the checkout event in your Facebook pixel code."
  }

  measure: total_facebook_action_values_offsite_conversion_fb_pixel_initiate_checkout_7d_click {
    type: sum
    sql: ${facebook_action_values_offsite_conversion_fb_pixel_initiate_checkout_7d_click} ;;
    label: "Website Checkouts Initiated Conversion Value (7-day click)"
    group_label: "facebook-website-conversion-values"
    description: "The total value of the checkout actions tracked by your Facebook pixel on your website after people viewed or clicked on your ad. This is based on the value assigned to the checkout event in your Facebook pixel code."
  }

  measure: total_facebook_action_values_offsite_conversion_fb_pixel_initiate_checkout_7d_view {
    type: sum
    sql: ${facebook_action_values_offsite_conversion_fb_pixel_initiate_checkout_7d_view} ;;
    label: "Website Checkouts Initiated Conversion Value (7-day view)"
    group_label: "facebook-website-conversion-values"
    description: "The total value of the checkout actions tracked by your Facebook pixel on your website after people viewed or clicked on your ad. This is based on the value assigned to the checkout event in your Facebook pixel code."
  }

  measure: total_facebook_actions_offsite_conversion_fb_pixel_view_content {
    type: sum
    sql: ${facebook_actions_offsite_conversion_fb_pixel_view_content} ;;
    label: "Website Content Views"
    group_label: "facebook-website-actions"
    description: "The number of content views tracked by your Facebook pixel on your website after people viewed or clicked on your ad."
  }

  measure: total_facebook_actions_offsite_conversion_fb_pixel_view_content_1d_click {
    type: sum
    sql: ${facebook_actions_offsite_conversion_fb_pixel_view_content_1d_click} ;;
    label: "Website Content Views (1-day click)"
    group_label: "facebook-website-actions"
    description: "The number of content views tracked by your Facebook pixel on your website after people viewed or clicked on your ad."
  }

  measure: total_facebook_actions_offsite_conversion_fb_pixel_view_content_1d_view {
    type: sum
    sql: ${facebook_actions_offsite_conversion_fb_pixel_view_content_1d_view} ;;
    label: "Website Content Views (1-day view)"
    group_label: "facebook-website-actions"
    description: "The number of content views tracked by your Facebook pixel on your website after people viewed or clicked on your ad."
  }

  measure: total_facebook_actions_offsite_conversion_fb_pixel_view_content_28d_click {
    type: sum
    sql: ${facebook_actions_offsite_conversion_fb_pixel_view_content_28d_click} ;;
    label: "Website Content Views (28-day click)"
    group_label: "facebook-website-actions"
    description: "The number of content views tracked by your Facebook pixel on your website after people viewed or clicked on your ad."
  }

  measure: total_facebook_actions_offsite_conversion_fb_pixel_view_content_28d_view {
    type: sum
    sql: ${facebook_actions_offsite_conversion_fb_pixel_view_content_28d_view} ;;
    label: "Website Content Views (28-day view)"
    group_label: "facebook-website-actions"
    description: "The number of content views tracked by your Facebook pixel on your website after people viewed or clicked on your ad."
  }

  measure: total_facebook_actions_offsite_conversion_fb_pixel_view_content_7d_click {
    type: sum
    sql: ${facebook_actions_offsite_conversion_fb_pixel_view_content_7d_click} ;;
    label: "Website Content Views (7-day click)"
    group_label: "facebook-website-actions"
    description: "The number of content views tracked by your Facebook pixel on your website after people viewed or clicked on your ad."
  }

  measure: total_facebook_actions_offsite_conversion_fb_pixel_view_content_7d_view {
    type: sum
    sql: ${facebook_actions_offsite_conversion_fb_pixel_view_content_7d_view} ;;
    label: "Website Content Views (7-day view)"
    group_label: "facebook-website-actions"
    description: "The number of content views tracked by your Facebook pixel on your website after people viewed or clicked on your ad."
  }

  measure: total_facebook_action_values_offsite_conversion_fb_pixel_view_content {
    type: sum
    sql: ${facebook_action_values_offsite_conversion_fb_pixel_view_content} ;;
    label: "Website Content Views Conversion Value"
    group_label: "facebook-website-conversion-values"
    description: "The total value of the content views tracked by your Facebook pixel on your website after people viewed or clicked on your ad. This is based on the value assigned to the content view event in your Facebook pixel code."
  }

  measure: total_facebook_action_values_offsite_conversion_fb_pixel_view_content_1d_click {
    type: sum
    sql: ${facebook_action_values_offsite_conversion_fb_pixel_view_content_1d_click} ;;
    label: "Website Content Views Conversion Value (1-day click)"
    group_label: "facebook-website-conversion-values"
    description: "The total value of the content views tracked by your Facebook pixel on your website after people viewed or clicked on your ad. This is based on the value assigned to the content view event in your Facebook pixel code."
  }

  measure: total_facebook_action_values_offsite_conversion_fb_pixel_view_content_1d_view {
    type: sum
    sql: ${facebook_action_values_offsite_conversion_fb_pixel_view_content_1d_view} ;;
    label: "Website Content Views Conversion Value (1-day view)"
    group_label: "facebook-website-conversion-values"
    description: "The total value of the content views tracked by your Facebook pixel on your website after people viewed or clicked on your ad. This is based on the value assigned to the content view event in your Facebook pixel code."
  }

  measure: total_facebook_action_values_offsite_conversion_fb_pixel_view_content_28d_click {
    type: sum
    sql: ${facebook_action_values_offsite_conversion_fb_pixel_view_content_28d_click} ;;
    label: "Website Content Views Conversion Value (28-day click)"
    group_label: "facebook-website-conversion-values"
    description: "The total value of the content views tracked by your Facebook pixel on your website after people viewed or clicked on your ad. This is based on the value assigned to the content view event in your Facebook pixel code."
  }

  measure: total_facebook_action_values_offsite_conversion_fb_pixel_view_content_28d_view {
    type: sum
    sql: ${facebook_action_values_offsite_conversion_fb_pixel_view_content_28d_view} ;;
    label: "Website Content Views Conversion Value (28-day view)"
    group_label: "facebook-website-conversion-values"
    description: "The total value of the content views tracked by your Facebook pixel on your website after people viewed or clicked on your ad. This is based on the value assigned to the content view event in your Facebook pixel code."
  }

  measure: total_facebook_action_values_offsite_conversion_fb_pixel_view_content_7d_click {
    type: sum
    sql: ${facebook_action_values_offsite_conversion_fb_pixel_view_content_7d_click} ;;
    label: "Website Content Views Conversion Value (7-day click)"
    group_label: "facebook-website-conversion-values"
    description: "The total value of the content views tracked by your Facebook pixel on your website after people viewed or clicked on your ad. This is based on the value assigned to the content view event in your Facebook pixel code."
  }

  measure: total_facebook_action_values_offsite_conversion_fb_pixel_view_content_7d_view {
    type: sum
    sql: ${facebook_action_values_offsite_conversion_fb_pixel_view_content_7d_view} ;;
    label: "Website Content Views Conversion Value (7-day view)"
    group_label: "facebook-website-conversion-values"
    description: "The total value of the content views tracked by your Facebook pixel on your website after people viewed or clicked on your ad. This is based on the value assigned to the content view event in your Facebook pixel code."
  }

  measure: total_facebook_actions_offsite_conversion {
    type: sum
    sql: ${facebook_actions_offsite_conversion} ;;
    label: "Website Conversions"
    group_label: "facebook-website-actions"
    description: "The total number of actions tracked by your Facebook pixel or conversion pixels on your website after people clicked or viewed your ad."
  }

  measure: total_facebook_actions_offsite_conversion_key_page_view {
    type: sum
    sql: ${facebook_actions_offsite_conversion_key_page_view} ;;
    label: "Website Key Page Views (Conversion Tracking Pixel)"
    group_label: "facebook-website-actions"
    description: "The number of times a key page was viewed on your website as a result of your ad."
  }

  measure: total_facebook_action_values_offsite_conversion_key_page_view {
    type: sum
    sql: ${facebook_action_values_offsite_conversion_key_page_view} ;;
    label: "Website Key Page Views Conversion Value (Conversion Tracking Pixel)"
    group_label: "facebook-website-conversion-values"
    description: "The total value returned when a key page was viewed on your website as a result of your ad."
  }

  measure: total_facebook_actions_offsite_conversion_fb_pixel_lead {
    type: sum
    sql: ${facebook_actions_offsite_conversion_fb_pixel_lead} ;;
    label: "Website Leads"
    group_label: "facebook-website-actions"
    description: "The number of leads tracked by your Facebook pixel on your website after people viewed or clicked on your ad."
  }

  measure: total_facebook_actions_offsite_conversion_fb_pixel_lead_1d_click {
    type: sum
    sql: ${facebook_actions_offsite_conversion_fb_pixel_lead_1d_click} ;;
    label: "Website Leads (1-day click)"
    group_label: "facebook-website-actions"
    description: "The number of leads tracked by your Facebook pixel on your website after people viewed or clicked on your ad."
  }

  measure: total_facebook_actions_offsite_conversion_fb_pixel_lead_1d_view {
    type: sum
    sql: ${facebook_actions_offsite_conversion_fb_pixel_lead_1d_view} ;;
    label: "Website Leads (1-day view)"
    group_label: "facebook-website-actions"
    description: "The number of leads tracked by your Facebook pixel on your website after people viewed or clicked on your ad."
  }

  measure: total_facebook_actions_offsite_conversion_fb_pixel_lead_28d_click {
    type: sum
    sql: ${facebook_actions_offsite_conversion_fb_pixel_lead_28d_click} ;;
    label: "Website Leads (28-day click)"
    group_label: "facebook-website-actions"
    description: "The number of leads tracked by your Facebook pixel on your website after people viewed or clicked on your ad."
  }

  measure: total_facebook_actions_offsite_conversion_fb_pixel_lead_28d_view {
    type: sum
    sql: ${facebook_actions_offsite_conversion_fb_pixel_lead_28d_view} ;;
    label: "Website Leads (28-day view)"
    group_label: "facebook-website-actions"
    description: "The number of leads tracked by your Facebook pixel on your website after people viewed or clicked on your ad."
  }

  measure: total_facebook_actions_offsite_conversion_fb_pixel_lead_7d_click {
    type: sum
    sql: ${facebook_actions_offsite_conversion_fb_pixel_lead_7d_click} ;;
    label: "Website Leads (7-day click)"
    group_label: "facebook-website-actions"
    description: "The number of leads tracked by your Facebook pixel on your website after people viewed or clicked on your ad."
  }

  measure: total_facebook_actions_offsite_conversion_fb_pixel_lead_7d_view {
    type: sum
    sql: ${facebook_actions_offsite_conversion_fb_pixel_lead_7d_view} ;;
    label: "Website Leads (7-day view)"
    group_label: "facebook-website-actions"
    description: "The number of leads tracked by your Facebook pixel on your website after people viewed or clicked on your ad."
  }

  measure: total_facebook_actions_offsite_conversion_lead {
    type: sum
    sql: ${facebook_actions_offsite_conversion_lead} ;;
    label: "Website Leads (Conversion Tracking Pixel)"
    group_label: "facebook-website-actions"
    description: "The number of new leads you acquired on your website as a result of your ad."
  }

  measure: total_facebook_action_values_offsite_conversion_fb_pixel_lead {
    type: sum
    sql: ${facebook_action_values_offsite_conversion_fb_pixel_lead} ;;
    label: "Website Leads Conversion Value"
    group_label: "facebook-website-conversion-values"
    description: "The total value of the leads tracked by your Facebook pixel on your website after people viewed or clicked on your ad. This is based on the value assigned to the website lead event in your Facebook pixel code."
  }

  measure: total_facebook_action_values_offsite_conversion_fb_pixel_lead_1d_click {
    type: sum
    sql: ${facebook_action_values_offsite_conversion_fb_pixel_lead_1d_click} ;;
    label: "Website Leads Conversion Value (1-day click)"
    group_label: "facebook-website-conversion-values"
    description: "The total value of the leads tracked by your Facebook pixel on your website after people viewed or clicked on your ad. This is based on the value assigned to the website lead event in your Facebook pixel code."
  }

  measure: total_facebook_action_values_offsite_conversion_fb_pixel_lead_1d_view {
    type: sum
    sql: ${facebook_action_values_offsite_conversion_fb_pixel_lead_1d_view} ;;
    label: "Website Leads Conversion Value (1-day view)"
    group_label: "facebook-website-conversion-values"
    description: "The total value of the leads tracked by your Facebook pixel on your website after people viewed or clicked on your ad. This is based on the value assigned to the website lead event in your Facebook pixel code."
  }

  measure: total_facebook_action_values_offsite_conversion_fb_pixel_lead_28d_click {
    type: sum
    sql: ${facebook_action_values_offsite_conversion_fb_pixel_lead_28d_click} ;;
    label: "Website Leads Conversion Value (28-day click)"
    group_label: "facebook-website-conversion-values"
    description: "The total value of the leads tracked by your Facebook pixel on your website after people viewed or clicked on your ad. This is based on the value assigned to the website lead event in your Facebook pixel code."
  }

  measure: total_facebook_action_values_offsite_conversion_fb_pixel_lead_28d_view {
    type: sum
    sql: ${facebook_action_values_offsite_conversion_fb_pixel_lead_28d_view} ;;
    label: "Website Leads Conversion Value (28-day view)"
    group_label: "facebook-website-conversion-values"
    description: "The total value of the leads tracked by your Facebook pixel on your website after people viewed or clicked on your ad. This is based on the value assigned to the website lead event in your Facebook pixel code."
  }

  measure: total_facebook_action_values_offsite_conversion_fb_pixel_lead_7d_click {
    type: sum
    sql: ${facebook_action_values_offsite_conversion_fb_pixel_lead_7d_click} ;;
    label: "Website Leads Conversion Value (7-day click)"
    group_label: "facebook-website-conversion-values"
    description: "The total value of the leads tracked by your Facebook pixel on your website after people viewed or clicked on your ad. This is based on the value assigned to the website lead event in your Facebook pixel code."
  }

  measure: total_facebook_action_values_offsite_conversion_fb_pixel_lead_7d_view {
    type: sum
    sql: ${facebook_action_values_offsite_conversion_fb_pixel_lead_7d_view} ;;
    label: "Website Leads Conversion Value (7-day view)"
    group_label: "facebook-website-conversion-values"
    description: "The total value of the leads tracked by your Facebook pixel on your website after people viewed or clicked on your ad. This is based on the value assigned to the website lead event in your Facebook pixel code."
  }

  measure: total_facebook_action_values_offsite_conversion_lead {
    type: sum
    sql: ${facebook_action_values_offsite_conversion_lead} ;;
    label: "Website Leads Conversion Value (Conversion Tracking Pixel)"
    group_label: "facebook-website-conversion-values"
    description: "The total value returned from acquiring new leads on your website as a result of your ad."
  }

  measure: total_facebook_actions_offsite_conversion_fb_pixel_purchase {
    type: sum
    sql: ${facebook_actions_offsite_conversion_fb_pixel_purchase} ;;
    label: "Website Purchases"
    group_label: "facebook-website-actions"
    description: "The number of times a purchase was made tracked by your Facebook pixel on your website after people viewed or clicked on your ad."
  }

  measure: total_facebook_actions_offsite_conversion_fb_pixel_purchase_1d_click {
    type: sum
    sql: ${facebook_actions_offsite_conversion_fb_pixel_purchase_1d_click} ;;
    label: "Website Purchases (1-day click)"
    group_label: "facebook-website-actions"
    description: "The number of times a purchase was made tracked by your Facebook pixel on your website after people viewed or clicked on your ad."
  }

  measure: total_facebook_actions_offsite_conversion_fb_pixel_purchase_1d_view {
    type: sum
    sql: ${facebook_actions_offsite_conversion_fb_pixel_purchase_1d_view} ;;
    label: "Website Purchases (1-day view)"
    group_label: "facebook-website-actions"
    description: "The number of times a purchase was made tracked by your Facebook pixel on your website after people viewed or clicked on your ad."
  }

  measure: total_facebook_actions_offsite_conversion_fb_pixel_purchase_28d_click {
    type: sum
    sql: ${facebook_actions_offsite_conversion_fb_pixel_purchase_28d_click} ;;
    label: "Website Purchases (28-day click)"
    group_label: "facebook-website-actions"
    description: "The number of times a purchase was made tracked by your Facebook pixel on your website after people viewed or clicked on your ad."
  }

  measure: total_facebook_actions_offsite_conversion_fb_pixel_purchase_28d_view {
    type: sum
    sql: ${facebook_actions_offsite_conversion_fb_pixel_purchase_28d_view} ;;
    label: "Website Purchases (28-day view)"
    group_label: "facebook-website-actions"
    description: "The number of times a purchase was made tracked by your Facebook pixel on your website after people viewed or clicked on your ad."
  }

  measure: total_facebook_actions_offsite_conversion_fb_pixel_purchase_7d_click {
    type: sum
    sql: ${facebook_actions_offsite_conversion_fb_pixel_purchase_7d_click} ;;
    label: "Website Purchases (7-day click)"
    group_label: "facebook-website-actions"
    description: "The number of times a purchase was made tracked by your Facebook pixel on your website after people viewed or clicked on your ad."
  }

  measure: total_facebook_actions_offsite_conversion_fb_pixel_purchase_7d_view {
    type: sum
    sql: ${facebook_actions_offsite_conversion_fb_pixel_purchase_7d_view} ;;
    label: "Website Purchases (7-day view)"
    group_label: "facebook-website-actions"
    description: "The number of times a purchase was made tracked by your Facebook pixel on your website after people viewed or clicked on your ad."
  }

  measure: total_facebook_action_values_offsite_conversion_fb_pixel_purchase {
    type: sum
    sql: ${facebook_action_values_offsite_conversion_fb_pixel_purchase} ;;
    label: "Website Purchases Conversion Value"
    group_label: "facebook-website-conversion-values"
    description: "The total value of the purchase actions tracked by your Facebook pixel on your website after people viewed or clicked on your ad. This is based on the value assigned to the purchase detail event in your Facebook pixel code."
  }

  measure: total_facebook_action_values_offsite_conversion_fb_pixel_purchase_1d_click {
    type: sum
    sql: ${facebook_action_values_offsite_conversion_fb_pixel_purchase_1d_click} ;;
    label: "Website Purchases Conversion Value (1-day click)"
    group_label: "facebook-website-conversion-values"
    description: "The total value of the purchase actions tracked by your Facebook pixel on your website after people viewed or clicked on your ad. This is based on the value assigned to the purchase detail event in your Facebook pixel code."
  }

  measure: total_facebook_action_values_offsite_conversion_fb_pixel_purchase_1d_view {
    type: sum
    sql: ${facebook_action_values_offsite_conversion_fb_pixel_purchase_1d_view} ;;
    label: "Website Purchases Conversion Value (1-day view)"
    group_label: "facebook-website-conversion-values"
    description: "The total value of the purchase actions tracked by your Facebook pixel on your website after people viewed or clicked on your ad. This is based on the value assigned to the purchase detail event in your Facebook pixel code."
  }

  measure: total_facebook_action_values_offsite_conversion_fb_pixel_purchase_28d_click {
    type: sum
    sql: ${facebook_action_values_offsite_conversion_fb_pixel_purchase_28d_click} ;;
    label: "Website Purchases Conversion Value (28-day click)"
    group_label: "facebook-website-conversion-values"
    description: "The total value of the purchase actions tracked by your Facebook pixel on your website after people viewed or clicked on your ad. This is based on the value assigned to the purchase detail event in your Facebook pixel code."
  }

  measure: total_facebook_action_values_offsite_conversion_fb_pixel_purchase_28d_view {
    type: sum
    sql: ${facebook_action_values_offsite_conversion_fb_pixel_purchase_28d_view} ;;
    label: "Website Purchases Conversion Value (28-day view)"
    group_label: "facebook-website-conversion-values"
    description: "The total value of the purchase actions tracked by your Facebook pixel on your website after people viewed or clicked on your ad. This is based on the value assigned to the purchase detail event in your Facebook pixel code."
  }

  measure: total_facebook_action_values_offsite_conversion_fb_pixel_purchase_7d_click {
    type: sum
    sql: ${facebook_action_values_offsite_conversion_fb_pixel_purchase_7d_click} ;;
    label: "Website Purchases Conversion Value (7-day click)"
    group_label: "facebook-website-conversion-values"
    description: "The total value of the purchase actions tracked by your Facebook pixel on your website after people viewed or clicked on your ad. This is based on the value assigned to the purchase detail event in your Facebook pixel code."
  }

  measure: total_facebook_action_values_offsite_conversion_fb_pixel_purchase_7d_view {
    type: sum
    sql: ${facebook_action_values_offsite_conversion_fb_pixel_purchase_7d_view} ;;
    label: "Website Purchases Conversion Value (7-day view)"
    group_label: "facebook-website-conversion-values"
    description: "The total value of the purchase actions tracked by your Facebook pixel on your website after people viewed or clicked on your ad. This is based on the value assigned to the purchase detail event in your Facebook pixel code."
  }

  measure: total_facebook_actions_offsite_conversion_registration {
    type: sum
    sql: ${facebook_actions_offsite_conversion_registration} ;;
    label: "Website Registrations (Conversion Tracking Pixel)"
    group_label: "facebook-website-actions"
    description: "The number of times a registration was completed on your website as a result of your ad."
  }

  measure: total_facebook_actions_offsite_conversion_fb_pixel_complete_registration {
    type: sum
    sql: ${facebook_actions_offsite_conversion_fb_pixel_complete_registration} ;;
    label: "Website Registrations Completed"
    group_label: "facebook-website-actions"
    description: "The number of registrations tracked by your Facebook pixel on your website after people viewed or clicked on your ad."
  }

  measure: total_facebook_actions_offsite_conversion_fb_pixel_complete_registration_1d_click {
    type: sum
    sql: ${facebook_actions_offsite_conversion_fb_pixel_complete_registration_1d_click} ;;
    label: "Website Registrations Completed (1-day click)"
    group_label: "facebook-website-actions"
    description: "The number of registrations tracked by your Facebook pixel on your website after people viewed or clicked on your ad."
  }

  measure: total_facebook_actions_offsite_conversion_fb_pixel_complete_registration_1d_view {
    type: sum
    sql: ${facebook_actions_offsite_conversion_fb_pixel_complete_registration_1d_view} ;;
    label: "Website Registrations Completed (1-day view)"
    group_label: "facebook-website-actions"
    description: "The number of registrations tracked by your Facebook pixel on your website after people viewed or clicked on your ad."
  }

  measure: total_facebook_actions_offsite_conversion_fb_pixel_complete_registration_28d_click {
    type: sum
    sql: ${facebook_actions_offsite_conversion_fb_pixel_complete_registration_28d_click} ;;
    label: "Website Registrations Completed (28-day click)"
    group_label: "facebook-website-actions"
    description: "The number of registrations tracked by your Facebook pixel on your website after people viewed or clicked on your ad."
  }

  measure: total_facebook_actions_offsite_conversion_fb_pixel_complete_registration_28d_view {
    type: sum
    sql: ${facebook_actions_offsite_conversion_fb_pixel_complete_registration_28d_view} ;;
    label: "Website Registrations Completed (28-day view)"
    group_label: "facebook-website-actions"
    description: "The number of registrations tracked by your Facebook pixel on your website after people viewed or clicked on your ad."
  }

  measure: total_facebook_actions_offsite_conversion_fb_pixel_complete_registration_7d_click {
    type: sum
    sql: ${facebook_actions_offsite_conversion_fb_pixel_complete_registration_7d_click} ;;
    label: "Website Registrations Completed (7-day click)"
    group_label: "facebook-website-actions"
    description: "The number of registrations tracked by your Facebook pixel on your website after people viewed or clicked on your ad."
  }

  measure: total_facebook_actions_offsite_conversion_fb_pixel_complete_registration_7d_view {
    type: sum
    sql: ${facebook_actions_offsite_conversion_fb_pixel_complete_registration_7d_view} ;;
    label: "Website Registrations Completed (7-day view)"
    group_label: "facebook-website-actions"
    description: "The number of registrations tracked by your Facebook pixel on your website after people viewed or clicked on your ad."
  }

  measure: total_facebook_action_values_offsite_conversion_fb_pixel_complete_registration {
    type: sum
    sql: ${facebook_action_values_offsite_conversion_fb_pixel_complete_registration} ;;
    label: "Website Registrations Completed Conversion Value"
    group_label: "facebook-website-conversion-values"
    description: "The total value of the registrations tracked by your Facebook pixel on your website after people viewed or clicked on your ad. This is based on the value assigned to the registration event in your Facebook pixel code."
  }

  measure: total_facebook_action_values_offsite_conversion_fb_pixel_complete_registration_1d_click {
    type: sum
    sql: ${facebook_action_values_offsite_conversion_fb_pixel_complete_registration_1d_click} ;;
    label: "Website Registrations Completed Conversion Value (1-day click)"
    group_label: "facebook-website-conversion-values"
    description: "The total value of the registrations tracked by your Facebook pixel on your website after people viewed or clicked on your ad. This is based on the value assigned to the registration event in your Facebook pixel code."
  }

  measure: total_facebook_action_values_offsite_conversion_fb_pixel_complete_registration_1d_view {
    type: sum
    sql: ${facebook_action_values_offsite_conversion_fb_pixel_complete_registration_1d_view} ;;
    label: "Website Registrations Completed Conversion Value (1-day view)"
    group_label: "facebook-website-conversion-values"
    description: "The total value of the registrations tracked by your Facebook pixel on your website after people viewed or clicked on your ad. This is based on the value assigned to the registration event in your Facebook pixel code."
  }

  measure: total_facebook_action_values_offsite_conversion_fb_pixel_complete_registration_28d_click {
    type: sum
    sql: ${facebook_action_values_offsite_conversion_fb_pixel_complete_registration_28d_click} ;;
    label: "Website Registrations Completed Conversion Value (28-day click)"
    group_label: "facebook-website-conversion-values"
    description: "The total value of the registrations tracked by your Facebook pixel on your website after people viewed or clicked on your ad. This is based on the value assigned to the registration event in your Facebook pixel code."
  }

  measure: total_facebook_action_values_offsite_conversion_fb_pixel_complete_registration_28d_view {
    type: sum
    sql: ${facebook_action_values_offsite_conversion_fb_pixel_complete_registration_28d_view} ;;
    label: "Website Registrations Completed Conversion Value (28-day view)"
    group_label: "facebook-website-conversion-values"
    description: "The total value of the registrations tracked by your Facebook pixel on your website after people viewed or clicked on your ad. This is based on the value assigned to the registration event in your Facebook pixel code."
  }

  measure: total_facebook_action_values_offsite_conversion_fb_pixel_complete_registration_7d_click {
    type: sum
    sql: ${facebook_action_values_offsite_conversion_fb_pixel_complete_registration_7d_click} ;;
    label: "Website Registrations Completed Conversion Value (7-day click)"
    group_label: "facebook-website-conversion-values"
    description: "The total value of the registrations tracked by your Facebook pixel on your website after people viewed or clicked on your ad. This is based on the value assigned to the registration event in your Facebook pixel code."
  }

  measure: total_facebook_action_values_offsite_conversion_fb_pixel_complete_registration_7d_view {
    type: sum
    sql: ${facebook_action_values_offsite_conversion_fb_pixel_complete_registration_7d_view} ;;
    label: "Website Registrations Completed Conversion Value (7-day view)"
    group_label: "facebook-website-conversion-values"
    description: "The total value of the registrations tracked by your Facebook pixel on your website after people viewed or clicked on your ad. This is based on the value assigned to the registration event in your Facebook pixel code."
  }

  measure: total_facebook_action_values_offsite_conversion_registration {
    type: sum
    sql: ${facebook_action_values_offsite_conversion_registration} ;;
    label: "Website Registrations Conversion Value (Conversion Tracking Pixel)"
    group_label: "facebook-website-conversion-values"
    description: "The total value returned from completed registration conversions on your website as a result of your ad."
  }

  measure: total_facebook_actions_offsite_conversion_fb_pixel_search {
    type: sum
    sql: ${facebook_actions_offsite_conversion_fb_pixel_search} ;;
    label: "Website Searches"
    group_label: "facebook-website-actions"
    description: "The number of searches tracked by your Facebook pixel on your website after people viewed or clicked on your ad."
  }

  measure: total_facebook_actions_offsite_conversion_fb_pixel_search_1d_click {
    type: sum
    sql: ${facebook_actions_offsite_conversion_fb_pixel_search_1d_click} ;;
    label: "Website Searches (1-day click)"
    group_label: "facebook-website-actions"
    description: "The number of searches tracked by your Facebook pixel on your website after people viewed or clicked on your ad."
  }

  measure: total_facebook_actions_offsite_conversion_fb_pixel_search_1d_view {
    type: sum
    sql: ${facebook_actions_offsite_conversion_fb_pixel_search_1d_view} ;;
    label: "Website Searches (1-day view)"
    group_label: "facebook-website-actions"
    description: "The number of searches tracked by your Facebook pixel on your website after people viewed or clicked on your ad."
  }

  measure: total_facebook_actions_offsite_conversion_fb_pixel_search_28d_click {
    type: sum
    sql: ${facebook_actions_offsite_conversion_fb_pixel_search_28d_click} ;;
    label: "Website Searches (28-day click)"
    group_label: "facebook-website-actions"
    description: "The number of searches tracked by your Facebook pixel on your website after people viewed or clicked on your ad."
  }

  measure: total_facebook_actions_offsite_conversion_fb_pixel_search_28d_view {
    type: sum
    sql: ${facebook_actions_offsite_conversion_fb_pixel_search_28d_view} ;;
    label: "Website Searches (28-day view)"
    group_label: "facebook-website-actions"
    description: "The number of searches tracked by your Facebook pixel on your website after people viewed or clicked on your ad."
  }

  measure: total_facebook_actions_offsite_conversion_fb_pixel_search_7d_click {
    type: sum
    sql: ${facebook_actions_offsite_conversion_fb_pixel_search_7d_click} ;;
    label: "Website Searches (7-day click)"
    group_label: "facebook-website-actions"
    description: "The number of searches tracked by your Facebook pixel on your website after people viewed or clicked on your ad."
  }

  measure: total_facebook_actions_offsite_conversion_fb_pixel_search_7d_view {
    type: sum
    sql: ${facebook_actions_offsite_conversion_fb_pixel_search_7d_view} ;;
    label: "Website Searches (7-day view)"
    group_label: "facebook-website-actions"
    description: "The number of searches tracked by your Facebook pixel on your website after people viewed or clicked on your ad."
  }

  measure: total_facebook_action_values_offsite_conversion_fb_pixel_search {
    type: sum
    sql: ${facebook_action_values_offsite_conversion_fb_pixel_search} ;;
    label: "Website Searches Conversion Value"
    group_label: "facebook-website-conversion-values"
    description: "The total value of the searches tracked by your Facebook pixel on your website after people viewed or clicked on your ad. This is based on the value assigned to the search event in your Facebook pixel code."
  }

  measure: total_facebook_action_values_offsite_conversion_fb_pixel_search_1d_click {
    type: sum
    sql: ${facebook_action_values_offsite_conversion_fb_pixel_search_1d_click} ;;
    label: "Website Searches Conversion Value (1-day click)"
    group_label: "facebook-website-conversion-values"
    description: "The total value of the searches tracked by your Facebook pixel on your website after people viewed or clicked on your ad. This is based on the value assigned to the search event in your Facebook pixel code."
  }

  measure: total_facebook_action_values_offsite_conversion_fb_pixel_search_1d_view {
    type: sum
    sql: ${facebook_action_values_offsite_conversion_fb_pixel_search_1d_view} ;;
    label: "Website Searches Conversion Value (1-day view)"
    group_label: "facebook-website-conversion-values"
    description: "The total value of the searches tracked by your Facebook pixel on your website after people viewed or clicked on your ad. This is based on the value assigned to the search event in your Facebook pixel code."
  }

  measure: total_facebook_action_values_offsite_conversion_fb_pixel_search_28d_click {
    type: sum
    sql: ${facebook_action_values_offsite_conversion_fb_pixel_search_28d_click} ;;
    label: "Website Searches Conversion Value (28-day click)"
    group_label: "facebook-website-conversion-values"
    description: "The total value of the searches tracked by your Facebook pixel on your website after people viewed or clicked on your ad. This is based on the value assigned to the search event in your Facebook pixel code."
  }

  measure: total_facebook_action_values_offsite_conversion_fb_pixel_search_28d_view {
    type: sum
    sql: ${facebook_action_values_offsite_conversion_fb_pixel_search_28d_view} ;;
    label: "Website Searches Conversion Value (28-day view)"
    group_label: "facebook-website-conversion-values"
    description: "The total value of the searches tracked by your Facebook pixel on your website after people viewed or clicked on your ad. This is based on the value assigned to the search event in your Facebook pixel code."
  }

  measure: total_facebook_action_values_offsite_conversion_fb_pixel_search_7d_click {
    type: sum
    sql: ${facebook_action_values_offsite_conversion_fb_pixel_search_7d_click} ;;
    label: "Website Searches Conversion Value (7-day click)"
    group_label: "facebook-website-conversion-values"
    description: "The total value of the searches tracked by your Facebook pixel on your website after people viewed or clicked on your ad. This is based on the value assigned to the search event in your Facebook pixel code."
  }

  measure: total_facebook_action_values_offsite_conversion_fb_pixel_search_7d_view {
    type: sum
    sql: ${facebook_action_values_offsite_conversion_fb_pixel_search_7d_view} ;;
    label: "Website Searches Conversion Value (7-day view)"
    group_label: "facebook-website-conversion-values"
    description: "The total value of the searches tracked by your Facebook pixel on your website after people viewed or clicked on your ad. This is based on the value assigned to the search event in your Facebook pixel code."
  }

  measure: total_facebook_action_values_offsite_conversion {
    type: sum
    sql: ${facebook_action_values_offsite_conversion} ;;
    label: "Website action value (All)"
    group_label: "facebook-website-conversion-values"
    description: "The total value of the actions tracked by your Facebook pixel or conversion pixels on your website after people viewed or clicked on your ad."
  }

  measure: total_facebook_website_clicks {
    type: sum
    sql: ${facebook_website_clicks} ;;
    label: "Website clicks"
    group_label: "facebook-clicks"
    description: "The numbers of clicks that go to web after user clicks your ads."
  }

  ##################################################################
  # END OF FUNNEL GENERATED
  ##################################################################

}
