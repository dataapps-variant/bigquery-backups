-- job_id: fa752243-89c2-4f68-987c-e8e6c3c8c3a3
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-30T04:06:43.406000+00:00
-- started: 2026-07-30T04:06:43.521000+00:00
-- ended: 2026-07-30T04:06:43.610000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'formsourcellc' AND order_id IS NOT NULL
