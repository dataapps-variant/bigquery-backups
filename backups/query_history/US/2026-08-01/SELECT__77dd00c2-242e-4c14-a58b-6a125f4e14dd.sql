-- job_id: 77dd00c2-242e-4c14-a58b-6a125f4e14dd
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-01T06:03:45.805000+00:00
-- started: 2026-08-01T06:03:45.942000+00:00
-- ended: 2026-08-01T06:03:46.161000+00:00


           SELECT DISTINCT order_id, last_modified 
           FROM `variant-finance-data-project.Sticky_Data.missing_updated_orders` 
           WHERE company = 'formsourcellc' AND order_id IS NOT NULL
