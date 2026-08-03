-- job_id: 2b11e6e8-607a-4a9b-9263-7b4d97145e62
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-02T15:02:56.903000+00:00
-- started: 2026-08-02T15:02:57.111000+00:00
-- ended: 2026-08-02T15:02:57.204000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'formsourcellc' AND order_id IS NOT NULL
