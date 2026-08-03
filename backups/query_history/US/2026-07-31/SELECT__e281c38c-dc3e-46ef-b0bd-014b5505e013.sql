-- job_id: e281c38c-dc3e-46ef-b0bd-014b5505e013
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T10:03:57.383000+00:00
-- started: 2026-07-31T10:03:57.523000+00:00
-- ended: 2026-07-31T10:03:57.647000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'jobflowllc' AND order_id IS NOT NULL
