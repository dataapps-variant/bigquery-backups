-- job_id: 97b13c0c-cf29-43c4-a00c-a7c91088935d
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T20:08:11.730000+00:00
-- started: 2026-07-28T20:08:11.872000+00:00
-- ended: 2026-07-28T20:08:11.993000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'jobflowllc' AND order_id IS NOT NULL
