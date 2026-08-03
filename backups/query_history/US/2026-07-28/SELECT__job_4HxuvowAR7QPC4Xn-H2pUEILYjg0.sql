-- job_id: job_4HxuvowAR7QPC4Xn-H2pUEILYjg0
-- user: apache-superset-admin@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T13:09:08.499000+00:00
-- started: 2026-07-28T13:09:08.590000+00:00
-- ended: 2026-07-28T13:09:08.771000+00:00

SELECT `App_Name` AS `App_Name` 
FROM `CWC`.`CWC_App_AFID` GROUP BY `App_Name` ORDER BY `App_Name` ASC
 LIMIT 1000
