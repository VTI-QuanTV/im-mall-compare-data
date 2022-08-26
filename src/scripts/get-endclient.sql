-- trancate table
TRUNCATE TABLE endclient;

-- insert endclient
INSERT INTO `endclient` (`endclient_id`,`auth_id`,`is_terms`,`email`,`name`,`company_name`,`tel`,`is_admin`,`is_active`,`login_at`,`created_at`,`updated_at`) VALUES ('5048a18a-91f8-11eb-b052-0609da597fe3','6226b059358462006942e496',1,'test@plan-b.co.jp','管理者権限テスト','株式会社PLAN-B','0665785558',1,1,NULL,'2021-03-31 17:08:44','2022-07-27 16:24:07');
INSERT INTO `endclient` (`endclient_id`,`auth_id`,`is_terms`,`email`,`name`,`company_name`,`tel`,`is_admin`,`is_active`,`login_at`,`created_at`,`updated_at`) VALUES ('28b5305c-94f6-11ea-b9c0-06a242d67a8e','5ebbb3c376cbd20c68f159a2',1,'test2@plan-b.co.jp','テスト','株式会社PLAN-B','0000000000',0,1,NULL,'2020-05-13 17:45:55','2021-06-06 23:12:47');

commit;