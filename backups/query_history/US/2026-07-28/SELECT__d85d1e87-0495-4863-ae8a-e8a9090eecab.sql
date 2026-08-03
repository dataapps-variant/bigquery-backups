-- job_id: d85d1e87-0495-4863-ae8a-e8a9090eecab
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:03:22.965000+00:00
-- started: 2026-07-28T10:03:23.063000+00:00
-- ended: 2026-07-28T10:03:23.167000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'mindworksllc' AND order_id IS NOT NULL
