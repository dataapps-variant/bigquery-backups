-- job_id: 33501bc5-e7a2-40f8-b170-a7470284cd86
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T05:06:12.426000+00:00
-- started: 2026-07-28T05:06:12.518000+00:00
-- ended: 2026-07-28T05:06:12.663000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'pdfdotnet' AND order_id IS NOT NULL
