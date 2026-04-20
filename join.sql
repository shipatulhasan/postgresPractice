select *
from posts
    -- inner JOIN

select * from posts p join users s on p.user_id = s.id

-- left outer join
select p.post, s.user_name
from posts p
    left join users s on p.user_id = s.id

select * from users s left join posts p on s.id = p.user_id