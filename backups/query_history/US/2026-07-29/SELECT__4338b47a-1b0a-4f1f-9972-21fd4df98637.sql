-- job_id: 4338b47a-1b0a-4f1f-9972-21fd4df98637
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-29T01:05:14.216000+00:00
-- started: 2026-07-29T01:05:14.380000+00:00
-- ended: 2026-07-29T01:05:14.560000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'jobflowllc' AND order_id IS NOT NULL
