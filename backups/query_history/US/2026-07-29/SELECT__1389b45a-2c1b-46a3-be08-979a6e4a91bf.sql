-- job_id: 1389b45a-2c1b-46a3-be08-979a6e4a91bf
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-29T22:05:23.436000+00:00
-- started: 2026-07-29T22:05:23.555000+00:00
-- ended: 2026-07-29T22:05:23.665000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'jobflowllc' AND order_id IS NOT NULL
