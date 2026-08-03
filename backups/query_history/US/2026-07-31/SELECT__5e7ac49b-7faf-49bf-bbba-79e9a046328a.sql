-- job_id: 5e7ac49b-7faf-49bf-bbba-79e9a046328a
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T01:03:44.160000+00:00
-- started: 2026-07-31T01:03:44.291000+00:00
-- ended: 2026-07-31T01:03:44.398000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'mindworksllc' AND order_id IS NOT NULL
