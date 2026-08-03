-- job_id: e96f329b-45b7-4802-b622-dcee51a26b62
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T07:06:11.753000+00:00
-- started: 2026-07-28T07:06:11.860000+00:00
-- ended: 2026-07-28T07:06:11.962000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'jobflowllc' AND order_id IS NOT NULL
