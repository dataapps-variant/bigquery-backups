-- job_id: 33b719bc-0ea8-484d-9e5f-bcc51f60d7d9
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T09:04:13.597000+00:00
-- started: 2026-07-28T09:04:13.689000+00:00
-- ended: 2026-07-28T09:04:13.806000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'jobflowllc' AND order_id IS NOT NULL
