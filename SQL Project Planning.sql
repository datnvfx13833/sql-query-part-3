WITH CTE_Projects AS 
(
  SELECT Start_Date, End_Date, ROW_NUMBER() OVER (ORDER BY Start_Date) AS RowNumber
  FROM Projects WITH (NOLOCK)
)
SELECT MIN(Start_Date), MAX(End_Date) 
FROM CTE_Projects WITH (NOLOCK)
GROUP BY DATEDIFF(DAY, RowNumber, Start_Date)
ORDER BY DATEDIFF(DAY, MIN(Start_Date), MAX(End_Date)), MIN(Start_Date)