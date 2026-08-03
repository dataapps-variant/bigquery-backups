-- job_id: fc50ec4c-fa29-4dca-bb1b-4cbc5943554f
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-29T20:04:03.598000+00:00
-- started: 2026-07-29T20:04:03.724000+00:00
-- ended: 2026-07-29T20:04:04.465000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'formsourcellc' AND order_id IS NOT NULL
