-- job_id: 810376a9-38ce-4c86-b4d3-0bfeb823de90
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-02T00:09:49.634000+00:00
-- started: 2026-08-02T00:09:49.722000+00:00
-- ended: 2026-08-02T00:09:49.903000+00:00


                SELECT DISTINCT order_id 
                FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
                WHERE company = 'contractsdotnetllc' AND order_id IS NOT NULL
