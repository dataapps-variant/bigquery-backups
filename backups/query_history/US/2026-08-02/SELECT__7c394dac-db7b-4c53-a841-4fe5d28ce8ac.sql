-- job_id: 7c394dac-db7b-4c53-a841-4fe5d28ce8ac
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-02T13:01:33.933000+00:00
-- started: 2026-08-02T13:01:34.108000+00:00
-- ended: 2026-08-02T13:01:34.238000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'jobflowllc' AND order_id IS NOT NULL
