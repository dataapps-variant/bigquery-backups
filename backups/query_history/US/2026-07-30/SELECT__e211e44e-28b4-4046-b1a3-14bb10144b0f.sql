-- job_id: e211e44e-28b4-4046-b1a3-14bb10144b0f
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-30T02:01:58.586000+00:00
-- started: 2026-07-30T02:01:58.725000+00:00
-- ended: 2026-07-30T02:01:58.868000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'jobflowllc' AND order_id IS NOT NULL
