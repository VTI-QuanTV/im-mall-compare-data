-- trancate table
TRUNCATE TABLE endclient;
TRUNCATE TABLE endclient_plan;

-- insert endclient
INSERT INTO `endclient` (`endclient_id`,`auth_id`,`is_terms`,`email`,`name`,`company_name`,`tel`,`is_admin`,`is_active`,`login_at`,`created_at`,`updated_at`) VALUES ('0401bf74-bdf8-11eb-a487-0242ac160005','60adff67963467006963e8ea',1,'youngseok.oh+dev-ys-end-03@plan-b.co.jp','テスト','株式会社テスト','11111111111',NULL,1,NULL,'2021-05-26 16:57:28','2021-05-26 16:57:28');

-- insert endclient_plan
INSERT INTO `endclient_plan` (`endclient_id`,`plan_id`,`is_update`,`plan_start_date`,`paid_start_date`,`paid_end_date`,`created_at`,`updated_at`) VALUES ('0401bf74-bdf8-11eb-a487-0242ac160005',4,1,'2021-07-01 00:00:00','2021-07-01 00:00:00','2021-07-31 00:00:00','2021-06-01 13:33:46','2021-06-01 13:33:46');

commit;