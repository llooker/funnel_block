
view: marks_test_view {
  derived_table: {
    sql: select * from funnel_aggregated_all_dates
      ;;
  }


  dimension: date {
    type: string
    sql: ${date};;
    label: "Date"
    group_label: "common-date"
    description: "The date provided by the connected data source in ISO format, e.g. '2016-07-31'"
  }

  dimension: sourceType {
    type: string
    sql: ${sourceType};;
    label: "Connection type code"
    group_label: "common-connection"
    description: "The type code of a connected data source, e.g. 'googleanalytics', 'adwords' or 'facebook'."
  }

  dimension: sourceId {
    type: string
    sql: ${sourceId};;
    label: "Connection id"
    group_label: "common-connection"
    description: "The id of a connected data source. This could, for example, be the id of a Google Analytics View or a Facebook ad account."
  }

  dimension: currency {
    type: string
    sql: ${currency};;
    label: "Currency"
    group_label: "common-connection"
    description: "The currency code that the monetary data is in."
  }

  dimension: ga_campaign {
    type: string
    sql: ${ga_campaign};;
    label: "GA Campaign"
    group_label: "googleanalytics-dims"
    description: "Google Analytics dimension 'Campaign'. Sometimes referred to as utm_campaign."
  }

  dimension: ga_medium {
    type: string
    sql: ${ga_medium};;
    label: "GA Medium"
    group_label: "googleanalytics-dims"
    description: "Google Analytics dimension 'Medium'. Sometimes referred to as utm_medium."
  }

  dimension: ga_source {
    type: string
    sql: ${ga_source};;
    label: "GA Source"
    group_label: "googleanalytics-dims"
    description: "Google Analytics dimension 'Source'. Sometimes referred to as utm_source."
  }

  dimension: googleanalytics_ga_uniquePurchases {
    type:number
    hidden:yes
    sql: ${googleanalytics_ga_uniquePurchases};;
    label: "Unique Purchases"
    group_label: "ga-ecommerce"
    description: "The number of product sets purchased. For example, if users purchase 2 frisbees and 5 tennis balls from your site, 2 unique products have been purchased."
  }

  dimension: googleanalytics_mcf_assistedConversions_mcf_conversionType__Transaction {
    type:number
    hidden:yes
    sql: ${googleanalytics_mcf_assistedConversions_mcf_conversionType__Transaction};;
    label: "Transaction assists"
    group_label: "ga-ecommerce"
    description: "Google Analytics ecommerce transactions, where the Channel was not the last interaction"
  }

  dimension: googleanalytics_ga_goal5Value_161909777 {
    type:number
    hidden:yes
    sql: ${googleanalytics_ga_goal5Value_161909777};;
    label: "Leads value (Fashion Retailer DE)"
    group_label: "ga-goal-conversion-values"
    description: "Total value of Goal completions in view 'Fashion Retailer DE'."
  }

  dimension: googleanalytics_ga_quantityRefunded {
    type:number
    hidden:yes
    sql: ${googleanalytics_ga_quantityRefunded};;
    label: "Quantity refunded"
    group_label: "ga-ecommerce"
    description: "Number of product units refunded (Enhanced E-commerce)"
  }

  dimension: googleanalytics_ga_goal4Value_161909777 {
    type:number
    hidden:yes
    sql: ${googleanalytics_ga_goal4Value_161909777};;
    label: "Checkout success value (Fashion Retailer DE)"
    group_label: "ga-goal-conversion-values"
    description: "Total value of Goal completions in view 'Fashion Retailer DE'."
  }

  dimension: googleanalytics_ga_goalValueAll {
    type:number
    hidden:yes
    sql: ${googleanalytics_ga_goalValueAll};;
    label: "Goal value"
    group_label: "ga-goal-conversion-values"
    description: "Total value from Google Analytics goal completions"
  }

  dimension: googleanalytics_ga_goal3Value_161909777 {
    type:number
    hidden:yes
    sql: ${googleanalytics_ga_goal3Value_161909777};;
    label: "Add to cart value (Fashion Retailer DE)"
    group_label: "ga-goal-conversion-values"
    description: "Total value of Goal completions in view 'Fashion Retailer DE'."
  }

  dimension: googleanalytics_ga_goal2Value_161909777 {
    type:number
    hidden:yes
    sql: ${googleanalytics_ga_goal2Value_161909777};;
    label: "View product value (Fashion Retailer DE)"
    group_label: "ga-goal-conversion-values"
    description: "Total value of Goal completions in view 'Fashion Retailer DE'."
  }

  dimension: googleanalytics_ga_goal1Value_161909777 {
    type:number
    hidden:yes
    sql: ${googleanalytics_ga_goal1Value_161909777};;
    label: "Newsletter signup value (Fashion Retailer DE)"
    group_label: "ga-goal-conversion-values"
    description: "Total value of Goal completions in view 'Fashion Retailer DE'."
  }

  dimension: googleanalytics_mcf_firstInteractionConversions_mcf_conversionType__Transaction {
    type:number
    hidden:yes
    sql: ${googleanalytics_mcf_firstInteractionConversions_mcf_conversionType__Transaction};;
    label: "Transactions (first click)"
    group_label: "ga-ecommerce"
    description: "The number of first interactions in chains of interactions leading up to a transaction."
  }

  dimension: googleanalytics_ga_goal5Completions_161909777 {
    type:number
    hidden:yes
    sql: ${googleanalytics_ga_goal5Completions_161909777};;
    label: "Leads completions (Fashion Retailer DE)"
    group_label: "ga-goal-completions"
    description: "Number of Google Analytics goal completions in view 'Fashion Retailer DE'."
  }

  dimension: googleanalytics_ga_newUsers {
    type:number
    hidden:yes
    sql: ${googleanalytics_ga_newUsers};;
    label: "New users"
    group_label: "ga-basic"
    description: "Number of new users"
  }

  dimension: googleanalytics_ga_itemRevenue {
    type:number
    hidden:yes
    sql: ${googleanalytics_ga_itemRevenue};;
    label: "Product Revenue"
    group_label: "ga-ecommerce"
    description: "The total revenue from purchased product items."
  }

  dimension: googleanalytics_ga_goal4Completions_161909777 {
    type:number
    hidden:yes
    sql: ${googleanalytics_ga_goal4Completions_161909777};;
    label: "Checkout success (DE)"
    group_label: "ga-goal-completions"
    description: "Number of Google Analytics goal completions in view 'Fashion Retailer DE'."
  }

  dimension: googleanalytics_ga_sessionDuration {
    type:number
    hidden:yes
    sql: ${googleanalytics_ga_sessionDuration};;
    label: "Session duration"
    group_label: "ga-basic"
    description: "Total duration (in seconds) of users' sessions"
  }

  dimension: googleanalytics_ga_goal3Completions_161909777 {
    type:number
    hidden:yes
    sql: ${googleanalytics_ga_goal3Completions_161909777};;
    label: "Add to cart (DE)"
    group_label: "ga-goal-completions"
    description: "Number of Google Analytics goal completions in view 'Fashion Retailer DE'."
  }

  dimension: googleanalytics_ga_goal5Value_148417296 {
    type:number
    hidden:yes
    sql: ${googleanalytics_ga_goal5Value_148417296};;
    label: "Leads value (Fashion Retailer FR)"
    group_label: "ga-goal-conversion-values"
    description: "Total value of Goal completions in view 'Fashion Retailer FR'."
  }

  dimension: googleanalytics_ga_bounces {
    type:number
    hidden:yes
    sql: ${googleanalytics_ga_bounces};;
    label: "Bounces"
    group_label: "ga-basic"
    description: "The total number of single page (or single interaction hit) sessions for the property."
  }

  dimension: googleanalytics_ga_goal2Completions_161909777 {
    type:number
    hidden:yes
    sql: ${googleanalytics_ga_goal2Completions_161909777};;
    label: "Newsletter signup (DE)"
    group_label: "ga-goal-completions"
    description: "Number of Google Analytics goal completions in view 'Fashion Retailer DE'."
  }

  dimension: googleanalytics_ga_goal1Completions_161909777 {
    type:number
    hidden:yes
    sql: ${googleanalytics_ga_goal1Completions_161909777};;
    label: "Newsletter signup (DE)"
    group_label: "ga-goal-completions"
    description: "Number of Google Analytics goal completions in view 'Fashion Retailer DE'."
  }

  dimension: googleanalytics_ga_transactionShipping {
    type:number
    hidden:yes
    sql: ${googleanalytics_ga_transactionShipping};;
    label: "Shipping"
    group_label: "ga-ecommerce"
    description: "Total cost of shipping"
  }

  dimension: googleanalytics_ga_goal5Value_192686016 {
    type:number
    hidden:yes
    sql: ${googleanalytics_ga_goal5Value_192686016};;
    label: "Leads value (Fashion Retailer US)"
    group_label: "ga-goal-conversion-values"
    description: "Total value of Goal completions in view 'Fashion Retailer US'."
  }

  dimension: googleanalytics_ga_goal4Value_148417296 {
    type:number
    hidden:yes
    sql: ${googleanalytics_ga_goal4Value_148417296};;
    label: "Checkout success value (Fashion Retailer FR)"
    group_label: "ga-goal-conversion-values"
    description: "Total value of Goal completions in view 'Fashion Retailer FR'."
  }

  dimension: googleanalytics_ga_goal3Value_148417296 {
    type:number
    hidden:yes
    sql: ${googleanalytics_ga_goal3Value_148417296};;
    label: "Add to cart value (Fashion Retailer FR)"
    group_label: "ga-goal-conversion-values"
    description: "Total value of Goal completions in view 'Fashion Retailer FR'."
  }

  dimension: googleanalytics_ga_transactionTax {
    type:number
    hidden:yes
    sql: ${googleanalytics_ga_transactionTax};;
    label: "Tax"
    group_label: "ga-ecommerce"
    description: "Total amount of tax"
  }

  dimension: googleanalytics_ga_goal4Value_192686016 {
    type:number
    hidden:yes
    sql: ${googleanalytics_ga_goal4Value_192686016};;
    label: "Checkout success value (Fashion Retailer US)"
    group_label: "ga-goal-conversion-values"
    description: "Total value of Goal completions in view 'Fashion Retailer US'."
  }

  dimension: googleanalytics_ga_goal3Value_192686016 {
    type:number
    hidden:yes
    sql: ${googleanalytics_ga_goal3Value_192686016};;
    label: "Add to cart value (Fashion Retailer US)"
    group_label: "ga-goal-conversion-values"
    description: "Total value of Goal completions in view 'Fashion Retailer US'."
  }

  dimension: googleanalytics_ga_goal2Value_148417296 {
    type:number
    hidden:yes
    sql: ${googleanalytics_ga_goal2Value_148417296};;
    label: "View product value (Fashion Retailer FR)"
    group_label: "ga-goal-conversion-values"
    description: "Total value of Goal completions in view 'Fashion Retailer FR'."
  }

  dimension: googleanalytics_ga_goal2Value_192686016 {
    type:number
    hidden:yes
    sql: ${googleanalytics_ga_goal2Value_192686016};;
    label: "View product value (Fashion Retailer US)"
    group_label: "ga-goal-conversion-values"
    description: "Total value of Goal completions in view 'Fashion Retailer US'."
  }

  dimension: googleanalytics_ga_goal1Value_148417296 {
    type:number
    hidden:yes
    sql: ${googleanalytics_ga_goal1Value_148417296};;
    label: "Newsletter signup value (Fashion Retailer FR)"
    group_label: "ga-goal-conversion-values"
    description: "Total value of Goal completions in view 'Fashion Retailer FR'."
  }

  dimension: googleanalytics_ga_quantityAddedToCart {
    type:number
    hidden:yes
    sql: ${googleanalytics_ga_quantityAddedToCart};;
    label: "Quantity added to cart"
    group_label: "ga-ecommerce"
    description: "Number of product units added to the shopping cart (Enhanced E-commerce)"
  }

  dimension: googleanalytics_ga_goal1Value_192686016 {
    type:number
    hidden:yes
    sql: ${googleanalytics_ga_goal1Value_192686016};;
    label: "Newsletter signup value (Fashion Retailer US)"
    group_label: "ga-goal-conversion-values"
    description: "Total value of Goal completions in view 'Fashion Retailer US'."
  }

  dimension: googleanalytics_ga_goal5Completions_148417296 {
    type:number
    hidden:yes
    sql: ${googleanalytics_ga_goal5Completions_148417296};;
    label: "Leads completions (Fashion Retailer FR)"
    group_label: "ga-goal-completions"
    description: "Number of Google Analytics goal completions in view 'Fashion Retailer FR'."
  }

  dimension: googleanalytics_ga_goal5Value_176628848 {
    type:number
    hidden:yes
    sql: ${googleanalytics_ga_goal5Value_176628848};;
    label: "Leads value (Fashion Retailer UK)"
    group_label: "ga-goal-conversion-values"
    description: "Total value of Goal completions in view 'Fashion Retailer UK'."
  }

  dimension: googleanalytics_ga_goal4Value_176628848 {
    type:number
    hidden:yes
    sql: ${googleanalytics_ga_goal4Value_176628848};;
    label: "Checkout success value (Fashion Retailer UK)"
    group_label: "ga-goal-conversion-values"
    description: "Total value of Goal completions in view 'Fashion Retailer UK'."
  }

  dimension: googleanalytics_ga_goal4Completions_148417296 {
    type:number
    hidden:yes
    sql: ${googleanalytics_ga_goal4Completions_148417296};;
    label: "Checkout success (FR)"
    group_label: "ga-goal-completions"
    description: "Number of Google Analytics goal completions in view 'Fashion Retailer FR'."
  }

  dimension: googleanalytics_ga_goal5Completions_192686016 {
    type:number
    hidden:yes
    sql: ${googleanalytics_ga_goal5Completions_192686016};;
    label: "Leads completions (Fashion Retailer US)"
    group_label: "ga-goal-completions"
    description: "Number of Google Analytics goal completions in view 'Fashion Retailer US'."
  }

  dimension: googleanalytics_ga_quantityCheckedOut {
    type:number
    hidden:yes
    sql: ${googleanalytics_ga_quantityCheckedOut};;
    label: "Quantity checked out"
    group_label: "ga-ecommerce"
    description: "Number of product units included in check out (Enhanced E-commerce)"
  }

  dimension: googleanalytics_ga_goal3Completions_148417296 {
    type:number
    hidden:yes
    sql: ${googleanalytics_ga_goal3Completions_148417296};;
    label: "Add to cart (FR)"
    group_label: "ga-goal-completions"
    description: "Number of Google Analytics goal completions in view 'Fashion Retailer FR'."
  }

  dimension: googleanalytics_ga_goal3Value_176628848 {
    type:number
    hidden:yes
    sql: ${googleanalytics_ga_goal3Value_176628848};;
    label: "Add to cart value (Fashion Retailer UK)"
    group_label: "ga-goal-conversion-values"
    description: "Total value of Goal completions in view 'Fashion Retailer UK'."
  }

  dimension: googleanalytics_ga_goal4Completions_192686016 {
    type:number
    hidden:yes
    sql: ${googleanalytics_ga_goal4Completions_192686016};;
    label: "Checkout success (US)"
    group_label: "ga-goal-completions"
    description: "Number of Google Analytics goal completions in view 'Fashion Retailer US'."
  }

  dimension: googleanalytics_ga_goal2Completions_148417296 {
    type:number
    hidden:yes
    sql: ${googleanalytics_ga_goal2Completions_148417296};;
    label: "View product (FR)"
    group_label: "ga-goal-completions"
    description: "Number of Google Analytics goal completions in view 'Fashion Retailer FR'."
  }

  dimension: googleanalytics_ga_goal3Completions_192686016 {
    type:number
    hidden:yes
    sql: ${googleanalytics_ga_goal3Completions_192686016};;
    label: "Add to cart (US)"
    group_label: "ga-goal-completions"
    description: "Number of Google Analytics goal completions in view 'Fashion Retailer US'."
  }

  dimension: googleanalytics_ga_goal2Value_176628848 {
    type:number
    hidden:yes
    sql: ${googleanalytics_ga_goal2Value_176628848};;
    label: "View product value (Fashion Retailer UK)"
    group_label: "ga-goal-conversion-values"
    description: "Total value of Goal completions in view 'Fashion Retailer UK'."
  }

  dimension: googleanalytics_ga_goal1Completions_148417296 {
    type:number
    hidden:yes
    sql: ${googleanalytics_ga_goal1Completions_148417296};;
    label: "Newsletter signup (FR)"
    group_label: "ga-goal-completions"
    description: "Number of Google Analytics goal completions in view 'Fashion Retailer FR'."
  }

  dimension: googleanalytics_ga_goal2Completions_192686016 {
    type:number
    hidden:yes
    sql: ${googleanalytics_ga_goal2Completions_192686016};;
    label: "View product (US)"
    group_label: "ga-goal-completions"
    description: "Number of Google Analytics goal completions in view 'Fashion Retailer US'."
  }

  dimension: googleanalytics_ga_transactions {
    type:number
    hidden:yes
    sql: ${googleanalytics_ga_transactions};;
    label: "Transactions"
    group_label: "ga-ecommerce"
    description: "Number of Google Analytics ecommerce transactions"
  }

  dimension: googleanalytics_mcf_assistedValue_mcf_conversionType__Transaction {
    type:number
    hidden:yes
    sql: ${googleanalytics_mcf_assistedValue_mcf_conversionType__Transaction};;
    label: "Transaction assist revenue"
    group_label: "ga-ecommerce"
    description: "Revenue for interactions leading up to a transaction, excluding the final interaction."
  }

  dimension: googleanalytics_ga_goal1Value_176628848 {
    type:number
    hidden:yes
    sql: ${googleanalytics_ga_goal1Value_176628848};;
    label: "Newsletter signup value (Fashion Retailer UK)"
    group_label: "ga-goal-conversion-values"
    description: "Total value of Goal completions in view 'Fashion Retailer UK'."
  }

  dimension: googleanalytics_ga_goal1Completions_192686016 {
    type:number
    hidden:yes
    sql: ${googleanalytics_ga_goal1Completions_192686016};;
    label: "Newsletter signup (US)"
    group_label: "ga-goal-completions"
    description: "Number of Google Analytics goal completions in view 'Fashion Retailer US'."
  }

  dimension: googleanalytics_ga_totalRefunds {
    type:number
    hidden:yes
    sql: ${googleanalytics_ga_totalRefunds};;
    label: "Refunds"
    group_label: "ga-ecommerce"
    description: "Number of refunds that have been issued (Enhanced E-commerce)"
  }

  dimension: googleanalytics_ga_goal5Completions_176628848 {
    type:number
    hidden:yes
    sql: ${googleanalytics_ga_goal5Completions_176628848};;
    label: "Leads completions (Fashion Retailer UK)"
    group_label: "ga-goal-completions"
    description: "Number of Google Analytics goal completions in view 'Fashion Retailer UK'."
  }

  dimension: googleanalytics_ga_goal4Completions_176628848 {
    type:number
    hidden:yes
    sql: ${googleanalytics_ga_goal4Completions_176628848};;
    label: "Checkout success (UK)"
    group_label: "ga-goal-completions"
    description: "Number of Google Analytics goal completions in view 'Fashion Retailer UK'."
  }

  dimension: googleanalytics_ga_goal3Completions_176628848 {
    type:number
    hidden:yes
    sql: ${googleanalytics_ga_goal3Completions_176628848};;
    label: "Add to cart (UK)"
    group_label: "ga-goal-completions"
    description: "Number of Google Analytics goal completions in view 'Fashion Retailer UK'."
  }

  dimension: googleanalytics_ga_goal2Completions_176628848 {
    type:number
    hidden:yes
    sql: ${googleanalytics_ga_goal2Completions_176628848};;
    label: "View product (UK)"
    group_label: "ga-goal-completions"
    description: "Number of Google Analytics goal completions in view 'Fashion Retailer UK'."
  }

  dimension: googleanalytics_mcf_firstInteractionValue_mcf_conversionType__Transaction {
    type:number
    hidden:yes
    sql: ${googleanalytics_mcf_firstInteractionValue_mcf_conversionType__Transaction};;
    label: "Transaction revenue (first click)"
    group_label: "ga-ecommerce"
    description: "Revenue for the first interactions in chains of interactions leading up to a transaction."
  }

  dimension: googleanalytics_ga_goal1Completions_176628848 {
    type:number
    hidden:yes
    sql: ${googleanalytics_ga_goal1Completions_176628848};;
    label: "Newsletter signup (UK)"
    group_label: "ga-goal-completions"
    description: "Number of Google Analytics goal completions in view 'Fashion Retailer UK'."
  }

  dimension: googleanalytics_ga_goalCompletionsAll {
    type:number
    hidden:yes
    sql: ${googleanalytics_ga_goalCompletionsAll};;
    label: "Goal completions"
    group_label: "ga-goal-completions"
    description: "Total number of Google Analytics goal completions"
  }

  dimension: googleanalytics_ga_sessions {
    type:number
    hidden:yes
    sql: ${googleanalytics_ga_sessions};;
    label: "Sessions"
    group_label: "ga-basic"
    description: "Number of Google Analytics sessions"
  }

  dimension: googleanalytics_ga_transactionRevenue {
    type:number
    hidden:yes
    sql: ${googleanalytics_ga_transactionRevenue};;
    label: "Transaction revenue"
    group_label: "ga-ecommerce"
    description: "Total revenue from Transactions"
  }

  dimension: googleanalytics_ga_itemQuantity {
    type:number
    hidden:yes
    sql: ${googleanalytics_ga_itemQuantity};;
    label: "Quantity"
    group_label: "ga-ecommerce"
    description: "Total number of items purchased."
  }

  dimension: googleanalytics_ga_quantityRemovedFromCart {
    type:number
    hidden:yes
    sql: ${googleanalytics_ga_quantityRemovedFromCart};;
    label: "Quantity removed from cart"
    group_label: "ga-ecommerce"
    description: "Number of product units removed from cart (Enhanced E-commerce)"
  }

  dimension: googleanalytics_ga_pageviews {
    type:number
    hidden:yes
    sql: ${googleanalytics_ga_pageviews};;
    label: "Pageviews"
    group_label: "ga-basic"
    description: "Google Analytics Pageviews"
  }


  measure: total_googleanalytics_ga_uniquePurchases {
    type: sum
    sql: ${googleanalytics_ga_uniquePurchases} ;;
    label: "Unique Purchases"
    group_label: "ga-ecommerce"
    description: "The number of product sets purchased. For example, if users purchase 2 frisbees and 5 tennis balls from your site, 2 unique products have been purchased."
  }

  measure: total_googleanalytics_mcf_assistedConversions_mcf_conversionType__Transaction {
    type: sum
    sql: ${googleanalytics_mcf_assistedConversions_mcf_conversionType__Transaction} ;;
    label: "Transaction assists"
    group_label: "ga-ecommerce"
    description: "Google Analytics ecommerce transactions, where the Channel was not the last interaction"
  }

  measure: total_googleanalytics_ga_goal5Value_161909777 {
    type: sum
    sql: ${googleanalytics_ga_goal5Value_161909777} ;;
    label: "Leads value (Fashion Retailer DE)"
    group_label: "ga-goal-conversion-values"
    description: "Total value of Goal completions in view 'Fashion Retailer DE'."
  }

  measure: total_googleanalytics_ga_quantityRefunded {
    type: sum
    sql: ${googleanalytics_ga_quantityRefunded} ;;
    label: "Quantity refunded"
    group_label: "ga-ecommerce"
    description: "Number of product units refunded (Enhanced E-commerce)"
  }

  measure: total_googleanalytics_ga_goal4Value_161909777 {
    type: sum
    sql: ${googleanalytics_ga_goal4Value_161909777} ;;
    label: "Checkout success value (Fashion Retailer DE)"
    group_label: "ga-goal-conversion-values"
    description: "Total value of Goal completions in view 'Fashion Retailer DE'."
  }

  measure: total_googleanalytics_ga_goalValueAll {
    type: sum
    sql: ${googleanalytics_ga_goalValueAll} ;;
    label: "Goal value"
    group_label: "ga-goal-conversion-values"
    description: "Total value from Google Analytics goal completions"
  }

  measure: total_googleanalytics_ga_goal3Value_161909777 {
    type: sum
    sql: ${googleanalytics_ga_goal3Value_161909777} ;;
    label: "Add to cart value (Fashion Retailer DE)"
    group_label: "ga-goal-conversion-values"
    description: "Total value of Goal completions in view 'Fashion Retailer DE'."
  }

  measure: total_googleanalytics_ga_goal2Value_161909777 {
    type: sum
    sql: ${googleanalytics_ga_goal2Value_161909777} ;;
    label: "View product value (Fashion Retailer DE)"
    group_label: "ga-goal-conversion-values"
    description: "Total value of Goal completions in view 'Fashion Retailer DE'."
  }

  measure: total_googleanalytics_ga_goal1Value_161909777 {
    type: sum
    sql: ${googleanalytics_ga_goal1Value_161909777} ;;
    label: "Newsletter signup value (Fashion Retailer DE)"
    group_label: "ga-goal-conversion-values"
    description: "Total value of Goal completions in view 'Fashion Retailer DE'."
  }

  measure: total_googleanalytics_mcf_firstInteractionConversions_mcf_conversionType__Transaction {
    type: sum
    sql: ${googleanalytics_mcf_firstInteractionConversions_mcf_conversionType__Transaction} ;;
    label: "Transactions (first click)"
    group_label: "ga-ecommerce"
    description: "The number of first interactions in chains of interactions leading up to a transaction."
  }

  measure: total_googleanalytics_ga_goal5Completions_161909777 {
    type: sum
    sql: ${googleanalytics_ga_goal5Completions_161909777} ;;
    label: "Leads completions (Fashion Retailer DE)"
    group_label: "ga-goal-completions"
    description: "Number of Google Analytics goal completions in view 'Fashion Retailer DE'."
  }

  measure: total_googleanalytics_ga_newUsers {
    type: sum
    sql: ${googleanalytics_ga_newUsers} ;;
    label: "New users"
    group_label: "ga-basic"
    description: "Number of new users"
  }

  measure: total_googleanalytics_ga_itemRevenue {
    type: sum
    sql: ${googleanalytics_ga_itemRevenue} ;;
    label: "Product Revenue"
    group_label: "ga-ecommerce"
    description: "The total revenue from purchased product items."
  }

  measure: total_googleanalytics_ga_goal4Completions_161909777 {
    type: sum
    sql: ${googleanalytics_ga_goal4Completions_161909777} ;;
    label: "Checkout success (DE)"
    group_label: "ga-goal-completions"
    description: "Number of Google Analytics goal completions in view 'Fashion Retailer DE'."
  }

  measure: total_googleanalytics_ga_sessionDuration {
    type: sum
    sql: ${googleanalytics_ga_sessionDuration} ;;
    label: "Session duration"
    group_label: "ga-basic"
    description: "Total duration (in seconds) of users' sessions"
  }

  measure: total_googleanalytics_ga_goal3Completions_161909777 {
    type: sum
    sql: ${googleanalytics_ga_goal3Completions_161909777} ;;
    label: "Add to cart (DE)"
    group_label: "ga-goal-completions"
    description: "Number of Google Analytics goal completions in view 'Fashion Retailer DE'."
  }

  measure: total_googleanalytics_ga_goal5Value_148417296 {
    type: sum
    sql: ${googleanalytics_ga_goal5Value_148417296} ;;
    label: "Leads value (Fashion Retailer FR)"
    group_label: "ga-goal-conversion-values"
    description: "Total value of Goal completions in view 'Fashion Retailer FR'."
  }

  measure: total_googleanalytics_ga_bounces {
    type: sum
    sql: ${googleanalytics_ga_bounces} ;;
    label: "Bounces"
    group_label: "ga-basic"
    description: "The total number of single page (or single interaction hit) sessions for the property."
  }

  measure: total_googleanalytics_ga_goal2Completions_161909777 {
    type: sum
    sql: ${googleanalytics_ga_goal2Completions_161909777} ;;
    label: "Newsletter signup (DE)"
    group_label: "ga-goal-completions"
    description: "Number of Google Analytics goal completions in view 'Fashion Retailer DE'."
  }

  measure: total_googleanalytics_ga_goal1Completions_161909777 {
    type: sum
    sql: ${googleanalytics_ga_goal1Completions_161909777} ;;
    label: "Newsletter signup (DE)"
    group_label: "ga-goal-completions"
    description: "Number of Google Analytics goal completions in view 'Fashion Retailer DE'."
  }

  measure: total_googleanalytics_ga_transactionShipping {
    type: sum
    sql: ${googleanalytics_ga_transactionShipping} ;;
    label: "Shipping"
    group_label: "ga-ecommerce"
    description: "Total cost of shipping"
  }

  measure: total_googleanalytics_ga_goal5Value_192686016 {
    type: sum
    sql: ${googleanalytics_ga_goal5Value_192686016} ;;
    label: "Leads value (Fashion Retailer US)"
    group_label: "ga-goal-conversion-values"
    description: "Total value of Goal completions in view 'Fashion Retailer US'."
  }

  measure: total_googleanalytics_ga_goal4Value_148417296 {
    type: sum
    sql: ${googleanalytics_ga_goal4Value_148417296} ;;
    label: "Checkout success value (Fashion Retailer FR)"
    group_label: "ga-goal-conversion-values"
    description: "Total value of Goal completions in view 'Fashion Retailer FR'."
  }

  measure: total_googleanalytics_ga_goal3Value_148417296 {
    type: sum
    sql: ${googleanalytics_ga_goal3Value_148417296} ;;
    label: "Add to cart value (Fashion Retailer FR)"
    group_label: "ga-goal-conversion-values"
    description: "Total value of Goal completions in view 'Fashion Retailer FR'."
  }

  measure: total_googleanalytics_ga_transactionTax {
    type: sum
    sql: ${googleanalytics_ga_transactionTax} ;;
    label: "Tax"
    group_label: "ga-ecommerce"
    description: "Total amount of tax"
  }

  measure: total_googleanalytics_ga_goal4Value_192686016 {
    type: sum
    sql: ${googleanalytics_ga_goal4Value_192686016} ;;
    label: "Checkout success value (Fashion Retailer US)"
    group_label: "ga-goal-conversion-values"
    description: "Total value of Goal completions in view 'Fashion Retailer US'."
  }

  measure: total_googleanalytics_ga_goal3Value_192686016 {
    type: sum
    sql: ${googleanalytics_ga_goal3Value_192686016} ;;
    label: "Add to cart value (Fashion Retailer US)"
    group_label: "ga-goal-conversion-values"
    description: "Total value of Goal completions in view 'Fashion Retailer US'."
  }

  measure: total_googleanalytics_ga_goal2Value_148417296 {
    type: sum
    sql: ${googleanalytics_ga_goal2Value_148417296} ;;
    label: "View product value (Fashion Retailer FR)"
    group_label: "ga-goal-conversion-values"
    description: "Total value of Goal completions in view 'Fashion Retailer FR'."
  }

  measure: total_googleanalytics_ga_goal2Value_192686016 {
    type: sum
    sql: ${googleanalytics_ga_goal2Value_192686016} ;;
    label: "View product value (Fashion Retailer US)"
    group_label: "ga-goal-conversion-values"
    description: "Total value of Goal completions in view 'Fashion Retailer US'."
  }

  measure: total_googleanalytics_ga_goal1Value_148417296 {
    type: sum
    sql: ${googleanalytics_ga_goal1Value_148417296} ;;
    label: "Newsletter signup value (Fashion Retailer FR)"
    group_label: "ga-goal-conversion-values"
    description: "Total value of Goal completions in view 'Fashion Retailer FR'."
  }

  measure: total_googleanalytics_ga_quantityAddedToCart {
    type: sum
    sql: ${googleanalytics_ga_quantityAddedToCart} ;;
    label: "Quantity added to cart"
    group_label: "ga-ecommerce"
    description: "Number of product units added to the shopping cart (Enhanced E-commerce)"
  }

  measure: total_googleanalytics_ga_goal1Value_192686016 {
    type: sum
    sql: ${googleanalytics_ga_goal1Value_192686016} ;;
    label: "Newsletter signup value (Fashion Retailer US)"
    group_label: "ga-goal-conversion-values"
    description: "Total value of Goal completions in view 'Fashion Retailer US'."
  }

  measure: total_googleanalytics_ga_goal5Completions_148417296 {
    type: sum
    sql: ${googleanalytics_ga_goal5Completions_148417296} ;;
    label: "Leads completions (Fashion Retailer FR)"
    group_label: "ga-goal-completions"
    description: "Number of Google Analytics goal completions in view 'Fashion Retailer FR'."
  }

  measure: total_googleanalytics_ga_goal5Value_176628848 {
    type: sum
    sql: ${googleanalytics_ga_goal5Value_176628848} ;;
    label: "Leads value (Fashion Retailer UK)"
    group_label: "ga-goal-conversion-values"
    description: "Total value of Goal completions in view 'Fashion Retailer UK'."
  }

  measure: total_googleanalytics_ga_goal4Value_176628848 {
    type: sum
    sql: ${googleanalytics_ga_goal4Value_176628848} ;;
    label: "Checkout success value (Fashion Retailer UK)"
    group_label: "ga-goal-conversion-values"
    description: "Total value of Goal completions in view 'Fashion Retailer UK'."
  }

  measure: total_googleanalytics_ga_goal4Completions_148417296 {
    type: sum
    sql: ${googleanalytics_ga_goal4Completions_148417296} ;;
    label: "Checkout success (FR)"
    group_label: "ga-goal-completions"
    description: "Number of Google Analytics goal completions in view 'Fashion Retailer FR'."
  }

  measure: total_googleanalytics_ga_goal5Completions_192686016 {
    type: sum
    sql: ${googleanalytics_ga_goal5Completions_192686016} ;;
    label: "Leads completions (Fashion Retailer US)"
    group_label: "ga-goal-completions"
    description: "Number of Google Analytics goal completions in view 'Fashion Retailer US'."
  }

  measure: total_googleanalytics_ga_quantityCheckedOut {
    type: sum
    sql: ${googleanalytics_ga_quantityCheckedOut} ;;
    label: "Quantity checked out"
    group_label: "ga-ecommerce"
    description: "Number of product units included in check out (Enhanced E-commerce)"
  }

  measure: total_googleanalytics_ga_goal3Completions_148417296 {
    type: sum
    sql: ${googleanalytics_ga_goal3Completions_148417296} ;;
    label: "Add to cart (FR)"
    group_label: "ga-goal-completions"
    description: "Number of Google Analytics goal completions in view 'Fashion Retailer FR'."
  }

  measure: total_googleanalytics_ga_goal3Value_176628848 {
    type: sum
    sql: ${googleanalytics_ga_goal3Value_176628848} ;;
    label: "Add to cart value (Fashion Retailer UK)"
    group_label: "ga-goal-conversion-values"
    description: "Total value of Goal completions in view 'Fashion Retailer UK'."
  }

  measure: total_googleanalytics_ga_goal4Completions_192686016 {
    type: sum
    sql: ${googleanalytics_ga_goal4Completions_192686016} ;;
    label: "Checkout success (US)"
    group_label: "ga-goal-completions"
    description: "Number of Google Analytics goal completions in view 'Fashion Retailer US'."
  }

  measure: total_googleanalytics_ga_goal2Completions_148417296 {
    type: sum
    sql: ${googleanalytics_ga_goal2Completions_148417296} ;;
    label: "View product (FR)"
    group_label: "ga-goal-completions"
    description: "Number of Google Analytics goal completions in view 'Fashion Retailer FR'."
  }

  measure: total_googleanalytics_ga_goal3Completions_192686016 {
    type: sum
    sql: ${googleanalytics_ga_goal3Completions_192686016} ;;
    label: "Add to cart (US)"
    group_label: "ga-goal-completions"
    description: "Number of Google Analytics goal completions in view 'Fashion Retailer US'."
  }

  measure: total_googleanalytics_ga_goal2Value_176628848 {
    type: sum
    sql: ${googleanalytics_ga_goal2Value_176628848} ;;
    label: "View product value (Fashion Retailer UK)"
    group_label: "ga-goal-conversion-values"
    description: "Total value of Goal completions in view 'Fashion Retailer UK'."
  }

  measure: total_googleanalytics_ga_goal1Completions_148417296 {
    type: sum
    sql: ${googleanalytics_ga_goal1Completions_148417296} ;;
    label: "Newsletter signup (FR)"
    group_label: "ga-goal-completions"
    description: "Number of Google Analytics goal completions in view 'Fashion Retailer FR'."
  }

  measure: total_googleanalytics_ga_goal2Completions_192686016 {
    type: sum
    sql: ${googleanalytics_ga_goal2Completions_192686016} ;;
    label: "View product (US)"
    group_label: "ga-goal-completions"
    description: "Number of Google Analytics goal completions in view 'Fashion Retailer US'."
  }

  measure: total_googleanalytics_ga_transactions {
    type: sum
    sql: ${googleanalytics_ga_transactions} ;;
    label: "Transactions"
    group_label: "ga-ecommerce"
    description: "Number of Google Analytics ecommerce transactions"
  }

  measure: total_googleanalytics_mcf_assistedValue_mcf_conversionType__Transaction {
    type: sum
    sql: ${googleanalytics_mcf_assistedValue_mcf_conversionType__Transaction} ;;
    label: "Transaction assist revenue"
    group_label: "ga-ecommerce"
    description: "Revenue for interactions leading up to a transaction, excluding the final interaction."
  }

  measure: total_googleanalytics_ga_goal1Value_176628848 {
    type: sum
    sql: ${googleanalytics_ga_goal1Value_176628848} ;;
    label: "Newsletter signup value (Fashion Retailer UK)"
    group_label: "ga-goal-conversion-values"
    description: "Total value of Goal completions in view 'Fashion Retailer UK'."
  }

  measure: total_googleanalytics_ga_goal1Completions_192686016 {
    type: sum
    sql: ${googleanalytics_ga_goal1Completions_192686016} ;;
    label: "Newsletter signup (US)"
    group_label: "ga-goal-completions"
    description: "Number of Google Analytics goal completions in view 'Fashion Retailer US'."
  }

  measure: total_googleanalytics_ga_totalRefunds {
    type: sum
    sql: ${googleanalytics_ga_totalRefunds} ;;
    label: "Refunds"
    group_label: "ga-ecommerce"
    description: "Number of refunds that have been issued (Enhanced E-commerce)"
  }

  measure: total_googleanalytics_ga_goal5Completions_176628848 {
    type: sum
    sql: ${googleanalytics_ga_goal5Completions_176628848} ;;
    label: "Leads completions (Fashion Retailer UK)"
    group_label: "ga-goal-completions"
    description: "Number of Google Analytics goal completions in view 'Fashion Retailer UK'."
  }

  measure: total_googleanalytics_ga_goal4Completions_176628848 {
    type: sum
    sql: ${googleanalytics_ga_goal4Completions_176628848} ;;
    label: "Checkout success (UK)"
    group_label: "ga-goal-completions"
    description: "Number of Google Analytics goal completions in view 'Fashion Retailer UK'."
  }

  measure: total_googleanalytics_ga_goal3Completions_176628848 {
    type: sum
    sql: ${googleanalytics_ga_goal3Completions_176628848} ;;
    label: "Add to cart (UK)"
    group_label: "ga-goal-completions"
    description: "Number of Google Analytics goal completions in view 'Fashion Retailer UK'."
  }

  measure: total_googleanalytics_ga_goal2Completions_176628848 {
    type: sum
    sql: ${googleanalytics_ga_goal2Completions_176628848} ;;
    label: "View product (UK)"
    group_label: "ga-goal-completions"
    description: "Number of Google Analytics goal completions in view 'Fashion Retailer UK'."
  }

  measure: total_googleanalytics_mcf_firstInteractionValue_mcf_conversionType__Transaction {
    type: sum
    sql: ${googleanalytics_mcf_firstInteractionValue_mcf_conversionType__Transaction} ;;
    label: "Transaction revenue (first click)"
    group_label: "ga-ecommerce"
    description: "Revenue for the first interactions in chains of interactions leading up to a transaction."
  }

  measure: total_googleanalytics_ga_goal1Completions_176628848 {
    type: sum
    sql: ${googleanalytics_ga_goal1Completions_176628848} ;;
    label: "Newsletter signup (UK)"
    group_label: "ga-goal-completions"
    description: "Number of Google Analytics goal completions in view 'Fashion Retailer UK'."
  }

  measure: total_googleanalytics_ga_goalCompletionsAll {
    type: sum
    sql: ${googleanalytics_ga_goalCompletionsAll} ;;
    label: "Goal completions"
    group_label: "ga-goal-completions"
    description: "Total number of Google Analytics goal completions"
  }

  measure: total_googleanalytics_ga_sessions {
    type: sum
    sql: ${googleanalytics_ga_sessions} ;;
    label: "Sessions"
    group_label: "ga-basic"
    description: "Number of Google Analytics sessions"
  }

  measure: total_googleanalytics_ga_transactionRevenue {
    type: sum
    sql: ${googleanalytics_ga_transactionRevenue} ;;
    label: "Transaction revenue"
    group_label: "ga-ecommerce"
    description: "Total revenue from Transactions"
  }

  measure: total_googleanalytics_ga_itemQuantity {
    type: sum
    sql: ${googleanalytics_ga_itemQuantity} ;;
    label: "Quantity"
    group_label: "ga-ecommerce"
    description: "Total number of items purchased."
  }

  measure: total_googleanalytics_ga_quantityRemovedFromCart {
    type: sum
    sql: ${googleanalytics_ga_quantityRemovedFromCart} ;;
    label: "Quantity removed from cart"
    group_label: "ga-ecommerce"
    description: "Number of product units removed from cart (Enhanced E-commerce)"
  }

  measure: total_googleanalytics_ga_pageviews {
    type: sum
    sql: ${googleanalytics_ga_pageviews} ;;
    label: "Pageviews"
    group_label: "ga-basic"
    description: "Google Analytics Pageviews"
  }

}
