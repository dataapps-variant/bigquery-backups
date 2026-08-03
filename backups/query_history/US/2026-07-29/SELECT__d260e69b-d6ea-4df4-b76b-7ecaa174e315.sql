-- job_id: d260e69b-d6ea-4df4-b76b-7ecaa174e315
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-29T02:02:54.176000+00:00
-- started: 2026-07-29T02:02:54.266000+00:00
-- ended: 2026-07-29T02:02:54.389000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'pdfdotnet' AND order_id IS NOT NULL
