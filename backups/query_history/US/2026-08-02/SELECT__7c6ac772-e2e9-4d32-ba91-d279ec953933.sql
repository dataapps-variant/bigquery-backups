-- job_id: 7c6ac772-e2e9-4d32-ba91-d279ec953933
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-02T00:13:29.922000+00:00
-- started: 2026-08-02T00:13:30.031000+00:00
-- ended: 2026-08-02T00:13:30.229000+00:00


                SELECT DISTINCT order_id 
                FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
                WHERE company = 'jobflowllc' AND order_id IS NOT NULL
