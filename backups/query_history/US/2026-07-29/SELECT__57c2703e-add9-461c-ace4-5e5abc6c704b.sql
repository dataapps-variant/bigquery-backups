-- job_id: 57c2703e-add9-461c-ace4-5e5abc6c704b
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-29T21:07:08.389000+00:00
-- started: 2026-07-29T21:07:08.530000+00:00
-- ended: 2026-07-29T21:07:08.672000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'pdfdotnet' AND order_id IS NOT NULL
