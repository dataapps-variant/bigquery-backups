-- job_id: 2bb60a48-b130-44da-be60-44fac81c694a
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-08-02T01:04:19.818000+00:00
-- started: 2026-08-02T01:04:20.181000+00:00
-- ended: 2026-08-02T01:04:21.084000+00:00


            DELETE FROM `variant-finance-data-project.Sticky_Data.missing_orders`
            WHERE company = 'jobflowllc' AND order_id IN ('7265856', '7277147', '7267692', '7300920')
