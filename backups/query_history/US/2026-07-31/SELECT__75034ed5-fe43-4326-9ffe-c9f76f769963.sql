-- job_id: 75034ed5-fe43-4326-9ffe-c9f76f769963
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T11:01:37.892000+00:00
-- started: 2026-07-31T11:01:37.998000+00:00
-- ended: 2026-07-31T11:01:38.266000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'pdfdotnet' AND order_id IS NOT NULL
