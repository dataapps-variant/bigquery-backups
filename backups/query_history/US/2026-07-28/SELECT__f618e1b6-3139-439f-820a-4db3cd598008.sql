-- job_id: f618e1b6-3139-439f-820a-4db3cd598008
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T03:02:09.965000+00:00
-- started: 2026-07-28T03:02:10.079000+00:00
-- ended: 2026-07-28T03:02:10.207000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'mindworksllc' AND order_id IS NOT NULL
