--defining sales funnel and different stages


WITH funnel_stage as (
 SELECT
        COUNT(DISTINCT CASE WHEN event_type="page_view" THEN user_id END) AS stage_1_views,
        COUNT(DISTINCT CASE WHEN event_type="add_to_cart" THEN user_id END) AS stage_2_cart,
        COUNT(DISTINCT CASE WHEN event_type="checkout_start" THEN user_id END) AS stage_3_checkout,
        COUNT(DISTINCT CASE WHEN event_type="payment_info" THEN user_id END) AS stage_4_payment,
        COUNT(DISTINCT CASE WHEN event_type="purchase" THEN user_id END) AS stage_5_purchase

  from `manifest-virtue-445717-b0.SQL.user_event`
  
  where event_date>=TIMESTAMP(DATE_SUB(CURRENT_DATE(),INTERVAL 200 DAY))
  )



  --conversion rate through funnels

  SELECT 
  stage_1_views,
  stage_2_cart,
  round(stage_2_cart*100/stage_1_views) as view_to_cart_Ratio,
  stage_3_checkout,
  round(stage_3_checkout*100/stage_2_cart) as cart_to_checkout_Ratio,
  stage_4_payment,
  round(stage_4_payment*100/stage_3_checkout) as checkout_to_payment_Ratio,
  stage_5_purchase,
 round(stage_5_purchase*100/stage_4_payment) as payment_to_purchase_Ratio,
 round(stage_5_purchase*100/stage_1_views) as conversion_Ratio

FROM funnel_stage;



--funnel by source

with source_funnel as (
      select
      traffic_source, 
        COUNT(DISTINCT CASE WHEN event_type="page_view" THEN user_id END) AS views,
        COUNT(DISTINCT CASE WHEN event_type="add_to_cart" THEN user_id END) AS cart,
        COUNT(DISTINCT CASE WHEN event_type="purchase" THEN user_id END) AS purchase
        from `manifest-virtue-445717-b0.SQL.user_event`
        group by traffic_source
  
)
select traffic_source,views,cart,purchase,
round(cart*100/views) as view_tocart_rate,
round(purchase*100/cart) as cart_to_purchase_rate,
round(purchase*100/views) as conversion_rate,

 from source_funnel;

 --time to conversion analysis

 with user_journey as (
      select
      user_id, 
        MIN(CASE WHEN event_type="page_view" THEN event_date END) AS view_time,
        MIN(CASE WHEN event_type="add_to_cart" THEN event_date END) AS cart_time,
        MIN(CASE WHEN event_type="purchase" THEN event_date END) AS purchase_time
      from `manifest-virtue-445717-b0.SQL.user_event`
  
  where event_date>=TIMESTAMP(DATE_SUB(CURRENT_DATE(),INTERVAL 200 DAY))
  group by user_id
  HAVING MIN(CASE WHEN event_type="purchase" THEN user_id END) is not NULL
  )

  select count(*) as converted_users,
  Round(AVG(TIMESTAMP_DIFF(cart_time,view_time, MINUTE)),2) AS avg_view_to_cart_min,
  Round(AVG(TIMESTAMP_DIFF(purchase_time,cart_time,MINUTE)),2) AS avg_view_to_cart_min,
  Round(AVG(TIMESTAMP_DIFF(purchase_time,view_time, MINUTE)),2) AS avg_view_to_cart_min,

  from user_journey;

--revenue funnel analysis


 with funnel_revenue as (
      select
       
        count(distinct CASE WHEN event_type="page_view" THEN user_id END) AS total_visitors,
        count(distinct CASE WHEN event_type="purchase" THEN user_id END) AS total_buyers,--unique buyers
        sum(CASE WHEN event_type="purchase" THEN  amount END) AS total_revenue,
        count(CASE WHEN event_type="purchase" THEN 1 END) AS total_orders--total no of orders 
      from `manifest-virtue-445717-b0.SQL.user_event`
  
  where event_date>=TIMESTAMP(DATE_SUB(CURRENT_DATE(),INTERVAL 200 DAY))

  )
  select total_visitors,total_buyers,total_revenue,total_orders,
  total_revenue/total_buyers as avg_order_value,
  total_revenue/total_visitors as revenue_per_visitor,
  total_revenue/total_orders as revenue_per_orders,


   from funnel_revenue;

