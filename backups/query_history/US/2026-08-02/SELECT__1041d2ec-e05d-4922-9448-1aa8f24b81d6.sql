-- job_id: 1041d2ec-e05d-4922-9448-1aa8f24b81d6
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-02T23:02:37.056000+00:00
-- started: 2026-08-02T23:02:37.180000+00:00
-- ended: 2026-08-02T23:02:37.318000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'mindworksllc' AND order_id IS NOT NULL
