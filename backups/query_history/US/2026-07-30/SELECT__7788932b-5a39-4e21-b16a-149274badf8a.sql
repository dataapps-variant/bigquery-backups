-- job_id: 7788932b-5a39-4e21-b16a-149274badf8a
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-30T04:05:15.881000+00:00
-- started: 2026-07-30T04:05:16.024000+00:00
-- ended: 2026-07-30T04:05:16.129000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'jobflowllc' AND order_id IS NOT NULL
