-- job_id: f3dac3bf-a366-4546-b7aa-787c53f2105b
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-27T23:01:12.452000+00:00
-- started: 2026-07-27T23:01:12.569000+00:00
-- ended: 2026-07-27T23:01:12.730000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'mindworksllc' AND order_id IS NOT NULL
