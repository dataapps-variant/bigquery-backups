-- job_id: 705fa9ab-6d2a-4b80-82e6-7bb1658d2474
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-27T23:01:28.970000+00:00
-- started: 2026-07-27T23:01:29.066000+00:00
-- ended: 2026-07-27T23:01:29.202000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'jobflowllc' AND order_id IS NOT NULL
