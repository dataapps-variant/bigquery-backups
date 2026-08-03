-- job_id: 7bb2c26e-29fd-494b-a245-a8cc8792e8ff
-- user: 1041741270489-compute@developer.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:00:10.929000+00:00
-- started: 2026-08-03T12:00:11.017000+00:00
-- ended: 2026-08-03T12:00:11.240000+00:00

SELECT Reporting_Date AS report_date, CASE WHEN App_Name = 'CT-JP' THEN 'CT - JP' WHEN App_Name = 'CT-Non-JP' THEN 'CT - US' ELSE App_Name END AS app, CASE WHEN Plan_Name LIKE '%-%' THEN SUBSTR(Plan_Name, 0, STRPOS(Plan_Name, '-')-1) ELSE Plan_Name END AS plan, Gross_ARPU_BC4 AS gross_arpu, Net_ARPU_BC4 AS net_arpu
FROM `variant-finance-data-project.Sticky_Reports.BC4_ARPU_Refund_Report`
WHERE Reporting_Date BETWEEN current_date-120 AND current_date-1 AND Gross_ARPU_BC4 IS NOT NULL AND App_Name NOT IN ('CT', 'CN', 'AT', 'IQ')
