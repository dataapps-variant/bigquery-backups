-- job_id: fedf00fe-bf30-4281-8e83-d1c028896358
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T01:07:17.814000+00:00
-- started: 2026-07-31T01:07:17.929000+00:00
-- ended: 2026-07-31T01:07:18.033000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'jobflowllc' AND order_id IS NOT NULL
