SELECT e.Code AS FirstCode
	,v.DateBegin AS FirstDateBegin
	,v.DateEnd AS FirstDateEnd
	,e_map.Code AS SecondCode
	,v_map.DateBegin AS SecondDateBegin
	,v_map.DateEnd AS SecondDateEnd
FROM dbo.Vacation AS v
	CROSS  JOIN dbo.Vacation AS v_map
	INNER JOIN dbo.Employee AS e ON e.ID = v.Id_Employee
	INNER JOIN dbo.Employee AS e_map ON e_map.ID = v_map.Id_Employee
WHERE v.ID_Employee > v_map.ID_Employee 
	AND DATEDIFF(day, v_map.DateEnd, v.DateBegin) <= 0 
	AND DATEDIFF(day, v_map.DateBegin, v.DateEnd) >= 0 
