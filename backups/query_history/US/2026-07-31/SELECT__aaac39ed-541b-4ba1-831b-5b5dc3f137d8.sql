-- job_id: aaac39ed-541b-4ba1-831b-5b5dc3f137d8
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T16:11:18.893000+00:00
-- started: 2026-07-31T16:11:19.063000+00:00
-- ended: 2026-07-31T16:11:19.198000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'jobflowllc' AND order_id IS NOT NULL
