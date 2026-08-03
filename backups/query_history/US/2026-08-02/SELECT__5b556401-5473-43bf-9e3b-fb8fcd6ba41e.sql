-- job_id: 5b556401-5473-43bf-9e3b-fb8fcd6ba41e
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-02T00:09:00.571000+00:00
-- started: 2026-08-02T00:09:00.660000+00:00
-- ended: 2026-08-02T00:09:00.845000+00:00


                SELECT DISTINCT order_id 
                FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
                WHERE company = 'contractsdotnetllc' AND order_id IS NOT NULL
