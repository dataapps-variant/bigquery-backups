-- job_id: script_job_6eebc7e2c309aacab2a5895d83178624_1
-- user: dataapps@variant.net
-- statement_type: CREATE_TABLE_AS_SELECT
-- created: 2026-07-29T17:19:56.156000+00:00
-- started: 2026-07-29T17:19:56.511000+00:00
-- ended: 2026-07-29T17:20:06.315000+00:00

CREATE OR REPLACE TABLE `variant-finance-data-project.Ad_spend_data.Spend_Matching_Channel` AS
  SELECT
    App_Name,
    Channel_name,
    Channel_code,
    SUM(CASE WHEN DATE_TRUNC(Date, MONTH) = '2025-01-01' THEN allocated_spend ELSE 0 END) AS `Jan_2025`,
    SUM(CASE WHEN DATE_TRUNC(Date, MONTH) = '2025-02-01' THEN allocated_spend ELSE 0 END) AS `Feb_2025`,
    SUM(CASE WHEN DATE_TRUNC(Date, MONTH) = '2025-03-01' THEN allocated_spend ELSE 0 END) AS `Mar_2025`,
    SUM(CASE WHEN DATE_TRUNC(Date, MONTH) = '2025-04-01' THEN allocated_spend ELSE 0 END) AS `Apr_2025`,
    SUM(CASE WHEN DATE_TRUNC(Date, MONTH) = '2025-05-01' THEN allocated_spend ELSE 0 END) AS `May_2025`,
    SUM(CASE WHEN DATE_TRUNC(Date, MONTH) = '2025-06-01' THEN allocated_spend ELSE 0 END) AS `Jun_2025`,
    SUM(CASE WHEN DATE_TRUNC(Date, MONTH) = '2025-07-01' THEN allocated_spend ELSE 0 END) AS `Jul_2025`,
    SUM(CASE WHEN DATE_TRUNC(Date, MONTH) = '2025-08-01' THEN allocated_spend ELSE 0 END) AS `Aug_2025`,
    SUM(CASE WHEN DATE_TRUNC(Date, MONTH) = '2025-09-01' THEN allocated_spend ELSE 0 END) AS `Sep_2025`,
    SUM(CASE WHEN DATE_TRUNC(Date, MONTH) = '2025-10-01' THEN allocated_spend ELSE 0 END) AS `Oct_2025`,
    SUM(CASE WHEN DATE_TRUNC(Date, MONTH) = '2025-11-01' THEN allocated_spend ELSE 0 END) AS `Nov_2025`,
    SUM(CASE WHEN DATE_TRUNC(Date, MONTH) = '2025-12-01' THEN allocated_spend ELSE 0 END) AS `Dec_2025`,
    SUM(CASE WHEN DATE_TRUNC(Date, MONTH) = '2026-01-01' THEN allocated_spend ELSE 0 END) AS `Jan_2026`,
    SUM(CASE WHEN DATE_TRUNC(Date, MONTH) = '2026-02-01' THEN allocated_spend ELSE 0 END) AS `Feb_2026`,
    SUM(CASE WHEN DATE_TRUNC(Date, MONTH) = '2026-03-01' THEN allocated_spend ELSE 0 END) AS `Mar_2026`,
    SUM(CASE WHEN DATE_TRUNC(Date, MONTH) = '2026-04-01' THEN allocated_spend ELSE 0 END) AS `Apr_2026`,
    SUM(CASE WHEN DATE_TRUNC(Date, MONTH) = '2026-05-01' THEN allocated_spend ELSE 0 END) AS `May_2026`,
    SUM(CASE WHEN DATE_TRUNC(Date, MONTH) = '2026-06-01' THEN allocated_spend ELSE 0 END) AS `Jun_2026`
  FROM
    `variant-finance-data-project.Ad_spend_data.Merged_Spend_Split_TBL`
  WHERE
    Date BETWEEN '2025-01-01' AND '2026-06-30'
  GROUP BY
    App_Name, Channel_name, Channel_code
  ORDER BY
    App_Name, Channel_name, Channel_code
