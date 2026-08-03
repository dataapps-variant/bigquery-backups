-- job_id: 82625ccd-993b-4c60-aa64-1ed9cc6d320b
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-08-02T06:09:38.308000+00:00
-- started: 2026-08-02T06:09:38.787000+00:00
-- ended: 2026-08-02T06:09:39.695000+00:00


        DELETE FROM `variant-finance-data-project.Sticky_Data.missing_updated_orders`
        WHERE company = 'brainable' AND order_id IN ('4865653', '4873952', '4880078', '4881889')
