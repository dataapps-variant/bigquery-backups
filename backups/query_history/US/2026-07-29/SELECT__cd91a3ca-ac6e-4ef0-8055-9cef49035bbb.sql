-- job_id: cd91a3ca-ac6e-4ef0-8055-9cef49035bbb
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-29T16:07:40.585000+00:00
-- started: 2026-07-29T16:07:40.705000+00:00
-- ended: 2026-07-29T16:07:40.801000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'formsourcellc' AND order_id IS NOT NULL
