select *
from publications.employee emp
right join publications.jobs job
on emp.job_id=job.job_id
union
select *
from publications.employee emp
left join publications.jobs job
on emp.job_id=job.job_id;



select stores.stor_name as store,
count(distinct(ord_num)) as orders,
count(title_id) as items, sum(qty) as qty
from publications.sales sales
inner join publications.stores stores
on stores.stor_id=sales.stor_id
group by store;





select store, items/orders as avgitems,
qty/items avgqty
from
(select stores.stor_name as store,
count(distinct(ord_num)) as orders,
count(title_id) as items, sum(qty) as qty
from publications.sales sales
inner join publications.stores stores
on stores.stor_id=sales.stor_id
group by store) averages
;






select store, ord_num as orderNumber,
title, sales.qty as qty,
price, type, (sales.qty*price) as revenue
from
(select stores.stor_id as storeID,
stores.stor_name as store, 
count(distinct(ord_num)) as orders,
count(title_id) as items, 
sum(qty) as qty
from publications.sales sales
inner join publications.stores stores
on stores.stor_id=sales.stor_id
group by storeID, store
) summary
inner join publications.sales sales
on summary.storeID=sales.stor_id
inner join publications.titles 
on sales.title_id=titles.title_id
where items/orders>1









create temporary table publications.store_sales_summary
select stores.stor_id as storeID, stores.stor_name as store,
count(distinct(ord_num)) as orders, 
count(title_id) as items, sum(qty) as qty
from publications.sales sales
inner join publications.stores stores
on stores.stor_id=sales.stor_id
group by storeID, store
;


select *
from publications.store_sales_summary;


















