-- trancate table
TRUNCATE TABLE m_project;
TRUNCATE TABLE affiliate_conversion;
TRUNCATE TABLE influencer_socialmedia;
TRUNCATE TABLE affiliate;

-- insert m_project
INSERT INTO `m_project` (`m_project_id`,`endclient_id`,`status`,`title`,`m_project_type_id`,`recruit_type`,`m_write_type_id`,`incentive_id`,`incentive_item_type`,`incentive_item`,`price`,`sns_id`,`follower_count_id`,`m_experience_id`,`company_logo_img`,`img_name_1`,`img_name_2`,`img_name_3`,`img_name_4`,`img_name_5`,`content`,`recruit_count`,`recruit_date_start`,`recruit_date_end`,`assign_date`,`target_sex`,`target_age_min`,`target_age_max`,`company_name`,`company_url`,`store_address`,`mention_tag`,`recruit_fix_date`,`memo`,`created_at`,`updated_at`,`deleted_at`,`is_active`,`project_start_date`,`project_end_date`,`stories_url`,`instructions`,`showcase`,`pay_comment`,`report_status`,`plan_id`) VALUES ('a16b9356-2b17-11ec-aba9-06e52fpid001','45af0e5c-6a94-11eb-9030-0242ac160005',2,'成果報酬案件HTML組み込み',5,2,3,1,2,'1時間マッサージ',0,1,1,2,NULL,'https://im-mall-post-dev.s3.us-west-2.amazonaws.com/insite/thumb-u4Z5Ce8aNnzZigDdGn9NVIo4dQjKa9zIr9ARN0xW.jpg','https://im-mall-post-dev.s3.us-west-2.amazonaws.com/insite/Ab46X9pUI52wrsimBZIPgcb3dGP0d9XRCoo6SDOp.png',NULL,NULL,NULL,'本商品はベビーカーでは日本初の人工知能を搭載したベビーカーになります。\r\nデザイン、安全性はもちろん、特許技術を取得した「幼児の状態把握機能」を活用。\r\n赤ちゃんの体温、心拍数、動きを取得し、興奮状態を察知したアラート機能やベビーカー内の適切な温度調整、\r\n睡眠状態に合わせたヒーリングミュージックの再生など、赤',10,'2022-05-31 00:00:00','2022-06-01 00:00:00','2022-06-04 00:00:00',2,20,25,'株式会社呉','https://google.com',NULL,'aaaa',NULL,'・商品が画像の外に切れるような撮影はやめてください。必ず商品全体を写真の中に収めてください。\r\n・ストーリーズ投稿へのURL添付は必須です。\r\n・同伴者は◯人まで可能です。必ず事前に来場者数をお伝えください。※同伴者様の料金も弊社で負担します。\r\n・商品が画像の外に切れるような撮影はやめてください。必ず商品全体を写真の中に収めてください。\r\n・同伴者は◯人まで可能です。必ず事前に来場者数をお伝えください。※同伴者様の料金も弊社で負担します。','2022-05-24 15:17:55','2022-05-31 17:31:48',NULL,1,'2022-05-31 17:31:48',NULL,'https://google.com/stories','（写真）顔出しは必須でお願いします。\r\n（写真）顔出しは必要ありません。\r\n（写真）普段の投稿イメージになるべく近づけてください。\r\n（写真）商品の画像の順番が必ず一枚目にくるように設定してください。\r\n（文章）ブランド・商品名を必ず含めてください。','デザインを強く訴求してほしい。\r\n機能性について強く訴求してほしい。\r\n今流行っていることを訴求してほしい。\r\n高級感を訴求してほしい。',NULL,NULL,5);

