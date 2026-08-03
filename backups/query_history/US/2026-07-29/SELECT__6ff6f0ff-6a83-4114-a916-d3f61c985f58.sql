-- job_id: 6ff6f0ff-6a83-4114-a916-d3f61c985f58
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-29T12:01:10.672000+00:00
-- started: 2026-07-29T12:01:10.769000+00:00
-- ended: 2026-07-29T12:01:10.893000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'jobflowllc' AND order_id IS NOT NULL
