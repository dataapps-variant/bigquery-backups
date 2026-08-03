-- job_id: e7b2b599-a7ab-499e-8fbc-92b9e66a7311
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-01T01:01:21.085000+00:00
-- started: 2026-08-01T01:01:21.231000+00:00
-- ended: 2026-08-01T01:01:21.367000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'pdfdotnet' AND order_id IS NOT NULL
