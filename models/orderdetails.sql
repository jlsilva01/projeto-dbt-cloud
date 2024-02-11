--order detail model
select
od.order_id, od.product_id, od.unit_price, od.quantity, pr.product_name, pr.supplier_id, pr.category_id,
cast ((od.unit_price * od.quantity) as numeric(14,2)) as total,
cast ((pr.unit_price * od.quantity) - (od.unit_price * od.quantity) as numeric(14,2)) as discount
from {{source('sources', 'order_details')}} od
left join {{source('sources', 'products')}} pr on (od.product_id = pr.product_id)