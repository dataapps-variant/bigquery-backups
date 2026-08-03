-- job_id: 1a831129-f6e2-4638-b427-8250b29cc6d9
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T06:03:27.340000+00:00
-- started: 2026-08-03T06:03:27.534000+00:00
-- ended: 2026-08-03T06:03:27.667000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'formsourcellc' AND order_id IS NOT NULL
