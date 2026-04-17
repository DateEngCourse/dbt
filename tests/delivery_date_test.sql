select *
  from {{ ref('order_target') }}
where status in ('Shipped','Delivered') 
  and DELIVERY_DATE is null 