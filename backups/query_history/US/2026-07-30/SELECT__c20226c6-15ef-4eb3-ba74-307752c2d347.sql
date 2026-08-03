-- job_id: c20226c6-15ef-4eb3-ba74-307752c2d347
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-30T18:03:06.560000+00:00
-- started: 2026-07-30T18:03:06.690000+00:00
-- ended: 2026-07-30T18:03:06.900000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'formsourcellc' AND order_id IS NOT NULL
