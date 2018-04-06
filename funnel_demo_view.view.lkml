view: funnel_demo_view {
  derived_table: {
    sql: select * from looker_demo_aggregated
      ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  measure: total_clicks {
    type:  sum
    sql: ${common_clicks} ;;
  }

  measure: total_impressions {
    type:  sum
    sql: ${common_impressions} ;;
  }

  measure: total_cost {
    type:  sum
    sql: ${common_cost} ;;
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
  }

  measure: total_sessions {
    type:  sum
    sql:  ${googleanalytics_ga_sessions} ;;
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
      common_cost,
      common_clicks,
      common_impressions
    ]
  }


# Everything below this line was generated automatically by Funnel

  dimension: date {
    type: string
    sql: ${TABLE}.date;;
    label: "Date"
    group_label: "common-date"
    description: "The date provided by the connected data source in ISO format, e.g. '2016-07-31'"
  }

  dimension: sourceType {
    type: string
    sql: ${TABLE}.sourceType;;
    label: "Connection type code"
    group_label: "common-connection"
    description: "The type code of a connected data source, e.g. 'googleanalytics', 'adwords' or 'facebook'."
  }

  dimension: sourceId {
    type: string
    sql: ${TABLE}.sourceId;;
    label: "Connection id"
    group_label: "common-connection"
    description: "The id of a connected data source. This could, for example, be the id of a Google Analytics View or a Facebook ad account."
  }

  dimension: currency {
    type: string
    sql: ${TABLE}.currency;;
    label: "Currency"
    group_label: "common-connection"
    description: "The currency code that the monetary data is in."
  }

  dimension: common_campaign {
    type: string
    sql: ${TABLE}.common_campaign;;
    label: "Ad campaign name"
    group_label: "common-connection"
    description: "The name of an advertising campaign. This is the name that was set when the campaign was created in the ad platform."
  }

  dimension: sourceKey {
    type: string
    sql: ${TABLE}.sourceKey;;
    label: "Connection"
    group_label: "common-connection"
    description: "The exact connected data source. This could, for example, be a Google Analytics View or Facebook ad account."
  }

  dimension: sourceName {
    type: string
    sql: ${TABLE}.sourceName;;
    label: "Connection name"
    group_label: "common-connection"
    description: "The name of a connected data source. This could, for example, be the name of a Google Analytics View or a Facebook ad account."
  }

  dimension: sourceTypeName {
    type: string
    sql: ${TABLE}.sourceTypeName;;
    label: "Connection type"
    group_label: "common-connection"
    description: "The type of a connected data source. This could, for example, be 'Google Analytics', 'AdWords' or 'Facebook'."
  }

  dimension: accountId {
    type: string
    sql: ${TABLE}.accountId;;
    label: "Funnel Account id"
    group_label: "common-connection"
    description: "The Funnel account id that the data is from."
  }

  dimension: date_MMMM {
    type: string
    sql: ${TABLE}.date_MMMM;;
    label: "Month"
    group_label: "common-date"
    description: "The month name for the date provided by the connected data source, e.g. 'January'"
  }

  dimension: date_MM {
    type: string
    sql: ${TABLE}.date_MM;;
    label: "Month number"
    group_label: "common-date"
    description: "The month for the date provided by the connected data source, e.g. '07'"
  }

  dimension: date_W_iso {
    type: string
    sql: ${TABLE}.date_W_iso;;
    label: "Week number (ISO)"
    group_label: "common-date"
    description: "The week number according to the ISO 8601 standard, with Monday as the first day of week"
  }

  dimension: date_YYYY {
    type: string
    sql: ${TABLE}.date_YYYY;;
    label: "Year"
    group_label: "common-date"
    description: "The 4 digit year for the date provided by the connected data source, e.g. '2016'"
  }

  dimension: common_campaignFlags {
    type: string
    sql: ${TABLE}.common_campaignFlags;;
    label: "Ad campaign type"
    group_label: "custom-dims"
    description: ""
  }

  dimension: campaign {
    type: string
    sql: ${TABLE}.campaign;;
    label: "Campaign"
    group_label: "custom-dims"
    description: ""
  }

  dimension: paid_organic {
    type: string
    sql: ${TABLE}.paid_organic;;
    label: "Paid / Organic"
    group_label: "custom-dims"
    description: ""
  }

  dimension: traffic_source {
    type: string
    sql: ${TABLE}.traffic_source;;
    label: "Traffic source"
    group_label: "custom-dims"
    description: ""
  }

  dimension: adroll_campaign {
    type: string
    sql: ${TABLE}.adroll_campaign;;
    label: "Campaign"
    group_label: "adroll-dims"
    description: ""
  }

  dimension: adwords_campaign {
    type: string
    sql: ${TABLE}.adwords_campaign;;
    label: "Campaign"
    group_label: "adwords-dims"
    description: ""
  }

  dimension: adwords_campaignID {
    type: string
    sql: ${TABLE}.adwords_campaignID;;
    label: "Campaign ID"
    group_label: "adwords-dims"
    description: ""
  }

  dimension: adwords_advertisingChannel {
    type: string
    sql: ${TABLE}.adwords_advertisingChannel;;
    label: "Campaign type"
    group_label: "adwords-dims"
    description: ""
  }

  dimension: bing_AdDistribution {
    type: string
    sql: ${TABLE}.bing_AdDistribution;;
    label: "Ad Distribution"
    group_label: "bing-dims"
    description: "The ad distribution attribute of an ad group"
  }

  dimension: bing_AdGroupId {
    type: string
    sql: ${TABLE}.bing_AdGroupId;;
    label: "Ad Group Id"
    group_label: "bing-dims"
    description: "The Bing Ads assigned identifier of an ad group"
  }

  dimension: bing_AdGroupName {
    type: string
    sql: ${TABLE}.bing_AdGroupName;;
    label: "Ad Group Name"
    group_label: "bing-dims"
    description: "The ad group name"
  }

  dimension: bing_CampaignId {
    type: string
    sql: ${TABLE}.bing_CampaignId;;
    label: "Campaign Id"
    group_label: "bing-dims"
    description: "The Bing Ads assigned identifier of a campaign"
  }

  dimension: bing_CampaignName {
    type: string
    sql: ${TABLE}.bing_CampaignName;;
    label: "Campaign Name"
    group_label: "bing-dims"
    description: "The campaign name"
  }

  dimension: criteo_biddingStrategy {
    type: string
    sql: ${TABLE}.criteo_biddingStrategy;;
    label: "Bidding Strategy"
    group_label: "criteo"
    description: ""
  }

  dimension: criteo_campaignID {
    type: string
    sql: ${TABLE}.criteo_campaignID;;
    label: "Campaign ID"
    group_label: "criteo"
    description: ""
  }

  dimension: criteo_campaignName {
    type: string
    sql: ${TABLE}.criteo_campaignName;;
    label: "Campaign Name"
    group_label: "criteo"
    description: ""
  }

  dimension: criteo_categoryID {
    type: string
    sql: ${TABLE}.criteo_categoryID;;
    label: "Category ID"
    group_label: "criteo"
    description: ""
  }

  dimension: criteo_categoryName {
    type: string
    sql: ${TABLE}.criteo_categoryName;;
    label: "Category Name"
    group_label: "criteo"
    description: ""
  }

  dimension: facebook_campaign {
    type: string
    sql: ${TABLE}.facebook_campaign;;
    label: "Campaign"
    group_label: "facebook-dims"
    description: ""
  }

  dimension: ga_campaign {
    type: string
    sql: ${TABLE}.ga_campaign;;
    label: "GA Campaign"
    group_label: "googleanalytics-dims"
    description: "Google Analytics dimension 'Campaign'. Sometimes referred to as utm_campaign."
  }

  dimension: ga_medium {
    type: string
    sql: ${TABLE}.ga_medium;;
    label: "GA Medium"
    group_label: "googleanalytics-dims"
    description: "Google Analytics dimension 'Medium'. Sometimes referred to as utm_medium."
  }

  dimension: ga_source {
    type: string
    sql: ${TABLE}.ga_source;;
    label: "GA Source"
    group_label: "googleanalytics-dims"
    description: "Google Analytics dimension 'Source'. Sometimes referred to as utm_source."
  }

  dimension: perfectaudience_campaign_name {
    type: string
    sql: ${TABLE}.perfectaudience_campaign_name;;
    label: "Campaign Name"
    group_label: "perfectaudience"
    description: ""
  }

  dimension: perfectaudience_pricing_model {
    type: string
    sql: ${TABLE}.perfectaudience_pricing_model;;
    label: "Pricing Model"
    group_label: "perfectaudience"
    description: ""
  }

  dimension: pricerunner_category {
    type: string
    sql: ${TABLE}.pricerunner_category;;
    label: "Category"
    group_label: "pricerunner-dims"
    description: "The category"
  }

  dimension: twitter_campaign {
    type: string
    sql: ${TABLE}.twitter_campaign;;
    label: "Campaign"
    group_label: "twitter-dims"
    description: ""
  }

  dimension: common_clicks {
    type:number
    hidden:yes
    sql: ${TABLE}.common_clicks;;
    label: "Clicks"
    group_label: "common"
    description: "Number of ad clicks"
  }

  dimension: common_cost {
    type:number
    hidden:yes
    sql: ${TABLE}.common_cost;;
    label: "Cost"
    group_label: "common"
    description: "Amount spent"
  }

  dimension: common_impressions {
    type:number
    hidden:yes
    sql: ${TABLE}.common_impressions;;
    label: "Impressions"
    group_label: "common"
    description: "Number of ad impressions"
  }

  dimension: adroll_adjusted_ctc {
    type:number
    hidden:yes
    sql: ${TABLE}.adroll_adjusted_ctc;;
    label: "Adjusted Click-Through Conversions"
    group_label: "adroll"
    description: "Number of AdRoll adjusted click-through conversions"
  }

  dimension: adroll_adjusted_total_conversions {
    type:number
    hidden:yes
    sql: ${TABLE}.adroll_adjusted_total_conversions;;
    label: "Adjusted Total Conversions"
    group_label: "adroll"
    description: "Number of AdRoll adjusted total conversions (click-through and view-through)"
  }

  dimension: adroll_adjusted_vtc {
    type:number
    hidden:yes
    sql: ${TABLE}.adroll_adjusted_vtc;;
    label: "Adjusted View-Through Conversions"
    group_label: "adroll"
    description: "Number of AdRoll adjusted view-through conversions"
  }

  dimension: adroll_attributed_click_through_rev {
    type:number
    hidden:yes
    sql: ${TABLE}.adroll_attributed_click_through_rev;;
    label: "Attributed Click-Through Revenue"
    group_label: "adroll"
    description: "The revenue attributed to an ad with a click-through conversion as reported by AdRoll"
  }

  dimension: adroll_attributed_rev {
    type:number
    hidden:yes
    sql: ${TABLE}.adroll_attributed_rev;;
    label: "Attributed Revenue"
    group_label: "adroll"
    description: "The revenue attributed to an ad with a conversion (click-through or view-through) as reported by AdRoll"
  }

  dimension: adroll_attributed_view_through_rev {
    type:number
    hidden:yes
    sql: ${TABLE}.adroll_attributed_view_through_rev;;
    label: "Attributed View-Through Revenue"
    group_label: "adroll"
    description: "The revenue attributed to an ad with a view-through conversion as reported by AdRoll"
  }

  dimension: adroll_click_through_conversions {
    type:number
    hidden:yes
    sql: ${TABLE}.adroll_click_through_conversions;;
    label: "Click-Through Conversions"
    group_label: "adroll"
    description: "Number of AdRoll click-through conversions"
  }

  dimension: adroll_clicks {
    type:number
    hidden:yes
    sql: ${TABLE}.adroll_clicks;;
    label: "Clicks"
    group_label: "adroll"
    description: "Number of AdRoll clicks"
  }

  dimension: adroll_total_conversions {
    type:number
    hidden:yes
    sql: ${TABLE}.adroll_total_conversions;;
    label: "Conversions"
    group_label: "adroll"
    description: "Number of AdRoll total conversions (click-through and view-through)"
  }

  dimension: adroll_cost {
    type:number
    hidden:yes
    sql: ${TABLE}.adroll_cost;;
    label: "Cost"
    group_label: "adroll"
    description: "Amount spent in AdRoll"
  }

  dimension: adroll_impressions {
    type:number
    hidden:yes
    sql: ${TABLE}.adroll_impressions;;
    label: "Impressions"
    group_label: "adroll"
    description: "Number of AdRoll impressions"
  }

  dimension: adroll_view_through_conversions {
    type:number
    hidden:yes
    sql: ${TABLE}.adroll_view_through_conversions;;
    label: "View-Through Conversions"
    group_label: "adroll"
    description: "Number of AdRoll view-through conversions"
  }

  dimension: adwords_activeViewViewableImpressions {
    type:number
    hidden:yes
    sql: ${TABLE}.adwords_activeViewViewableImpressions;;
    label: "Active View Impressions"
    group_label: "adwords-performanceActiveView"
    description: "How often your ad has become viewable on a Display Network site"
  }

  dimension: adwords_activeViewMeasurableCost {
    type:number
    hidden:yes
    sql: ${TABLE}.adwords_activeViewMeasurableCost;;
    label: "Active View Measurable Cost"
    group_label: "adwords-performanceActiveView"
    description: "The cost of the impressions you received that were measurable by Active View"
  }

  dimension: adwords_activeViewMeasurableImpr {
    type:number
    hidden:yes
    sql: ${TABLE}.adwords_activeViewMeasurableImpr;;
    label: "Active View Measurable Impressions"
    group_label: "adwords-performanceActiveView"
    description: "The number of times your ads are appearing on placements in positions where they can be seen"
  }

  dimension: adwords_allConv {
    type:number
    hidden:yes
    sql: ${TABLE}.adwords_allConv;;
    label: "All conv."
    group_label: "adwords-conv"
    description: "Best estimate of the total number of conversions that AdWords drives. Includes website, cross-device, and phone call conversions."
  }

  dimension: adwords_allConvValue {
    type:number
    hidden:yes
    sql: ${TABLE}.adwords_allConvValue;;
    label: "All conv. value"
    group_label: "adwords-conv"
    description: "The total value of all of your conversions, including those that are estimated."
  }

  dimension: adwords_clickAssistedConv {
    type:number
    hidden:yes
    sql: ${TABLE}.adwords_clickAssistedConv;;
    label: "Click Assisted Conv."
    group_label: "adwords-conv"
    description: "The total number of conversions for which this keyword, ad, ad group, or campaign contributed one or more assist clicks."
  }

  dimension: adwords_clickAssistedConvValue {
    type:number
    hidden:yes
    sql: ${TABLE}.adwords_clickAssistedConvValue;;
    label: "Click Assisted Conv. Value"
    group_label: "adwords-conv"
    description: "The total value of all conversions for which this keyword, ad, ad group, or campaign triggered assist clicks."
  }

  dimension: adwords_clicks {
    type:number
    hidden:yes
    sql: ${TABLE}.adwords_clicks;;
    label: "Clicks"
    group_label: "adwords-performance"
    description: "Number of AdWords clicks"
  }

  dimension: adwords_conversions {
    type:number
    hidden:yes
    sql: ${TABLE}.adwords_conversions;;
    label: "Conversions"
    group_label: "adwords-conv"
    description: "The number of conversions for all conversion actions that you have opted into optimization."
  }

  dimension: adwords_cost {
    type:number
    hidden:yes
    sql: ${TABLE}.adwords_cost;;
    label: "Cost"
    group_label: "adwords-performance"
    description: "Amount spent in AdWords"
  }

  dimension: adwords_engagements {
    type:number
    hidden:yes
    sql: ${TABLE}.adwords_engagements;;
    label: "Engagements"
    group_label: "adwords-performance"
    description: "The number of engagements. An engagement occurs when a viewer expands your Lightbox ad. Also, in the future, other ad types may support engagement metrics."
  }

  dimension: adwords_gmailClicksToWebsite {
    type:number
    hidden:yes
    sql: ${TABLE}.adwords_gmailClicksToWebsite;;
    label: "Gmail clicks to website"
    group_label: "adwords-gmail"
    description: "The number of clicks to your landing page on the expanded state of Gmail ads."
  }

  dimension: adwords_gmailForwards {
    type:number
    hidden:yes
    sql: ${TABLE}.adwords_gmailForwards;;
    label: "Gmail forwards"
    group_label: "adwords-gmail"
    description: "The number of times your ad was forwarded to someone else as a message."
  }

  dimension: adwords_gmailSaves {
    type:number
    hidden:yes
    sql: ${TABLE}.adwords_gmailSaves;;
    label: "Gmail saves"
    group_label: "adwords-gmail"
    description: "The number of times someone has saved your Gmail ad to their inbox as a message."
  }

  dimension: adwords_imprAssistedConv {
    type:number
    hidden:yes
    sql: ${TABLE}.adwords_imprAssistedConv;;
    label: "Impr. Assisted Conv."
    group_label: "adwords-conv"
    description: "Total number of conversions for which this object triggered assist impressions prior to the last click."
  }

  dimension: adwords_imprAssistedConvValue {
    type:number
    hidden:yes
    sql: ${TABLE}.adwords_imprAssistedConvValue;;
    label: "Impr. Assisted Conv. Value"
    group_label: "adwords-conv"
    description: "Total value of all conversions for which this object triggered assist impressions."
  }

  dimension: adwords_impressions {
    type:number
    hidden:yes
    sql: ${TABLE}.adwords_impressions;;
    label: "Impressions"
    group_label: "adwords-performance"
    description: "Number of AdWords impressions"
  }

  dimension: adwords_interactions {
    type:number
    hidden:yes
    sql: ${TABLE}.adwords_interactions;;
    label: "Interactions"
    group_label: "adwords-performance"
    description: "An interaction is the main user action associated with an ad format—clicks for text and shopping ads, views for video ads, and so on."
  }

  dimension: adwords_invalidClicks {
    type:number
    hidden:yes
    sql: ${TABLE}.adwords_invalidClicks;;
    label: "Invalid clicks"
    group_label: "adwords-performance"
    description: "Number of clicks Google considers illegitimate and doesn't charge you for."
  }

  dimension: adwords_videoPlayedTo100Number {
    type:number
    hidden:yes
    sql: ${TABLE}.adwords_videoPlayedTo100Number;;
    label: "Number of Video Quartile 100% views"
    group_label: "adwords-video"
    description: "The number of times the video was played to its full length."
  }

  dimension: adwords_videoPlayedTo25Number {
    type:number
    hidden:yes
    sql: ${TABLE}.adwords_videoPlayedTo25Number;;
    label: "Number of Video Quartile 25% views"
    group_label: "adwords-video"
    description: "The number of times the video was played to 25% of its length."
  }

  dimension: adwords_videoPlayedTo50Number {
    type:number
    hidden:yes
    sql: ${TABLE}.adwords_videoPlayedTo50Number;;
    label: "Number of Video Quartile 50% views"
    group_label: "adwords-video"
    description: "The number of times the video was played to 50% of its length."
  }

  dimension: adwords_videoPlayedTo75Number {
    type:number
    hidden:yes
    sql: ${TABLE}.adwords_videoPlayedTo75Number;;
    label: "Number of Video Quartile 75% views"
    group_label: "adwords-video"
    description: "The number of times the video was played to 75% of its length."
  }

  dimension: adwords_phoneCalls {
    type:number
    hidden:yes
    sql: ${TABLE}.adwords_phoneCalls;;
    label: "Phone calls"
    group_label: "adwords-calldetails"
    description: "Number of offline phone calls."
  }

  dimension: adwords_phoneImpressions {
    type:number
    hidden:yes
    sql: ${TABLE}.adwords_phoneImpressions;;
    label: "Phone impressions"
    group_label: "adwords-calldetails"
    description: "Number of offline phone impressions."
  }

  dimension: adwords_totalConvValue {
    type:number
    hidden:yes
    sql: ${TABLE}.adwords_totalConvValue;;
    label: "Total conv. value"
    group_label: "adwords-conv"
    description: "The sum of conversion values for all conversions."
  }

  dimension: adwords_viewThroughConv {
    type:number
    hidden:yes
    sql: ${TABLE}.adwords_viewThroughConv;;
    label: "View-through conv."
    group_label: "adwords-conv"
    description: "The total number of view-through conversions. These happen when a customer sees an image or rich media ad, then later completes a conversion on your site without interacting with (e.g. clicking on) another ad."
  }

  dimension: adwords_views {
    type:number
    hidden:yes
    sql: ${TABLE}.adwords_views;;
    label: "Views"
    group_label: "adwords-performance"
    description: "The number of times your video ads were viewed."
  }

  dimension: bing_Assists {
    type:number
    hidden:yes
    sql: ${TABLE}.bing_Assists;;
    label: "Assists"
    group_label: "bing-conversions"
    description: "The number of conversions from other ads within the same account that were preceded by one or more clicks from this ad. An ad is considered to have assisted the conversion if it was clicked before the most recently clicked ad that was credited with the conversion. Additionally, the click corresponding to the assist must occur within the conversion period of the goal."
  }

  dimension: bing_ClickCalls {
    type:number
    hidden:yes
    sql: ${TABLE}.bing_ClickCalls;;
    label: "Click calls"
    group_label: "bing-calldetails"
    description: "The number of clicks on a Call Extension phone number. This includes clicks on call forwarding (metered) phone numbers only."
  }

  dimension: bing_clicks {
    type:number
    hidden:yes
    sql: ${TABLE}.bing_clicks;;
    label: "Clicks"
    group_label: "bing-performance"
    description: "Number of Bing clicks"
  }

  dimension: bing_Conversions {
    type:number
    hidden:yes
    sql: ${TABLE}.bing_Conversions;;
    label: "Conversions"
    group_label: "bing-conversions"
    description: "A conversion is a click that results in a sale or another measure of success. Conversions are measured by adding a small bit of code to your website pages so that a visitor’s progress through your site can be tracked."
  }

  dimension: bing_cost {
    type:number
    hidden:yes
    sql: ${TABLE}.bing_cost;;
    label: "Cost"
    group_label: "bing-performance"
    description: "Amount spent in Bing"
  }

  dimension: bing_impressions {
    type:number
    hidden:yes
    sql: ${TABLE}.bing_impressions;;
    label: "Impressions"
    group_label: "bing-performance"
    description: "Number of Bing impressions"
  }

  dimension: bing_ManualCalls {
    type:number
    hidden:yes
    sql: ${TABLE}.bing_ManualCalls;;
    label: "Manual calls"
    group_label: "bing-calldetails"
    description: "Calls made to a call extension number by dialing the number, rather than clicking the number."
  }

  dimension: bing_derived_PhoneCalls {
    type:number
    hidden:yes
    sql: ${TABLE}.bing_derived_PhoneCalls;;
    label: "Phone calls"
    group_label: "bing-calldetails"
    description: "The number of calls made to the call forwarding number you created in your call extension."
  }

  dimension: bing_PhoneImpressions {
    type:number
    hidden:yes
    sql: ${TABLE}.bing_PhoneImpressions;;
    label: "Phone impressions"
    group_label: "bing-calldetails"
    description: "Phone impressions are the number of times that your call forwarding number was shown on all devices."
  }

  dimension: bing_Revenue {
    type:number
    hidden:yes
    sql: ${TABLE}.bing_Revenue;;
    label: "Revenue"
    group_label: "bing-conversions"
    description: "A value that you can collect using universal event tracking. Based on conversions, revenue can be a constant value per conversion or a variable amount, such as a sales total."
  }

  dimension: bing_TotalVisits {
    type:number
    hidden:yes
    sql: ${TABLE}.bing_TotalVisits;;
    label: "Total visits"
    group_label: "bing-performance"
    description: "The total number of times customers visited your site."
  }

  dimension: criteo_click {
    type:number
    hidden:yes
    sql: ${TABLE}.criteo_click;;
    label: "Clicks"
    group_label: "criteo"
    description: "Number of times that your Criteo ads have been clicked"
  }

  dimension: criteo_cost {
    type:number
    hidden:yes
    sql: ${TABLE}.criteo_cost;;
    label: "Criteo Cost"
    group_label: "criteo"
    description: "Cost"
  }

  dimension: criteo_impressions {
    type:number
    hidden:yes
    sql: ${TABLE}.criteo_impressions;;
    label: "Impressions"
    group_label: "criteo"
    description: ""
  }

  dimension: criteo_orderValue {
    type:number
    hidden:yes
    sql: ${TABLE}.criteo_orderValue;;
    label: "Order Value"
    group_label: "criteo"
    description: "Criteo Order Value"
  }

  dimension: criteo_orderValuePostView {
    type:number
    hidden:yes
    sql: ${TABLE}.criteo_orderValuePostView;;
    label: "Order Value Post-View"
    group_label: "criteo"
    description: "The Criteo Post-View Order Value"
  }

  dimension: criteo_sales {
    type:number
    hidden:yes
    sql: ${TABLE}.criteo_sales;;
    label: "Sales"
    group_label: "criteo"
    description: "Number of purchases made on your website by users who clicked a Criteo ad. Sales are tracked within 30 days after a user clicked the ad."
  }

  dimension: criteo_salesPostView {
    type:number
    hidden:yes
    sql: ${TABLE}.criteo_salesPostView;;
    label: "Sales Post View (PV)"
    group_label: "criteo"
    description: "All sales that occurred on your website within 24 hours after a user sees a Criteo ad of your campaign. Post-view sales do not include sales from users who clicked an ad, which are counted as sales"
  }

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

  dimension: googleanalytics_ga_bounces {
    type:number
    hidden:yes
    sql: ${TABLE}.googleanalytics_ga_bounces;;
    label: "Bounces"
    group_label: "ga-basic"
    description: "The total number of single page (or single interaction hit) sessions for the property."
  }

  dimension: googleanalytics_ga_goalCompletionsAll {
    type:number
    hidden:yes
    sql: ${TABLE}.googleanalytics_ga_goalCompletionsAll;;
    label: "Goal completions"
    group_label: "ga-goal-completions"
    description: "Total number of Google Analytics goal completions"
  }

  dimension: googleanalytics_ga_goalValueAll {
    type:number
    hidden:yes
    sql: ${TABLE}.googleanalytics_ga_goalValueAll;;
    label: "Goal value"
    group_label: "ga-goal-conversion-values"
    description: "Total value from Google Analytics goal completions"
  }

  dimension: googleanalytics_ga_newUsers {
    type:number
    hidden:yes
    sql: ${TABLE}.googleanalytics_ga_newUsers;;
    label: "New users"
    group_label: "ga-basic"
    description: "Number of new users"
  }

  dimension: googleanalytics_ga_pageviews {
    type:number
    hidden:yes
    sql: ${TABLE}.googleanalytics_ga_pageviews;;
    label: "Pageviews"
    group_label: "ga-basic"
    description: "Google Analytics Pageviews"
  }

  dimension: googleanalytics_ga_itemRevenue {
    type:number
    hidden:yes
    sql: ${TABLE}.googleanalytics_ga_itemRevenue;;
    label: "Product Revenue"
    group_label: "ga-ecommerce"
    description: "The total revenue from purchased product items."
  }

  dimension: googleanalytics_ga_itemQuantity {
    type:number
    hidden:yes
    sql: ${TABLE}.googleanalytics_ga_itemQuantity;;
    label: "Quantity"
    group_label: "ga-ecommerce"
    description: "Total number of items purchased."
  }

  dimension: googleanalytics_ga_quantityAddedToCart {
    type:number
    hidden:yes
    sql: ${TABLE}.googleanalytics_ga_quantityAddedToCart;;
    label: "Quantity added to cart"
    group_label: "ga-ecommerce"
    description: "Number of product units added to the shopping cart (Enhanced E-commerce)"
  }

  dimension: googleanalytics_ga_quantityCheckedOut {
    type:number
    hidden:yes
    sql: ${TABLE}.googleanalytics_ga_quantityCheckedOut;;
    label: "Quantity checked out"
    group_label: "ga-ecommerce"
    description: "Number of product units included in check out (Enhanced E-commerce)"
  }

  dimension: googleanalytics_ga_quantityRefunded {
    type:number
    hidden:yes
    sql: ${TABLE}.googleanalytics_ga_quantityRefunded;;
    label: "Quantity refunded"
    group_label: "ga-ecommerce"
    description: "Number of product units refunded (Enhanced E-commerce)"
  }

  dimension: googleanalytics_ga_quantityRemovedFromCart {
    type:number
    hidden:yes
    sql: ${TABLE}.googleanalytics_ga_quantityRemovedFromCart;;
    label: "Quantity removed from cart"
    group_label: "ga-ecommerce"
    description: "Number of product units removed from cart (Enhanced E-commerce)"
  }

  dimension: googleanalytics_ga_totalRefunds {
    type:number
    hidden:yes
    sql: ${TABLE}.googleanalytics_ga_totalRefunds;;
    label: "Refunds"
    group_label: "ga-ecommerce"
    description: "Number of refunds that have been issued (Enhanced E-commerce)"
  }

  dimension: googleanalytics_ga_sessionDuration {
    type:number
    hidden:yes
    sql: ${TABLE}.googleanalytics_ga_sessionDuration;;
    label: "Session duration"
    group_label: "ga-basic"
    description: "Total duration (in seconds) of users' sessions"
  }

  dimension: googleanalytics_ga_sessions {
    type:number
    hidden:yes
    sql: ${TABLE}.googleanalytics_ga_sessions;;
    label: "Sessions"
    group_label: "ga-basic"
    description: "Number of Google Analytics sessions"
  }

  dimension: googleanalytics_ga_transactionShipping {
    type:number
    hidden:yes
    sql: ${TABLE}.googleanalytics_ga_transactionShipping;;
    label: "Shipping"
    group_label: "ga-ecommerce"
    description: "Total cost of shipping"
  }

  dimension: googleanalytics_ga_transactionTax {
    type:number
    hidden:yes
    sql: ${TABLE}.googleanalytics_ga_transactionTax;;
    label: "Tax"
    group_label: "ga-ecommerce"
    description: "Total amount of tax"
  }

  dimension: googleanalytics_mcf_assistedValue_mcf_conversionType__Transaction {
    type:number
    hidden:yes
    sql: ${TABLE}.googleanalytics_mcf_assistedValue_mcf_conversionType__Transaction;;
    label: "Transaction assist revenue"
    group_label: "ga-ecommerce"
    description: "Revenue for interactions leading up to a transaction, excluding the final interaction."
  }

  dimension: googleanalytics_mcf_assistedConversions_mcf_conversionType__Transaction {
    type:number
    hidden:yes
    sql: ${TABLE}.googleanalytics_mcf_assistedConversions_mcf_conversionType__Transaction;;
    label: "Transaction assists"
    group_label: "ga-ecommerce"
    description: "Google Analytics ecommerce transactions, where the Channel was not the last interaction"
  }

  dimension: googleanalytics_ga_transactionRevenue {
    type:number
    hidden:yes
    sql: ${TABLE}.googleanalytics_ga_transactionRevenue;;
    label: "Transaction revenue"
    group_label: "ga-ecommerce"
    description: "Total revenue from Transactions"
  }

  dimension: googleanalytics_mcf_firstInteractionValue_mcf_conversionType__Transaction {
    type:number
    hidden:yes
    sql: ${TABLE}.googleanalytics_mcf_firstInteractionValue_mcf_conversionType__Transaction;;
    label: "Transaction revenue (first click)"
    group_label: "ga-ecommerce"
    description: "Revenue for the first interactions in chains of interactions leading up to a transaction."
  }

  dimension: googleanalytics_ga_transactions {
    type:number
    hidden:yes
    sql: ${TABLE}.googleanalytics_ga_transactions;;
    label: "Transactions"
    group_label: "ga-ecommerce"
    description: "Number of Google Analytics ecommerce transactions"
  }

  dimension: googleanalytics_mcf_firstInteractionConversions_mcf_conversionType__Transaction {
    type:number
    hidden:yes
    sql: ${TABLE}.googleanalytics_mcf_firstInteractionConversions_mcf_conversionType__Transaction;;
    label: "Transactions (first click)"
    group_label: "ga-ecommerce"
    description: "The number of first interactions in chains of interactions leading up to a transaction."
  }

  dimension: googleanalytics_ga_uniquePurchases {
    type:number
    hidden:yes
    sql: ${TABLE}.googleanalytics_ga_uniquePurchases;;
    label: "Unique Purchases"
    group_label: "ga-ecommerce"
    description: "The number of product sets purchased. For example, if users purchase 2 frisbees and 5 tennis balls from your site, 2 unique products have been purchased."
  }

  dimension: hasoffers_conversions {
    type:number
    hidden:yes
    sql: ${TABLE}.hasoffers_conversions;;
    label: "Conversions"
    group_label: "hasoffers"
    description: "Number of HasOffers conversions"
  }

  dimension: hasoffers_revenue {
    type:number
    hidden:yes
    sql: ${TABLE}.hasoffers_revenue;;
    label: "Revenue"
    group_label: "hasoffers"
    description: "Revenue generated from HasOffers traffic"
  }

  dimension: perfectaudience_clicks {
    type:number
    hidden:yes
    sql: ${TABLE}.perfectaudience_clicks;;
    label: "Clicks"
    group_label: "perfectaudience"
    description: ""
  }

  dimension: perfectaudience_impressions {
    type:number
    hidden:yes
    sql: ${TABLE}.perfectaudience_impressions;;
    label: "Impressions"
    group_label: "perfectaudience"
    description: ""
  }

  dimension: perfectaudience_spend {
    type:number
    hidden:yes
    sql: ${TABLE}.perfectaudience_spend;;
    label: "Spend"
    group_label: "perfectaudience"
    description: "The amount of spend"
  }

  dimension: pricerunner_clicks {
    type:number
    hidden:yes
    sql: ${TABLE}.pricerunner_clicks;;
    label: "Clicks"
    group_label: "pricerunner-metrics"
    description: "The number of clicks"
  }

  dimension: pricerunner_cost {
    type:number
    hidden:yes
    sql: ${TABLE}.pricerunner_cost;;
    label: "Cost"
    group_label: "pricerunner-metrics"
    description: "The amount of cost"
  }

  dimension: twitter_video_3s100p_views {
    type:number
    hidden:yes
    sql: ${TABLE}.twitter_video_3s100p_views;;
    label: "3s/100% views"
    group_label: "twitter-video"
    description: "Total number of views where at least 3 seconds were played while 100% in view"
  }

  dimension: twitter_app_clicks {
    type:number
    hidden:yes
    sql: ${TABLE}.twitter_app_clicks;;
    label: "App clicks"
    group_label: "twitter-engagement"
    description: "Number of app install or app open attempts"
  }

  dimension: twitter_billed_engagements {
    type:number
    hidden:yes
    sql: ${TABLE}.twitter_billed_engagements;;
    label: "Billed engagements"
    group_label: "twitter-engagement"
    description: "Total number of billed engagements"
  }

  dimension: twitter_card_engagements {
    type:number
    hidden:yes
    sql: ${TABLE}.twitter_card_engagements;;
    label: "Card engagements"
    group_label: "twitter-engagement"
    description: "Total number of card engagements"
  }

  dimension: twitter_clicks {
    type:number
    hidden:yes
    sql: ${TABLE}.twitter_clicks;;
    label: "Clicks"
    group_label: "twitter-engagement"
    description: "Total number of clicks"
  }

  dimension: twitter_conversion_custom_metric {
    type:number
    hidden:yes
    sql: ${TABLE}.twitter_conversion_custom_metric;;
    label: "Custom conversions"
    group_label: "twitter-conversions"
    description: "Number of conversions of type Custom"
  }

  dimension: twitter_conversion_custom_order_quantity {
    type:number
    hidden:yes
    sql: ${TABLE}.twitter_conversion_custom_order_quantity;;
    label: "Custom conversions order quantity"
    group_label: "twitter-conversions"
    description: "Order quantity for conversions of type Custom"
  }

  dimension: twitter_conversion_custom_sale_amount {
    type:number
    hidden:yes
    sql: ${TABLE}.twitter_conversion_custom_sale_amount;;
    label: "Custom conversions: sale amount"
    group_label: "twitter-conversions"
    description: "Sale amount for conversions of type Custom"
  }

  dimension: twitter_conversion_downloads_metric {
    type:number
    hidden:yes
    sql: ${TABLE}.twitter_conversion_downloads_metric;;
    label: "Downloads"
    group_label: "twitter-conversions"
    description: "Number of conversions of type Downloads"
  }

  dimension: twitter_conversion_downloads_order_quantity {
    type:number
    hidden:yes
    sql: ${TABLE}.twitter_conversion_downloads_order_quantity;;
    label: "Downloads order quantity"
    group_label: "twitter-conversions"
    description: "Order quantity for conversions of type Downloads"
  }

  dimension: twitter_conversion_downloads_sale_amount {
    type:number
    hidden:yes
    sql: ${TABLE}.twitter_conversion_downloads_sale_amount;;
    label: "Downloads sale amount"
    group_label: "twitter-conversions"
    description: "Sale amount for conversions of type Downloads"
  }

  dimension: twitter_engagements {
    type:number
    hidden:yes
    sql: ${TABLE}.twitter_engagements;;
    label: "Engagements"
    group_label: "twitter-engagement"
    description: "Total number of engagements"
  }

  dimension: twitter_follows {
    type:number
    hidden:yes
    sql: ${TABLE}.twitter_follows;;
    label: "Follows"
    group_label: "twitter-engagement"
    description: "Total number of follows"
  }

  dimension: twitter_likes {
    type:number
    hidden:yes
    sql: ${TABLE}.twitter_likes;;
    label: "Likes"
    group_label: "twitter-engagement"
    description: "Total number of likes"
  }

  dimension: twitter_media_views {
    type:number
    hidden:yes
    sql: ${TABLE}.twitter_media_views;;
    label: "Media views"
    group_label: "twitter-media"
    description: "Total numbers of views (autoplay and click) of media across Videos, Vines, GIFs, and Images"
  }

  dimension: twitter_conversion_purchases_metric {
    type:number
    hidden:yes
    sql: ${TABLE}.twitter_conversion_purchases_metric;;
    label: "Purchases"
    group_label: "twitter-conversions"
    description: "Number of conversions of type Purchase"
  }

  dimension: twitter_conversion_purchases_order_quantity {
    type:number
    hidden:yes
    sql: ${TABLE}.twitter_conversion_purchases_order_quantity;;
    label: "Purchases order quantity"
    group_label: "twitter-conversions"
    description: "Order quantity for conversions of type Purchase"
  }

  dimension: twitter_conversion_purchases_sale_amount {
    type:number
    hidden:yes
    sql: ${TABLE}.twitter_conversion_purchases_sale_amount;;
    label: "Purchases sale amount"
    group_label: "twitter-conversions"
    description: "Sale amount for conversions of type Purchase"
  }

  dimension: twitter_qualified_impressions {
    type:number
    hidden:yes
    sql: ${TABLE}.twitter_qualified_impressions;;
    label: "Qualified impressions"
    group_label: "twitter-engagement"
    description: "Total number of qualified impressions"
  }

  dimension: twitter_replies {
    type:number
    hidden:yes
    sql: ${TABLE}.twitter_replies;;
    label: "Replies"
    group_label: "twitter-engagement"
    description: "Total number of replies"
  }

  dimension: twitter_retweets {
    type:number
    hidden:yes
    sql: ${TABLE}.twitter_retweets;;
    label: "Retweets"
    group_label: "twitter-engagement"
    description: "Total number of retweets"
  }

  dimension: twitter_conversion_sign_ups_metric {
    type:number
    hidden:yes
    sql: ${TABLE}.twitter_conversion_sign_ups_metric;;
    label: "Sign ups"
    group_label: "twitter-conversions"
    description: "Number of conversions of type Sign up"
  }

  dimension: twitter_conversion_sign_ups_order_quantity {
    type:number
    hidden:yes
    sql: ${TABLE}.twitter_conversion_sign_ups_order_quantity;;
    label: "Sign ups order quantity"
    group_label: "twitter-conversions"
    description: "Order quantity for conversions of type Sign up"
  }

  dimension: twitter_conversion_sign_ups_sale_amount {
    type:number
    hidden:yes
    sql: ${TABLE}.twitter_conversion_sign_ups_sale_amount;;
    label: "Sign ups sale amount"
    group_label: "twitter-conversions"
    description: "Sale amount for conversions of type Sign up"
  }

  dimension: twitter_conversion_site_visits_metric {
    type:number
    hidden:yes
    sql: ${TABLE}.twitter_conversion_site_visits_metric;;
    label: "Site visits"
    group_label: "twitter-conversions"
    description: "Number of conversions of type Site visits"
  }

  dimension: twitter_conversion_site_visits_order_quantity {
    type:number
    hidden:yes
    sql: ${TABLE}.twitter_conversion_site_visits_order_quantity;;
    label: "Site visits order quantity"
    group_label: "twitter-conversions"
    description: "Order quantity for conversions of type Site visits"
  }

  dimension: twitter_conversion_site_visits_sale_amount {
    type:number
    hidden:yes
    sql: ${TABLE}.twitter_conversion_site_visits_sale_amount;;
    label: "Site visits sale amount"
    group_label: "twitter-conversions"
    description: "Sale amount for conversions of type Site visits"
  }

  dimension: twitter_cost {
    type:number
    hidden:yes
    sql: ${TABLE}.twitter_cost;;
    label: "Spend"
    group_label: "twitter-spend"
    description: ""
  }

  dimension: twitter_url_clicks {
    type:number
    hidden:yes
    sql: ${TABLE}.twitter_url_clicks;;
    label: "URL clicks"
    group_label: "twitter-engagement"
    description: "Number of clicks on linked URLs"
  }

  dimension: twitter_video_cta_clicks {
    type:number
    hidden:yes
    sql: ${TABLE}.twitter_video_cta_clicks;;
    label: "Video CTA clicks"
    group_label: "twitter-video"
    description: "Total clicks on the call to action"
  }

  dimension: twitter_video_mrc_views {
    type:number
    hidden:yes
    sql: ${TABLE}.twitter_video_mrc_views;;
    label: "Video MRC views"
    group_label: "twitter-video"
    description: "Total number of views according to Media Rating Council guidelines"
  }

  dimension: twitter_video_views_100 {
    type:number
    hidden:yes
    sql: ${TABLE}.twitter_video_views_100;;
    label: "Video played 100%"
    group_label: "twitter-video"
    description: "Total number of views where the entire video was viewed"
  }

  dimension: twitter_video_views_25 {
    type:number
    hidden:yes
    sql: ${TABLE}.twitter_video_views_25;;
    label: "Video played 25%"
    group_label: "twitter-video"
    description: "Total number of views where at least 25% of the video was viewed"
  }

  dimension: twitter_video_views_50 {
    type:number
    hidden:yes
    sql: ${TABLE}.twitter_video_views_50;;
    label: "Video played 50%"
    group_label: "twitter-video"
    description: "Total number of views where at least 50% of the video was viewed"
  }

  dimension: twitter_video_views_75 {
    type:number
    hidden:yes
    sql: ${TABLE}.twitter_video_views_75;;
    label: "Video played 75%"
    group_label: "twitter-video"
    description: "Total number of views where at least 75% of the video was viewed"
  }

  dimension: twitter_video_content_starts {
    type:number
    hidden:yes
    sql: ${TABLE}.twitter_video_content_starts;;
    label: "Video starts"
    group_label: "twitter-video"
    description: "Total number of video playback starts"
  }

  dimension: twitter_video_total_views {
    type:number
    hidden:yes
    sql: ${TABLE}.twitter_video_total_views;;
    label: "Video views"
    group_label: "twitter-video"
    description: "Total number of video views"
  }


  measure: total_common_clicks {
    type: sum
    sql: ${common_clicks} ;;
    label: "Clicks"
    group_label: "common"
    description: "Number of ad clicks"
  }

  measure: total_common_cost {
    type: sum
    sql: ${common_cost} ;;
    label: "Cost"
    group_label: "common"
    description: "Amount spent"
  }

  measure: total_common_impressions {
    type: sum
    sql: ${common_impressions} ;;
    label: "Impressions"
    group_label: "common"
    description: "Number of ad impressions"
  }

  measure: total_adroll_adjusted_ctc {
    type: sum
    sql: ${adroll_adjusted_ctc} ;;
    label: "Adjusted Click-Through Conversions"
    group_label: "adroll"
    description: "Number of AdRoll adjusted click-through conversions"
  }

  measure: total_adroll_adjusted_total_conversions {
    type: sum
    sql: ${adroll_adjusted_total_conversions} ;;
    label: "Adjusted Total Conversions"
    group_label: "adroll"
    description: "Number of AdRoll adjusted total conversions (click-through and view-through)"
  }

  measure: total_adroll_adjusted_vtc {
    type: sum
    sql: ${adroll_adjusted_vtc} ;;
    label: "Adjusted View-Through Conversions"
    group_label: "adroll"
    description: "Number of AdRoll adjusted view-through conversions"
  }

  measure: total_adroll_attributed_click_through_rev {
    type: sum
    sql: ${adroll_attributed_click_through_rev} ;;
    label: "Attributed Click-Through Revenue"
    group_label: "adroll"
    description: "The revenue attributed to an ad with a click-through conversion as reported by AdRoll"
  }

  measure: total_adroll_attributed_rev {
    type: sum
    sql: ${adroll_attributed_rev} ;;
    label: "Attributed Revenue"
    group_label: "adroll"
    description: "The revenue attributed to an ad with a conversion (click-through or view-through) as reported by AdRoll"
  }

  measure: total_adroll_attributed_view_through_rev {
    type: sum
    sql: ${adroll_attributed_view_through_rev} ;;
    label: "Attributed View-Through Revenue"
    group_label: "adroll"
    description: "The revenue attributed to an ad with a view-through conversion as reported by AdRoll"
  }

  measure: total_adroll_click_through_conversions {
    type: sum
    sql: ${adroll_click_through_conversions} ;;
    label: "Click-Through Conversions"
    group_label: "adroll"
    description: "Number of AdRoll click-through conversions"
  }

  measure: total_adroll_clicks {
    type: sum
    sql: ${adroll_clicks} ;;
    label: "Clicks"
    group_label: "adroll"
    description: "Number of AdRoll clicks"
  }

  measure: total_adroll_total_conversions {
    type: sum
    sql: ${adroll_total_conversions} ;;
    label: "Conversions"
    group_label: "adroll"
    description: "Number of AdRoll total conversions (click-through and view-through)"
  }

  measure: total_adroll_cost {
    type: sum
    sql: ${adroll_cost} ;;
    label: "Cost"
    group_label: "adroll"
    description: "Amount spent in AdRoll"
  }

  measure: total_adroll_impressions {
    type: sum
    sql: ${adroll_impressions} ;;
    label: "Impressions"
    group_label: "adroll"
    description: "Number of AdRoll impressions"
  }

  measure: total_adroll_view_through_conversions {
    type: sum
    sql: ${adroll_view_through_conversions} ;;
    label: "View-Through Conversions"
    group_label: "adroll"
    description: "Number of AdRoll view-through conversions"
  }

  measure: total_adwords_activeViewViewableImpressions {
    type: sum
    sql: ${adwords_activeViewViewableImpressions} ;;
    label: "Active View Impressions"
    group_label: "adwords-performanceActiveView"
    description: "How often your ad has become viewable on a Display Network site"
  }

  measure: total_adwords_activeViewMeasurableCost {
    type: sum
    sql: ${adwords_activeViewMeasurableCost} ;;
    label: "Active View Measurable Cost"
    group_label: "adwords-performanceActiveView"
    description: "The cost of the impressions you received that were measurable by Active View"
  }

  measure: total_adwords_activeViewMeasurableImpr {
    type: sum
    sql: ${adwords_activeViewMeasurableImpr} ;;
    label: "Active View Measurable Impressions"
    group_label: "adwords-performanceActiveView"
    description: "The number of times your ads are appearing on placements in positions where they can be seen"
  }

  measure: total_adwords_allConv {
    type: sum
    sql: ${adwords_allConv} ;;
    label: "All conv."
    group_label: "adwords-conv"
    description: "Best estimate of the total number of conversions that AdWords drives. Includes website, cross-device, and phone call conversions."
  }

  measure: total_adwords_allConvValue {
    type: sum
    sql: ${adwords_allConvValue} ;;
    label: "All conv. value"
    group_label: "adwords-conv"
    description: "The total value of all of your conversions, including those that are estimated."
  }

  measure: total_adwords_clickAssistedConv {
    type: sum
    sql: ${adwords_clickAssistedConv} ;;
    label: "Click Assisted Conv."
    group_label: "adwords-conv"
    description: "The total number of conversions for which this keyword, ad, ad group, or campaign contributed one or more assist clicks."
  }

  measure: total_adwords_clickAssistedConvValue {
    type: sum
    sql: ${adwords_clickAssistedConvValue} ;;
    label: "Click Assisted Conv. Value"
    group_label: "adwords-conv"
    description: "The total value of all conversions for which this keyword, ad, ad group, or campaign triggered assist clicks."
  }

  measure: total_adwords_clicks {
    type: sum
    sql: ${adwords_clicks} ;;
    label: "Clicks"
    group_label: "adwords-performance"
    description: "Number of AdWords clicks"
  }

  measure: total_adwords_conversions {
    type: sum
    sql: ${adwords_conversions} ;;
    label: "Conversions"
    group_label: "adwords-conv"
    description: "The number of conversions for all conversion actions that you have opted into optimization."
  }

  measure: total_adwords_cost {
    type: sum
    sql: ${adwords_cost} ;;
    label: "Cost"
    group_label: "adwords-performance"
    description: "Amount spent in AdWords"
  }

  measure: total_adwords_engagements {
    type: sum
    sql: ${adwords_engagements} ;;
    label: "Engagements"
    group_label: "adwords-performance"
    description: "The number of engagements. An engagement occurs when a viewer expands your Lightbox ad. Also, in the future, other ad types may support engagement metrics."
  }

  measure: total_adwords_gmailClicksToWebsite {
    type: sum
    sql: ${adwords_gmailClicksToWebsite} ;;
    label: "Gmail clicks to website"
    group_label: "adwords-gmail"
    description: "The number of clicks to your landing page on the expanded state of Gmail ads."
  }

  measure: total_adwords_gmailForwards {
    type: sum
    sql: ${adwords_gmailForwards} ;;
    label: "Gmail forwards"
    group_label: "adwords-gmail"
    description: "The number of times your ad was forwarded to someone else as a message."
  }

  measure: total_adwords_gmailSaves {
    type: sum
    sql: ${adwords_gmailSaves} ;;
    label: "Gmail saves"
    group_label: "adwords-gmail"
    description: "The number of times someone has saved your Gmail ad to their inbox as a message."
  }

  measure: total_adwords_imprAssistedConv {
    type: sum
    sql: ${adwords_imprAssistedConv} ;;
    label: "Impr. Assisted Conv."
    group_label: "adwords-conv"
    description: "Total number of conversions for which this object triggered assist impressions prior to the last click."
  }

  measure: total_adwords_imprAssistedConvValue {
    type: sum
    sql: ${adwords_imprAssistedConvValue} ;;
    label: "Impr. Assisted Conv. Value"
    group_label: "adwords-conv"
    description: "Total value of all conversions for which this object triggered assist impressions."
  }

  measure: total_adwords_impressions {
    type: sum
    sql: ${adwords_impressions} ;;
    label: "Impressions"
    group_label: "adwords-performance"
    description: "Number of AdWords impressions"
  }

  measure: total_adwords_interactions {
    type: sum
    sql: ${adwords_interactions} ;;
    label: "Interactions"
    group_label: "adwords-performance"
    description: "An interaction is the main user action associated with an ad format—clicks for text and shopping ads, views for video ads, and so on."
  }

  measure: total_adwords_invalidClicks {
    type: sum
    sql: ${adwords_invalidClicks} ;;
    label: "Invalid clicks"
    group_label: "adwords-performance"
    description: "Number of clicks Google considers illegitimate and doesn't charge you for."
  }

  measure: total_adwords_videoPlayedTo100Number {
    type: sum
    sql: ${adwords_videoPlayedTo100Number} ;;
    label: "Number of Video Quartile 100% views"
    group_label: "adwords-video"
    description: "The number of times the video was played to its full length."
  }

  measure: total_adwords_videoPlayedTo25Number {
    type: sum
    sql: ${adwords_videoPlayedTo25Number} ;;
    label: "Number of Video Quartile 25% views"
    group_label: "adwords-video"
    description: "The number of times the video was played to 25% of its length."
  }

  measure: total_adwords_videoPlayedTo50Number {
    type: sum
    sql: ${adwords_videoPlayedTo50Number} ;;
    label: "Number of Video Quartile 50% views"
    group_label: "adwords-video"
    description: "The number of times the video was played to 50% of its length."
  }

  measure: total_adwords_videoPlayedTo75Number {
    type: sum
    sql: ${adwords_videoPlayedTo75Number} ;;
    label: "Number of Video Quartile 75% views"
    group_label: "adwords-video"
    description: "The number of times the video was played to 75% of its length."
  }

  measure: total_adwords_phoneCalls {
    type: sum
    sql: ${adwords_phoneCalls} ;;
    label: "Phone calls"
    group_label: "adwords-calldetails"
    description: "Number of offline phone calls."
  }

  measure: total_adwords_phoneImpressions {
    type: sum
    sql: ${adwords_phoneImpressions} ;;
    label: "Phone impressions"
    group_label: "adwords-calldetails"
    description: "Number of offline phone impressions."
  }

  measure: total_adwords_totalConvValue {
    type: sum
    sql: ${adwords_totalConvValue} ;;
    label: "Total conv. value"
    group_label: "adwords-conv"
    description: "The sum of conversion values for all conversions."
  }

  measure: total_adwords_viewThroughConv {
    type: sum
    sql: ${adwords_viewThroughConv} ;;
    label: "View-through conv."
    group_label: "adwords-conv"
    description: "The total number of view-through conversions. These happen when a customer sees an image or rich media ad, then later completes a conversion on your site without interacting with (e.g. clicking on) another ad."
  }

  measure: total_adwords_views {
    type: sum
    sql: ${adwords_views} ;;
    label: "Views"
    group_label: "adwords-performance"
    description: "The number of times your video ads were viewed."
  }

  measure: total_bing_Assists {
    type: sum
    sql: ${bing_Assists} ;;
    label: "Assists"
    group_label: "bing-conversions"
    description: "The number of conversions from other ads within the same account that were preceded by one or more clicks from this ad. An ad is considered to have assisted the conversion if it was clicked before the most recently clicked ad that was credited with the conversion. Additionally, the click corresponding to the assist must occur within the conversion period of the goal."
  }

  measure: total_bing_ClickCalls {
    type: sum
    sql: ${bing_ClickCalls} ;;
    label: "Click calls"
    group_label: "bing-calldetails"
    description: "The number of clicks on a Call Extension phone number. This includes clicks on call forwarding (metered) phone numbers only."
  }

  measure: total_bing_clicks {
    type: sum
    sql: ${bing_clicks} ;;
    label: "Clicks"
    group_label: "bing-performance"
    description: "Number of Bing clicks"
  }

  measure: total_bing_Conversions {
    type: sum
    sql: ${bing_Conversions} ;;
    label: "Conversions"
    group_label: "bing-conversions"
    description: "A conversion is a click that results in a sale or another measure of success. Conversions are measured by adding a small bit of code to your website pages so that a visitor’s progress through your site can be tracked."
  }

  measure: total_bing_cost {
    type: sum
    sql: ${bing_cost} ;;
    label: "Cost"
    group_label: "bing-performance"
    description: "Amount spent in Bing"
  }

  measure: total_bing_impressions {
    type: sum
    sql: ${bing_impressions} ;;
    label: "Impressions"
    group_label: "bing-performance"
    description: "Number of Bing impressions"
  }

  measure: total_bing_ManualCalls {
    type: sum
    sql: ${bing_ManualCalls} ;;
    label: "Manual calls"
    group_label: "bing-calldetails"
    description: "Calls made to a call extension number by dialing the number, rather than clicking the number."
  }

  measure: total_bing_derived_PhoneCalls {
    type: sum
    sql: ${bing_derived_PhoneCalls} ;;
    label: "Phone calls"
    group_label: "bing-calldetails"
    description: "The number of calls made to the call forwarding number you created in your call extension."
  }

  measure: total_bing_PhoneImpressions {
    type: sum
    sql: ${bing_PhoneImpressions} ;;
    label: "Phone impressions"
    group_label: "bing-calldetails"
    description: "Phone impressions are the number of times that your call forwarding number was shown on all devices."
  }

  measure: total_bing_Revenue {
    type: sum
    sql: ${bing_Revenue} ;;
    label: "Revenue"
    group_label: "bing-conversions"
    description: "A value that you can collect using universal event tracking. Based on conversions, revenue can be a constant value per conversion or a variable amount, such as a sales total."
  }

  measure: total_bing_TotalVisits {
    type: sum
    sql: ${bing_TotalVisits} ;;
    label: "Total visits"
    group_label: "bing-performance"
    description: "The total number of times customers visited your site."
  }

  measure: total_criteo_click {
    type: sum
    sql: ${criteo_click} ;;
    label: "Clicks"
    group_label: "criteo"
    description: "Number of times that your Criteo ads have been clicked"
  }

  measure: total_criteo_cost {
    type: sum
    sql: ${criteo_cost} ;;
    label: "Criteo Cost"
    group_label: "criteo"
    description: "Cost"
  }

  measure: total_criteo_impressions {
    type: sum
    sql: ${criteo_impressions} ;;
    label: "Impressions"
    group_label: "criteo"
    description: ""
  }

  measure: total_criteo_orderValue {
    type: sum
    sql: ${criteo_orderValue} ;;
    label: "Order Value"
    group_label: "criteo"
    description: "Criteo Order Value"
  }

  measure: total_criteo_orderValuePostView {
    type: sum
    sql: ${criteo_orderValuePostView} ;;
    label: "Order Value Post-View"
    group_label: "criteo"
    description: "The Criteo Post-View Order Value"
  }

  measure: total_criteo_sales {
    type: sum
    sql: ${criteo_sales} ;;
    label: "Sales"
    group_label: "criteo"
    description: "Number of purchases made on your website by users who clicked a Criteo ad. Sales are tracked within 30 days after a user clicked the ad."
  }

  measure: total_criteo_salesPostView {
    type: sum
    sql: ${criteo_salesPostView} ;;
    label: "Sales Post View (PV)"
    group_label: "criteo"
    description: "All sales that occurred on your website within 24 hours after a user sees a Criteo ad of your campaign. Post-view sales do not include sales from users who clicked an ad, which are counted as sales"
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

  measure: total_googleanalytics_ga_bounces {
    type: sum
    sql: ${googleanalytics_ga_bounces} ;;
    label: "Bounces"
    group_label: "ga-basic"
    description: "The total number of single page (or single interaction hit) sessions for the property."
  }

  measure: total_googleanalytics_ga_goalCompletionsAll {
    type: sum
    sql: ${googleanalytics_ga_goalCompletionsAll} ;;
    label: "Goal completions"
    group_label: "ga-goal-completions"
    description: "Total number of Google Analytics goal completions"
  }

  measure: total_googleanalytics_ga_goalValueAll {
    type: sum
    sql: ${googleanalytics_ga_goalValueAll} ;;
    label: "Goal value"
    group_label: "ga-goal-conversion-values"
    description: "Total value from Google Analytics goal completions"
  }

  measure: total_googleanalytics_ga_newUsers {
    type: sum
    sql: ${googleanalytics_ga_newUsers} ;;
    label: "New users"
    group_label: "ga-basic"
    description: "Number of new users"
  }

  measure: total_googleanalytics_ga_pageviews {
    type: sum
    sql: ${googleanalytics_ga_pageviews} ;;
    label: "Pageviews"
    group_label: "ga-basic"
    description: "Google Analytics Pageviews"
  }

  measure: total_googleanalytics_ga_itemRevenue {
    type: sum
    sql: ${googleanalytics_ga_itemRevenue} ;;
    label: "Product Revenue"
    group_label: "ga-ecommerce"
    description: "The total revenue from purchased product items."
  }

  measure: total_googleanalytics_ga_itemQuantity {
    type: sum
    sql: ${googleanalytics_ga_itemQuantity} ;;
    label: "Quantity"
    group_label: "ga-ecommerce"
    description: "Total number of items purchased."
  }

  measure: total_googleanalytics_ga_quantityAddedToCart {
    type: sum
    sql: ${googleanalytics_ga_quantityAddedToCart} ;;
    label: "Quantity added to cart"
    group_label: "ga-ecommerce"
    description: "Number of product units added to the shopping cart (Enhanced E-commerce)"
  }

  measure: total_googleanalytics_ga_quantityCheckedOut {
    type: sum
    sql: ${googleanalytics_ga_quantityCheckedOut} ;;
    label: "Quantity checked out"
    group_label: "ga-ecommerce"
    description: "Number of product units included in check out (Enhanced E-commerce)"
  }

  measure: total_googleanalytics_ga_quantityRefunded {
    type: sum
    sql: ${googleanalytics_ga_quantityRefunded} ;;
    label: "Quantity refunded"
    group_label: "ga-ecommerce"
    description: "Number of product units refunded (Enhanced E-commerce)"
  }

  measure: total_googleanalytics_ga_quantityRemovedFromCart {
    type: sum
    sql: ${googleanalytics_ga_quantityRemovedFromCart} ;;
    label: "Quantity removed from cart"
    group_label: "ga-ecommerce"
    description: "Number of product units removed from cart (Enhanced E-commerce)"
  }

  measure: total_googleanalytics_ga_totalRefunds {
    type: sum
    sql: ${googleanalytics_ga_totalRefunds} ;;
    label: "Refunds"
    group_label: "ga-ecommerce"
    description: "Number of refunds that have been issued (Enhanced E-commerce)"
  }

  measure: total_googleanalytics_ga_sessionDuration {
    type: sum
    sql: ${googleanalytics_ga_sessionDuration} ;;
    label: "Session duration"
    group_label: "ga-basic"
    description: "Total duration (in seconds) of users' sessions"
  }

  measure: total_googleanalytics_ga_sessions {
    type: sum
    sql: ${googleanalytics_ga_sessions} ;;
    label: "Sessions"
    group_label: "ga-basic"
    description: "Number of Google Analytics sessions"
  }

  measure: total_googleanalytics_ga_transactionShipping {
    type: sum
    sql: ${googleanalytics_ga_transactionShipping} ;;
    label: "Shipping"
    group_label: "ga-ecommerce"
    description: "Total cost of shipping"
  }

  measure: total_googleanalytics_ga_transactionTax {
    type: sum
    sql: ${googleanalytics_ga_transactionTax} ;;
    label: "Tax"
    group_label: "ga-ecommerce"
    description: "Total amount of tax"
  }

  measure: total_googleanalytics_mcf_assistedValue_mcf_conversionType__Transaction {
    type: sum
    sql: ${googleanalytics_mcf_assistedValue_mcf_conversionType__Transaction} ;;
    label: "Transaction assist revenue"
    group_label: "ga-ecommerce"
    description: "Revenue for interactions leading up to a transaction, excluding the final interaction."
  }

  measure: total_googleanalytics_mcf_assistedConversions_mcf_conversionType__Transaction {
    type: sum
    sql: ${googleanalytics_mcf_assistedConversions_mcf_conversionType__Transaction} ;;
    label: "Transaction assists"
    group_label: "ga-ecommerce"
    description: "Google Analytics ecommerce transactions, where the Channel was not the last interaction"
  }

  measure: total_googleanalytics_ga_transactionRevenue {
    type: sum
    sql: ${googleanalytics_ga_transactionRevenue} ;;
    label: "Transaction revenue"
    group_label: "ga-ecommerce"
    description: "Total revenue from Transactions"
  }

  measure: total_googleanalytics_mcf_firstInteractionValue_mcf_conversionType__Transaction {
    type: sum
    sql: ${googleanalytics_mcf_firstInteractionValue_mcf_conversionType__Transaction} ;;
    label: "Transaction revenue (first click)"
    group_label: "ga-ecommerce"
    description: "Revenue for the first interactions in chains of interactions leading up to a transaction."
  }

  measure: total_googleanalytics_ga_transactions {
    type: sum
    sql: ${googleanalytics_ga_transactions} ;;
    label: "Transactions"
    group_label: "ga-ecommerce"
    description: "Number of Google Analytics ecommerce transactions"
  }

  measure: total_googleanalytics_mcf_firstInteractionConversions_mcf_conversionType__Transaction {
    type: sum
    sql: ${googleanalytics_mcf_firstInteractionConversions_mcf_conversionType__Transaction} ;;
    label: "Transactions (first click)"
    group_label: "ga-ecommerce"
    description: "The number of first interactions in chains of interactions leading up to a transaction."
  }

  measure: total_googleanalytics_ga_uniquePurchases {
    type: sum
    sql: ${googleanalytics_ga_uniquePurchases} ;;
    label: "Unique Purchases"
    group_label: "ga-ecommerce"
    description: "The number of product sets purchased. For example, if users purchase 2 frisbees and 5 tennis balls from your site, 2 unique products have been purchased."
  }

  measure: total_hasoffers_conversions {
    type: sum
    sql: ${hasoffers_conversions} ;;
    label: "Conversions"
    group_label: "hasoffers"
    description: "Number of HasOffers conversions"
  }

  measure: total_hasoffers_revenue {
    type: sum
    sql: ${hasoffers_revenue} ;;
    label: "Revenue"
    group_label: "hasoffers"
    description: "Revenue generated from HasOffers traffic"
  }

  measure: total_perfectaudience_clicks {
    type: sum
    sql: ${perfectaudience_clicks} ;;
    label: "Clicks"
    group_label: "perfectaudience"
    description: ""
  }

  measure: total_perfectaudience_impressions {
    type: sum
    sql: ${perfectaudience_impressions} ;;
    label: "Impressions"
    group_label: "perfectaudience"
    description: ""
  }

  measure: total_perfectaudience_spend {
    type: sum
    sql: ${perfectaudience_spend} ;;
    label: "Spend"
    group_label: "perfectaudience"
    description: "The amount of spend"
  }

  measure: total_pricerunner_clicks {
    type: sum
    sql: ${pricerunner_clicks} ;;
    label: "Clicks"
    group_label: "pricerunner-metrics"
    description: "The number of clicks"
  }

  measure: total_pricerunner_cost {
    type: sum
    sql: ${pricerunner_cost} ;;
    label: "Cost"
    group_label: "pricerunner-metrics"
    description: "The amount of cost"
  }

  measure: total_twitter_video_3s100p_views {
    type: sum
    sql: ${twitter_video_3s100p_views} ;;
    label: "3s/100% views"
    group_label: "twitter-video"
    description: "Total number of views where at least 3 seconds were played while 100% in view"
  }

  measure: total_twitter_app_clicks {
    type: sum
    sql: ${twitter_app_clicks} ;;
    label: "App clicks"
    group_label: "twitter-engagement"
    description: "Number of app install or app open attempts"
  }

  measure: total_twitter_billed_engagements {
    type: sum
    sql: ${twitter_billed_engagements} ;;
    label: "Billed engagements"
    group_label: "twitter-engagement"
    description: "Total number of billed engagements"
  }

  measure: total_twitter_card_engagements {
    type: sum
    sql: ${twitter_card_engagements} ;;
    label: "Card engagements"
    group_label: "twitter-engagement"
    description: "Total number of card engagements"
  }

  measure: total_twitter_clicks {
    type: sum
    sql: ${twitter_clicks} ;;
    label: "Clicks"
    group_label: "twitter-engagement"
    description: "Total number of clicks"
  }

  measure: total_twitter_conversion_custom_metric {
    type: sum
    sql: ${twitter_conversion_custom_metric} ;;
    label: "Custom conversions"
    group_label: "twitter-conversions"
    description: "Number of conversions of type Custom"
  }

  measure: total_twitter_conversion_custom_order_quantity {
    type: sum
    sql: ${twitter_conversion_custom_order_quantity} ;;
    label: "Custom conversions order quantity"
    group_label: "twitter-conversions"
    description: "Order quantity for conversions of type Custom"
  }

  measure: total_twitter_conversion_custom_sale_amount {
    type: sum
    sql: ${twitter_conversion_custom_sale_amount} ;;
    label: "Custom conversions: sale amount"
    group_label: "twitter-conversions"
    description: "Sale amount for conversions of type Custom"
  }

  measure: total_twitter_conversion_downloads_metric {
    type: sum
    sql: ${twitter_conversion_downloads_metric} ;;
    label: "Downloads"
    group_label: "twitter-conversions"
    description: "Number of conversions of type Downloads"
  }

  measure: total_twitter_conversion_downloads_order_quantity {
    type: sum
    sql: ${twitter_conversion_downloads_order_quantity} ;;
    label: "Downloads order quantity"
    group_label: "twitter-conversions"
    description: "Order quantity for conversions of type Downloads"
  }

  measure: total_twitter_conversion_downloads_sale_amount {
    type: sum
    sql: ${twitter_conversion_downloads_sale_amount} ;;
    label: "Downloads sale amount"
    group_label: "twitter-conversions"
    description: "Sale amount for conversions of type Downloads"
  }

  measure: total_twitter_engagements {
    type: sum
    sql: ${twitter_engagements} ;;
    label: "Engagements"
    group_label: "twitter-engagement"
    description: "Total number of engagements"
  }

  measure: total_twitter_follows {
    type: sum
    sql: ${twitter_follows} ;;
    label: "Follows"
    group_label: "twitter-engagement"
    description: "Total number of follows"
  }

  measure: total_twitter_likes {
    type: sum
    sql: ${twitter_likes} ;;
    label: "Likes"
    group_label: "twitter-engagement"
    description: "Total number of likes"
  }

  measure: total_twitter_media_views {
    type: sum
    sql: ${twitter_media_views} ;;
    label: "Media views"
    group_label: "twitter-media"
    description: "Total numbers of views (autoplay and click) of media across Videos, Vines, GIFs, and Images"
  }

  measure: total_twitter_conversion_purchases_metric {
    type: sum
    sql: ${twitter_conversion_purchases_metric} ;;
    label: "Purchases"
    group_label: "twitter-conversions"
    description: "Number of conversions of type Purchase"
  }

  measure: total_twitter_conversion_purchases_order_quantity {
    type: sum
    sql: ${twitter_conversion_purchases_order_quantity} ;;
    label: "Purchases order quantity"
    group_label: "twitter-conversions"
    description: "Order quantity for conversions of type Purchase"
  }

  measure: total_twitter_conversion_purchases_sale_amount {
    type: sum
    sql: ${twitter_conversion_purchases_sale_amount} ;;
    label: "Purchases sale amount"
    group_label: "twitter-conversions"
    description: "Sale amount for conversions of type Purchase"
  }

  measure: total_twitter_qualified_impressions {
    type: sum
    sql: ${twitter_qualified_impressions} ;;
    label: "Qualified impressions"
    group_label: "twitter-engagement"
    description: "Total number of qualified impressions"
  }

  measure: total_twitter_replies {
    type: sum
    sql: ${twitter_replies} ;;
    label: "Replies"
    group_label: "twitter-engagement"
    description: "Total number of replies"
  }

  measure: total_twitter_retweets {
    type: sum
    sql: ${twitter_retweets} ;;
    label: "Retweets"
    group_label: "twitter-engagement"
    description: "Total number of retweets"
  }

  measure: total_twitter_conversion_sign_ups_metric {
    type: sum
    sql: ${twitter_conversion_sign_ups_metric} ;;
    label: "Sign ups"
    group_label: "twitter-conversions"
    description: "Number of conversions of type Sign up"
  }

  measure: total_twitter_conversion_sign_ups_order_quantity {
    type: sum
    sql: ${twitter_conversion_sign_ups_order_quantity} ;;
    label: "Sign ups order quantity"
    group_label: "twitter-conversions"
    description: "Order quantity for conversions of type Sign up"
  }

  measure: total_twitter_conversion_sign_ups_sale_amount {
    type: sum
    sql: ${twitter_conversion_sign_ups_sale_amount} ;;
    label: "Sign ups sale amount"
    group_label: "twitter-conversions"
    description: "Sale amount for conversions of type Sign up"
  }

  measure: total_twitter_conversion_site_visits_metric {
    type: sum
    sql: ${twitter_conversion_site_visits_metric} ;;
    label: "Site visits"
    group_label: "twitter-conversions"
    description: "Number of conversions of type Site visits"
  }

  measure: total_twitter_conversion_site_visits_order_quantity {
    type: sum
    sql: ${twitter_conversion_site_visits_order_quantity} ;;
    label: "Site visits order quantity"
    group_label: "twitter-conversions"
    description: "Order quantity for conversions of type Site visits"
  }

  measure: total_twitter_conversion_site_visits_sale_amount {
    type: sum
    sql: ${twitter_conversion_site_visits_sale_amount} ;;
    label: "Site visits sale amount"
    group_label: "twitter-conversions"
    description: "Sale amount for conversions of type Site visits"
  }

  measure: total_twitter_cost {
    type: sum
    sql: ${twitter_cost} ;;
    label: "Spend"
    group_label: "twitter-spend"
    description: ""
  }

  measure: total_twitter_url_clicks {
    type: sum
    sql: ${twitter_url_clicks} ;;
    label: "URL clicks"
    group_label: "twitter-engagement"
    description: "Number of clicks on linked URLs"
  }

  measure: total_twitter_video_cta_clicks {
    type: sum
    sql: ${twitter_video_cta_clicks} ;;
    label: "Video CTA clicks"
    group_label: "twitter-video"
    description: "Total clicks on the call to action"
  }

  measure: total_twitter_video_mrc_views {
    type: sum
    sql: ${twitter_video_mrc_views} ;;
    label: "Video MRC views"
    group_label: "twitter-video"
    description: "Total number of views according to Media Rating Council guidelines"
  }

  measure: total_twitter_video_views_100 {
    type: sum
    sql: ${twitter_video_views_100} ;;
    label: "Video played 100%"
    group_label: "twitter-video"
    description: "Total number of views where the entire video was viewed"
  }

  measure: total_twitter_video_views_25 {
    type: sum
    sql: ${twitter_video_views_25} ;;
    label: "Video played 25%"
    group_label: "twitter-video"
    description: "Total number of views where at least 25% of the video was viewed"
  }

  measure: total_twitter_video_views_50 {
    type: sum
    sql: ${twitter_video_views_50} ;;
    label: "Video played 50%"
    group_label: "twitter-video"
    description: "Total number of views where at least 50% of the video was viewed"
  }

  measure: total_twitter_video_views_75 {
    type: sum
    sql: ${twitter_video_views_75} ;;
    label: "Video played 75%"
    group_label: "twitter-video"
    description: "Total number of views where at least 75% of the video was viewed"
  }

  measure: total_twitter_video_content_starts {
    type: sum
    sql: ${twitter_video_content_starts} ;;
    label: "Video starts"
    group_label: "twitter-video"
    description: "Total number of video playback starts"
  }

  measure: total_twitter_video_total_views {
    type: sum
    sql: ${twitter_video_total_views} ;;
    label: "Video views"
    group_label: "twitter-video"
    description: "Total number of video views"
  }

# End of Funnel generated configuration
}
