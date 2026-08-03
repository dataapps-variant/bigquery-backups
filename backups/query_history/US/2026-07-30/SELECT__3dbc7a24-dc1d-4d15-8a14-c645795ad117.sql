-- job_id: 3dbc7a24-dc1d-4d15-8a14-c645795ad117
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-30T05:05:03.498000+00:00
-- started: 2026-07-30T05:05:03.647000+00:00
-- ended: 2026-07-30T05:05:03.767000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'brainable' AND order_id IS NOT NULL
