-- trancate table
TRUNCATE TABLE influencer;
TRUNCATE TABLE influencer_insite;

-- insert influencer
INSERT INTO `influencer` (`influencer_id`,`auth_id`,`is_active`,`line_user_id`,`nonce`,`sns_status`,`email`,`address_flag`,`bank_flag`,`audit_status`,`prefecture`,`notice_flag`,`is_planb`,`is_terms`,`operation_date`,`login_at`,`created_at`,`updated_at`) VALUES ('ee8742a6-e563-11ec-a5d2-0611f1df76cb','611234ebf4d4420069158147',1,'U951f859ff27dfdc1a1fb715fdf13a11e',NULL,3,'youngseok.oh+inf-01@plan-b.co.jp',1,0,2,27,3,0,1,NULL,'2022-05-31 13:55:33','2021-08-10 17:12:27','2022-05-31 13:55:33');
INSERT INTO `influencer` (`influencer_id`,`auth_id`,`is_active`,`line_user_id`,`nonce`,`sns_status`,`email`,`address_flag`,`bank_flag`,`audit_status`,`prefecture`,`notice_flag`,`is_planb`,`is_terms`,`operation_date`,`login_at`,`created_at`,`updated_at`) VALUES ('pla26316-9a07-11ec-a6dc-069f9bbaf005','615fe6d2a392710070244ffb',1,NULL,NULL,3,'youngseok.oh+inf-60@plan-b.co.jp',0,0,1,1,3,0,1,NULL,NULL,'2021-10-08 15:36:02','2021-10-29 17:27:13');

-- insert influencer_insite
INSERT INTO `influencer_insite` (`influencer_insite_id`,`influencer_id`,`insite_img`,`is_active`,`created_at`,`updated_at`) VALUES (1,'ee8742a6-e563-11ec-a5d2-0611f1df76cb','https://im-mall-post.s3.us-west-2.amazonaws.com/insite/g297BVl4OpOBlXBV735b8qn2AfIpb3W1byZRgLLZ.jpeg',1,'2020-04-18 20:14:10','2020-05-24 12:26:41');
INSERT INTO `influencer_insite` (`influencer_insite_id`,`influencer_id`,`insite_img`,`is_active`,`created_at`,`updated_at`) VALUES (2,'pla26316-9a07-11ec-a6dc-069f9bbaf005','https://im-mall-post.s3.us-west-2.amazonaws.com/insite/grzQASs3w1vkL78izOzmJXmC2neJROdpUbgYodPH.png',1,'2020-04-20 11:45:05','2020-04-20 11:45:05');
INSERT INTO `influencer_insite` (`influencer_insite_id`,`influencer_id`,`insite_img`,`is_active`,`created_at`,`updated_at`) VALUES (3,'pla26316-9a07-11ec-a6dc-069f9bbaf005','https://im-mall-post.s3.us-west-2.amazonaws.com/insite/BIwUgg5TTkbIXlItN9nsxxSQzRXvpl4ujU0VHHMf.png',1,'2020-04-20 11:45:05','2020-04-20 11:45:05');
INSERT INTO `influencer_insite` (`influencer_insite_id`,`influencer_id`,`insite_img`,`is_active`,`created_at`,`updated_at`) VALUES (4,'pla26316-9a07-11ec-a6dc-069f9bbaf005','https://im-mall-post.s3.us-west-2.amazonaws.com/insite/qy6uVssV0MsEuMJJ0xL5OtD8qh0Bmt4VMYPJwW8M.png',1,'2020-04-20 11:45:05','2020-04-20 11:45:05');

commit;