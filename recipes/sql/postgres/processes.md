# Processes

```sql
SELECT
    pg_stat_activity.pid,
    pg_stat_activity.waiting,
    ROUND(EXTRACT(SECONDS FROM AGE(clock_timestamp(), query_start)) :: NUMERIC, 3) AS seconds,
    usename,
    query,
    pg_locks.mode,
    pg_locks.locktype,
    pg_locks.granted
FROM pg_stat_activity
INNER JOIN pg_locks on pg_stat_activity.pid = pg_locks.pid
ORDER BY 
    pg_locks.granted,
    pg_locks.pid DESC
;
```

Shorter:

```sql
SELECT DISTINCT
    pg_stat_activity.pid,
    usename,
    query
FROM pg_stat_activity
    INNER JOIN pg_locks ON pg_stat_activity.pid = pg_locks.pid
ORDER BY pid ASC
;
```
