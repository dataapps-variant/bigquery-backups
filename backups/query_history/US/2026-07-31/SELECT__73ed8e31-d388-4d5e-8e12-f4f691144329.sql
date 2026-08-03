-- job_id: 73ed8e31-d388-4d5e-8e12-f4f691144329
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T11:07:19.763000+00:00
-- started: 2026-07-31T11:07:19.866000+00:00
-- ended: 2026-07-31T11:07:19.985000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'mindworksllc' AND order_id IS NOT NULL
