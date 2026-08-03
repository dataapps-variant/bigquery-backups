-- job_id: 4abf32b8-76ea-4ce8-a46b-277701283ce8
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-02T11:02:03.771000+00:00
-- started: 2026-08-02T11:02:03.913000+00:00
-- ended: 2026-08-02T11:02:04.036000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'mindworksllc' AND order_id IS NOT NULL
