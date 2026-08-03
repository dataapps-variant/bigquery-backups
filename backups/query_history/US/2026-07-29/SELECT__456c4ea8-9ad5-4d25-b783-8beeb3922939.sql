-- job_id: 456c4ea8-9ad5-4d25-b783-8beeb3922939
-- user: 1041741270489-compute@developer.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-29T12:00:09.920000+00:00
-- started: 2026-07-29T12:00:10.024000+00:00
-- ended: 2026-07-29T12:00:10.252000+00:00

SELECT Reporting_Date AS report_date, CASE WHEN App_Name = 'CT-JP' THEN 'CT - JP' WHEN App_Name = 'CT-Non-JP' THEN 'CT - US' ELSE App_Name END AS app, CASE WHEN Plan_Name LIKE '%-%' THEN SUBSTR(Plan_Name, 0, STRPOS(Plan_Name, '-')-1) ELSE Plan_Name END AS plan, Gross_ARPU_BC4 AS gross_arpu, Net_ARPU_BC4 AS net_arpu
FROM `variant-finance-data-project.Sticky_Reports.BC4_ARPU_Refund_Report`
WHERE Reporting_Date BETWEEN current_date-120 AND current_date-1 AND Gross_ARPU_BC4 IS NOT NULL AND App_Name NOT IN ('CT', 'CN', 'AT', 'IQ')
