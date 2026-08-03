-- job_id: 1c62a9a5-4f2e-4a68-959c-827a2f0fef7b
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-02T00:01:29.734000+00:00
-- started: 2026-08-02T00:01:29.820000+00:00
-- ended: 2026-08-02T00:01:29.925000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'pdfdotnet' AND order_id IS NOT NULL
