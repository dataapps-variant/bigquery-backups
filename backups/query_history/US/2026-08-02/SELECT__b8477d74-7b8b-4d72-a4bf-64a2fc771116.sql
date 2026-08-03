-- job_id: b8477d74-7b8b-4d72-a4bf-64a2fc771116
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-02T12:03:47.956000+00:00
-- started: 2026-08-02T12:03:48.135000+00:00
-- ended: 2026-08-02T12:03:48.257000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'mindworksllc' AND order_id IS NOT NULL
