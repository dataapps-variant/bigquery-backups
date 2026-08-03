-- job_id: 06c75e64-52fa-4729-abbc-2abb8a793f2c
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T18:02:40.682000+00:00
-- started: 2026-07-31T18:02:40.872000+00:00
-- ended: 2026-07-31T18:02:41.196000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'pdfdotnet' AND order_id IS NOT NULL
