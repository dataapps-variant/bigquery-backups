-- job_id: 62b5512b-7555-4a19-9bd5-40f559518cf3
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T02:02:16.110000+00:00
-- started: 2026-08-03T02:02:16.284000+00:00
-- ended: 2026-08-03T02:02:16.450000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'pdfdotnet' AND order_id IS NOT NULL
