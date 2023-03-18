SELECT Name = 
    CASE 
        WHEN G.Grade >7 THEN S.Name 
        ELSE NULL 
    END, G.Grade , S.Marks 
FROM Students S JOIN Grades G ON S.Marks >= G.Min_Mark AND S.Marks <= G.Max_Mark 
ORDER BY Grade DESC,Name,Marks
