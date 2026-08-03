-- job_id: 609275d8-8079-439d-bb82-8e406635bf01
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T15:01:32.475000+00:00
-- started: 2026-07-28T15:01:32.571000+00:00
-- ended: 2026-07-28T15:01:32.691000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'formsourcellc' AND order_id IS NOT NULL
