-- job_id: 94e24423-a7af-4d16-9672-3a21c39fc38b
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-27T23:07:19.214000+00:00
-- started: 2026-07-27T23:07:19.313000+00:00
-- ended: 2026-07-27T23:07:19.414000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'formsourcellc' AND order_id IS NOT NULL
