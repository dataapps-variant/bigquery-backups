-- job_id: fa89d24d-2c53-46de-99a1-b755092f2eb3
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-30T14:03:15.843000+00:00
-- started: 2026-07-30T14:03:15.951000+00:00
-- ended: 2026-07-30T14:03:16.086000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'pdfdotnet' AND order_id IS NOT NULL
