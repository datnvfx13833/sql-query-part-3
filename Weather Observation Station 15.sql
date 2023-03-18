select format(LONG_W,'####.####')
from station
where LAT_N = (select max(LAT_N) from station where LAT_N<137.2345)