-- job_id: c6e79d9b-6abd-4e24-9709-48978d128ce9
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-01T18:01:12.236000+00:00
-- started: 2026-08-01T18:01:12.370000+00:00
-- ended: 2026-08-01T18:01:12.489000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'formsourcellc' AND order_id IS NOT NULL
