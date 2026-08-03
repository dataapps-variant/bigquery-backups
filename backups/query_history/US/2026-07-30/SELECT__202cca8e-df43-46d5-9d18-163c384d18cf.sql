-- job_id: 202cca8e-df43-46d5-9d18-163c384d18cf
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-30T16:04:11.359000+00:00
-- started: 2026-07-30T16:04:11.468000+00:00
-- ended: 2026-07-30T16:04:11.576000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'jobflowllc' AND order_id IS NOT NULL
