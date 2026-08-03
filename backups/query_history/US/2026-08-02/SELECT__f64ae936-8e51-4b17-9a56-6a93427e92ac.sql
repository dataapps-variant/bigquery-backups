-- job_id: f64ae936-8e51-4b17-9a56-6a93427e92ac
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-02T23:02:07.843000+00:00
-- started: 2026-08-02T23:02:07.945000+00:00
-- ended: 2026-08-02T23:02:08.064000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'jobflowllc' AND order_id IS NOT NULL
