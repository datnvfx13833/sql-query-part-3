SELECT id, age, coins_needed, power
FROM 
(
    SELECT W.id, WP.age, W.coins_needed, W.power,
    ROW_NUMBER() OVER 
        (
            PARTITION BY W.code,W.power  
            ORDER BY W.coins_needed, W.power DESC
        ) AS RowNumber
    FROM Wands W  JOIN Wands_Property WP  ON W.code = WP.code
    WHERE WP.is_evil = 0
)
AS Wand_Data
WHERE RowNumber = 1
ORDER BY power DESC, age DESC