-- job_id: 86e54b74-717f-4e40-87eb-70c81ee57799
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-27T20:07:31.472000+00:00
-- started: 2026-07-27T20:07:31.575000+00:00
-- ended: 2026-07-27T20:07:31.717000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'mindworksllc' AND order_id IS NOT NULL
