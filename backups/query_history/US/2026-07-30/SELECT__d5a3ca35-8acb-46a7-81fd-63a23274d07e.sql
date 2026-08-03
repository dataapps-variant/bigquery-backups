-- job_id: d5a3ca35-8acb-46a7-81fd-63a23274d07e
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-30T13:05:13.490000+00:00
-- started: 2026-07-30T13:05:13.617000+00:00
-- ended: 2026-07-30T13:05:13.748000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'jobflowllc' AND order_id IS NOT NULL
