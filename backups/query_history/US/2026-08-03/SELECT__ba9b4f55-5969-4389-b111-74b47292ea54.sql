-- job_id: ba9b4f55-5969-4389-b111-74b47292ea54
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T02:02:54.320000+00:00
-- started: 2026-08-03T02:02:54.464000+00:00
-- ended: 2026-08-03T02:02:54.591000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'mindworksllc' AND order_id IS NOT NULL
