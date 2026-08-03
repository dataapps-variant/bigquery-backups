-- job_id: 4e0b643e-d4b4-4fd9-afcb-106a377592cd
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-02T06:24:37.535000+00:00
-- started: 2026-08-02T06:24:37.647000+00:00
-- ended: 2026-08-02T06:24:37.830000+00:00


           SELECT DISTINCT order_id, last_modified 
           FROM `variant-finance-data-project.Sticky_Data.missing_updated_orders` 
           WHERE company = 'jobflowllc' AND order_id IS NOT NULL
