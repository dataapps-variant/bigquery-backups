-- job_id: ee564b11-931d-4204-b5a7-3a91d183bd53
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-29T13:35:15.939000+00:00
-- started: 2026-07-29T13:35:16.057000+00:00
-- ended: 2026-07-29T13:35:16.179000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'mindworksllc' AND order_id IS NOT NULL
