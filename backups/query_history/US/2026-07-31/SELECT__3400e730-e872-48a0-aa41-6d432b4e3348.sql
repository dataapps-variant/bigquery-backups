-- job_id: 3400e730-e872-48a0-aa41-6d432b4e3348
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T17:03:33.333000+00:00
-- started: 2026-07-31T17:03:33.438000+00:00
-- ended: 2026-07-31T17:03:33.744000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'formsourcellc' AND order_id IS NOT NULL
