-- job_id: 4ec5010b-e35e-460d-b017-c3e9d12970c5
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T22:04:11.137000+00:00
-- started: 2026-07-31T22:04:11.329000+00:00
-- ended: 2026-07-31T22:04:11.534000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'formsourcellc' AND order_id IS NOT NULL
