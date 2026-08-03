-- job_id: da8fe2a3-cf0b-47f3-9f78-de53783b8911
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-29T01:00:59.380000+00:00
-- started: 2026-07-29T01:00:59.541000+00:00
-- ended: 2026-07-29T01:00:59.671000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'formsourcellc' AND order_id IS NOT NULL
