-- job_id: fdc81348-a72e-406b-b9f5-67f7622a2576
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-02T00:14:07.590000+00:00
-- started: 2026-08-02T00:14:07.689000+00:00
-- ended: 2026-08-02T00:14:07.963000+00:00


                SELECT DISTINCT order_id 
                FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
                WHERE company = 'jobflowllc' AND order_id IS NOT NULL
