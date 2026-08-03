-- job_id: b47aef54-0da2-4e83-97e5-d81eae8db0f6
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T15:02:33.067000+00:00
-- started: 2026-07-31T15:02:33.189000+00:00
-- ended: 2026-07-31T15:02:33.344000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'jobflowllc' AND order_id IS NOT NULL
