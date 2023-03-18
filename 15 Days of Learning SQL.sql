with temp as (
select submission_date,hacker_id,count(submission_id)c
    from submissions a
    group by submission_date,hacker_id
),
hacker as (
select submission_date,hacker_id, c ,row_number()over (partition by submission_date order by c desc, hacker_id) rank
    from temp
),
date as (
select distinct submission_date, row_number()over(order by submission_date) rank from (select distinct submission_date from submissions)a 
),
rank as (
select a.submission_date,rank,hacker_id,count(b.submission_date) c from date a
left join temp b on a.submission_date >=b.submission_date  
group by a.submission_date,rank,hacker_id
having count(b.submission_date) =rank
    )
    
select a.submission_date,count(a.hacker_id),b.hacker_id,name from rank a 
left join hacker b on a.submission_date=b.submission_date and b.rank=1
left join hackers c on b.hacker_id=c.hacker_id
group by a.submission_date,b.hacker_id,name 
order by 1