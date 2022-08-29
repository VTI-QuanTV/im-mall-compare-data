-- trancate table
TRUNCATE TABLE m_project;
TRUNCATE TABLE task;
TRUNCATE TABLE task_status_logs;
TRUNCATE TABLE task_content;

-- insert m_project
INSERT INTO `m_project` (`m_project_id`,`endclient_id`,`status`,`title`,`m_project_type_id`,`recruit_type`,`m_write_type_id`,`incentive_id`,`incentive_item_type`,`incentive_item`,`price`,`sns_id`,`follower_count_id`,`m_experience_id`,`company_logo_img`,`img_name_1`,`img_name_2`,`img_name_3`,`img_name_4`,`img_name_5`,`content`,`recruit_count`,`recruit_date_start`,`recruit_date_end`,`assign_date`,`target_sex`,`target_age_min`,`target_age_max`,`company_name`,`company_url`,`store_address`,`mention_tag`,`recruit_fix_date`,`memo`,`created_at`,`updated_at`,`deleted_at`,`is_active`,`project_start_date`,`project_end_date`,`stories_url`,`instructions`,`showcase`,`pay_comment`,`report_status`,`plan_id`) VALUES ('a16b9356-2b17-11ec-aba9-06e52fpid001','45af0e5c-6a94-11eb-9030-0242ac160005',2,'成果報酬案件HTML組み込み',5,2,3,1,2,'1時間マッサージ',0,1,1,2,NULL,'https://im-mall-post-dev.s3.us-west-2.amazonaws.com/insite/thumb-u4Z5Ce8aNnzZigDdGn9NVIo4dQjKa9zIr9ARN0xW.jpg','https://im-mall-post-dev.s3.us-west-2.amazonaws.com/insite/Ab46X9pUI52wrsimBZIPgcb3dGP0d9XRCoo6SDOp.png',NULL,NULL,NULL,'本商品はベビーカーでは日本初の人工知能を搭載したベビーカーになります。\r\nデザイン、安全性はもちろん、特許技術を取得した「幼児の状態把握機能」を活用。\r\n赤ちゃんの体温、心拍数、動きを取得し、興奮状態を察知したアラート機能やベビーカー内の適切な温度調整、\r\n睡眠状態に合わせたヒーリングミュージックの再生など、赤',10,'2022-05-31 00:00:00','2022-06-01 00:00:00','2022-06-04 00:00:00',2,20,25,'株式会社呉','https://google.com',NULL,'aaaa',NULL,'・商品が画像の外に切れるような撮影はやめてください。必ず商品全体を写真の中に収めてください。\r\n・ストーリーズ投稿へのURL添付は必須です。\r\n・同伴者は◯人まで可能です。必ず事前に来場者数をお伝えください。※同伴者様の料金も弊社で負担します。\r\n・商品が画像の外に切れるような撮影はやめてください。必ず商品全体を写真の中に収めてください。\r\n・同伴者は◯人まで可能です。必ず事前に来場者数をお伝えください。※同伴者様の料金も弊社で負担します。','2022-05-24 15:17:55','2022-05-31 17:31:48',NULL,1,'2022-05-31 17:31:48',NULL,'https://google.com/stories','（写真）顔出しは必須でお願いします。\r\n（写真）顔出しは必要ありません。\r\n（写真）普段の投稿イメージになるべく近づけてください。\r\n（写真）商品の画像の順番が必ず一枚目にくるように設定してください。\r\n（文章）ブランド・商品名を必ず含めてください。','デザインを強く訴求してほしい。\r\n機能性について強く訴求してほしい。\r\n今流行っていることを訴求してほしい。\r\n高級感を訴求してほしい。',NULL,NULL,5);

-- insert task
INSERT INTO `task` (`task_id`,`m_project_id`,`task_name`,`in_charge`,`task_rank`,`from_date`,`to_date`,`turn`,`task_status`,`is_active`,`created_at`,`updated_at`) VALUES (6918,'a16b9356-2b17-11ec-aba9-06e52fpid001','affiliate_delivery',1,1,'2022-06-05','2022-06-08',1,2,1,'2022-05-25 14:43:43','2022-05-25 14:43:43');
INSERT INTO `task` (`task_id`,`m_project_id`,`task_name`,`in_charge`,`task_rank`,`from_date`,`to_date`,`turn`,`task_status`,`is_active`,`created_at`,`updated_at`) VALUES (6919,'a16b9356-2b17-11ec-aba9-06e52fpid001','affiliate_receive',2,2,'2022-06-08','2022-06-13',1,1,1,'2022-05-25 14:43:43','2022-05-25 14:43:43');
INSERT INTO `task` (`task_id`,`m_project_id`,`task_name`,`in_charge`,`task_rank`,`from_date`,`to_date`,`turn`,`task_status`,`is_active`,`created_at`,`updated_at`) VALUES (6920,'a16b9356-2b17-11ec-aba9-06e52fpid001','affiliate_prepost',2,3,'2022-06-13','2022-06-18',1,1,1,'2022-05-25 14:43:43','2022-05-25 14:43:43');
INSERT INTO `task` (`task_id`,`m_project_id`,`task_name`,`in_charge`,`task_rank`,`from_date`,`to_date`,`turn`,`task_status`,`is_active`,`created_at`,`updated_at`) VALUES (6921,'a16b9356-2b17-11ec-aba9-06e52fpid001','affiliate_prepost-confirm',1,4,'2022-06-18','2022-06-20',1,1,1,'2022-05-25 14:43:43','2022-05-25 14:43:43');
INSERT INTO `task` (`task_id`,`m_project_id`,`task_name`,`in_charge`,`task_rank`,`from_date`,`to_date`,`turn`,`task_status`,`is_active`,`created_at`,`updated_at`) VALUES (6922,'a16b9356-2b17-11ec-aba9-06e52fpid001','affiliate_edit-post',2,5,'2022-06-20','2022-06-23',1,1,1,'2022-05-25 14:43:43','2022-05-25 14:43:43');
INSERT INTO `task` (`task_id`,`m_project_id`,`task_name`,`in_charge`,`task_rank`,`from_date`,`to_date`,`turn`,`task_status`,`is_active`,`created_at`,`updated_at`) VALUES (6923,'a16b9356-2b17-11ec-aba9-06e52fpid001','affiliate_fix-post',1,6,'2022-06-23','2022-06-24',1,1,1,'2022-05-25 14:43:43','2022-05-25 14:43:43');
INSERT INTO `task` (`task_id`,`m_project_id`,`task_name`,`in_charge`,`task_rank`,`from_date`,`to_date`,`turn`,`task_status`,`is_active`,`created_at`,`updated_at`) VALUES (6924,'a16b9356-2b17-11ec-aba9-06e52fpid001','affiliate_post',2,7,'2022-06-24','2022-06-27',1,1,1,'2022-05-25 14:43:43','2022-05-25 14:43:43');
INSERT INTO `task` (`task_id`,`m_project_id`,`task_name`,`in_charge`,`task_rank`,`from_date`,`to_date`,`turn`,`task_status`,`is_active`,`created_at`,`updated_at`) VALUES (6925,'a16b9356-2b17-11ec-aba9-06e52fpid001','affiliate_post-confirm',1,8,'2022-06-27','2022-06-28',1,1,1,'2022-05-25 14:43:43','2022-05-25 14:43:43');

