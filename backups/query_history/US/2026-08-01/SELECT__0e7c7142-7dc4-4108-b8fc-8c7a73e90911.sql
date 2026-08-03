-- job_id: 0e7c7142-7dc4-4108-b8fc-8c7a73e90911
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-01T22:05:03.224000+00:00
-- started: 2026-08-01T22:05:03.349000+00:00
-- ended: 2026-08-01T22:05:03.492000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'jobflowllc' AND order_id IS NOT NULL
