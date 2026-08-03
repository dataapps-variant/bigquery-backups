-- job_id: 0bef3e3c-13ae-4f63-b29d-1bb1c576ddbd
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-02T00:09:58.549000+00:00
-- started: 2026-08-02T00:09:58.627000+00:00
-- ended: 2026-08-02T00:09:58.770000+00:00


                SELECT DISTINCT order_id 
                FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
                WHERE company = 'formsourcellc' AND order_id IS NOT NULL
