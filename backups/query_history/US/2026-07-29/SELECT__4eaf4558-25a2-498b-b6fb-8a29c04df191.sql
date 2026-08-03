-- job_id: 4eaf4558-25a2-498b-b6fb-8a29c04df191
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-29T03:01:20.176000+00:00
-- started: 2026-07-29T03:01:20.337000+00:00
-- ended: 2026-07-29T03:01:20.453000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'formsourcellc' AND order_id IS NOT NULL
