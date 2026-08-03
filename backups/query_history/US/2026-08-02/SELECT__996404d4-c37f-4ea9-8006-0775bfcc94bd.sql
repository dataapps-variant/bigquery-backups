-- job_id: 996404d4-c37f-4ea9-8006-0775bfcc94bd
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-02T04:06:29.147000+00:00
-- started: 2026-08-02T04:06:29.283000+00:00
-- ended: 2026-08-02T04:06:29.426000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'mindworksllc' AND order_id IS NOT NULL
