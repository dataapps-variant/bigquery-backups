-- job_id: d38799e9-6d74-4534-b155-226abf1b3bff
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-02T16:02:34.924000+00:00
-- started: 2026-08-02T16:02:35.026000+00:00
-- ended: 2026-08-02T16:02:35.123000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'contractsdotnetllc' AND order_id IS NOT NULL
