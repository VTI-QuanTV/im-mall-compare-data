-- trancate table
TRUNCATE TABLE assigned_influencer;
TRUNCATE TABLE m_project;
TRUNCATE TABLE affiliate_approved;
TRUNCATE TABLE affiliate;

-- insert assigned_influencer
INSERT INTO `assigned_influencer` (`assigned_influencer_id`,`influencer_id`,`m_project_id`,`progress_status`,`transfer_date`,`transfer_amount`,`memo`,`created_at`,`updated_at`,`is_active`) VALUES (1,'15bd13aa-2caf-11ec-809b-0242ac150002','869b82f-b9f3-46a7-a808-d0022193bd38',2,NULL,NULL,'','2022-05-17 14:22:40','2022-06-24 16:26:20',1);

-- insert m_project
INSERT INTO `m_project` (`m_project_id`,`endclient_id`,`status`,`title`,`m_project_type_id`,`recruit_type`,`m_write_type_id`,`incentive_id`,`incentive_item_type`,`incentive_item`,`price`,`sns_id`,`follower_count_id`,`m_experience_id`,`company_logo_img`,`img_name_1`,`img_name_2`,`img_name_3`,`img_name_4`,`img_name_5`,`content`,`recruit_count`,`recruit_date_start`,`recruit_date_end`,`assign_date`,`target_sex`,`target_age_min`,`target_age_max`,`company_name`,`company_url`,`store_address`,`mention_tag`,`recruit_fix_date`,`memo`,`created_at`,`updated_at`,`deleted_at`,`is_active`,`project_start_date`,`project_end_date`,`stories_url`,`instructions`,`showcase`,`pay_comment`,`report_status`,`plan_id`) VALUES ('869b82f-b9f3-46a7-a808-d0022193bd38','45af0e5c-6a94-11eb-9030-0242ac160005',3,'成果報酬インフルエンサー',5,2,3,1,3,'1時間マッサージ',0,1,1,2,NULL,'https://im-mall-post-dev.s3.us-west-2.amazonaws.com/insite/thumb-bEHYaI6QvKRWooeCsFahffMzkV2BmIMHJNJAoza6.jpg','https://im-mall-post-dev.s3.us-west-2.amazonaws.com/insite/I5te4Akxlh0mvtaIjVf3OoZSeVHoNNee46rf6qaQ.jpg',NULL,NULL,NULL,'品はベビーカーでは日本初の人工知能を搭載したベビーカーになります。\r\nデザイン、安全性はもちろん、特許技術を取得した「幼児の状態把握機能」を活用。\r\n赤ちゃんの体温、心拍数、動きを取得し、興奮状態を察知したアラート機能やベビーカー内の適切な温度調整、\r\n睡眠状態に合わせたヒー',1,'2022-05-17 00:00:00','2022-05-24 00:00:00','2022-05-27 00:00:00',2,20,30,'株式会社呉','https://google.com',NULL,'asdada',NULL,'・商品が画像の外に切れるような撮影はやめてください。必ず商品全体を写真の中に収めてください。\r\n・ストーリーズ投稿へのURL添付は必須です。','2022-05-17 14:19:49','2022-06-24 17:54:21',NULL,1,'2022-05-17 14:22:40',NULL,'https://test.com/stories','（写真）商品のパッケージ（ロゴを含む）を必ず入れてください。\r\n（写真）顔出しは必須でお願いします。\r\n（写真）普段の投稿イメージになるべく近づけてください。','ナチュラル感を訴求してほしい。\r\nインスタ映えすることを訴求してほしい。\r\n機能性について強く訴求してほしい。',NULL,NULL,5);

-- insert affiliate_approved
INSERT INTO `affiliate_approved` (`id`,`m_project_id`,`influencer_id`,`endclient_id`,`affiliate_conversion_id`,`created_at`,`updated_at`) VALUES (1,'869b82f-b9f3-46a7-a808-d0022193bd38','15bd13aa-2caf-11ec-809b-0242ac150002','45af0e5c-6a94-11eb-9030-0242ac160005',9,'2022-05-17 17:00:58','2022-05-17 17:00:58');
INSERT INTO `affiliate_approved` (`id`,`m_project_id`,`influencer_id`,`endclient_id`,`affiliate_conversion_id`,`created_at`,`updated_at`) VALUES (2,'869b82f-b9f3-46a7-a808-d0022193bd38','15bd13aa-2caf-11ec-809b-0242ac150002','45af0e5c-6a94-11eb-9030-0242ac160005',10,'2022-05-17 17:00:58','2022-05-17 17:00:58');

-- insert affiliate
INSERT INTO `affiliate` (`id`,`m_project_id`,`price`,`condition`,`accept`,`cv_rate`,`accept_rate`,`landing_url`,`reject_condition`,`highlight`,`accept_type`,`accept_interval`,`fix_price`,`created_at`,`updated_at`) VALUES (1,'869b82f-b9f3-46a7-a808-d0022193bd38','1000','弊社指定サイトでの購買発生','手動承認 ※承認頻度：随時',10,'40','https://google.com','獲得対象外 ※不備・不正・重複・いたずら・キャンセル ※その他お申込み内容に不備がある場合獲得対象外 ※不備・不正・重複・いたずら・キャンセル ※その他お申込み内容に不備がある場合',1,1,30,NULL,'2022-05-17 14:20:22','2022-05-17 14:20:22');

commit;