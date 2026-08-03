-- job_id: 7458dd5f-8bc8-4776-90d2-dc173eabf64e
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-30T09:01:15.400000+00:00
-- started: 2026-07-30T09:01:15.505000+00:00
-- ended: 2026-07-30T09:01:15.633000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'jobflowllc' AND order_id IS NOT NULL
