-- job_id: 9f3402f7-f450-4070-9bbc-9382b8fe5822
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-02T03:03:30.621000+00:00
-- started: 2026-08-02T03:03:30.761000+00:00
-- ended: 2026-08-02T03:03:30.869000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'mindworksllc' AND order_id IS NOT NULL
