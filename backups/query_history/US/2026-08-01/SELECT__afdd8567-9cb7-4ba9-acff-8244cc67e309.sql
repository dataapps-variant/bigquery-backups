-- job_id: afdd8567-9cb7-4ba9-acff-8244cc67e309
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-01T01:03:25.990000+00:00
-- started: 2026-08-01T01:03:26.147000+00:00
-- ended: 2026-08-01T01:03:26.266000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'mindworksllc' AND order_id IS NOT NULL
