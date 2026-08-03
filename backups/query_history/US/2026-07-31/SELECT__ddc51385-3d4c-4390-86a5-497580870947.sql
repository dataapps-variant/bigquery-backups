-- job_id: ddc51385-3d4c-4390-86a5-497580870947
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T08:04:55.593000+00:00
-- started: 2026-07-31T08:04:55.693000+00:00
-- ended: 2026-07-31T08:04:55.830000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'jobflowllc' AND order_id IS NOT NULL
