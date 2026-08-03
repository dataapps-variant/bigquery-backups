-- job_id: 07b7b8c6-3bd6-4e06-ad56-3429f5c3255e
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-01T13:16:46.385000+00:00
-- started: 2026-08-01T13:16:46.508000+00:00
-- ended: 2026-08-01T13:16:46.601000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'jobflowllc' AND order_id IS NOT NULL
