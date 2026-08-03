-- job_id: 8910eda9-b0b5-4898-a564-f70b96349764
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-27T18:01:36.066000+00:00
-- started: 2026-07-27T18:01:36.152000+00:00
-- ended: 2026-07-27T18:01:36.314000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'mindworksllc' AND order_id IS NOT NULL
