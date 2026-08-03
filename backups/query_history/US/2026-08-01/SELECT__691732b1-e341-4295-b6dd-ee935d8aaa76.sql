-- job_id: 691732b1-e341-4295-b6dd-ee935d8aaa76
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-01T11:03:30.602000+00:00
-- started: 2026-08-01T11:03:30.693000+00:00
-- ended: 2026-08-01T11:03:30.784000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'pdfdotnet' AND order_id IS NOT NULL
