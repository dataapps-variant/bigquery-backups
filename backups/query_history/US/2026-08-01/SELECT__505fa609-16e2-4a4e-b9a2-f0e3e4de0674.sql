-- job_id: 505fa609-16e2-4a4e-b9a2-f0e3e4de0674
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-01T18:02:02.890000+00:00
-- started: 2026-08-01T18:02:03.017000+00:00
-- ended: 2026-08-01T18:02:03.120000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'pdfdotnet' AND order_id IS NOT NULL
