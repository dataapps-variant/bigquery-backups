-- job_id: d79e72c7-b3c5-494a-a92b-fc15ec19fc4d
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T15:20:45.197000+00:00
-- started: 2026-07-31T15:20:45.305000+00:00
-- ended: 2026-07-31T15:20:45.424000+00:00


        WITH ranked AS (
            SELECT
                *,
                ROW_NUMBER() OVER (
                    PARTITION BY insight_id ORDER BY revision DESC
                ) AS _rn
            FROM `variant-finance-data-project.CWC.Weekly_Insights`
            WHERE report_date IN UNNEST(@report_dates)
        )
        SELECT * EXCEPT (_rn)
        FROM ranked
        WHERE _rn = 1
          AND NOT COALESCE(is_deleted, FALSE)
          AND (@app   IS NULL OR app  = @app)
          AND (@afid  IS NULL OR afid = @afid)
          AND (@tier  IS NULL OR tier = @tier)
        ORDER BY report_date DESC,
                 CASE WHEN tier = 'summary' THEN 0 ELSE 1 END,
                 sort_order
