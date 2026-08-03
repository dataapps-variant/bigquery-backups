-- job_id: db1f6dd0-d355-446c-a1a2-16553bf4a0fa
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T03:07:20.932000+00:00
-- started: 2026-08-03T03:07:21.078000+00:00
-- ended: 2026-08-03T03:07:21.181000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'mindworksllc' AND order_id IS NOT NULL
