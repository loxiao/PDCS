/*
Navicat MySQL Data Transfer

Source Server         : 1
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : pdcs

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2024-07-11 09:49:18
*/
CREATE DATABASE PDCS;
USE PDCS;
SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
                         `AdminID` int(11) NOT NULL AUTO_INCREMENT,
                         `AdminName` varchar(255) NOT NULL,
                         `AdminNumber` varchar(255) NOT NULL,
                         `AdminPsd` varchar(255) NOT NULL,
                         PRIMARY KEY (`AdminID`),
                         UNIQUE KEY `AdminNumber` (`AdminNumber`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('1', 'Alice', 'admin@1234.com', '1234');
INSERT INTO `admin` VALUES ('2', 'Bob', 'admin@1213.com', '1211');

-- ----------------------------
-- Table structure for awards
-- ----------------------------
DROP TABLE IF EXISTS `awards`;
CREATE TABLE `awards` (
                          `AwardID` int(11) NOT NULL AUTO_INCREMENT,
                          `WorkID` int(11) NOT NULL,
                          `AwardName` varchar(255) NOT NULL,
                          `CompetitionID` int(11) NOT NULL,
                          `Winner1ID` int(11) DEFAULT NULL,
                          `Winner2ID` int(11) DEFAULT NULL,
                          `Winner3ID` int(11) DEFAULT NULL,
                          `Winner4ID` int(11) DEFAULT NULL,
                          `AwardImageURL` varchar(255) DEFAULT NULL,
                          PRIMARY KEY (`AwardID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of awards
-- ----------------------------
INSERT INTO `awards` VALUES ('1', '1', '一等奖', '1', '1', '2', '4', '5', '1.png');
INSERT INTO `awards` VALUES ('2', '2', '一等奖', '5', '4', '9', '15', '16', '4.png');
INSERT INTO `awards` VALUES ('3', '3', '一等奖', '4', '5', '17', '18', '19', '3.png');
INSERT INTO `awards` VALUES ('4', '4', '一等奖', '6', '2', '20', '21', '22', '5.png');
INSERT INTO `awards` VALUES ('5', '5', '一等奖', '7', '9', '23', '24', '25', '6.png');
INSERT INTO `awards` VALUES ('6', '6', '一等奖', '10', '1', '4', '5', null, '7.png');
INSERT INTO `awards` VALUES ('7', '7', '一等奖', '13', '15', '9', '2', null, '8.png');
INSERT INTO `awards` VALUES ('8', '8', '一等奖', '19', '19', '18', '17', null, '9.png');
INSERT INTO `awards` VALUES ('9', '9', '一等奖', '2', '1', '2', '4', '5', '2.png');

-- ----------------------------
-- Table structure for competitions
-- ----------------------------
DROP TABLE IF EXISTS `competitions`;
CREATE TABLE `competitions` (
                                `CompetitionID` int(11) NOT NULL AUTO_INCREMENT,
                                `CompetitionName` varchar(255) NOT NULL,
                                `CompetitionDate` date NOT NULL,
                                `RegistrationDeadline` date NOT NULL,
                                `CompetitionTypeID` int(11) DEFAULT NULL,
                                `CompetitionTypeName` varchar(255) DEFAULT NULL,
                                `CompetitionDescription` text NOT NULL,
                                `MaxParticipants` int(11) DEFAULT NULL,
                                `Theme` varchar(255) DEFAULT NULL,
                                `PublishDate` date DEFAULT NULL,
                                PRIMARY KEY (`CompetitionID`),
                                KEY `fk_competition_type` (`CompetitionTypeID`),
                                CONSTRAINT `fk_competition_type` FOREIGN KEY (`CompetitionTypeID`) REFERENCES `competitiontypes` (`CompetitionTypeID`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of competitions
-- ----------------------------
INSERT INTO `competitions` VALUES ('1', '2022年第7届大学生海洋公益海报竞赛', '2022-10-09', '2022-07-10', '1', '公益类', '2022年第7届大学生海洋公益海报竞赛是一项旨在提升公众海洋保护意识的年度盛事。本次竞赛鼓励学生们运用创意设计，展现海洋生态的多样性与脆弱性，倡导可持续发展的理念。参赛者将通过海报这一直观媒介，传达保护海洋环境的紧迫性和重要性。我们诚邀全国在校大学生积极参与，用艺术的力量为海洋发声，共同守护我们的蓝色星球。', '4', '海洋', '2022-06-01');
INSERT INTO `competitions` VALUES ('2', '2024年第15届大学生建军节海报', '2024-01-02', '2023-12-01', '2', '国防类', '2024年第15届大学生建军节海报竞赛涌现出众多创意与情感并重的作品。这些海报不仅以其鲜明的色彩和独特的设计吸引了观众的目光，更深刻地传达了对军人精神的敬意和对和平的珍视。学生们的创作充分展现了他们对历史的理解、对英雄的崇敬以及对未来的憧憬。每一幅海报都是对建军节深刻的思考和美好愿景的展现，它们让我们铭记过去，珍惜和平，激励我们共同为一个更加繁荣和谐的社会贡献力量。', '4', '建军', '2022-06-01');
INSERT INTO `competitions` VALUES ('3', '2021年第30届大学生泡芙宣传竞赛', '2024-09-10', '2024-07-06', '3', '商业类', '2021年第30届大学生泡芙宣传竞赛是一场集创意与美食于一体的盛会。本次竞赛旨在激发学生们的创新思维和艺术设计能力，通过海报的形式展现泡芙的诱人魅力和文化内涵。我们鼓励参赛者以独特的视角和创新的手法，捕捉泡芙的美味瞬间，传达甜品带来的幸福感。竞赛不仅为学生们提供了展示才华的平台，也为推广美食文化、提升设计水平搭建了桥梁。让我们一同期待这场视觉与味觉的双重盛宴。', '4', '泡芙', '2022-06-01');
INSERT INTO `competitions` VALUES ('4', '2024年第11届国防科技创新海报大赛', '2024-01-15', '2023-11-15', '2', '国防类', '科技创新，国防之魂。第11届国防科技创新海报大赛致力于激发青年学子的创新精神和爱国情怀。我们鼓励参赛者运用现代设计理念，结合国防科技元素，创作出能够展现国家力量和科技成就的海报作品，共同推动国防科技进步与和平发展。', '4', '国防', '2022-06-01');
INSERT INTO `competitions` VALUES ('5', '2024年第6届军事历史知识海报竞赛', '2024-02-20', '2023-12-20', '2', '国防类', '历史是最好的教科书。第6届军事历史知识海报竞赛旨在通过视觉艺术的形式，让学生们深入了解军事历史，传承红色基因，弘扬民族精神。我们期待参赛者用海报讲述那些激励人心的历史瞬间，增强民族自豪感和历史使命感。', '4', '军事历史', '2022-06-01');
INSERT INTO `competitions` VALUES ('6', '2024年第1届绿色地球环保海报设计海报大赛', '2024-07-10', '2024-05-10', '1', '公益类', '绿色地球，你我共建。首届绿色地球环保海报设计大赛以提升公众环保意识为宗旨，鼓励学生运用创意设计，表达对自然环境保护的关注和思考。我们希望参赛者的作品能够唤起人们心中对绿色生活的向往，共同参与到环境保护的伟大事业中。', '4', '环保', '2022-06-01');
INSERT INTO `competitions` VALUES ('7', '2024年第14届关爱留守儿童公益广告海报大赛', '2024-07-11', '2024-05-11', '1', '公益类', '留守不孤单，关爱在行动。第14届关爱留守儿童公益广告海报大赛聚焦于这一特殊群体，通过公益海报的形式，传递社会的温暖与关怀。我们期望参赛者的作品能够触动人心，唤起更多人对留守儿童问题的关注，并积极参与到关爱行动中来。', '4', '关爱', '2022-06-01');
INSERT INTO `competitions` VALUES ('8', '2023年第3届国际品牌设计海报大赛', '2023-07-12', '2023-05-12', '3', '商业类', '品牌故事，设计发声。第3届国际品牌设计海报大赛以国际化视野为背景，邀请全球设计爱好者展现国际品牌的文化内涵和设计理念。我们鼓励参赛者深入挖掘品牌故事，通过海报设计传递品牌价值，探索设计在品牌传播中的力量。', '4', '品牌设计', '2022-06-01');
INSERT INTO `competitions` VALUES ('9', '2023第8届年电子商务创新海报大赛', '2023-07-13', '2023-03-13', '3', '商业类', '电商新浪潮，创新引领未来。第8届电子商务创新海报大赛聚焦于电子商务领域的创新发展，鼓励学生探索电商新模式、新趋势。我们期待参赛者用海报展示电商如何便捷生活、推动经济发展，激发更多人对电商创新的思考和参与。', '4', '电子商务', '2022-06-01');
INSERT INTO `competitions` VALUES ('10', '2023年第11届春季大学生编程挑战海报赛', '2023-06-01', '2023-03-01', '3', '商业类', '春回大地，代码飞扬。第11届春季大学生编程挑战海报赛以编程挑战为主题，邀请编程爱好者通过海报展现编程语言的魅力和创新思维。我们希望参赛者的作品能够激发更多人对编程学习的兴趣，共同探索技术改变世界的无限可能。', '4', '编程', '2022-06-01');
INSERT INTO `competitions` VALUES ('11', '2023年第4届夏季大学生建筑设计海报大赛', '2023-08-31', '2023-08-01', '1', '公益类', '夏日炎炎，设计清凉。第4届夏季大学生建筑设计海报大赛以夏日为灵感，鼓励学生探索建筑设计与自然环境的和谐共生。我们期待参赛者用海报展示如何通过创新设计为人们带来清凉舒适的生活空间，展现建筑设计的美学与实用性。', '4', '建筑', '2022-06-01');
INSERT INTO `competitions` VALUES ('12', '2024年第5届大学生夏季军歌节海报大赛', '2024-08-17', '2024-07-20', '2', '国防类', '以军歌传承精神，以海报展现力量。第5届大学生夏季军歌节海报大赛不仅是一场视觉盛宴，更是一次心灵的触动。我们鼓励学生们通过海报设计，捕捉军歌背后的深厚情感和历史意义，传递军人的坚毅与勇敢，激发全社会的爱国热情和集体荣誉感。', '4', '音乐节', '2022-06-01');
INSERT INTO `competitions` VALUES ('13', '2024年第9届国防科技挑战海报赛', '2024-07-08', '2024-04-08', '2', '国防类', '科技创新，国防未来。第9届国防科技挑战海报赛旨在激发青年学生的创新热情和科技梦想。通过海报，我们希望学生们能够展示国防科技的前沿发展，探索科技与国防结合的无限可能，为国家的和平与安全贡献青春智慧。', '4', '国防科技', '2022-06-01');
INSERT INTO `competitions` VALUES ('14', '2024年第13届军事模拟战略海报大赛','2024-08-18',  '2025-07-18', '2', '国防类', '战略智慧，沙场秋点兵。第13届军事模拟战略海报大赛邀请学生们运用战略思维，设计出能够体现军事模拟深度和广度的海报。我们期待作品能够展现军事策略的精妙，启发人们对军事艺术的深入思考和学习。', '4', '军事战略', '2022-06-01');
INSERT INTO `competitions` VALUES ('15', '2024年第21届城市环保创新海报大赛','2024-08-12',  '2025-07-12', '1', '公益类', '绿色城市，创新生活。第21届城市环保创新海报大赛聚焦于城市可持续发展的创新理念。我们鼓励学生们提出并展示他们的环保解决方案，通过海报设计引领环保新潮流，促进生态文明建设，共同为地球的未来贡献力量。', '4', '城市环保', '2022-06-01');
INSERT INTO `competitions` VALUES ('16', '2024年第22届文化遗产保护海报竞赛','2024-08-13',  '2025-07-13', '1', '公益类', '文化遗产，民族之根。第22届文化遗产保护海报竞赛致力于提高公众对文化遗产重要性的认识。我们邀请学生们通过海报设计，展现文化遗产的独特魅力，激发对传统与现代融合的思考，共同守护我们宝贵的文化财富。', '4', '文化遗产', '2022-06-01');
INSERT INTO `competitions` VALUES ('17', '2024年第20届国际品牌营销海报大赛','2024-08-24',  '2025-08-14', '3', '商业类', '品牌故事，全球视野。第20届国际品牌营销海报大赛以国际品牌为焦点，鼓励学生们探索品牌背后的深刻故事和全球影响力。我们期待学生们的创意海报能够展现品牌的文化内涵和市场策略，提升品牌的全球竞争力。', '4', '品牌营销', '2022-06-01');
INSERT INTO `competitions` VALUES ('18', '2024年第1届青年创业挑战海报赛',   '2024-08-05' , ' 2025-07-17', '3', '商业类', '创业之路，挑战与机遇并存。首届青年创业挑战海报赛旨在激发青年的创业激情和创新思维。我们鼓励学生们通过海报设计，展示他们的创业理念、项目特色和市场潜力，激励更多青年勇敢追求创业梦想。', '4', '青年创业', '2022-06-01');
INSERT INTO `competitions` VALUES ('19', '2024年第11届春季大学生艺术海报展','2024-08-12',  '2025-07-30', '3', '商业类', '春天的艺术，创意的绽放。第11届春季大学生艺术海报展是一场展示大学生艺术才华的盛会。我们邀请学生们以春天为主题，通过海报设计表达对自然美、艺术美和生活美的感悟，展现春天的生机与艺术的创造力。', '4', '艺术展', '2022-06-01');
INSERT INTO `competitions` VALUES ('20', '2024年第14届夏季大学生编程马拉松', '2025-08-31', '2024-07-30', '1', '公益类', '编码盛夏，智慧对决。第14届夏季大学生编程马拉松是一场技术的较量，一场创新的盛宴。我们邀请编程高手们在限定时间内挑战极限，展现逻辑之美。这不仅是一场编程竞赛，更是一次思维与速度的碰撞，一次团队协作与个人能力的双重考验。', '4', '编程马拉松', '2022-06-01');
INSERT INTO `competitions` VALUES ('21', '2024年第17届夏季大学生编程马拉松海报大赛', '2024-08-31', '2024-07-30', '1', '公益类', '海报映照智慧，编码点燃激情。第17届夏季大学生编程马拉松海报大赛以创意为笔，以技术为墨，邀请学生们设计出能够代表编程精神的海报。我们期待作品捕捉编程马拉松的紧张与兴奋，展现参赛者们的专注与热情，传递科技改变世界的力量。', '4', '编程马拉松', '2022-06-01');
INSERT INTO `competitions` VALUES ('22', '2024年第18届大学生夏季电影海报大赛', '2024-08-17', '2024-07-27', '2', '国防类', '银幕之下，海报之上。第18届大学生夏季电影海报大赛是一场视觉与故事的交融。我们鼓励学生们以电影为灵感，设计出能够讲述故事、传达情感的海报。这不仅是对电影艺术的致敬，更是一次创意与设计技巧的展示，一次视觉叙事的探索。', '4', '电影节', '2022-06-01');
INSERT INTO `competitions` VALUES ('23', '2024年第19届大学生夏季摄影海报大赛', '2024-07-18', '2024-04-18', '1', '公益类', '镜头捕捉瞬间，海报讲述故事。第19届大学生夏季摄影海报大赛邀请摄影爱好者们通过镜头探索世界，用海报展示瞬间之美。我们期待作品展现摄影的独特视角，讲述触动人心的故事，传递摄影艺术的魅力与情感深度。', '4', '摄影', '2022-06-01');
INSERT INTO `competitions` VALUES ('30', '国防应急演练大赛', '2024-01-10', '2024-12-31', '2', '国防类', '检验应急响应能力，提升国防应急管理水平。', '4', '应急演练', '2024-11-15');
INSERT INTO `competitions` VALUES ('31', '边防安全技能比武', '2024-07-10', '2024-07-20', '2', '国防类', '提升边防官兵安全技能，保障国家安全。', '4', '安全技能', '2024-05-15');
INSERT INTO `competitions` VALUES ('32', '国防战略创新大赛', '2024-07-27', '2024-07-30', '2', '国防类', '探索国防战略新思维，推动国防科技创新。', '4', '战略创新', '2024-03-15');
INSERT INTO `competitions` VALUES ('33', '国防装备设计挑战赛', '2024-07-20','2024-07-31', '2', '国防类', '激发设计灵感，打造未来国防装备。', '4', '装备设计', '2024-04-15');
INSERT INTO `competitions` VALUES ('34', '海报比赛', '2024-07-11', '2024-08-11', '1', '公益类', '该比赛……', '4', '为了……', '2024-07-13');
INSERT INTO `competitions` VALUES ('35', '国防教育知识竞赛', '2024-08-15', '2024-07-31', '2', '国防类', '普及国防知识，增强全民国防意识。', '4', '国防教育', '2024-06-15');
INSERT INTO `competitions` VALUES ('36', '国防科技论文大赛', '2024-09-20', '2024-08-31', '2', '国防类', '鼓励科研创新，推动国防科技领域发展。', '4', '科技论文', '2024-07-15');
INSERT INTO `competitions` VALUES ('37', '国防信息安全攻防演练', '2024-10-15', '2024-09-30', '2', '国防类', '检验信息安全防护能力，提升国防信息安全水平。', '4', '信息安全', '2024-08-15');
INSERT INTO `competitions` VALUES ('38', '国防装备维修技能大赛', '2024-11-10', '2024-10-31', '2', '国防类', '提升装备维修技能，保障装备完好率。', '4', '装备维修', '2024-09-15');
INSERT INTO `competitions` VALUES ('39', '国防战略规划研讨会', '2024-8-15', '2024-7-30', '2', '国防类', '深入研讨国防战略规划，为国防建设提供指导。', '4', '战略规划', '2024-10-15');
INSERT INTO `competitions` VALUES ('40', '全球公益项目合作洽谈会', '2024-8-15', '2024-7-30', '1', '公益类', '促进全球公益项目合作，共同应对挑战。', '4', '携手公益', '2024-10-15');
INSERT INTO `competitions` VALUES ('41', '环保海报设计大赛', '2024-08-15', '2024-07-19', '1', '公益类', '设计环保主题海报，提升公众环保意识。', '4', '绿色地球', '2024-01-15');
INSERT INTO `competitions` VALUES ('42', '公益微电影创作比赛', '2024-04-20', '2024-03-31', '1', '公益类', '用微电影讲述公益故事，传递正能量。', '4', '爱的传递', '2024-02-15');
INSERT INTO `competitions` VALUES ('43', '公益广告设计竞赛', '2024-08-15', '2024-07-30', '1', '公益类', '创作公益广告，呼吁社会关注弱势群体。', '4', '关爱行动', '2024-03-15');
INSERT INTO `competitions` VALUES ('44', '环保科技创新大赛', '2024-06-20', '2024-05-31', '1', '公益类', '推动环保科技创新，解决环境问题。', '4', '绿色科技', '2024-04-15');
INSERT INTO `competitions` VALUES ('45', '公益摄影展', '2024-08-15', '2024-07-30', '1', '公益类', '用镜头捕捉公益瞬间，展现人间温情。', '4', '温暖瞬间', '2024-05-15');
INSERT INTO `competitions` VALUES ('46', '青少年公益创意大赛', '2024-08-20', '2024-07-31', '1', '公益类', '激发青少年创意，为公益事业贡献力量。', '4', '创意无限', '2024-06-15');
INSERT INTO `competitions` VALUES ('47', '公益项目策划竞赛', '2024-09-15', '2024-08-31', '1', '公益类', '策划公益项目，推动社会进步。', '4', '公益前行', '2024-07-15');
INSERT INTO `competitions` VALUES ('48', '公益志愿服务表彰大会', '2024-8-15', '2024-07-30', '1', '公益类', '表彰优秀公益志愿者，弘扬志愿精神。', '4', '志愿之光', '2024-08-15');
INSERT INTO `competitions` VALUES ('49', '公益教育论坛', '2024-8-15', '2024-7-30', '1', '公益类', '探讨公益教育理念，促进教育公平。', '4', '教育公益', '2024-09-15');
INSERT INTO `competitions` VALUES ('50', '全球商业领袖峰会', '2024-8-15', '2024-07-30', '3', '商业类', '汇聚全球商业精英，共谋商业发展大计。', '4', '商业巅峰', '2024-08-25');
INSERT INTO `competitions` VALUES ('51', '全国商业策划大赛', '2024-08-01', '2022-7-25', '3', '商业类', '制定商业策略，挑战市场巅峰。', '4', '商业智慧', '2022-11-01');
INSERT INTO `competitions` VALUES ('52', '创新商业模式挑战赛', '2024-08-15', '2024-07-15', '3', '商业类', '探索创新商业模式，引领行业变革。', '4', '模式创新', '2022-12-15');
INSERT INTO `competitions` VALUES ('53', '创业项目路演大赛', '2024-08-20', '2024-07-28', '3', '商业类', '展示创业项目，吸引投资与合作。', '4', '创业舞台', '2024-01-20');
INSERT INTO `competitions` VALUES ('54', '品牌营销创意大赛', '2024-08-15', '2024-07-27', '3', '商业类', '策划品牌营销方案，提升品牌影响力。', '4', '品牌力量', '2024-02-25');
INSERT INTO `competitions` VALUES ('55', '电子商务创新竞赛', '2024-08-10', '2024-07-30', '3', '商业类', '推动电子商务创新，引领消费新潮流。', '4', '电商未来', '2024-03-25');
INSERT INTO `competitions` VALUES ('56', '金融科技应用大赛', '2024-08-15', '2024-07-28', '3', '商业类', '探索金融科技应用，促进金融服务创新。', '4', '金融科技', '2024-04-25');
INSERT INTO `competitions` VALUES ('57', '供应链管理挑战赛', '2024-08-10', '2024-07-30', '3', '商业类', '优化供应链管理，提升企业竞争力。', '4', '供应链优化', '2024-05-25');
INSERT INTO `competitions` VALUES ('58', '新零售创新大赛', '2024-08-15', '2024-07-29', '3', '商业类', '探索新零售模式，重塑零售新生态。', '4', '新零售时代', '2024-06-25');
INSERT INTO `competitions` VALUES ('59', '商业数据分析竞赛', '2024-09-10', '2024-08-31', '3', '商业类', '运用数据分析技术，挖掘商业价值。', '4', '数据洞察', '2024-07-25');

-- ----------------------------
-- Table structure for competitiontypes
-- ----------------------------
DROP TABLE IF EXISTS `competitiontypes`;
CREATE TABLE `competitiontypes` (
                                    `CompetitionTypeID` int(11) NOT NULL AUTO_INCREMENT,
                                    `TypeName` varchar(255) NOT NULL,
                                    PRIMARY KEY (`CompetitionTypeID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of competitiontypes
-- ----------------------------
INSERT INTO `competitiontypes` VALUES ('1', '公益类');
INSERT INTO `competitiontypes` VALUES ('2', '国防类');
INSERT INTO `competitiontypes` VALUES ('3', '商业类');

-- ----------------------------
-- Table structure for judges
-- ----------------------------
DROP TABLE IF EXISTS `judges`;
CREATE TABLE `judges` (
                          `JudgeID` int(11) NOT NULL AUTO_INCREMENT,
                          `JudgesName` varchar(255) NOT NULL,
                          `JudgesNumber` varchar(255) NOT NULL,
                          `JudgesPsd` varchar(255) NOT NULL,
                          PRIMARY KEY (`JudgeID`),
                          UNIQUE KEY `JudgesNumber` (`JudgesNumber`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of judges
-- ----------------------------
INSERT INTO `judges` VALUES ('1', 'Jhon', '1224.com', '1234');
INSERT INTO `judges` VALUES ('2', 'Mike', '1432.com', '9879');

-- ----------------------------
-- Table structure for participant
-- ----------------------------
DROP TABLE IF EXISTS `participant`;
CREATE TABLE `participant` (
                               `participant_id` int(11) NOT NULL AUTO_INCREMENT,
                               `participant_name` varchar(255) NOT NULL,
                               `participant_number` varchar(50) NOT NULL,
                               `participant_psd` varchar(50) NOT NULL,
                               `participant_address` varchar(255) NOT NULL,
                               `enter` int(11) DEFAULT NULL,
                               PRIMARY KEY (`participant_id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of participant
-- ----------------------------
INSERT INTO `participant` VALUES ('1', 'Jim', '3415.com', '1234', '二仙桥', '0');
INSERT INTO `participant` VALUES ('2', 'Kiko', '2456.com', '1111', '成华大道', '0');
INSERT INTO `participant` VALUES ('3', '张三', 'zhangsan3@example.com', 'zhangsan123', '北京市朝阳区三里屯', '0');
INSERT INTO `participant` VALUES ('4', '朱杨华', '1267.com', '7890', '绍兴', '0');
INSERT INTO `participant` VALUES ('5', 'Lili', '9868.com', '6521', '天海市', '0');
INSERT INTO `participant` VALUES ('6', '李四', 'lisi36@example.com', 'lisi123', '上海市浦东新区张江高科技园区', '0');
INSERT INTO `participant` VALUES ('7', '王五', 'wangwu37@example.com', 'wangwu123', '广州市天河区体育西路', '0');
INSERT INTO `participant` VALUES ('8', '赵六', 'zhaoliu49@example.com', 'zhaoliu123', '深圳市南山区粤海街道', '0');
INSERT INTO `participant` VALUES ('9', 'hlj', '1457.com', '1111', '楼外楼', '0');
INSERT INTO `participant` VALUES ('10', '李雷', 'lilei10@example.com', 'psd1234', '中国四川成都高新区', '0');
INSERT INTO `participant` VALUES ('11', '王芳', 'wangfang11@example.com', 'psd1234', '中国上海浦东新区', '0');
INSERT INTO `participant` VALUES ('12', '陈浩', 'chenhao12@example.com', 'psd1234', '中国广东深圳南山区', '0');
INSERT INTO `participant` VALUES ('13', '刘娟', 'liujuan13@example.com', 'psd1234', '中国浙江杭州西湖区', '0');
INSERT INTO `participant` VALUES ('14', '赵强', 'zqiang14@example.com', 'psd1234', '中国江苏苏州工业园区', '0');
INSERT INTO `participant` VALUES ('15', '刘德华', '7777.com', '1111', '香港', '0');
INSERT INTO `participant` VALUES ('16', '张三', '7891.com', '1234', '北京', '0');
INSERT INTO `participant` VALUES ('17', '李四', '1234.com', '1234', '上海', '0');
INSERT INTO `participant` VALUES ('18', '王五', '5678.com', '1234', '广州', '0');
INSERT INTO `participant` VALUES ('19', '赵六', '9012.com', '1234', '深圳', '0');
INSERT INTO `participant` VALUES ('20', '孙七', '3456.com', '1234', '杭州', '0');
INSERT INTO `participant` VALUES ('21', '周八', '7890.com', '1234', '成都', '0');
INSERT INTO `participant` VALUES ('22', '吴九', '1357.com', '1234', '武汉', '0');
INSERT INTO `participant` VALUES ('23', '郑十', '2460.com', '1234', '西安', '0');
INSERT INTO `participant` VALUES ('24', '钱十一', '1111.com', '1234', '南京', '0');
INSERT INTO `participant` VALUES ('25', '孙十二', '2222.com', '1234', '重庆', '0');
INSERT INTO `participant` VALUES ('26', '李白', '1999.com', '9999', '大唐', '0');
INSERT INTO `participant` VALUES ('27', '张三', 'lisi@qq.com', '123', 'aaaa', '0');
INSERT INTO `participant` VALUES ('28', '白起', '1666.com', '9999', 'aaaa', '0');
INSERT INTO `participant` VALUES ('29', '马云', 'mayun29@example.com', 'psd1234', '中国浙江杭州余杭区', '0');
INSERT INTO `participant` VALUES ('30', '狗蛋', '7776.com', '1111', '重庆', '0');
INSERT INTO `participant` VALUES ('31', '陈晨', 'chenchen@example.com', 'chenchen123', '南京市长江路123号', '0');
INSERT INTO `participant` VALUES ('32', '李雷', 'lilei@example.com', 'lilei123', '北京市朝阳区望京SOHO', '0');
INSERT INTO `participant` VALUES ('33', '王芳', 'wangfang@example.com', 'wangfang123', '上海市浦东新区世纪大道', '0');
INSERT INTO `participant` VALUES ('34', '赵磊', 'zhaolei@example.com', 'zhaolei123', '广州市天河区天河路', '0');
INSERT INTO `participant` VALUES ('35', '马云', 'mayun@example.com', 'mayun123', '杭州市西湖区文三路', '0');
INSERT INTO `participant` VALUES ('36', '钱伟', 'qianwei@example.com', 'qianwei123', '成都市高新区天府软件园', '0');
INSERT INTO `participant` VALUES ('37', '孙悦', 'sunyue@example.com', 'sunyue123', '西安市雁塔区科技二路', '0');
INSERT INTO `participant` VALUES ('38', '周杰', 'zhoujie@example.com', 'zhoujie123', '武汉市洪山区珞喻路', '0');
INSERT INTO `participant` VALUES ('39', '吴兰', 'wulan@example.com', 'wulan123', '重庆市渝北区金开大道', '0');
INSERT INTO `participant` VALUES ('40', '郑和', 'zhenghe@example.com', 'zhenghe123', '苏州市工业园区星湖街', '0');
INSERT INTO `participant` VALUES ('41', '郭靖', 'guojing@example.com', 'guojing123', '桃花岛桃花村', '0');
INSERT INTO `participant` VALUES ('42', '黄蓉', 'huangrong@example.com', 'huangrong123', '襄阳城', '0');
INSERT INTO `participant` VALUES ('43', '杨过', 'yangguo@example.com', 'yangguo123', '终南山活死人墓', '0');
INSERT INTO `participant` VALUES ('44', '小龙女', 'xiaolongnv@example.com', 'xiaolongnv123', '绝情谷底', '0');
INSERT INTO `participant` VALUES ('45', '张无忌', 'zhangwuji@example.com', 'zhangwuji123', '明教光明顶', '0');
INSERT INTO `participant` VALUES ('46', '赵敏', 'zhaomin@example.com', 'zhaomin123', '大都', '0');
INSERT INTO `participant` VALUES ('47', '令狐冲', 'linghuchong@example.com', 'linghuchong123', '华山派', '0');
INSERT INTO `participant` VALUES ('48', '任盈盈', 'renyingying@example.com', 'renyingying123', '黑木崖', '0');
INSERT INTO `participant` VALUES ('49', '萧峰', 'xiaofeng@example.com', 'xiaofeng123', '丐帮总舵', '0');
INSERT INTO `participant` VALUES ('50', '段誉', 'duanyu@example.com', 'duanyu123', '大理国', '0');

-- ----------------------------
-- Table structure for participant_messages
-- ----------------------------
DROP TABLE IF EXISTS `participant_messages`;
CREATE TABLE `participant_messages` (
                                        `message_id` int(11) NOT NULL AUTO_INCREMENT,
                                        `participant_id` int(11) NOT NULL,
                                        `team_id` int(11) NOT NULL,
                                        `judgment` int(11) NOT NULL,
                                        `participant_name` varchar(255) NOT NULL,
                                        `team_name` varchar(255) NOT NULL,
                                        `recipient_id` int(11) NOT NULL,
                                        PRIMARY KEY (`message_id`),
                                        KEY `participant_id` (`participant_id`),
                                        KEY `team_id` (`team_id`),
                                        CONSTRAINT `participant_messages_ibfk_1` FOREIGN KEY (`participant_id`) REFERENCES `participant` (`participant_id`),
                                        CONSTRAINT `participant_messages_ibfk_2` FOREIGN KEY (`team_id`) REFERENCES `teams` (`TeamID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of participant_messages
-- ----------------------------
INSERT INTO `participant_messages` VALUES ('1', '5', '113', '0', 'Lili', '军歌海报先锋队', '20');
INSERT INTO `participant_messages` VALUES ('2', '6', '102', '0', '李四', '强国在心中队', '1');
INSERT INTO `participant_messages` VALUES ('3', '4', '102', '0', '朱杨华', '强国在心中队', '1');
INSERT INTO `participant_messages` VALUES ('4', '4', '116', '0', '朱杨华', '军歌历史传承队', '29');

-- ----------------------------
-- Table structure for teams
-- ----------------------------
DROP TABLE IF EXISTS `teams`;
CREATE TABLE `teams` (
                         `TeamID` int(11) NOT NULL AUTO_INCREMENT,
                         `TeamName` varchar(255) NOT NULL,
                         `CaptainID` int(11) NOT NULL,
                         `Member1ID` int(11) DEFAULT NULL,
                         `Member2ID` int(11) DEFAULT NULL,
                         `Member3ID` int(11) DEFAULT NULL,
                         `CompetitionID` int(11) DEFAULT NULL,
                         PRIMARY KEY (`TeamID`),
                         KEY `CaptainID` (`CaptainID`),
                         KEY `Member1ID` (`Member1ID`),
                         KEY `Member2ID` (`Member2ID`),
                         KEY `Member3ID` (`Member3ID`),
                         CONSTRAINT `teams_ibfk_1` FOREIGN KEY (`CaptainID`) REFERENCES `participant` (`participant_id`),
                         CONSTRAINT `teams_ibfk_2` FOREIGN KEY (`Member1ID`) REFERENCES `participant` (`participant_id`),
                         CONSTRAINT `teams_ibfk_3` FOREIGN KEY (`Member2ID`) REFERENCES `participant` (`participant_id`),
                         CONSTRAINT `teams_ibfk_4` FOREIGN KEY (`Member3ID`) REFERENCES `participant` (`participant_id`)
) ENGINE=InnoDB AUTO_INCREMENT=123 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of teams
-- ----------------------------
INSERT INTO `teams` VALUES ('10', '海洋卫士', '1', '2', '4', '5', '1');
INSERT INTO `teams` VALUES ('11', '历史传承者', '4', '9', '15', '16', '5');
INSERT INTO `teams` VALUES ('12', '科技探索者', '5', '17', '18', '19', '4');
INSERT INTO `teams` VALUES ('13', '环保使者', '2', '20', '21', '22', '6');
INSERT INTO `teams` VALUES ('14', '关爱大使', '9', '23', '24', '25', '7');
INSERT INTO `teams` VALUES ('15', '编程挑战者', '1', '4', '5', null, '10');
INSERT INTO `teams` VALUES ('16', '国防创新者', '15', '9', '2', null, '13');
INSERT INTO `teams` VALUES ('17', '艺术春天', '19', '18', '17', null, '19');
INSERT INTO `teams` VALUES ('18', '建军强国', '1', '2', '4', '5', '2');
INSERT INTO `teams` VALUES ('19', '军歌嘹亮队', '15', '16', '17', '18', '1');
INSERT INTO `teams` VALUES ('95', '国防精英队', '19', '20', '21', '22', '2');
INSERT INTO `teams` VALUES ('96', '品牌设计队', '23', '24', '25', '26', '8');
INSERT INTO `teams` VALUES ('97', '电商领航队', '27', '28', '39', '30', '9');
INSERT INTO `teams` VALUES ('98', '编程精英队', '31', '32', '33', '34', '10');
INSERT INTO `teams` VALUES ('99', '建筑美学队', '35', '36', '37', '38', '11');
INSERT INTO `teams` VALUES ('100', '摄影艺术队', '39', '40', '41', '42', '23');
INSERT INTO `teams` VALUES ('102', '强国在心中队', '1', null, null, null, '12');
INSERT INTO `teams` VALUES ('113', '军歌海报先锋队', '20', '21', '22', null, '12');
INSERT INTO `teams` VALUES ('114', '军歌创意设计队', '23', '24', '25', null, '12');
INSERT INTO `teams` VALUES ('115', '军歌主题艺术队', '26', '27', '28', null, '12');
INSERT INTO `teams` VALUES ('116', '军歌历史传承队', '29', '30', '31', null, '12');
INSERT INTO `teams` VALUES ('117', '军歌文化宣传队', '32', '33', '34', null, '12');
INSERT INTO `teams` VALUES ('118', '军歌精神弘扬队', '35', '36', '37', null, '12');
INSERT INTO `teams` VALUES ('119', '军歌风格演绎队', '38', '39', '40', null, '12');
INSERT INTO `teams` VALUES ('120', '军歌情感表达队', '41', '42', '43', null, '12');
INSERT INTO `teams` VALUES ('121', '军歌英雄赞颂队', '44', '45', '46', null, '12');
INSERT INTO `teams` VALUES ('122', '军歌时代印记队', '47', '48', '49', null, '12');

-- ----------------------------
-- Table structure for works
-- ----------------------------
DROP TABLE IF EXISTS `works`;
CREATE TABLE `works` (
                         `WorkID` int(11) NOT NULL AUTO_INCREMENT,
                         `WorkName` varchar(255) NOT NULL,
                         `CompetitionID` int(11) NOT NULL,
                         `TeamID` int(11) NOT NULL,
                         `Likes` int(11) DEFAULT '0',
                         `Comments` text,
                         `ImageURL` varchar(255) DEFAULT NULL,
                         `Score` int(11) DEFAULT NULL,
                         PRIMARY KEY (`WorkID`),
                         KEY `CompetitionID` (`CompetitionID`),
                         KEY `TeamID` (`TeamID`),
                         CONSTRAINT `works_ibfk_1` FOREIGN KEY (`CompetitionID`) REFERENCES `competitions` (`CompetitionID`),
                         CONSTRAINT `works_ibfk_2` FOREIGN KEY (`TeamID`) REFERENCES `teams` (`TeamID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of works
-- ----------------------------
INSERT INTO `works` VALUES ('1', '海洋生态海报', '1', '10', '0', '精美的设计，很好地传达了海洋生态的重要性。', 'a.jpg', '95');
INSERT INTO `works` VALUES ('2', '历史传承海报', '5', '11', '0', '创意独特，历史传承的主题表现得淋漓尽致。', 'b.jpg', '95');
INSERT INTO `works` VALUES ('3', '科技创新海报', '4', '12', '0', '创新与科技的结合，展现了未来的趋势。', 'c.jpg', '95');
INSERT INTO `works` VALUES ('4', '环保行动海报', '6', '13', '0', '海报设计引人深思，对环保的呼吁非常有力。', 'd.jpg', '95');
INSERT INTO `works` VALUES ('5', '关爱成长海报', '7', '14', '0', '作品温馨感人，关爱成长的主题触动人心。', 'e.jpg', '95');
INSERT INTO `works` VALUES ('6', '编程艺术海报', '10', '15', '0', '编程与艺术的完美结合，展现了技术的另一面。', 'f.jpg', '95');
INSERT INTO `works` VALUES ('7', '国防教育海报', '13', '16', '0', '国防教育意义深远，设计鼓舞人心。', 'g.jpg', '95');
INSERT INTO `works` VALUES ('8', '艺术春天海报', '19', '17', '0', '艺术与春天的结合，充满了生机与活力。', 'h.jpg', '95');
INSERT INTO `works` VALUES ('9', '建军节庆祝海报', '2', '18', '0', '建军节庆祝海报，展现了军人的庄严与荣誉。', 'i.jpg', '95');
