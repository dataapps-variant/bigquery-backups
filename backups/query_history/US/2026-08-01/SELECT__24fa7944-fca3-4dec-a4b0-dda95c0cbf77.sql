-- job_id: 24fa7944-fca3-4dec-a4b0-dda95c0cbf77
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-01T07:07:02.458000+00:00
-- started: 2026-08-01T07:07:02.580000+00:00
-- ended: 2026-08-01T07:07:02.687000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'pdfdotnet' AND order_id IS NOT NULL
