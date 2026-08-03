-- job_id: d0f400b3-c9f9-46dc-9561-5043e1328221
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-02T06:01:21.948000+00:00
-- started: 2026-08-02T06:01:22.146000+00:00
-- ended: 2026-08-02T06:01:22.266000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'mindworksllc' AND order_id IS NOT NULL
