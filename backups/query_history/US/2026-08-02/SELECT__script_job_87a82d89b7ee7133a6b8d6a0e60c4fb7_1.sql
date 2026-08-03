-- job_id: script_job_87a82d89b7ee7133a6b8d6a0e60c4fb7_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-08-02T08:45:03.422000+00:00
-- started: 2026-08-02T08:45:03.506000+00:00
-- ended: 2026-08-02T08:45:03.697000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM `variant-finance-data-project.ICARUS_Multi.7K_Main_Table`
)).*;
