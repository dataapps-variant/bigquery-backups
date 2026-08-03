-- job_id: 22f10a84-eb39-4d2c-9b3b-d1224eb0174d
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T04:02:12.043000+00:00
-- started: 2026-08-03T04:02:12.192000+00:00
-- ended: 2026-08-03T04:02:12.293000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'pdfdotnet' AND order_id IS NOT NULL
