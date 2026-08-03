-- job_id: 5e4158a9-3706-4762-9d63-5dc4779b56b8
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-30T07:07:59.978000+00:00
-- started: 2026-07-30T07:08:00.123000+00:00
-- ended: 2026-07-30T07:08:00.226000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'mindworksllc' AND order_id IS NOT NULL
