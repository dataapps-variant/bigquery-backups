-- job_id: 1cd23314-2b70-4a24-8ea1-0d5fc92a4ff2
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-01T20:07:29.094000+00:00
-- started: 2026-08-01T20:07:29.222000+00:00
-- ended: 2026-08-01T20:07:29.347000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'formsourcellc' AND order_id IS NOT NULL