-- insert affiliate_conversion
INSERT INTO `affiliate_conversion` (`id`,`m_project_id`,`influencer_id`,`endclient_id`,`order_id`,`click_id`,`session_id`,`conversion_at`,`click_at`,`conversion_at_tz`,`click_at_tz`,`useragent`,`os`,`referer_url`,`current_url`,`memo`,`approve_status`,`created_at`,`updated_at`) VALUES (1,'a16b9356-2b17-11ec-aba9-06e52fpid001','29d4ee76-8869-11ea-a687-06ac534ba540','45af0e5c-6a94-11eb-9030-0242ac160005','order_5',NULL,NULL,'2022-05-31 17:33:48','2022-05-31 16:33:52',NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,'2022-05-31 17:33:45','2022-07-21 10:36:59');
INSERT INTO `affiliate_conversion` (`id`,`m_project_id`,`influencer_id`,`endclient_id`,`order_id`,`click_id`,`session_id`,`conversion_at`,`click_at`,`conversion_at_tz`,`click_at_tz`,`useragent`,`os`,`referer_url`,`current_url`,`memo`,`approve_status`,`created_at`,`updated_at`) VALUES (2,'a16b9356-2b17-11ec-aba9-06e52fpid001','29d4ee76-8869-11ea-a687-06ac534ba540','45af0e5c-6a94-11eb-9030-0242ac160005','order_6',NULL,NULL,'2022-05-31 17:33:47','2022-05-31 16:33:53',NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,'2022-05-31 17:33:44','2022-07-21 10:36:59');
INSERT INTO `affiliate_conversion` (`id`,`m_project_id`,`influencer_id`,`endclient_id`,`order_id`,`click_id`,`session_id`,`conversion_at`,`click_at`,`conversion_at_tz`,`click_at_tz`,`useragent`,`os`,`referer_url`,`current_url`,`memo`,`approve_status`,`created_at`,`updated_at`) VALUES (3,'a16b9356-2b17-11ec-aba9-06e52fpid001','7cb99672-8897-11ea-bd4b-06ac534ba540','45af0e5c-6a94-11eb-9030-0242ac160005','order_8',NULL,NULL,'2022-05-31 17:33:45','2022-05-31 16:33:55',NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,'2022-05-31 17:33:42','2022-07-21 10:36:59');
INSERT INTO `affiliate_conversion` (`id`,`m_project_id`,`influencer_id`,`endclient_id`,`order_id`,`click_id`,`session_id`,`conversion_at`,`click_at`,`conversion_at_tz`,`click_at_tz`,`useragent`,`os`,`referer_url`,`current_url`,`memo`,`approve_status`,`created_at`,`updated_at`) VALUES (4,'a16b9356-2b17-11ec-aba9-06e52fpid001','a314180a-8893-11ea-9caa-06ac534ba540','45af0e5c-6a94-11eb-9030-0242ac160005','order_7',NULL,NULL,'2022-05-31 17:33:46','2022-05-31 16:33:54',NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,'2022-05-31 17:33:43','2022-07-21 10:36:59');
INSERT INTO `affiliate_conversion` (`id`,`m_project_id`,`influencer_id`,`endclient_id`,`order_id`,`click_id`,`session_id`,`conversion_at`,`click_at`,`conversion_at_tz`,`click_at_tz`,`useragent`,`os`,`referer_url`,`current_url`,`memo`,`approve_status`,`created_at`,`updated_at`) VALUES (5,'a16b9356-2b17-11ec-aba9-06e52fpid001','b357ac40-f9b2-11eb-ad8a-0242ac160005','45af0e5c-6a94-11eb-9030-0242ac160005','order_1',NULL,NULL,'2022-05-31 17:33:52','2022-05-31 16:33:48',NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,'2022-05-31 17:33:50','2022-08-10 17:31:32');
INSERT INTO `affiliate_conversion` (`id`,`m_project_id`,`influencer_id`,`endclient_id`,`order_id`,`click_id`,`session_id`,`conversion_at`,`click_at`,`conversion_at_tz`,`click_at_tz`,`useragent`,`os`,`referer_url`,`current_url`,`memo`,`approve_status`,`created_at`,`updated_at`) VALUES (6,'a16b9356-2b17-11ec-aba9-06e52fpid001','b357ac40-f9b2-11eb-ad8a-0242ac160005','45af0e5c-6a94-11eb-9030-0242ac160005','order_2',NULL,NULL,'2022-05-31 17:33:51','2022-05-31 16:33:49',NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,'2022-05-31 17:33:49','2022-08-10 17:39:16');
INSERT INTO `affiliate_conversion` (`id`,`m_project_id`,`influencer_id`,`endclient_id`,`order_id`,`click_id`,`session_id`,`conversion_at`,`click_at`,`conversion_at_tz`,`click_at_tz`,`useragent`,`os`,`referer_url`,`current_url`,`memo`,`approve_status`,`created_at`,`updated_at`) VALUES (7,'a16b9356-2b17-11ec-aba9-06e52fpid001','b357ac40-f9b2-11eb-ad8a-0242ac160005','45af0e5c-6a94-11eb-9030-0242ac160005','order_3',NULL,NULL,'2022-05-31 17:33:50','2022-05-31 16:33:50',NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,'2022-05-31 17:33:48','2022-07-21 10:36:59');
INSERT INTO `affiliate_conversion` (`id`,`m_project_id`,`influencer_id`,`endclient_id`,`order_id`,`click_id`,`session_id`,`conversion_at`,`click_at`,`conversion_at_tz`,`click_at_tz`,`useragent`,`os`,`referer_url`,`current_url`,`memo`,`approve_status`,`created_at`,`updated_at`) VALUES (8,'a16b9356-2b17-11ec-aba9-06e52fpid001','b357ac40-f9b2-11eb-ad8a-0242ac160005','45af0e5c-6a94-11eb-9030-0242ac160005','order_4',NULL,NULL,'2022-05-31 17:33:49','2022-05-31 16:33:51',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'2022-05-31 17:33:47','2022-07-21 10:36:59');
INSERT INTO `affiliate_conversion` (`id`,`m_project_id`,`influencer_id`,`endclient_id`,`order_id`,`click_id`,`session_id`,`conversion_at`,`click_at`,`conversion_at_tz`,`click_at_tz`,`useragent`,`os`,`referer_url`,`current_url`,`memo`,`approve_status`,`created_at`,`updated_at`) VALUES (9,'a16b9356-2b17-11ec-aba9-06e52fpid001','b357ac40-f9b2-11eb-ad8a-0242ac160005','45af0e5c-6a94-11eb-9030-0242ac160005',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'2022-05-31 17:33:46','2022-07-21 10:36:59');
INSERT INTO `affiliate_conversion` (`id`,`m_project_id`,`influencer_id`,`endclient_id`,`order_id`,`click_id`,`session_id`,`conversion_at`,`click_at`,`conversion_at_tz`,`click_at_tz`,`useragent`,`os`,`referer_url`,`current_url`,`memo`,`approve_status`,`created_at`,`updated_at`) VALUES (10,'a16b9356-2b17-11ec-aba9-06e52fpid001','b357ac40-f9b2-11eb-ad8a-0242ac160005','45af0e5c-6a94-11eb-9030-0242ac160005','order_9',NULL,NULL,'2022-05-31 17:33:44','2022-05-31 16:33:56',NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,'2022-05-31 17:33:41','2022-07-21 10:36:59');

