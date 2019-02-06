USE Geography
SELECT ContinentCode, CurrencyCode, CurrencyUsage FROM
(
	SELECT ContinentCode, CurrencyCode, CurrencyUsage,
	RANK() OVER(PARTITION BY(ContinentCode) ORDER BY CurrencyUsage DESC) AS Ranking
	FROM
	(
		SELECT ContinentCode, CurrencyCode, COUNT(CurrencyCode) AS CurrencyUsage 
	    FROM Countries
		GROUP BY CurrencyCode, ContinentCode
		HAVING COUNT(CurrencyCode) > 1
	) AS Currencies
) AS Result
WHERE Ranking = 1