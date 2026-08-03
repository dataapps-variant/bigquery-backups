-- job_id: 3317ca0e-c17c-4f31-aea8-37205772d6ca
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-02T15:03:05.282000+00:00
-- started: 2026-08-02T15:03:05.364000+00:00
-- ended: 2026-08-02T15:03:05.477000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'mindworksllc' AND order_id IS NOT NULL
