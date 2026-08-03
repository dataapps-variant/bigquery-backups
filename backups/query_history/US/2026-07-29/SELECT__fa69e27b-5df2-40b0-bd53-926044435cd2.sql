-- job_id: fa69e27b-5df2-40b0-bd53-926044435cd2
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-29T19:07:15.226000+00:00
-- started: 2026-07-29T19:07:15.334000+00:00
-- ended: 2026-07-29T19:07:15.592000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'pdfdotnet' AND order_id IS NOT NULL
