-- job_id: f1e282d5-f9cf-41bc-b4ed-b23ab36c629e
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T03:03:39.613000+00:00
-- started: 2026-07-31T03:03:39.719000+00:00
-- ended: 2026-07-31T03:03:39.851000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'mindworksllc' AND order_id IS NOT NULL
