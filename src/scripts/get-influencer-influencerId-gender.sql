-- trancate table
TRUNCATE TABLE influencer;
TRUNCATE TABLE influencer_insite_value;

-- insert influencer
INSERT INTO `influencer` (`influencer_id`,`auth_id`,`is_active`,`line_user_id`,`nonce`,`sns_status`,`email`,`address_flag`,`bank_flag`,`audit_status`,`prefecture`,`notice_flag`,`is_planb`,`is_terms`,`operation_date`,`login_at`,`created_at`,`updated_at`) VALUES ('a166b250-a17b-11ea-8304-06dcdaiid001','611234ebf4d4420069158147',1,'U951f859ff27dfdc1a1fb715fdf13a11e',NULL,3,'youngseok.oh+inf-01@plan-b.co.jp',1,0,2,27,3,0,1,NULL,'2022-05-31 13:55:33','2021-08-10 17:12:27','2022-05-31 13:55:33');
INSERT INTO `influencer` (`influencer_id`,`auth_id`,`is_active`,`line_user_id`,`nonce`,`sns_status`,`email`,`address_flag`,`bank_flag`,`audit_status`,`prefecture`,`notice_flag`,`is_planb`,`is_terms`,`operation_date`,`login_at`,`created_at`,`updated_at`) VALUES ('a166b250-a17b-11ea-8304-06dcdaiid002','615fe6d2a392710070244ffb',1,NULL,NULL,3,'youngseok.oh+inf-60@plan-b.co.jp',0,0,1,1,3,0,1,NULL,NULL,'2021-10-08 15:36:02','2021-10-29 17:27:13');

-- insert influencer_insite_value
INSERT INTO `influencer_insite_value` (`id`,`influencer_id`,`man_rate`,`women_rate`,`engagement_rate`,`created_at`,`updated_at`) VALUES (1,'a166b250-a17b-11ea-8304-06dcdaiid001',52,48,0.47,'2020-10-04 13:38:03','2021-03-07 00:00:50');
INSERT INTO `influencer_insite_value` (`id`,`influencer_id`,`man_rate`,`women_rate`,`engagement_rate`,`created_at`,`updated_at`) VALUES (2,'a166b250-a17b-11ea-8304-06dcdaiid002',4,96,2.00,'2020-10-04 13:38:12','2021-02-28 00:00:24');

commit;