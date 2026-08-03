-- job_id: 9c1b3b40-bece-4c67-a933-9ed458637c52
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-01T15:01:41.399000+00:00
-- started: 2026-08-01T15:01:41.569000+00:00
-- ended: 2026-08-01T15:01:41.687000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'pdfdotnet' AND order_id IS NOT NULL
