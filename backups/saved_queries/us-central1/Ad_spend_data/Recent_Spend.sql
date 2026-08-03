DECLARE report_date DATE DEFAULT DATE '2026-03-27';

SELECT SUM(allocated_spend)
FROM `variant-finance-data-project.Ad_spend_data.Merged_Spend_Split_TBL`
WHERE Date >= DATE_SUB(report_date, INTERVAL 6 DAY)
  AND Date <= report_date
  AND App_Name = "JF"
