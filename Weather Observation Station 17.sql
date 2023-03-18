select format(LONG_W,'####.####')
from station
where lat_n = (select min(lat_n) from station where lat_n > 38.7780)