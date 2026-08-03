-- job_id: 366a6639-e81e-448e-a6b1-79aadacd1594
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-29T05:02:03.130000+00:00
-- started: 2026-07-29T05:02:03.533000+00:00
-- ended: 2026-07-29T05:02:03.651000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'contractsdotnetllc' AND order_id IS NOT NULL
