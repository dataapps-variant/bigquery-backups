-- job_id: 34b4c58b-32bc-415e-872f-3979357533e6
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T22:07:01.133000+00:00
-- started: 2026-07-31T22:07:01.233000+00:00
-- ended: 2026-07-31T22:07:01.359000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'pdfdotnet' AND order_id IS NOT NULL
