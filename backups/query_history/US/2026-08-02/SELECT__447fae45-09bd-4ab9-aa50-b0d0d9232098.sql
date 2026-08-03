-- job_id: 447fae45-09bd-4ab9-aa50-b0d0d9232098
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-02T08:02:51.916000+00:00
-- started: 2026-08-02T08:02:52.022000+00:00
-- ended: 2026-08-02T08:02:52.195000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'mindworksllc' AND order_id IS NOT NULL
