- dashboard: marketing_overview
  title: Marketing Overview
  layout: newspaper
  elements:
  - name: ''
    type: text
    title_text: ''
    subtitle_text: Brought to you by Funnel
    body_text: <center> <img src="https://static.funnel.io/images/logo-120x120.ffd2e0ebb.png"
      width="35"> </center>
    row: 38
    col: 0
    width: 24
    height: 3
  - name: Cross Channel Performance
    type: text
    title_text: Cross Channel Performance
    row: 15
    col: 0
    width: 24
    height: 2
  - name: Paid Vs Organic
    type: text
    title_text: Paid Vs Organic
    row: 26
    col: 0
    width: 24
    height: 2
  - name: Marketing Performance Overview
    type: text
    title_text: Marketing Performance Overview
    subtitle_text: Key Performance Indicators
    row: 0
    col: 2
    width: 20
    height: 2
  - name: funnel_logo
    type: text
    body_text: <center> <img src="https://static.funnel.io/images/logo-120x120.ffd2e0ebb.png"
      width="50"> </center>
    row: 0
    col: 0
    width: 2
    height: 2
  - title: Cost w/compare
    name: Cost w/compare
    model: funnel_demo
    explore: funnel_demo
    type: single_value
    fields:
    - funnel_demo_view.timeframes
    - funnel_demo_view.total_cost
    filters:
      funnel_demo_view.timeframes: "-Not in time period"
      funnel_demo_view.date_filter: 1 days
    sorts:
    - funnel_demo_view.timeframes
    limit: 500
    dynamic_fields:
    - table_calculation: change
      label: "% Change"
      expression: "(${funnel_demo_view.total_cost} - offset(${funnel_demo_view.total_cost},1))\
        \ / offset(${funnel_demo_view.total_cost}, 1) "
      value_format:
      value_format_name: percent_2
      _kind_hint: measure
      _type_hint: number
    - table_calculation: change_2
      label: Change
      expression: "${funnel_demo_view.total_cost} - offset(${funnel_demo_view.total_cost},1)"
      value_format:
      value_format_name:
      _kind_hint: measure
      _type_hint: number
    query_timezone: America/Los_Angeles
    custom_color_enabled: false
    custom_color: "#ffa04a"
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: true
    show_comparison_label: true
    show_view_names: true
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    limit_displayed_rows: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    single_value_title: Cost
    value_format: "$#,###"
    comparison_label: Compared to previous period
    listen:
      Date: funnel_demo_view.date_filter
    row: 2
    col: 0
    width: 6
    height: 4
  - title: Transactions w/compare
    name: Transactions w/compare
    model: funnel_demo
    explore: funnel_demo
    type: single_value
    fields:
    - funnel_demo_view.timeframes
    - funnel_demo_view.total_transactions
    filters:
      funnel_demo_view.timeframes: "-Not in time period"
      funnel_demo_view.date_filter: 1 days
    sorts:
    - funnel_demo_view.timeframes
    limit: 500
    dynamic_fields:
    - table_calculation: change_2
      label: "% Change"
      expression: "(${funnel_demo_view.total_transactions} - offset(${funnel_demo_view.total_transactions},1))\
        \ / offset(${funnel_demo_view.total_transactions}, 1)"
      value_format:
      value_format_name: percent_2
      _kind_hint: measure
      _type_hint: number
    - table_calculation: change
      label: Change
      expression: "${funnel_demo_view.total_transactions} - offset(${funnel_demo_view.total_transactions},1)"
      value_format:
      value_format_name:
      _kind_hint: measure
      _type_hint: number
    query_timezone: America/Los_Angeles
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: true
    show_view_names: true
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    limit_displayed_rows: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    single_value_title: Transactions
    value_format: ''
    comparison_label: Compared to previous period
    listen:
      Date: funnel_demo_view.date_filter
    row: 2
    col: 6
    width: 6
    height: 4
  - title: Revenue w/compare
    name: Revenue w/compare
    model: funnel_demo
    explore: funnel_demo
    type: single_value
    fields:
    - funnel_demo_view.timeframes
    - funnel_demo_view.total_revenue
    filters:
      funnel_demo_view.timeframes: "-Not in time period"
      funnel_demo_view.date_filter: 1 days
    sorts:
    - funnel_demo_view.timeframes
    limit: 500
    dynamic_fields:
    - table_calculation: change
      label: "% Change"
      expression: "(${funnel_demo_view.total_revenue} - offset(${funnel_demo_view.total_revenue},1))\
        \ / offset(${funnel_demo_view.total_revenue}, 1) "
      value_format:
      value_format_name: percent_2
      _kind_hint: measure
      _type_hint: number
    - table_calculation: change_2
      label: Change
      expression: "${funnel_demo_view.total_revenue} - offset(${funnel_demo_view.total_revenue},1)"
      value_format:
      value_format_name:
      _kind_hint: measure
      _type_hint: number
    query_timezone: America/Los_Angeles
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: true
    show_view_names: true
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    limit_displayed_rows: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    single_value_title: Revenue
    value_format: "$#,###"
    comparison_label: Compared to previous period
    listen:
      Date: funnel_demo_view.date_filter
    row: 2
    col: 12
    width: 6
    height: 4
  - title: Sessions w/compare
    name: Sessions w/compare
    model: funnel_demo
    explore: funnel_demo
    type: single_value
    fields:
    - funnel_demo_view.timeframes
    - funnel_demo_view.total_sessions
    filters:
      funnel_demo_view.timeframes: "-Not in time period"
      funnel_demo_view.date_filter: 1 days
    sorts:
    - funnel_demo_view.timeframes
    limit: 500
    dynamic_fields:
    - table_calculation: change
      label: "% Change"
      expression: "(${funnel_demo_view.total_sessions} - offset(${funnel_demo_view.total_sessions},1))\
        \ / offset(${funnel_demo_view.total_sessions}, 1)"
      value_format:
      value_format_name: percent_2
      _kind_hint: measure
      _type_hint: number
    - table_calculation: change_2
      label: Change
      expression: "${funnel_demo_view.total_sessions} - offset(${funnel_demo_view.total_sessions},1)"
      value_format:
      value_format_name:
      _kind_hint: measure
      _type_hint: number
    query_timezone: America/Los_Angeles
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: true
    show_view_names: true
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    limit_displayed_rows: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    single_value_title: Sessions
    value_format: ''
    comparison_label: Compared to previous period
    listen:
      Date: funnel_demo_view.date_filter
    row: 2
    col: 18
    width: 6
    height: 4
  - title: Cost
    name: Cost
    model: funnel_demo
    explore: funnel_demo
    type: looker_line
    fields:
    - funnel_demo_view.date_day_of_month
    - funnel_demo_view.date_month
    - funnel_demo_view.total_cost
    pivots:
    - funnel_demo_view.date_month
    fill_fields:
    - funnel_demo_view.date_day_of_month
    - funnel_demo_view.date_month
    filters:
      funnel_demo_view.date_month: 2 months ago for 2 months
    sorts:
    - funnel_demo_view.date_month 0
    - funnel_demo_view.date_day_of_month
    limit: 500
    dynamic_fields:
    - table_calculation: cumulative_cost
      label: Cumulative Cost
      expression: running_total(${funnel_demo_view.total_cost})
      value_format:
      value_format_name: usd_0
      _kind_hint: measure
      _type_hint: number
    query_timezone: America/Los_Angeles
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    show_null_points: true
    point_style: none
    interpolation: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    hidden_fields:
    - funnel_demo_view.total_cost
    series_colors:
      2018-03 - cumulative_cost: "#f7a400"
      2018-04 - cumulative_cost: "#f7a400"
      2018-02 - cumulative_cost: "#fae5b4"
    x_axis_label: Date
    listen:
      Date: funnel_demo_view.date_filter
    row: 6
    col: 0
    width: 8
    height: 9
  - title: Transactions vs Cost
    name: Transactions vs Cost
    model: funnel_demo
    explore: funnel_demo
    type: looker_column
    fields:
    - funnel_demo_view.traffic_source
    - funnel_demo_view.total_cost
    - funnel_demo_view.total_transactions
    - funnel_demo_view.timeframes
    filters:
      funnel_demo_view.date_filter: 1 days
      funnel_demo_view.timeframes: Selected Period
    sorts:
    - daily_cost desc
    limit: 500
    dynamic_fields:
    - table_calculation: daily_cost
      label: Daily cost
      expression: round(${funnel_demo_view.total_cost}, 2)
      value_format:
      value_format_name: usd
      _kind_hint: measure
      _type_hint: number
    query_timezone: America/Los_Angeles
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: right
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    show_null_points: false
    point_style: none
    interpolation: linear
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_types: {}
    series_colors:
      2018-03 - funnel_demo_view.total_cost: "#f7a105"
      2018-02 - funnel_demo_view.total_cost: "#f7d8bc"
      2018-03 - cumulative_cost: "#ffb400"
      2018-02 - cumulative_cost: "#ffe7ad"
      cumulative_cost: "#f7a400"
      daily_cost: "#f7a400"
      funnel_demo_view.total_transactions: "#fae5b4"
    hidden_fields:
    - funnel_demo_view.total_cost
    - funnel_demo_view.timeframes
    x_axis_label: Channel
    series_labels:
      funnel_demo_view.total_transactions: Transactions
      daily_cost: Cost
    x_axis_reversed: false
    x_axis_datetime_label: ''
    listen:
      Date: funnel_demo_view.date_filter
    refresh_interval: 1 hour
    row: 17
    col: 0
    width: 12
    height: 9
  - title: Transactions
    name: Transactions
    model: funnel_demo
    explore: funnel_demo
    type: looker_line
    fields:
    - funnel_demo_view.date_day_of_month
    - funnel_demo_view.date_month
    - funnel_demo_view.total_transactions
    pivots:
    - funnel_demo_view.date_month
    fill_fields:
    - funnel_demo_view.date_day_of_month
    - funnel_demo_view.date_month
    filters:
      funnel_demo_view.date_month: 2 months ago for 2 months
    sorts:
    - funnel_demo_view.date_month 0
    - funnel_demo_view.date_day_of_month
    limit: 500
    dynamic_fields:
    - table_calculation: cumulative_transactions
      label: Cumulative Transactions
      expression: running_total(${funnel_demo_view.total_transactions})
      value_format:
      value_format_name: decimal_0
      _kind_hint: measure
      _type_hint: number
    query_timezone: America/Los_Angeles
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    show_null_points: true
    point_style: none
    interpolation: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    hidden_fields:
    - funnel_demo_view.total_transactions
    series_colors:
      2018-03 - cumulative_cost: "#f7a400"
      2018-04 - cumulative_cost: "#f7a400"
      2018-02 - cumulative_cost: "#fae5b4"
      2018-03 - cumulative_transactions: "#f7a400"
      2018-02 - cumulative_transactions: "#fae5b4"
    x_axis_label: Date
    listen:
      Date: funnel_demo_view.date_filter
    row: 6
    col: 8
    width: 8
    height: 9
  - title: Transactions
    name: Transactions Line
    model: funnel_demo
    explore: funnel_demo
    type: looker_line
    fields:
    - funnel_demo_view.date_date
    - funnel_demo_view.paid_organic
    - funnel_demo_view.total_transactions
    pivots:
    - funnel_demo_view.paid_organic
    fill_fields:
    - funnel_demo_view.date_date
    filters:
      funnel_demo_view.date_filter: 1 days
      funnel_demo_view.timeframes: Selected Period
    sorts:
    - funnel_demo_view.date_date
    - funnel_demo_view.paid_organic
    limit: 500
    dynamic_fields:
    - table_calculation: cumulative_transactions
      label: Cumulative Transactions
      expression: running_total(${funnel_demo_view.total_transactions})
      value_format:
      value_format_name: decimal_0
      _kind_hint: measure
      _type_hint: number
    query_timezone: America/Los_Angeles
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    show_null_points: false
    point_style: none
    interpolation: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_types: {}
    series_colors:
      2018-03 - funnel_demo_view.total_cost: "#f7a105"
      2018-02 - funnel_demo_view.total_cost: "#f7d8bc"
      2018-03 - cumulative_cost: "#ffb400"
      2018-02 - cumulative_cost: "#ffe7ad"
      cumulative_cost: "#f7a400"
      Paid - cumulative_sessions: "#f7a400"
      Organic - cumulative_sessions: "#8bc677"
      Organic - cumulative_transactions: "#fae5b4"
      Paid - cumulative_transactions: "#f7a400"
    hidden_fields:
    - funnel_demo_view.total_transactions
    x_axis_label: Date
    listen:
      Date: funnel_demo_view.date_filter
    refresh_interval: 1 hour
    row: 28
    col: 0
    width: 8
    height: 10
  - title: KPIs
    name: KPIs
    model: funnel_demo
    explore: funnel_demo
    type: table
    fields:
    - funnel_demo_view.traffic_source
    - funnel_demo_view.total_cost
    - funnel_demo_view.total_transactions
    - funnel_demo_view.total_revenue
    filters:
      funnel_demo_view.date_filter: 1 days
      funnel_demo_view.timeframes: Selected Period
    sorts:
    - funnel_demo_view.total_cost desc
    limit: 500
    total: true
    query_timezone: America/Los_Angeles
    show_view_names: false
    show_row_numbers: false
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    show_null_points: false
    point_style: none
    interpolation: linear
    series_types: {}
    series_colors:
      2018-03 - funnel_demo_view.total_cost: "#f7a105"
      2018-02 - funnel_demo_view.total_cost: "#f7d8bc"
      2018-03 - cumulative_cost: "#ffb400"
      2018-02 - cumulative_cost: "#ffe7ad"
      cumulative_cost: "#f7a400"
      daily_cost: "#f7a400"
      funnel_demo_view.total_transactions: "#8bc677"
    hidden_fields:
    x_axis_label: Channel
    series_labels:
      funnel_demo_view.total_transactions: Transactions
      daily_cost: Cost
      funnel_demo_view.traffic_source: Channel
      funnel_demo_view.total_clicks: Clicks
      funnel_demo_view.total_impressions: Impressions
      funnel_demo_view.total_sessions: Sessions
      daily_revenue: Revenue
      daily_transactions: Transactions
      funnel_demo_view.total_revenue: Revenue
      funnel_demo_view.total_cost: Cost
    conditional_formatting: []
    limit_displayed_rows_values:
      show_hide: hide
      first_last: first
      num_rows: 0
    listen:
      Date: funnel_demo_view.date_filter
    refresh_interval: 1 hour
    note_state: collapsed
    note_display: above
    row: 17
    col: 12
    width: 12
    height: 9
  - title: Revenue
    name: Revenue
    model: funnel_demo
    explore: funnel_demo
    type: looker_line
    fields:
    - funnel_demo_view.date_date
    - funnel_demo_view.total_revenue
    - funnel_demo_view.paid_organic
    pivots:
    - funnel_demo_view.paid_organic
    fill_fields:
    - funnel_demo_view.date_date
    filters:
      funnel_demo_view.date_filter: 1 days
      funnel_demo_view.timeframes: Selected Period
    sorts:
    - funnel_demo_view.date_date
    - funnel_demo_view.paid_organic
    limit: 500
    dynamic_fields:
    - table_calculation: cumulative_revenue
      label: Cumulative Revenue
      expression: running_total(${funnel_demo_view.total_revenue})
      value_format:
      value_format_name: usd
      _kind_hint: measure
      _type_hint: number
    query_timezone: America/Los_Angeles
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    show_null_points: false
    point_style: none
    interpolation: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_types: {}
    series_colors:
      2018-03 - funnel_demo_view.total_cost: "#f7a105"
      2018-02 - funnel_demo_view.total_cost: "#f7d8bc"
      2018-03 - cumulative_cost: "#ffb400"
      2018-02 - cumulative_cost: "#ffe7ad"
      cumulative_cost: "#f7a400"
      Paid - cumulative_sessions: "#f7a400"
      Organic - cumulative_sessions: "#8bc677"
      Organic - cumulative_transactions: "#8bc677"
      Paid - cumulative_transactions: "#f7a400"
      Organic - cumulative_revenue: "#fae5b4"
      Paid - cumulative_revenue: "#f7a400"
    hidden_fields:
    - funnel_demo_view.total_revenue
    x_axis_label: Date
    listen:
      Date: funnel_demo_view.date_filter
    refresh_interval: 1 hour
    row: 28
    col: 8
    width: 8
    height: 10
  - title: Transactions
    name: Transactions Pie
    model: funnel_demo
    explore: funnel_demo
    type: looker_pie
    fields:
    - funnel_demo_view.paid_organic
    - funnel_demo_view.total_transactions
    filters:
      funnel_demo_view.date_filter: 1 days
      funnel_demo_view.timeframes: Selected Period
    sorts:
    - funnel_demo_view.paid_organic desc
    limit: 500
    query_timezone: America/Los_Angeles
    value_labels: legend
    label_type: labPer
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    show_null_points: false
    point_style: none
    interpolation: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_types: {}
    series_colors:
      2018-03 - funnel_demo_view.total_cost: "#f7a105"
      2018-02 - funnel_demo_view.total_cost: "#f7d8bc"
      2018-03 - cumulative_cost: "#ffb400"
      2018-02 - cumulative_cost: "#ffe7ad"
      cumulative_cost: "#f7a400"
      Paid - cumulative_sessions: "#f7a400"
      Organic - cumulative_sessions: "#8bc677"
      Organic: "#fae5b4"
      Paid: "#f7a400"
    hidden_fields:
    x_axis_label: Date
    inner_radius: 50
    listen:
      Date: funnel_demo_view.date_filter
    note_state: collapsed
    note_display: above
    note_text: ''
    row: 28
    col: 16
    width: 8
    height: 5
  - title: Revenue
    name: Revenue Line
    model: funnel_demo
    explore: funnel_demo
    type: looker_line
    fields:
    - funnel_demo_view.date_day_of_month
    - funnel_demo_view.total_revenue
    - funnel_demo_view.date_month
    pivots:
    - funnel_demo_view.date_month
    fill_fields:
    - funnel_demo_view.date_day_of_month
    - funnel_demo_view.date_month
    filters:
      funnel_demo_view.date_month: 2 months ago for 2 months
    sorts:
    - funnel_demo_view.date_month 0
    - funnel_demo_view.date_day_of_month
    limit: 500
    dynamic_fields:
    - table_calculation: cumulative_revenue
      label: Cumulative Revenue
      expression: running_total(${funnel_demo_view.total_revenue})
      value_format:
      value_format_name: usd_0
      _kind_hint: measure
      _type_hint: number
    query_timezone: America/Los_Angeles
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    show_null_points: true
    point_style: none
    interpolation: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    hidden_fields:
    - funnel_demo_view.total_revenue
    series_colors:
      2018-03 - cumulative_cost: "#f7a400"
      2018-04 - cumulative_cost: "#f7a400"
      2018-02 - cumulative_cost: "#fae5b4"
      2018-03 - cumulative_transactions: "#f7a400"
      2018-02 - cumulative_transactions: "#fae5b4"
      2018-03 - cumulative_revenue: "#f7a400"
      2018-02 - cumulative_revenue: "#fae5b4"
    x_axis_label: Date
    listen:
      Date: funnel_demo_view.date_filter
    row: 6
    col: 16
    width: 8
    height: 9
  - title: Revenue
    name: Revenue Pie
    model: funnel_demo
    explore: funnel_demo
    type: looker_pie
    fields:
    - funnel_demo_view.paid_organic
    - funnel_demo_view.total_revenue
    filters:
      funnel_demo_view.date_filter: 1 days
      funnel_demo_view.timeframes: Selected Period
    sorts:
    - funnel_demo_view.paid_organic desc
    limit: 500
    query_timezone: America/Los_Angeles
    value_labels: legend
    label_type: labPer
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    show_null_points: false
    point_style: none
    interpolation: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_types: {}
    series_colors:
      2018-03 - funnel_demo_view.total_cost: "#f7a105"
      2018-02 - funnel_demo_view.total_cost: "#f7d8bc"
      2018-03 - cumulative_cost: "#ffb400"
      2018-02 - cumulative_cost: "#ffe7ad"
      cumulative_cost: "#f7a400"
      Paid - cumulative_sessions: "#f7a400"
      Organic - cumulative_sessions: "#8bc677"
      Organic: "#fae5b4"
      Paid: "#f7a400"
    hidden_fields:
    x_axis_label: Date
    inner_radius: 50
    listen:
      Date: funnel_demo_view.date_filter
    row: 33
    col: 16
    width: 8
    height: 5
  filters:
  - name: Date
    title: Date
    type: date_filter
    default_value: 1 months ago for 1 months
    allow_multiple_values: true
    required: false
