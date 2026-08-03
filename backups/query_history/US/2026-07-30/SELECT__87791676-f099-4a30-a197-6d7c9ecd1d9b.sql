-- job_id: 87791676-f099-4a30-a197-6d7c9ecd1d9b
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-30T07:01:21.687000+00:00
-- started: 2026-07-30T07:01:21.813000+00:00
-- ended: 2026-07-30T07:01:21.960000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'jobflowllc' AND order_id IS NOT NULL
