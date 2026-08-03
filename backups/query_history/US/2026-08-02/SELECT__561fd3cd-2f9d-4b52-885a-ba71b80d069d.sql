-- job_id: 561fd3cd-2f9d-4b52-885a-ba71b80d069d
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-02T14:01:30.959000+00:00
-- started: 2026-08-02T14:01:31.086000+00:00
-- ended: 2026-08-02T14:01:31.217000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'mindworksllc' AND order_id IS NOT NULL
