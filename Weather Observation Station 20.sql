SELECT distinct format(PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY LAT_N) OVER (),'####.####') 
FROM station
