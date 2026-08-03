-- job_id: 3f2f9a07-56e9-496e-94f5-cb3193249c58
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-01T02:04:16.431000+00:00
-- started: 2026-08-01T02:04:16.568000+00:00
-- ended: 2026-08-01T02:04:16.669000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'pdfdotnet' AND order_id IS NOT NULL
