-- job_id: 147e8f1c-64dd-402d-a2a7-85784c276901
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-29T17:07:50.792000+00:00
-- started: 2026-07-29T17:07:51.003000+00:00
-- ended: 2026-07-29T17:07:51.115000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'pdfdotnet' AND order_id IS NOT NULL
