-- job_id: 0c60b201-b3d8-477c-b05a-75bfbc00e61c
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T23:03:08.444000+00:00
-- started: 2026-07-28T23:03:08.543000+00:00
-- ended: 2026-07-28T23:03:08.654000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'jobflowllc' AND order_id IS NOT NULL
