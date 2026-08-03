-- job_id: b12cbae2-1caa-4543-9283-24ccae0495df
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-02T11:06:21.237000+00:00
-- started: 2026-08-02T11:06:21.339000+00:00
-- ended: 2026-08-02T11:06:21.467000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'jobflowllc' AND order_id IS NOT NULL
