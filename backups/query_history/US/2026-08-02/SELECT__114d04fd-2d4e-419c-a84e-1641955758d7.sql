-- job_id: 114d04fd-2d4e-419c-a84e-1641955758d7
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-02T05:03:54.966000+00:00
-- started: 2026-08-02T05:03:55.110000+00:00
-- ended: 2026-08-02T05:03:55.226000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'mindworksllc' AND order_id IS NOT NULL
