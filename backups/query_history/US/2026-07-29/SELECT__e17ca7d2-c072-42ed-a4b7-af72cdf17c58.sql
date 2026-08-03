-- job_id: e17ca7d2-c072-42ed-a4b7-af72cdf17c58
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-29T06:14:08.930000+00:00
-- started: 2026-07-29T06:14:09.058000+00:00
-- ended: 2026-07-29T06:14:09.233000+00:00


           SELECT DISTINCT order_id, last_modified 
           FROM `variant-finance-data-project.Sticky_Data.missing_updated_orders` 
           WHERE company = 'pdfdotnet' AND order_id IS NOT NULL
