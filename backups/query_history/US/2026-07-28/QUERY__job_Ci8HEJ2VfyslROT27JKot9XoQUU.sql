-- job_id: job_Ci8HEJ2VfyslROT27JKot9XoQUU_
-- user: dataapps@variant.net
-- statement_type: None
-- created: 2026-07-28T14:23:02.950000+00:00
-- started: 2026-07-28T14:23:02.955000+00:00
-- ended: 2026-07-28T14:23:02.955000+00:00

SELECT * FROM `variant-finance-data-project.ICARUS_Multi.Final_Table` LIMIT 1000
where Reporting_Date >= "2026-07-12"
and App_Name = "CT-JP"
