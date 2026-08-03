-- job_id: e4a537b6-0c1d-4e51-af09-2a0576a91cd2
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T13:07:46.049000+00:00
-- started: 2026-07-31T13:07:46.135000+00:00
-- ended: 2026-07-31T13:07:46.258000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'pdfdotnet' AND order_id IS NOT NULL