-- insert influencer_socialmedia
INSERT INTO `influencer_socialmedia` (`influencer_socialmedia_id`,`influencer_id`,`media_id`,`socialmedia_id`,`biography`,`followers_count`,`media_count`,`follows_count`,`profile_image_url`,`username`,`created_at`,`updated_at`,`deleted_at`,`is_active`,`pr_rate`,`pr_engagement`,`avg_comment_count`,`recent_comment_max`,`recent_comment_min`,`recent_like_max`,`recent_like_min`,`age_man_rate_1`,`age_man_rate_2`,`age_man_rate_3`,`age_man_rate_4`,`age_man_rate_5`,`age_man_rate_6`,`age_women_rate_1`,`age_women_rate_2`,`age_women_rate_3`,`age_women_rate_4`,`age_women_rate_5`,`age_women_rate_6`,`is_update`,`post_rate`) VALUES (1,'29d4ee76-8869-11ea-a687-06ac534ba540','onumaaan',1,'食べながらdiet\\nミセス日本ﾌｧｲﾅﾘｽﾄ\\n一宮サッカー連盟イメージプレーヤー\\nFiNC @finc_app @oktikt_official 他アンバサダー色々\\n@onearts_jpn →fanochigusa 20%off\\n@sloli_jp→MILSLOLI 20%off',35552,1258,568,'https://scontent-sea1-1.xx.fbcdn.net/v/t51.2885-15/182478872_488126532240855_5720158391060606601_n.jpg?_nc_cat=106&ccb=1-5&_nc_sid=86c713&_nc_ohc=CbBkqD2NzKEAX9DTbH2&_nc_ht=scontent-sea1-1.xx&edm=AL-3X8kEAAAA&oh=78aa2e2bb25837fd6faf9be407c0f946&oe=612CA98A','chigu','2020-04-27 18:26:24','2021-08-26 10:20:38',NULL,1,18.00,0.00,2,23,0,0,0,12,25,22,15,19,1,37,41,9,1,0,0,1,NULL);
INSERT INTO `influencer_socialmedia` (`influencer_socialmedia_id`,`influencer_id`,`media_id`,`socialmedia_id`,`biography`,`followers_count`,`media_count`,`follows_count`,`profile_image_url`,`username`,`created_at`,`updated_at`,`deleted_at`,`is_active`,`pr_rate`,`pr_engagement`,`avg_comment_count`,`recent_comment_max`,`recent_comment_min`,`recent_like_max`,`recent_like_min`,`age_man_rate_1`,`age_man_rate_2`,`age_man_rate_3`,`age_man_rate_4`,`age_man_rate_5`,`age_man_rate_6`,`age_women_rate_1`,`age_women_rate_2`,`age_women_rate_3`,`age_women_rate_4`,`age_women_rate_5`,`age_women_rate_6`,`is_update`,`post_rate`) VALUES (2,'7cb99672-8897-11ea-bd4b-06ac534ba540','chiyamacyama',1,'influencer / beauty&mental specialist',54603,192,5044,'https://scontent-sea1-1.xx.fbcdn.net/v/t51.2885-15/92953580_263176638044434_7368314582982459392_n.jpg?_nc_cat=110&ccb=1-3&_nc_sid=86c713&_nc_ohc=ySpGrKa-A4oAX_vOO19&_nc_ht=scontent-sea1-1.xx&oh=5ffa990d0967fbef47293d81b19d4a14&oe=606C5DA7','ちよんの Chiyonno','2020-04-27 23:58:00','2021-03-09 00:00:21',NULL,1,0.00,0.00,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,NULL);
INSERT INTO `influencer_socialmedia` (`influencer_socialmedia_id`,`influencer_id`,`media_id`,`socialmedia_id`,`biography`,`followers_count`,`media_count`,`follows_count`,`profile_image_url`,`username`,`created_at`,`updated_at`,`deleted_at`,`is_active`,`pr_rate`,`pr_engagement`,`avg_comment_count`,`recent_comment_max`,`recent_comment_min`,`recent_like_max`,`recent_like_min`,`age_man_rate_1`,`age_man_rate_2`,`age_man_rate_3`,`age_man_rate_4`,`age_man_rate_5`,`age_man_rate_6`,`age_women_rate_1`,`age_women_rate_2`,`age_women_rate_3`,`age_women_rate_4`,`age_women_rate_5`,`age_women_rate_6`,`is_update`,`post_rate`) VALUES (3,'a314180a-8893-11ea-9caa-06ac534ba540','mari_alwayshawaii',1,'Osaka city/25old\nfashion/cafe/travel/ウーミーインフルエンサー\n???\nカコのコメント.DM気づかない事があります\n｢どこのですか？｣というDMはお控え頂ければと思います?お洋服に関してはわかる範囲はまた投稿にてタグ付け致します！',44480,918,541,'https://scontent-sea1-1.xx.fbcdn.net/v/t51.2885-15/106799661_326971618301828_8578721654794507972_n.jpg?_nc_cat=107&ccb=1-3&_nc_sid=86c713&_nc_ohc=nJUJvLwc0pQAX-G0pEZ&_nc_ht=scontent-sea1-1.xx&oh=5e027f6a94c99eb5f85ee70e6a3d2e74&oe=606ACF2E','','2020-04-27 23:30:26','2021-03-07 00:00:20',NULL,1,0.00,0.00,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,NULL);
INSERT INTO `influencer_socialmedia` (`influencer_socialmedia_id`,`influencer_id`,`media_id`,`socialmedia_id`,`biography`,`followers_count`,`media_count`,`follows_count`,`profile_image_url`,`username`,`created_at`,`updated_at`,`deleted_at`,`is_active`,`pr_rate`,`pr_engagement`,`avg_comment_count`,`recent_comment_max`,`recent_comment_min`,`recent_like_max`,`recent_like_min`,`age_man_rate_1`,`age_man_rate_2`,`age_man_rate_3`,`age_man_rate_4`,`age_man_rate_5`,`age_man_rate_6`,`age_women_rate_1`,`age_women_rate_2`,`age_women_rate_3`,`age_women_rate_4`,`age_women_rate_5`,`age_women_rate_6`,`is_update`,`post_rate`) VALUES (4,'b357ac40-f9b2-11eb-ad8a-0242ac160005','_941020_',1,'ふくおかのひと',5000,856,232,'https://scontent.fitm1-1.fna.fbcdn.net/v/t51.2885-15/246547938_592637368597734_6764010612338598145_n.jpg?_nc_cat=102&ccb=1-5&_nc_sid=86c713&_nc_ohc=nxiuOS_YEoYAX8QQBH6&_nc_ht=scontent.fitm1-1.fna&edm=AL-3X8kEAAAA&oh=5ad82baa539588ce94e80216f7ab0502&oe=617BBA0F','kanna','2021-08-10 17:12:27','2021-11-15 17:50:19',NULL,1,26.00,0.00,10,51,0,4401,0,0,0,0,0,0,0,0,0,0,0,0,0,1,NULL);

-- insert affiliate
INSERT INTO `affiliate` (`id`,`m_project_id`,`price`,`condition`,`accept`,`cv_rate`,`accept_rate`,`landing_url`,`reject_condition`,`highlight`,`accept_type`,`accept_interval`,`fix_price`,`created_at`,`updated_at`) VALUES (1,'a16b9356-2b17-11ec-aba9-06e52fpid001','200','「日本初の人工知能搭載型ベビーカー」という言葉を強く訴求して欲しいです。加えて機能面を訴求してください。',NULL,33,'90','https://im-mall-endclient-localhost/create/scaaa','プログラムの成果条件(期限内の入金や、カード発行、申込後の本人確認、会員登録後の利用など)を満たしていない場合、\r\nもしくは否認条件(注文キャンセルや、重複申込、入力内容の不備、既存顧客による申込など)に該当する場合、成果はキャンセル処理されます。\r\nまた、長期間にわたって成果条件を満たされない場合もキャンセル処理されることがあります。aaa',4,1,30,NULL,'2022-05-25 14:43:43','2022-05-30 18:00:38');

commit;