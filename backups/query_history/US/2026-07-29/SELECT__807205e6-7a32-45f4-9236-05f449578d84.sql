-- job_id: 807205e6-7a32-45f4-9236-05f449578d84
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-29T21:04:16.795000+00:00
-- started: 2026-07-29T21:04:16.918000+00:00
-- ended: 2026-07-29T21:04:17.035000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'formsourcellc' AND order_id IS NOT NULL
