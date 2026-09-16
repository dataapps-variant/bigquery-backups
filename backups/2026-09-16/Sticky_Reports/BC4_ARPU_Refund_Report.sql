CREATE OR REPLACE TABLE `variant-finance-data-project.ICARUS_Multi.BC4_ARPU_Report` AS
SELECT
  Reporting_Date,
  Plan_Name,
  App_Name,
  Entity_Name,
  AVG(Gross_ARPU_Discounted) AS Gross_ARPU_BC4,
  AVG(Net_ARPU_Discounted) AS Net_ARPU_BC4,
  COUNT(*) AS source_row_count
FROM
  `variant-finance-data-project.ICARUS_Multi.Final_Table`
WHERE
  BC = 4
  AND Table = 'Regular'
  AND Cohort = '7K'
GROUP BY
  Reporting_Date,
  Plan_Name,
  App_Name,
  Entity_Name
ORDER BY
  Reporting_Date DESC,
  Plan_Name;
