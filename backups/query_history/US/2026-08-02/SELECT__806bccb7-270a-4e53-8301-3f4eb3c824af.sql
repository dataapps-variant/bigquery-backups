-- job_id: 806bccb7-270a-4e53-8301-3f4eb3c824af
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-02T00:04:07.011000+00:00
-- started: 2026-08-02T00:04:07.110000+00:00
-- ended: 2026-08-02T00:04:07.236000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'jobflowllc' AND order_id IS NOT NULL