-- insert task_status_logs
INSERT INTO `task_status_logs` (`task_status_logs_id`,`task_id`,`influencer_id`,`task_status_logs_status`,`turn`,`created_at`,`updated_at`,`is_active`) VALUES (20845,6918,'a166b250-a17b-11ea-8304-06dcdaiid002',3,1,'2022-05-31 17:31:48','2022-07-29 14:55:08',1);
INSERT INTO `task_status_logs` (`task_status_logs_id`,`task_id`,`influencer_id`,`task_status_logs_status`,`turn`,`created_at`,`updated_at`,`is_active`) VALUES (20846,6919,'a166b250-a17b-11ea-8304-06dcdaiid002',2,1,'2022-05-31 17:31:48','2022-07-29 14:55:08',1);
INSERT INTO `task_status_logs` (`task_status_logs_id`,`task_id`,`influencer_id`,`task_status_logs_status`,`turn`,`created_at`,`updated_at`,`is_active`) VALUES (20847,6920,'a166b250-a17b-11ea-8304-06dcdaiid002',1,1,'2022-05-31 17:31:48','2022-05-31 17:31:48',1);
INSERT INTO `task_status_logs` (`task_status_logs_id`,`task_id`,`influencer_id`,`task_status_logs_status`,`turn`,`created_at`,`updated_at`,`is_active`) VALUES (20848,6921,'a166b250-a17b-11ea-8304-06dcdaiid002',1,1,'2022-05-31 17:31:48','2022-05-31 17:31:48',1);
INSERT INTO `task_status_logs` (`task_status_logs_id`,`task_id`,`influencer_id`,`task_status_logs_status`,`turn`,`created_at`,`updated_at`,`is_active`) VALUES (20849,6922,'a166b250-a17b-11ea-8304-06dcdaiid002',1,1,'2022-05-31 17:31:48','2022-05-31 17:31:48',1);
INSERT INTO `task_status_logs` (`task_status_logs_id`,`task_id`,`influencer_id`,`task_status_logs_status`,`turn`,`created_at`,`updated_at`,`is_active`) VALUES (20850,6923,'a166b250-a17b-11ea-8304-06dcdaiid002',1,1,'2022-05-31 17:31:48','2022-05-31 17:31:48',1);
INSERT INTO `task_status_logs` (`task_status_logs_id`,`task_id`,`influencer_id`,`task_status_logs_status`,`turn`,`created_at`,`updated_at`,`is_active`) VALUES (20851,6924,'a166b250-a17b-11ea-8304-06dcdaiid002',1,1,'2022-05-31 17:31:48','2022-05-31 17:31:48',1);
INSERT INTO `task_status_logs` (`task_status_logs_id`,`task_id`,`influencer_id`,`task_status_logs_status`,`turn`,`created_at`,`updated_at`,`is_active`) VALUES (20852,6925,'a166b250-a17b-11ea-8304-06dcdaiid002',1,1,'2022-05-31 17:31:48','2022-05-31 17:31:48',1);

-- insert task_content
INSERT INTO `task_content` (`task_content_id`,`task_status_logs_id`,`content_type`,`m_write_type_id`,`content`,`task_status_logs_status`,`is_story`,`created_at`,`updated_at`,`is_active`) VALUES (17944,20848,1,NULL,'もっと良い写真に修正して下さい',2,NULL,'2022-07-29 15:27:10','2022-07-29 15:27:10',1);
INSERT INTO `task_content` (`task_content_id`,`task_status_logs_id`,`content_type`,`m_write_type_id`,`content`,`task_status_logs_status`,`is_story`,`created_at`,`updated_at`,`is_active`) VALUES (17945,20850,1,NULL,'もっと良い写真に修正して下さい',2,NULL,'2022-07-29 15:34:07','2022-07-29 15:34:07',1);

commit;
