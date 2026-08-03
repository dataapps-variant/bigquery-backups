-- job_id: 92071a49-258d-49fb-8a99-6ef64e0ea7f3
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-29T13:23:12.141000+00:00
-- started: 2026-07-29T13:23:12.399000+00:00
-- ended: 2026-07-29T13:23:12.531000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'formsourcellc' AND order_id IS NOT NULL
