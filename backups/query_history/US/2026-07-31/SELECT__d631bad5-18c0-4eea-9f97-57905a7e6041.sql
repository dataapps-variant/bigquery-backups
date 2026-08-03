-- job_id: d631bad5-18c0-4eea-9f97-57905a7e6041
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T11:01:10.216000+00:00
-- started: 2026-07-31T11:01:10.325000+00:00
-- ended: 2026-07-31T11:01:10.472000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'jobflowllc' AND order_id IS NOT NULL
