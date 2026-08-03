-- job_id: 4c61c5b0-64c1-4c96-ba3d-721ecc08c6a5
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-29T06:03:42.965000+00:00
-- started: 2026-07-29T06:03:43.056000+00:00
-- ended: 2026-07-29T06:03:43.175000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'formsourcellc' AND order_id IS NOT NULL
