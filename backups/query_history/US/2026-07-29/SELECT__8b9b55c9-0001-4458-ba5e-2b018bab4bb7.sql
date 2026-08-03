-- job_id: 8b9b55c9-0001-4458-ba5e-2b018bab4bb7
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-29T21:02:56.609000+00:00
-- started: 2026-07-29T21:02:56.786000+00:00
-- ended: 2026-07-29T21:02:56.908000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'mindworksllc' AND order_id IS NOT NULL
