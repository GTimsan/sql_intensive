with agg as (select b.user_id
                  , b.type                       as type
                  , sum(b.money)                 as volume
                  , c.name                       as currency_name
                  , coalesce(c.rate_to_usd, 1)   as last_rate_to_usd
                  , sum(b.money * coalesce(c.rate_to_usd, 1)) as total_volume_in_usd
             from balance b
                      left join currency c on b.currency_id = c.id
                 and c.updated = (select max(updated)
                                  from currency
                                  where id = b.currency_id)
             group by b.user_id, type, currency_name, last_rate_to_usd
             order by 1, 3
)
select
    coalesce(u.name, 'not defined') as name
     , coalesce(u.lastname, 'not defined') as lastname
     , agg.type
     , agg.volume
     , coalesce(agg.currency_name, 'not defined') as currency_name
     , agg.last_rate_to_usd
     , agg.total_volume_in_usd
from agg
         join "user" u on agg.user_id = u.id
order by
    name desc, lastname, agg.type;
