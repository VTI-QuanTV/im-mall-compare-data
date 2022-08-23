-- trancate table
TRUNCATE TABLE influencer;
TRUNCATE TABLE nps;

-- insert influencer
INSERT INTO `influencer` (`influencer_id`,`auth_id`,`is_active`,`line_user_id`,`nonce`,`sns_status`,`email`,`address_flag`,`bank_flag`,`audit_status`,`prefecture`,`notice_flag`,`is_planb`,`is_terms`,`operation_date`,`login_at`,`created_at`,`updated_at`) VALUES ('a166b250-a17b-11ea-8304-06dcdaiid001','611234ebf4d4420069158147',1,'U951f859ff27dfdc1a1fb715fdf13a11e',NULL,3,'youngseok.oh+inf-01@plan-b.co.jp',1,0,2,27,3,0,1,NULL,'2022-05-31 13:55:33','2021-08-10 17:12:27','2022-05-31 13:55:33');
INSERT INTO `influencer` (`influencer_id`,`auth_id`,`is_active`,`line_user_id`,`nonce`,`sns_status`,`email`,`address_flag`,`bank_flag`,`audit_status`,`prefecture`,`notice_flag`,`is_planb`,`is_terms`,`operation_date`,`login_at`,`created_at`,`updated_at`) VALUES ('a166b250-a17b-11ea-8304-06dcdaiid002','615fe6d2a392710070244ffb',1,NULL,NULL,3,'youngseok.oh+inf-60@plan-b.co.jp',0,0,1,1,3,0,1,NULL,NULL,'2021-10-08 15:36:02','2021-10-29 17:27:13');

-- insert nps
INSERT INTO `nps` (`nps_id`,`m_project_id`,`influencer_id`,`score`,`comment`,`is_active`,`created_at`,`updated_at`) VALUES (1,'6e8c9654-ff28-11eb-b9a3-0242ac160005','a166b250-a17b-11ea-8304-06dcdaiid001','3','OK',1,'2021-08-17 16:46:01','2021-08-17 16:46:01');
INSERT INTO `nps` (`nps_id`,`m_project_id`,`influencer_id`,`score`,`comment`,`is_active`,`created_at`,`updated_at`) VALUES (2,'951c156a-fe6a-11eb-aedc-0242ac160005','a166b250-a17b-11ea-8304-06dcdaiid001','3','aaa',1,'2021-08-25 18:58:34','2021-08-25 18:58:34');
INSERT INTO `nps` (`nps_id`,`m_project_id`,`influencer_id`,`score`,`comment`,`is_active`,`created_at`,`updated_at`) VALUES (3,'37bf43ce-0612-11ec-a431-0242ac160005','a166b250-a17b-11ea-8304-06dcdaiid001','1','a',1,'2021-08-26 11:57:59','2021-08-26 11:57:59');
INSERT INTO `nps` (`nps_id`,`m_project_id`,`influencer_id`,`score`,`comment`,`is_active`,`created_at`,`updated_at`) VALUES (4,'4b20b24c-061a-11ec-a206-0242ac160005','a166b250-a17b-11ea-8304-06dcdaiid001','3','NG',1,'2021-08-26 12:12:42','2021-08-26 12:12:42');
INSERT INTO `nps` (`nps_id`,`m_project_id`,`influencer_id`,`score`,`comment`,`is_active`,`created_at`,`updated_at`) VALUES (5,'f55fde40-0629-11ec-b57b-0242ac160005','a166b250-a17b-11ea-8304-06dcdaiid001','1','a',1,'2021-08-26 13:57:52','2021-08-26 13:57:52');
INSERT INTO `nps` (`nps_id`,`m_project_id`,`influencer_id`,`score`,`comment`,`is_active`,`created_at`,`updated_at`) VALUES (6,'d7a5034a-062d-11ec-9612-0242ac160005','a166b250-a17b-11ea-8304-06dcdaiid001','1','aaa',1,'2021-08-26 17:36:37','2021-08-26 17:36:37');
INSERT INTO `nps` (`nps_id`,`m_project_id`,`influencer_id`,`score`,`comment`,`is_active`,`created_at`,`updated_at`) VALUES (7,'c5bed3aa-0adc-11ec-836f-0242ac160005','a166b250-a17b-11ea-8304-06dcdaiid001','1','完了',1,'2021-09-01 13:32:16','2021-09-01 13:32:16');
INSERT INTO `nps` (`nps_id`,`m_project_id`,`influencer_id`,`score`,`comment`,`is_active`,`created_at`,`updated_at`) VALUES (8,'aa7791e4-0add-11ec-8fb8-0242ac160005','a166b250-a17b-11ea-8304-06dcdaiid001','1','NG',1,'2021-09-01 13:34:43','2021-09-01 13:34:43');
INSERT INTO `nps` (`nps_id`,`m_project_id`,`influencer_id`,`score`,`comment`,`is_active`,`created_at`,`updated_at`) VALUES (9,'71fa52ac-41dd-11ec-a82e-0242ac160005','a166b250-a17b-11ea-8304-06dcdaiid001','3','fgasdgasdgsd',1,'2021-11-18 14:15:18','2021-11-18 14:15:18');
INSERT INTO `nps` (`nps_id`,`m_project_id`,`influencer_id`,`score`,`comment`,`is_active`,`created_at`,`updated_at`) VALUES (10,'a166b250-a17b-11ea-8304-06dcdaiid002','a166b250-a17b-11ea-8304-06dcdaiid002','3','テスト',1,'2021-11-18 14:15:18','2021-11-18 14:15:18');

commit;