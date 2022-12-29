-- MySQL dump 10.13  Distrib 5.7.27-30, for Linux (x86_64)
--
-- Host: localhost    Database: u0863135_krtdb
-- ------------------------------------------------------
-- Server version	5.7.27-30

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
/*!50717 SELECT COUNT(*) INTO @rocksdb_has_p_s_session_variables FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'performance_schema' AND TABLE_NAME = 'session_variables' */;
/*!50717 SET @rocksdb_get_is_supported = IF (@rocksdb_has_p_s_session_variables, 'SELECT COUNT(*) INTO @rocksdb_is_supported FROM performance_schema.session_variables WHERE VARIABLE_NAME=\'rocksdb_bulk_load\'', 'SELECT 0') */;
/*!50717 PREPARE s FROM @rocksdb_get_is_supported */;
/*!50717 EXECUTE s */;
/*!50717 DEALLOCATE PREPARE s */;
/*!50717 SET @rocksdb_enable_bulk_load = IF (@rocksdb_is_supported, 'SET SESSION rocksdb_bulk_load = 1', 'SET @rocksdb_dummy_bulk_load = 0') */;
/*!50717 PREPARE s FROM @rocksdb_enable_bulk_load */;
/*!50717 EXECUTE s */;
/*!50717 DEALLOCATE PREPARE s */;

--
-- Table structure for table `articles_article`
--

DROP TABLE IF EXISTS `articles_article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `articles_article` (
  `page_ptr_id` int(11) NOT NULL,
  `description` varchar(250) NOT NULL,
  `body` json NOT NULL,
  PRIMARY KEY (`page_ptr_id`),
  CONSTRAINT `articles_article_page_ptr_id_e7c9dbd8_fk_wagtailcore_page_id` FOREIGN KEY (`page_ptr_id`) REFERENCES `wagtailcore_page` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `articles_article`
--

LOCK TABLES `articles_article` WRITE;
/*!40000 ALTER TABLE `articles_article` DISABLE KEYS */;
INSERT INTO `articles_article` VALUES (5,'Анти КРТ мероприятия','[{\"id\": \"c5b41f96-403c-4233-a045-08717e59dad2\", \"type\": \"title\", \"value\": \"Это заголовок\"}, {\"id\": \"77c09cdf-5130-4282-9b5d-861fcbcf18cf\", \"type\": \"subTitle\", \"value\": \"Подзаголовок\"}, {\"id\": \"791b0a16-fc2d-4c1b-81e2-31cc8cf02b08\", \"type\": \"text\", \"value\": \"<p data-block-key=\\\"m81ml\\\">После этого заголовка может быть любой текст, например <b>выделеннный,</b> <a href=\\\"https://kpt.mo-spb.ru/\\\">ссылка на сайт</a> или документ,</p>\"}, {\"id\": \"e4837dd3-b119-4bba-a150-d6924631eadf\", \"type\": \"shortImage\", \"value\": 2}, {\"id\": \"51e20f13-4453-48af-8040-4d9ff22b52fc\", \"type\": \"text\", \"value\": \"<p data-block-key=\\\"m81ml\\\">Картинки, видео, и опять тестк</p>\"}]');
/*!40000 ALTER TABLE `articles_article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
INSERT INTO `auth_group` VALUES (2,'Editors'),(3,'homepage editors'),(1,'Moderators');
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
INSERT INTO `auth_group_permissions` VALUES (4,1,1),(5,1,2),(6,1,3),(8,1,5),(13,1,6),(14,1,7),(12,1,8),(16,1,9),(1,2,1),(2,2,2),(3,2,3),(7,2,5),(10,2,6),(11,2,7),(9,2,8),(15,2,9),(17,3,5);
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=188 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add image',2,'add_image'),(2,'Can change image',2,'change_image'),(3,'Can delete image',2,'delete_image'),(4,'Can choose image',2,'choose_image'),(5,'Can access Wagtail admin',4,'access_admin'),(6,'Can add document',5,'add_document'),(7,'Can change document',5,'change_document'),(8,'Can delete document',5,'delete_document'),(9,'Can choose document',5,'choose_document'),(10,'Can add home page',6,'add_homepage'),(11,'Can change home page',6,'change_homepage'),(12,'Can delete home page',6,'delete_homepage'),(13,'Can view home page',6,'view_homepage'),(14,'Can add home',7,'add_home'),(15,'Can change home',7,'change_home'),(16,'Can delete home',7,'delete_home'),(17,'Can view home',7,'view_home'),(18,'Can add form submission',8,'add_formsubmission'),(19,'Can change form submission',8,'change_formsubmission'),(20,'Can delete form submission',8,'delete_formsubmission'),(21,'Can view form submission',8,'view_formsubmission'),(22,'Can add redirect',9,'add_redirect'),(23,'Can change redirect',9,'change_redirect'),(24,'Can delete redirect',9,'delete_redirect'),(25,'Can view redirect',9,'view_redirect'),(26,'Can add embed',10,'add_embed'),(27,'Can change embed',10,'change_embed'),(28,'Can delete embed',10,'delete_embed'),(29,'Can view embed',10,'view_embed'),(30,'Can add user profile',11,'add_userprofile'),(31,'Can change user profile',11,'change_userprofile'),(32,'Can delete user profile',11,'delete_userprofile'),(33,'Can view user profile',11,'view_userprofile'),(34,'Can view document',5,'view_document'),(35,'Can add uploaded document',12,'add_uploadeddocument'),(36,'Can change uploaded document',12,'change_uploadeddocument'),(37,'Can delete uploaded document',12,'delete_uploadeddocument'),(38,'Can view uploaded document',12,'view_uploadeddocument'),(39,'Can view image',2,'view_image'),(40,'Can add rendition',13,'add_rendition'),(41,'Can change rendition',13,'change_rendition'),(42,'Can delete rendition',13,'delete_rendition'),(43,'Can view rendition',13,'view_rendition'),(44,'Can add uploaded image',14,'add_uploadedimage'),(45,'Can change uploaded image',14,'change_uploadedimage'),(46,'Can delete uploaded image',14,'delete_uploadedimage'),(47,'Can view uploaded image',14,'view_uploadedimage'),(48,'Can add query',15,'add_query'),(49,'Can change query',15,'change_query'),(50,'Can delete query',15,'delete_query'),(51,'Can view query',15,'view_query'),(52,'Can add Query Daily Hits',16,'add_querydailyhits'),(53,'Can change Query Daily Hits',16,'change_querydailyhits'),(54,'Can delete Query Daily Hits',16,'delete_querydailyhits'),(55,'Can view Query Daily Hits',16,'view_querydailyhits'),(56,'Can add index entry',17,'add_indexentry'),(57,'Can change index entry',17,'change_indexentry'),(58,'Can delete index entry',17,'delete_indexentry'),(59,'Can view index entry',17,'view_indexentry'),(60,'Can add page',1,'add_page'),(61,'Can change page',1,'change_page'),(62,'Can delete page',1,'delete_page'),(63,'Can view page',1,'view_page'),(64,'Can add group page permission',18,'add_grouppagepermission'),(65,'Can change group page permission',18,'change_grouppagepermission'),(66,'Can delete group page permission',18,'delete_grouppagepermission'),(67,'Can view group page permission',18,'view_grouppagepermission'),(68,'Can add page view restriction',19,'add_pageviewrestriction'),(69,'Can change page view restriction',19,'change_pageviewrestriction'),(70,'Can delete page view restriction',19,'delete_pageviewrestriction'),(71,'Can view page view restriction',19,'view_pageviewrestriction'),(72,'Can add site',20,'add_site'),(73,'Can change site',20,'change_site'),(74,'Can delete site',20,'delete_site'),(75,'Can view site',20,'view_site'),(76,'Can add collection',21,'add_collection'),(77,'Can change collection',21,'change_collection'),(78,'Can delete collection',21,'delete_collection'),(79,'Can view collection',21,'view_collection'),(80,'Can add group collection permission',22,'add_groupcollectionpermission'),(81,'Can change group collection permission',22,'change_groupcollectionpermission'),(82,'Can delete group collection permission',22,'delete_groupcollectionpermission'),(83,'Can view group collection permission',22,'view_groupcollectionpermission'),(84,'Can add collection view restriction',23,'add_collectionviewrestriction'),(85,'Can change collection view restriction',23,'change_collectionviewrestriction'),(86,'Can delete collection view restriction',23,'delete_collectionviewrestriction'),(87,'Can view collection view restriction',23,'view_collectionviewrestriction'),(88,'Can add task',24,'add_task'),(89,'Can change task',24,'change_task'),(90,'Can delete task',24,'delete_task'),(91,'Can view task',24,'view_task'),(92,'Can add Task state',25,'add_taskstate'),(93,'Can change Task state',25,'change_taskstate'),(94,'Can delete Task state',25,'delete_taskstate'),(95,'Can view Task state',25,'view_taskstate'),(96,'Can add workflow',26,'add_workflow'),(97,'Can change workflow',26,'change_workflow'),(98,'Can delete workflow',26,'delete_workflow'),(99,'Can view workflow',26,'view_workflow'),(100,'Can add Group approval task',3,'add_groupapprovaltask'),(101,'Can change Group approval task',3,'change_groupapprovaltask'),(102,'Can delete Group approval task',3,'delete_groupapprovaltask'),(103,'Can view Group approval task',3,'view_groupapprovaltask'),(104,'Can add Workflow state',27,'add_workflowstate'),(105,'Can change Workflow state',27,'change_workflowstate'),(106,'Can delete Workflow state',27,'delete_workflowstate'),(107,'Can view Workflow state',27,'view_workflowstate'),(108,'Can add workflow page',28,'add_workflowpage'),(109,'Can change workflow page',28,'change_workflowpage'),(110,'Can delete workflow page',28,'delete_workflowpage'),(111,'Can view workflow page',28,'view_workflowpage'),(112,'Can add workflow task order',29,'add_workflowtask'),(113,'Can change workflow task order',29,'change_workflowtask'),(114,'Can delete workflow task order',29,'delete_workflowtask'),(115,'Can view workflow task order',29,'view_workflowtask'),(116,'Can add page log entry',30,'add_pagelogentry'),(117,'Can change page log entry',30,'change_pagelogentry'),(118,'Can delete page log entry',30,'delete_pagelogentry'),(119,'Can view page log entry',30,'view_pagelogentry'),(120,'Can add locale',31,'add_locale'),(121,'Can change locale',31,'change_locale'),(122,'Can delete locale',31,'delete_locale'),(123,'Can view locale',31,'view_locale'),(124,'Can add comment',32,'add_comment'),(125,'Can change comment',32,'change_comment'),(126,'Can delete comment',32,'delete_comment'),(127,'Can view comment',32,'view_comment'),(128,'Can add comment reply',33,'add_commentreply'),(129,'Can change comment reply',33,'change_commentreply'),(130,'Can delete comment reply',33,'delete_commentreply'),(131,'Can view comment reply',33,'view_commentreply'),(132,'Can add page subscription',34,'add_pagesubscription'),(133,'Can change page subscription',34,'change_pagesubscription'),(134,'Can delete page subscription',34,'delete_pagesubscription'),(135,'Can view page subscription',34,'view_pagesubscription'),(136,'Can add model log entry',35,'add_modellogentry'),(137,'Can change model log entry',35,'change_modellogentry'),(138,'Can delete model log entry',35,'delete_modellogentry'),(139,'Can view model log entry',35,'view_modellogentry'),(140,'Can add revision',36,'add_revision'),(141,'Can change revision',36,'change_revision'),(142,'Can delete revision',36,'delete_revision'),(143,'Can view revision',36,'view_revision'),(144,'Can add reference index',37,'add_referenceindex'),(145,'Can change reference index',37,'change_referenceindex'),(146,'Can delete reference index',37,'delete_referenceindex'),(147,'Can view reference index',37,'view_referenceindex'),(148,'Can add tag',38,'add_tag'),(149,'Can change tag',38,'change_tag'),(150,'Can delete tag',38,'delete_tag'),(151,'Can view tag',38,'view_tag'),(152,'Can add tagged item',39,'add_taggeditem'),(153,'Can change tagged item',39,'change_taggeditem'),(154,'Can delete tagged item',39,'delete_taggeditem'),(155,'Can view tagged item',39,'view_taggeditem'),(156,'Can add log entry',40,'add_logentry'),(157,'Can change log entry',40,'change_logentry'),(158,'Can delete log entry',40,'delete_logentry'),(159,'Can view log entry',40,'view_logentry'),(160,'Can add permission',41,'add_permission'),(161,'Can change permission',41,'change_permission'),(162,'Can delete permission',41,'delete_permission'),(163,'Can view permission',41,'view_permission'),(164,'Can add group',42,'add_group'),(165,'Can change group',42,'change_group'),(166,'Can delete group',42,'delete_group'),(167,'Can view group',42,'view_group'),(168,'Can add user',43,'add_user'),(169,'Can change user',43,'change_user'),(170,'Can delete user',43,'delete_user'),(171,'Can view user',43,'view_user'),(172,'Can add content type',44,'add_contenttype'),(173,'Can change content type',44,'change_contenttype'),(174,'Can delete content type',44,'delete_contenttype'),(175,'Can view content type',44,'view_contenttype'),(176,'Can add session',45,'add_session'),(177,'Can change session',45,'change_session'),(178,'Can delete session',45,'delete_session'),(179,'Can view session',45,'view_session'),(180,'Can add krt news',46,'add_krtnews'),(181,'Can change krt news',46,'change_krtnews'),(182,'Can delete krt news',46,'delete_krtnews'),(183,'Can view krt news',46,'view_krtnews'),(184,'Can add article',47,'add_article'),(185,'Can change article',47,'change_article'),(186,'Can delete article',47,'delete_article'),(187,'Can view article',47,'view_article');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$390000$ZVVsZ1h4oF4rkBK82Wij8P$zVg/7yo0UTDatbLeWrDE7OMJ6anIEHRsiQJBwdrdj8M=','2022-12-02 15:40:01.277459',1,'Andrey','Андрей','К.','ayyyk@yandex.ru',1,1,'2022-12-02 15:36:58.097533'),(2,'pbkdf2_sha256$390000$PkPnflMa0lCIMjyIOEqhh1$/B20gUBMc39M3YM9Xk5gbHuPgSJe0g98sPbRp4WjbFY=','2022-12-12 07:00:39.088130',0,'ArkadiyV','Аркадий','В.','arkanoid16@gmail.com',0,1,'2022-12-02 16:16:53.823139');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
INSERT INTO `auth_user_groups` VALUES (1,2,3);
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (40,'admin','logentry'),(47,'articles','article'),(42,'auth','group'),(41,'auth','permission'),(43,'auth','user'),(44,'contenttypes','contenttype'),(7,'home','home'),(6,'home','homepage'),(46,'krtnews','krtnews'),(45,'sessions','session'),(38,'taggit','tag'),(39,'taggit','taggeditem'),(4,'wagtailadmin','admin'),(21,'wagtailcore','collection'),(23,'wagtailcore','collectionviewrestriction'),(32,'wagtailcore','comment'),(33,'wagtailcore','commentreply'),(3,'wagtailcore','groupapprovaltask'),(22,'wagtailcore','groupcollectionpermission'),(18,'wagtailcore','grouppagepermission'),(31,'wagtailcore','locale'),(35,'wagtailcore','modellogentry'),(1,'wagtailcore','page'),(30,'wagtailcore','pagelogentry'),(34,'wagtailcore','pagesubscription'),(19,'wagtailcore','pageviewrestriction'),(37,'wagtailcore','referenceindex'),(36,'wagtailcore','revision'),(20,'wagtailcore','site'),(24,'wagtailcore','task'),(25,'wagtailcore','taskstate'),(26,'wagtailcore','workflow'),(28,'wagtailcore','workflowpage'),(27,'wagtailcore','workflowstate'),(29,'wagtailcore','workflowtask'),(5,'wagtaildocs','document'),(12,'wagtaildocs','uploadeddocument'),(10,'wagtailembeds','embed'),(8,'wagtailforms','formsubmission'),(2,'wagtailimages','image'),(13,'wagtailimages','rendition'),(14,'wagtailimages','uploadedimage'),(9,'wagtailredirects','redirect'),(17,'wagtailsearch','indexentry'),(15,'wagtailsearch','query'),(16,'wagtailsearch','querydailyhits'),(11,'wagtailusers','userprofile');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=192 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2022-12-02 15:35:23.351600'),(2,'auth','0001_initial','2022-12-02 15:35:23.456096'),(3,'admin','0001_initial','2022-12-02 15:35:23.488034'),(4,'admin','0002_logentry_remove_auto_add','2022-12-02 15:35:23.499359'),(5,'admin','0003_logentry_add_action_flag_choices','2022-12-02 15:35:23.519958'),(6,'contenttypes','0002_remove_content_type_name','2022-12-02 15:35:23.573566'),(7,'auth','0002_alter_permission_name_max_length','2022-12-02 15:35:23.595030'),(8,'auth','0003_alter_user_email_max_length','2022-12-02 15:35:23.610278'),(9,'auth','0004_alter_user_username_opts','2022-12-02 15:35:23.621753'),(10,'auth','0005_alter_user_last_login_null','2022-12-02 15:35:23.640730'),(11,'auth','0006_require_contenttypes_0002','2022-12-02 15:35:23.642220'),(12,'auth','0007_alter_validators_add_error_messages','2022-12-02 15:35:23.653746'),(13,'auth','0008_alter_user_username_max_length','2022-12-02 15:35:23.692162'),(14,'auth','0009_alter_user_last_name_max_length','2022-12-02 15:35:23.714785'),(15,'auth','0010_alter_group_name_max_length','2022-12-02 15:35:23.729514'),(16,'auth','0011_update_proxy_permissions','2022-12-02 15:35:23.741375'),(17,'auth','0012_alter_user_first_name_max_length','2022-12-02 15:35:23.761721'),(18,'wagtailcore','0001_initial','2022-12-02 15:35:24.170857'),(19,'wagtailcore','0002_initial_data','2022-12-02 15:35:24.172267'),(20,'wagtailcore','0003_add_uniqueness_constraint_on_group_page_permission','2022-12-02 15:35:24.173441'),(21,'wagtailcore','0004_page_locked','2022-12-02 15:35:24.174533'),(22,'wagtailcore','0005_add_page_lock_permission_to_moderators','2022-12-02 15:35:24.175600'),(23,'wagtailcore','0006_add_lock_page_permission','2022-12-02 15:35:24.176796'),(24,'wagtailcore','0007_page_latest_revision_created_at','2022-12-02 15:35:24.178047'),(25,'wagtailcore','0008_populate_latest_revision_created_at','2022-12-02 15:35:24.179078'),(26,'wagtailcore','0009_remove_auto_now_add_from_pagerevision_created_at','2022-12-02 15:35:24.180156'),(27,'wagtailcore','0010_change_page_owner_to_null_on_delete','2022-12-02 15:35:24.181161'),(28,'wagtailcore','0011_page_first_published_at','2022-12-02 15:35:24.182190'),(29,'wagtailcore','0012_extend_page_slug_field','2022-12-02 15:35:24.183332'),(30,'wagtailcore','0013_update_golive_expire_help_text','2022-12-02 15:35:24.184445'),(31,'wagtailcore','0014_add_verbose_name','2022-12-02 15:35:24.185740'),(32,'wagtailcore','0015_add_more_verbose_names','2022-12-02 15:35:24.186953'),(33,'wagtailcore','0016_change_page_url_path_to_text_field','2022-12-02 15:35:24.188079'),(34,'wagtailcore','0017_change_edit_page_permission_description','2022-12-02 15:35:24.203975'),(35,'wagtailcore','0018_pagerevision_submitted_for_moderation_index','2022-12-02 15:35:24.237167'),(36,'wagtailcore','0019_verbose_names_cleanup','2022-12-02 15:35:24.303688'),(37,'wagtailcore','0020_add_index_on_page_first_published_at','2022-12-02 15:35:24.339432'),(38,'wagtailcore','0021_capitalizeverbose','2022-12-02 15:35:24.913596'),(39,'wagtailcore','0022_add_site_name','2022-12-02 15:35:24.960486'),(40,'wagtailcore','0023_alter_page_revision_on_delete_behaviour','2022-12-02 15:35:24.979933'),(41,'wagtailcore','0024_collection','2022-12-02 15:35:24.987241'),(42,'wagtailcore','0025_collection_initial_data','2022-12-02 15:35:25.003611'),(43,'wagtailcore','0026_group_collection_permission','2022-12-02 15:35:25.070000'),(44,'taggit','0001_initial','2022-12-02 15:35:25.141667'),(45,'wagtailimages','0001_initial','2022-12-02 15:35:25.383985'),(46,'wagtailimages','0002_initial_data','2022-12-02 15:35:25.385940'),(47,'wagtailimages','0003_fix_focal_point_fields','2022-12-02 15:35:25.387672'),(48,'wagtailimages','0004_make_focal_point_key_not_nullable','2022-12-02 15:35:25.389293'),(49,'wagtailimages','0005_make_filter_spec_unique','2022-12-02 15:35:25.390926'),(50,'wagtailimages','0006_add_verbose_names','2022-12-02 15:35:25.392629'),(51,'wagtailimages','0007_image_file_size','2022-12-02 15:35:25.394127'),(52,'wagtailimages','0008_image_created_at_index','2022-12-02 15:35:25.395665'),(53,'wagtailimages','0009_capitalizeverbose','2022-12-02 15:35:25.397175'),(54,'wagtailimages','0010_change_on_delete_behaviour','2022-12-02 15:35:25.398702'),(55,'wagtailimages','0011_image_collection','2022-12-02 15:35:25.400068'),(56,'wagtailimages','0012_copy_image_permissions_to_collections','2022-12-02 15:35:25.401535'),(57,'wagtailimages','0013_make_rendition_upload_callable','2022-12-02 15:35:25.402982'),(58,'wagtailimages','0014_add_filter_spec_field','2022-12-02 15:35:25.404400'),(59,'wagtailimages','0015_fill_filter_spec_field','2022-12-02 15:35:25.405769'),(60,'wagtailimages','0016_deprecate_rendition_filter_relation','2022-12-02 15:35:25.407238'),(61,'wagtailimages','0017_reduce_focal_point_key_max_length','2022-12-02 15:35:25.408720'),(62,'wagtailimages','0018_remove_rendition_filter','2022-12-02 15:35:25.410205'),(63,'wagtailimages','0019_delete_filter','2022-12-02 15:35:25.411701'),(64,'wagtailimages','0020_add-verbose-name','2022-12-02 15:35:25.413106'),(65,'wagtailimages','0021_image_file_hash','2022-12-02 15:35:25.414656'),(66,'wagtailimages','0022_uploadedimage','2022-12-02 15:35:25.469950'),(67,'wagtailimages','0023_add_choose_permissions','2022-12-02 15:35:25.556070'),(68,'wagtailimages','0024_index_image_file_hash','2022-12-02 15:35:25.598185'),(69,'wagtailcore','0027_fix_collection_path_collation','2022-12-02 15:35:25.624598'),(70,'wagtailcore','0024_alter_page_content_type_on_delete_behaviour','2022-12-02 15:35:25.652549'),(71,'wagtailcore','0028_merge','2022-12-02 15:35:25.654142'),(72,'wagtailcore','0029_unicode_slugfield_dj19','2022-12-02 15:35:25.675318'),(73,'wagtailcore','0030_index_on_pagerevision_created_at','2022-12-02 15:35:25.716479'),(74,'wagtailcore','0031_add_page_view_restriction_types','2022-12-02 15:35:25.832546'),(75,'wagtailcore','0032_add_bulk_delete_page_permission','2022-12-02 15:35:25.859520'),(76,'wagtailcore','0033_remove_golive_expiry_help_text','2022-12-02 15:35:26.003746'),(77,'wagtailcore','0034_page_live_revision','2022-12-02 15:35:26.052938'),(78,'wagtailcore','0035_page_last_published_at','2022-12-02 15:35:26.136333'),(79,'wagtailcore','0036_populate_page_last_published_at','2022-12-02 15:35:26.185712'),(80,'wagtailcore','0037_set_page_owner_editable','2022-12-02 15:35:26.221498'),(81,'wagtailcore','0038_make_first_published_at_editable','2022-12-02 15:35:26.248404'),(82,'wagtailcore','0039_collectionviewrestriction','2022-12-02 15:35:26.379859'),(83,'wagtailcore','0040_page_draft_title','2022-12-02 15:35:26.494371'),(84,'wagtailcore','0041_group_collection_permissions_verbose_name_plural','2022-12-02 15:35:26.527705'),(85,'wagtailcore','0042_index_on_pagerevision_approved_go_live_at','2022-12-02 15:35:26.569711'),(86,'wagtailcore','0043_lock_fields','2022-12-02 15:35:26.686787'),(87,'wagtailcore','0044_add_unlock_grouppagepermission','2022-12-02 15:35:26.710759'),(88,'wagtailcore','0045_assign_unlock_grouppagepermission','2022-12-02 15:35:26.751382'),(89,'wagtailcore','0046_site_name_remove_null','2022-12-02 15:35:26.786700'),(90,'wagtailcore','0047_add_workflow_models','2022-12-02 15:35:27.349511'),(91,'wagtailcore','0048_add_default_workflows','2022-12-02 15:35:27.416905'),(92,'wagtailcore','0049_taskstate_finished_by','2022-12-02 15:35:27.470435'),(93,'wagtailcore','0050_workflow_rejected_to_needs_changes','2022-12-02 15:35:27.687722'),(94,'wagtailcore','0051_taskstate_comment','2022-12-02 15:35:27.724496'),(95,'wagtailcore','0052_pagelogentry','2022-12-02 15:35:27.842171'),(96,'wagtailcore','0053_locale_model','2022-12-02 15:35:27.850911'),(97,'wagtailcore','0054_initial_locale','2022-12-02 15:35:27.889170'),(98,'wagtailcore','0055_page_locale_fields','2022-12-02 15:35:28.127272'),(99,'wagtailcore','0056_page_locale_fields_populate','2022-12-02 15:35:28.195215'),(100,'wagtailcore','0057_page_locale_fields_notnull','2022-12-02 15:35:28.449939'),(101,'wagtailcore','0058_page_alias_of','2022-12-02 15:35:28.516566'),(102,'wagtailcore','0059_apply_collection_ordering','2022-12-02 15:35:28.563558'),(103,'wagtailcore','0060_fix_workflow_unique_constraint','2022-12-02 15:35:28.636106'),(104,'wagtailcore','0061_change_promote_tab_helpt_text_and_verbose_names','2022-12-02 15:35:28.700382'),(105,'wagtailcore','0062_comment_models_and_pagesubscription','2022-12-02 15:35:29.048740'),(106,'wagtailcore','0063_modellogentry','2022-12-02 15:35:29.230374'),(107,'wagtailcore','0064_log_timestamp_indexes','2022-12-02 15:35:29.349534'),(108,'wagtailcore','0065_log_entry_uuid','2022-12-02 15:35:29.571667'),(109,'wagtailcore','0066_collection_management_permissions','2022-12-02 15:35:29.625759'),(110,'wagtailcore','0067_alter_pagerevision_content_json','2022-12-02 15:35:29.739749'),(111,'wagtailcore','0068_log_entry_empty_object','2022-12-02 15:35:29.791578'),(112,'wagtailcore','0069_log_entry_jsonfield','2022-12-02 15:35:29.963085'),(113,'wagtailcore','0070_rename_pagerevision_revision','2022-12-02 15:35:30.779565'),(114,'wagtailcore','0071_populate_revision_content_type','2022-12-02 15:35:30.825386'),(115,'wagtailcore','0072_alter_revision_content_type_notnull','2022-12-02 15:35:31.131026'),(116,'wagtailcore','0073_page_latest_revision','2022-12-02 15:35:31.317829'),(117,'wagtailcore','0074_revision_object_str','2022-12-02 15:35:31.360741'),(118,'wagtailcore','0075_populate_latest_revision_and_revision_object_str','2022-12-02 15:35:31.449712'),(119,'wagtailcore','0076_modellogentry_revision','2022-12-02 15:35:31.525494'),(120,'wagtailcore','0077_alter_revision_user','2022-12-02 15:35:31.572624'),(121,'wagtailcore','0078_referenceindex','2022-12-02 15:35:31.659506'),(122,'home','0001_initial','2022-12-02 15:35:31.717931'),(123,'home','0002_homepage_related_page_home','2022-12-02 15:35:31.849962'),(124,'sessions','0001_initial','2022-12-02 15:35:31.863362'),(125,'taggit','0002_auto_20150616_2121','2022-12-02 15:35:31.899008'),(126,'taggit','0003_taggeditem_add_unique_index','2022-12-02 15:35:31.935782'),(127,'taggit','0004_alter_taggeditem_content_type_alter_taggeditem_tag','2022-12-02 15:35:32.037834'),(128,'taggit','0005_auto_20220424_2025','2022-12-02 15:35:32.089341'),(129,'wagtailadmin','0001_create_admin_access_permissions','2022-12-02 15:35:32.149598'),(130,'wagtailadmin','0002_admin','2022-12-02 15:35:32.153989'),(131,'wagtailadmin','0003_admin_managed','2022-12-02 15:35:32.168154'),(132,'wagtaildocs','0001_initial','2022-12-02 15:35:32.234344'),(133,'wagtaildocs','0002_initial_data','2022-12-02 15:35:32.318417'),(134,'wagtaildocs','0003_add_verbose_names','2022-12-02 15:35:32.552288'),(135,'wagtaildocs','0004_capitalizeverbose','2022-12-02 15:35:32.789694'),(136,'wagtaildocs','0005_document_collection','2022-12-02 15:35:32.863690'),(137,'wagtaildocs','0006_copy_document_permissions_to_collections','2022-12-02 15:35:32.933116'),(138,'wagtaildocs','0005_alter_uploaded_by_user_on_delete_action','2022-12-02 15:35:32.990256'),(139,'wagtaildocs','0007_merge','2022-12-02 15:35:32.993312'),(140,'wagtaildocs','0008_document_file_size','2022-12-02 15:35:33.043249'),(141,'wagtaildocs','0009_document_verbose_name_plural','2022-12-02 15:35:33.078497'),(142,'wagtaildocs','0010_document_file_hash','2022-12-02 15:35:33.118105'),(143,'wagtaildocs','0011_add_choose_permissions','2022-12-02 15:35:33.266102'),(144,'wagtaildocs','0012_uploadeddocument','2022-12-02 15:35:33.345265'),(145,'wagtailembeds','0001_initial','2022-12-02 15:35:33.373513'),(146,'wagtailembeds','0002_add_verbose_names','2022-12-02 15:35:33.380203'),(147,'wagtailembeds','0003_capitalizeverbose','2022-12-02 15:35:33.386087'),(148,'wagtailembeds','0004_embed_verbose_name_plural','2022-12-02 15:35:33.392259'),(149,'wagtailembeds','0005_specify_thumbnail_url_max_length','2022-12-02 15:35:33.401417'),(150,'wagtailembeds','0006_add_embed_hash','2022-12-02 15:35:33.417920'),(151,'wagtailembeds','0007_populate_hash','2022-12-02 15:35:33.473200'),(152,'wagtailembeds','0008_allow_long_urls','2022-12-02 15:35:33.735522'),(153,'wagtailembeds','0009_embed_cache_until','2022-12-02 15:35:33.755650'),(154,'wagtailforms','0001_initial','2022-12-02 15:35:33.833691'),(155,'wagtailforms','0002_add_verbose_names','2022-12-02 15:35:33.888216'),(156,'wagtailforms','0003_capitalizeverbose','2022-12-02 15:35:33.937675'),(157,'wagtailforms','0004_add_verbose_name_plural','2022-12-02 15:35:33.963692'),(158,'wagtailforms','0005_alter_formsubmission_form_data','2022-12-02 15:35:34.002515'),(159,'wagtailredirects','0001_initial','2022-12-02 15:35:34.103196'),(160,'wagtailredirects','0002_add_verbose_names','2022-12-02 15:35:34.183119'),(161,'wagtailredirects','0003_make_site_field_editable','2022-12-02 15:35:34.236338'),(162,'wagtailredirects','0004_set_unique_on_path_and_site','2022-12-02 15:35:34.436830'),(163,'wagtailredirects','0005_capitalizeverbose','2022-12-02 15:35:34.693805'),(164,'wagtailredirects','0006_redirect_increase_max_length','2022-12-02 15:35:34.729540'),(165,'wagtailredirects','0007_add_autocreate_fields','2022-12-02 15:35:34.873078'),(166,'wagtailredirects','0008_add_verbose_name_plural','2022-12-02 15:35:34.904714'),(167,'wagtailsearch','0001_initial','2022-12-02 15:35:35.232038'),(168,'wagtailsearch','0002_add_verbose_names','2022-12-02 15:35:35.351117'),(169,'wagtailsearch','0003_remove_editors_pick','2022-12-02 15:35:35.354683'),(170,'wagtailsearch','0004_querydailyhits_verbose_name_plural','2022-12-02 15:35:35.364097'),(171,'wagtailsearch','0005_create_indexentry','2022-12-02 15:35:35.460328'),(172,'wagtailsearch','0006_customise_indexentry','2022-12-02 15:35:35.758564'),(173,'wagtailsearch','0007_delete_editorspick','2022-12-02 15:35:35.766604'),(174,'wagtailusers','0001_initial','2022-12-02 15:35:35.855521'),(175,'wagtailusers','0002_add_verbose_name_on_userprofile','2022-12-02 15:35:35.965139'),(176,'wagtailusers','0003_add_verbose_names','2022-12-02 15:35:36.002809'),(177,'wagtailusers','0004_capitalizeverbose','2022-12-02 15:35:36.171017'),(178,'wagtailusers','0005_make_related_name_wagtail_specific','2022-12-02 15:35:36.234172'),(179,'wagtailusers','0006_userprofile_prefered_language','2022-12-02 15:35:36.287333'),(180,'wagtailusers','0007_userprofile_current_time_zone','2022-12-02 15:35:36.336265'),(181,'wagtailusers','0008_userprofile_avatar','2022-12-02 15:35:36.385844'),(182,'wagtailusers','0009_userprofile_verbose_name_plural','2022-12-02 15:35:36.559230'),(183,'wagtailusers','0010_userprofile_updated_comments_notifications','2022-12-02 15:35:36.604166'),(184,'wagtailusers','0011_userprofile_dismissibles','2022-12-02 15:35:36.649007'),(185,'wagtailimages','0001_squashed_0021','2022-12-02 15:35:36.660456'),(186,'wagtailcore','0001_squashed_0016_change_page_url_path_to_text_field','2022-12-02 15:35:36.666652'),(187,'krtnews','0001_initial','2022-12-20 21:19:21.897602'),(188,'krtnews','0002_alter_krtnews_message','2022-12-23 19:26:51.152435'),(189,'articles','0001_initial','2022-12-24 16:56:59.967302'),(190,'articles','0002_alter_article_body','2022-12-28 23:16:29.209383'),(191,'home','0003_alter_home_r3_alter_home_r4_alter_home_r5_and_more','2022-12-28 23:16:29.347357');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('0mnm2vqy66joaze2vf8awg8fn350tp3u','eyJsYXN0X25ld3NfaWQiOjIxM30:1p9Od4:feYjds2BLxD_rs-37k7JeKfo_kMzs1GoiLAk2BKSQYo','2023-01-08 10:53:18.641613'),('30a5fymipyweco9f9822naz5ym81dk4l','eyJsYXN0X25ld3NfaWQiOjE5OH0:1p8C3A:sSDizOgZjmlcKIes32UymFX5XpEoqEUKHmJ5gDWe85c','2023-01-05 03:15:16.902406'),('7ndgft7760x5e28ixdx0kyug62r3i222','eyJsYXN0X25ld3NfaWQiOjIzMX0:1pAfcw:EtHvgwdiqD65vuTJ3zEBle8n71CVGhVLtbr24IcsNDc','2023-01-11 23:14:26.351074'),('7yxltnq9xt7qgza6yg7j95r0i4csmw1q','eyJsYXN0X25ld3NfaWQiOjIyNX0:1pA8oa:xpJwZloBY8Yz06ZNhQmThhQvjVPLYuyRV_15009p4Zs','2023-01-10 12:12:16.642662'),('bt9hn42g5drer3eh4qm8732iu68obmau','.eJzlWVlv2zgQ_i8G7JdUgUiROgr4wbm63sZJmwMIsCgMiqRsJTpcSY7rLva_ryyLkjyykra7WSRYw6B4DIcz1Hyc4ejP3pQts_l0mcpk6ove-x7qvWv2uYw_yGgzIO5ZNIsPeRxlie8ebkgOy9H0cBILGRyVtDsM5iyd57O5xy0hhE6FMAiTwhUMew71LK6b1HRdxKRpSeRwB1vIsCnhhNlMMok5EZiZG6apTFM_jqby28JP1r33-rtewNJsGslVWgiPDfSut2KzjPmBtkjkoy9XGum9_6PH08QLfSECuWKJzOJczuHECX4fm9_v-afz8Tn7cEnvLm-CefwpnYwWt2dxeJXef7rz2W_nF6vr5PvZ0hbmx7PLZP7hlN58Nq1Pg0h-y4YDHoehjHIp4sz3fM6yXMR0GEeDzM8COeyf6H3neFMe6UU5KkraP0F9Gx8UDaMojxpEuChPivK0KJ2DYgbazitKvTFhS2oX_WZRHg0SNOxbR339pK-PDvJfH2M3iPlDmlf6xuigTxuDBYEFOspZD3KtpmBsrb6i5aaJj_cSZ-uFrKmXUZqtAymemCDkIpuXM_ROrvle11z79HipE5RvX1Eh1vZp0PLJywHDKwn0si3LJyqfLpxYPvWSAWLbJy4ZFFoo5mpVxZyBRQRok116gsHipTCkFIIgQKeeEmhXd4j96hBDEdgH-2VWaxADjAOZ1AqKjlRL24CA7CpfvQEONsHcnV8zfEKpblvyo8CP5PXG5K7y40o2TZ2edM3K4etn630TADwaHZBdxWbCFopHDic1Ja8MEvwSeHTvWfL1deCRQeNS-ES7xqDgVxkFQAThHROrtrIFAtpOA542mOMBIaBpW8C0vRbMgAmrdgdmKqHVOaGw1kYj2DgC98OABx08QpQo-M1iw3gJbNBVmEWvGxvV8aYGHPBqKyOBNg9OXGieRNm3DcySgnkC8INuTHnZqlIhClpfy_0yQNhh3y3k0BrGqFQHyRZqugCtAGztKtY6XSqAYvgu1Az6g0cAUS_t7fom8hL4mwXRo3zl-AOvtmU9ylY7o7EOG29ZGwZmV3lBB8DHABLB4JUAGCrVWlbLdxm3GMHoWDHwgKqwv1qAAN3VEWICjSCuvDcLE_oSMCHf3PipLXkNMMHgVdJdI2y5qy4nUQf40B8Bq6vDJOh3KoqO8LEFpNbdohISOiAGtQH9lUwwMFUi8N1x4raU6ArhqAZABePXSgawGwjICq-frfgAemfgN406yH6rKDVfAqVR6H97JYmPTpRClwGvJjDWs4BtPOvEYCBEwEJyd2KLcfcdqCtVA0ENr3xQJeWcUMkAI_XsTJtAoeH2WlBoGDjuSxO9Tei4cZbF4Xk8i4d4kAbL2TBkDzLTZgF7jOJ7Lc0SFvl8jbAxSGU83SY58ypL-HwqZMoTf7FJgQ4Hs3ga-I9yyrLhoEjZFtXeO2RaGOd_2z60KdGxZX1pZ21pV9Y2ocFM6Pcf0dpcsyv7qx7qI4ZD_WF5HX-4M9xVfB-m_NYera7Gn2eWaRz7yfL7Il2H0fVxPDn9iaxtlVndZlw3-dUiX-sUKdxRMTwqU7jHjayu3kjbnjV6ttnZsya_bc-guW__8dJuLNYaj5dRNqTbhq4JGchMiqFqx4mQyVBXzc1BNyz2SfX4YsipS5DnmBrRDa4RbBga0wnVdNtClqSOYAIr8kcWLLd7PGqqeLrVx2qktY2GPkeNOm7UR1u2CIiNSrGRahZip0v3ppYcbSS3LK47XHgaRYaeS25jzXGp0GwTedzlHrK5p8hryZ2zhgjknwiOgeC4FByr5na_c7NVHRuhHeTqDJmax7HQCEeuZiOJNQNxnsurY1e3FXkp9L_vEUMbhcHr8IjwFtdK8KvwS4CzHibxKqcAs_vAw8EsH_Rw1SeEVroQXI7q7EMVM3Y5XzUAv2KotgPDWrorUyOArtOkMP_UcSlsXybBzUCJ3XLQz-WdBJjfyOHCGLeicXcVqzdbgI7KEFrpNfjhQrGsAhLwBQPG33BDjNqycsP9Nfffou-EYoNh7HmpVIigdO-6DfJARrMKZGi_mA3yArM13I4uz082rQ5JT_ao_NMxzS_tQn0w7T84ujbMtH9uw8hPqv6Po7NdBjgPMTvGyvFwmTHXD3I-9Vub3N6Mjs5Pf_ioPh9ffHzqmGYZe0qKkmyZBDXLeZYt0rzex2f5_2GRHYaxli7cw2RZdO0xqdae7m7fbtiaezoDOFKjdKSGam4jgHmcZOOQzaTqzt2pJLZhCWFoLkKORlyXaQzRPBIyHUxMA0kmPEW-daeldyZgTVKuSVQTOG-yWY3mnlr3kKERQvPCZp5m6ySPPYTjeblnptjjivz_4Lyf-fzV-tJRJzxrNwZpoReSzS-DMBOrfB5MQfEOh9rKerG3et8rrniMZ_5jTvbcja68NKXazeXN6Hx6dnk1uc6vBVX3-GJ8M943MBlfTC9uJ3sGRneNgeeujAYyDm3T2KDmy19_AyZ3BLg:1pAgQ5:enQYLuONCVM2jwDzx-BGPm2-QFN378NoULe83d16uf4','2023-01-12 00:05:13.864379'),('cds1o388s4lolpcv9qhfqnm5uw2s8l82','eyJsYXN0X25ld3NfaWQiOjIyNn0:1pAFno:cpGk5-c5ndWiP4SaTgJSzWi8AnUwewcCfLOJlHLf_Gk','2023-01-10 19:39:56.266364'),('f8ubazfoc715z7mlx9zkcf4u1emcr21n','.eJxVjEEOwiAQRe_C2pDKDLS4dO8ZyACDRQ2Y0iYa4921SRe6_e_99xKOlnl0S-PJ5SgOQond7-YpXLmsIF6onKsMtcxT9nJV5EabPNXIt-Pm_gVGauP3PQSvPLLWHtFi0j3EoJXXgAAGrNXEKZq9MkAUEgxkEXVnfWKj-sB2jTZuLdfi-HHP01McuvcHfXE-8g:1p4cnn:SxF-a9-f-KTz30CLMuehULvZTRABOyeeLailxTwDKdE','2022-12-26 07:00:39.090997'),('ggthanvm2dgh6pc2oljh5mbi5jnuaqgw','eyJsYXN0X25ld3NfaWQiOjIyNX0:1pA7f8:k1Cj7C4xAhErwu-CxVavmy4JrqmMV6RLAHIiA4yINIM','2023-01-10 10:58:26.920607'),('md58idole823tmc34zq6lc774fri1tqt','eyJsYXN0X25ld3NfaWQiOjIzMX0:1pAczq:XcNT_fAZT-YMt28MOLtpEicy0TfDT_XL2mJRxUPKum8','2023-01-11 20:25:54.210873'),('pbh0eqsaqbgiawbfbiq55cjl7fqjewiu','eyJsYXN0X25ld3NfaWQiOjIxM30:1p9946:SULof6ZdiFslbxkunFVdIZ3GLmkVeTl67PDBe4605Ec','2023-01-07 18:16:10.650319'),('re0tpf7v6ec513eg27ezatpq3v416v1g','.eJzVWOtv4jgQ_1-Q4EsKSmznVYkPPMod2qV723alvZ5OkZMYSBsSmoRS7nT_--XhGGcC3f1SbVtVfszLM-PfjCP-7Th0l62dXcoSJ_A7lx3UuZBpLvUeWVQw_AcareKBF0dZEriDQmTAuelgEfssHHPZhoE1Tde5tuW5yCVM111CbLLUTex7OnJ1TDA2sG3rlC19Q0MGptRbYovahOiq7S6ZgUyP2YXRlKVpEEcOe9kGyaFzqSHVNlT1orOnq4wGYX-bsOeA7fukc_lXx0uT5Sbw_ZDtacKyOHdtOFu6__x-e_8Vp5Z5P7l5_jbdEPvPT9eRoWd7em9Hq3T_yUrvb62n9OH7-o_5b3RmXs2_HnbTdIoWYS9iL9mwlwVZyIbdqdq1J8U4VstxVI56d6p1LaSUG1yOY0kIleO0HK_K0VZKDa3SK0dVUqhErZJulOO4l2jDrjnuIuSGsfeY5osuHnX1cUV8ZAdOQcjcP2m7Yocm-Zjl7gtW6T-qDjdr1_NxUrk-kzypHNWkYLho5WepYJfhj0qFUXFeZcZsJeiqlQFSy1QJEObHJWXSTI_I4ZXw87iZNp3LNXDFsJSmHyLVWKKL8ypLFTcfuXFLYpDafZGjiRSEId0ZVz7poLiXw5aJe9lFaXYImS-4Pttm64qtVpQgCoOI3RZiN3lVMgkB-rQSYVGO0sM5rk8zyqk5ZMxp8d_UXNAtEOgl6GdR5z7Q5OkV1I3kyxDwl4EmF4G4qwkQFWtdglG1tgUALUluJh0iX7YpXfZMaYlOpDXAi3DElJDVxNxIikOOBsulJ4P_ioP8g6EDl-hQp111pOR_ACdKcYBglgImIHAtAaRio-83WcRjPSV8zI3STs4pBSldinrWqkBssRu8Yu5MrpVjOk9ptdNfK4AMtS38VNbsp4dk94uz1tUnO5VotJqxymeq8MWSz6yaCeaz2VQgGp-5QYyaemKvNuWIVx-EFKBRW7T5XuczBh6pQI80PcJ1aBan6_VBXtNwy9AS0GsDSxAqpIsDCIidC2IDROS3DP1CJB87AzDX7ioKbyulSNlcyFs0l1UYPbN3XiY-YNgQIwq4cwIw4QPwcXASl8-1nHsGOwBDAvWi_mCdifqAlVpbFpVJgWBdwqCURexHF4vHvUocD0djtVHrTIOptVuNxmqedmwcdR9A8C5aBQ-P8oCF-tK8D1t_-lvUH3lx49da0nuoPwTuvu7p8FmyfoB-IgAKCw10fYLPFZSQUJvOCh_gQ2bBo4WTsLLo6ZdH0IVPGoiqdsFr8onbCgK-68Lp_unGBZ9ZUbca4FtNl1qNSxQlbDugIYjY9A9bpcZbVGm0CV7e-8ck_GTDQBA-YibAxg8_ImGHJ-Ag1lRsGW4VEnymWh-JsKgJ2MOQ6sdI4waQVs-tGFoPHCiM2hUTOg1fxPpCENdA6KOWjhtnWbz5HK_iIeql4W413NBHlvVXIX2O4od-miU0CryDhnAvZbFT_QSYL2nirR2fpV4SbLMgjoY9L95s8uPS_t2Xu9FnZ_blZnE7VI_k-fX8bn6KsZhfO9ffFicYo-8So7eKnTB4Zg7Nhr3yt9By2bnQDFM1VVXF5kBHuq4R4--LTkjTzInYPi1_3kVI--9_4SVQDQ:1p9rOw:B2unU6O_MFWWk8-1uftQ1zzyXT102Pd84YtMceb9r08','2023-01-09 17:36:38.399465'),('w1krrsu4coerdj28t8fa2je8jf7kx9ru','eyJsYXN0X25ld3NfaWQiOjIxNX0:1p9hjJ:ektl51GSAIrVKO06t6pykOVo_EmqTc0cwzTzMvqX_yw','2023-01-09 07:17:01.040630'),('yzjl2ih65ss4dp3awcdd4hf87cwcqqm8','eyJsYXN0X25ld3NfaWQiOjIxM30:1p9RZt:-Z6GK9DoVsSDKnc1_NbK8ylVsz5pcDrk5Z-fWyCUU5w','2023-01-08 14:02:13.109448'),('zbpqe1mpn3rhh6l5achipu9f9iyv1qkc','.eJzVWO9vozYY_l8iJV9oKrBxgEr5QEK6Vbv0tmt7um2aIgMm4UIgByRpOu1_H9jGNSbpeh-ma6PImPeXH7_v89pR_u4t8K5cLXYFyRdx2Lvqgd6FLPNxsCZprQi_4nSZXQZZWuaxf1mbXHJtcTnPQpJMuG0rwAoXq8rbDnzgmwQh3zQdM0IWDAMEfARNCEfQcRAmUTgywAhiHETQxo5pIt3xIzICVkCcOmhBiiLO0gV53Mb5sXdlAN0Z6fpF74CXJY6T4TYn-5gchmbv6s9eUOTRJg7DhBxwTsqsgjb-7SG7-5no883nSbH7sn7y_S28cX-ZOoHzOdB9z1z_Gv1-iLde9vTwuLp7iA4__eEaG_vpuDTcp-tokJLHcjwo4zIh476n951pPU50Orp0RH3P6NtAoy-QjhPJCNDRo-OMjo5GPQzmR0ddcmCmNpWP6DgZ5Ma4b036APhJFqyLatKHbh9NmHBNjlwCgHX4ZuzqNzCtxrKCL1QUP2CLWw30apwy6NcSEgbUkDbDTRlO6uDQ7bvUwa3XY2GsToJmnQyYjQ1LgAg_oZJpOz0ihzOB8_nFa4OrPCBT2Fobh0g1lORiPRaJaauRB7clhdnAFzmaSpsYSTXjzicBiroct0TUZZcW5TEhodCGZFuumFpnkjhN4pTc1Wafqq4kEgOQx0xIWrH0eE4b4hJzaUUZy6u_bc853ioGgxy8lnX-V5x_e4F1rlwMQX-ZaHITiFpNFVMxRxKNkGgqUQJDJkqn0pZU6WutYzqV5gpZBApLolWbcK60CXkrUO47mfkzzvB3Rg34Wmqgw6ZMv4MacjVEmeS0nTgYpLlKn1qhdajmSMyBnc4Wh5SgkiuRC2kSTVDHTT5GmcO1BFiW8ECmhJ6dOCMJnddye2ckMV9LkmWS7sn3kcSTRI6cYa1zQtiSg-jx-l6lo9255bx25pWLDDyzSvBD5mHrUnU71JR7X28tzW9Q9hPDmbWOle5ZJjeG3SX9TP5VIpMIvXDisc6gB-WbYlql6F45-31qn6HMmwL_322CaJvoXl93teqjNIxWLyCU1MBSBNxLpKd-MR_9LOJ7PWX8nButm5xTDlK6NP1sVFGH-q2PpjvdNDB7Qp0_scYn3ACG_InY0zT4s9HbWlshHAmXkyai344Eo3YkE4qltdNrmXobrMDQRIQNJnVpARKo21V3o8gFJkPZVQMhaOtNv7MJ6xzoIZ-YCmpDxaBkw1CwEqVSoSIPtHbAphBNYLE39ALDzrSf9txhp7y6Hdk4KE0jCdRw3fbUeH9SE9qlo_-jS9NN_Lh7412q0FF0gK5woeGKpXBD6QfRaYIzkeJgKguRtmMncKeRbCWygK56ImVFdGZLiAc0eABgNM_OHtSsKSBF1iwVtHBo1uIegHuIe-2HtI4a4VXsdqzEIT-a3e_0vPGzssw2H7JlNgaDItktxxu8JuVwmeB9mn0dFmWO0zg4GgAOCpIt2H9U1RTnwWoRkiLI420ZZ-l4EGSbTbVcMbz_eO9-WFx__DS_G-vP4pvbm_ubU4r5ze3i9mF-QuF-kRSDZbZI4j1Z4HI8oH_W0WnvwhhZOrRNG1qXjmMBYP31z78rDvT9:1p2lOv:4ngmrlVJvJ1ailQmKYjxnbGhABWPKkSOs-ICVVHNOzs','2022-12-21 03:47:17.998084');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `home_home`
--

DROP TABLE IF EXISTS `home_home`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `home_home` (
  `page_ptr_id` int(11) NOT NULL,
  `r1` longtext,
  `r2` longtext,
  `r3` longtext,
  `r4` longtext,
  `r5` longtext,
  `r6` longtext,
  `bottomLogo_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`page_ptr_id`),
  KEY `home_home_bottomLogo_id_c9606e40_fk_wagtailimages_image_id` (`bottomLogo_id`),
  CONSTRAINT `home_home_bottomLogo_id_c9606e40_fk_wagtailimages_image_id` FOREIGN KEY (`bottomLogo_id`) REFERENCES `wagtailimages_image` (`id`),
  CONSTRAINT `home_home_page_ptr_id_940e97b3_fk_wagtailcore_page_id` FOREIGN KEY (`page_ptr_id`) REFERENCES `wagtailcore_page` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `home_home`
--

LOCK TABLES `home_home` WRITE;
/*!40000 ALTER TABLE `home_home` DISABLE KEYS */;
INSERT INTO `home_home` VALUES (4,'<p data-block-key=\"7wq1u\">В чем проблема КРТ, законодательство по нему и актуальную информацию о нем</p>','<p data-block-key=\"bjarq\">Как собрать соседей, используя помогалочку и карту чатов</p>','<p data-block-key=\"5wmtn\">Как найти единомышленников в своем квартале, МО и получить от них помощь</p>','<p data-block-key=\"glnve\">Как поучаствовать в общегородских мероприятиях движения</p>','<p data-block-key=\"4xbof\">Как внести свою лепту в стратегию и тактику борьбы в чате-дискуссионном клубе</p>','<p data-block-key=\"nmixu\">Как организовать подготовку и проведение ОСС по отказу от КРТ</p>',2);
/*!40000 ALTER TABLE `home_home` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `home_homepage`
--

DROP TABLE IF EXISTS `home_homepage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `home_homepage` (
  `page_ptr_id` int(11) NOT NULL,
  `related_page_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`page_ptr_id`),
  KEY `home_homepage_related_page_id_dd5cb385_fk_wagtailcore_page_id` (`related_page_id`),
  CONSTRAINT `home_homepage_page_ptr_id_e5b77cf7_fk_wagtailcore_page_id` FOREIGN KEY (`page_ptr_id`) REFERENCES `wagtailcore_page` (`id`),
  CONSTRAINT `home_homepage_related_page_id_dd5cb385_fk_wagtailcore_page_id` FOREIGN KEY (`related_page_id`) REFERENCES `wagtailcore_page` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `home_homepage`
--

LOCK TABLES `home_homepage` WRITE;
/*!40000 ALTER TABLE `home_homepage` DISABLE KEYS */;
INSERT INTO `home_homepage` VALUES (3,4);
/*!40000 ALTER TABLE `home_homepage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `krtnews_krtnews`
--

DROP TABLE IF EXISTS `krtnews_krtnews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `krtnews_krtnews` (
  `messageId` smallint(5) unsigned NOT NULL,
  `message_date` datetime(6) NOT NULL,
  `message` varchar(150) NOT NULL,
  `file_id` varchar(100) DEFAULT NULL,
  `full_message` json NOT NULL,
  PRIMARY KEY (`messageId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `krtnews_krtnews`
--

LOCK TABLES `krtnews_krtnews` WRITE;
/*!40000 ALTER TABLE `krtnews_krtnews` DISABLE KEYS */;
INSERT INTO `krtnews_krtnews` VALUES (201,'2022-12-23 13:29:19.000000','Ой, а чой-то за такая метаморфоза с формулировками???))Первый вариант Б.Л. широко растиражировал с п',NULL,'{\"update_id\": 14311079, \"channel_post\": {\"chat\": {\"id\": -1001838577085, \"type\": \"channel\", \"title\": \"АНТИ-КРТ Движение жителей СПб\", \"username\": \"channel_anti_krt\"}, \"date\": 1671802159, \"photo\": [{\"width\": 70, \"height\": 90, \"file_id\": \"AgACAgIAAx0CbZZ1vQADyWOlrS8PA68hTOyF0Us2QUMaiqBqAALoxDEbeJsoScKpmt9zoH5IAQADAgADcwADLAQ\", \"file_size\": 1641, \"file_unique_id\": \"AQAD6MQxG3ibKEl4\"}, {\"width\": 249, \"height\": 320, \"file_id\": \"AgACAgIAAx0CbZZ1vQADyWOlrS8PA68hTOyF0Us2QUMaiqBqAALoxDEbeJsoScKpmt9zoH5IAQADAgADbQADLAQ\", \"file_size\": 34693, \"file_unique_id\": \"AQAD6MQxG3ibKEly\"}, {\"width\": 565, \"height\": 726, \"file_id\": \"AgACAgIAAx0CbZZ1vQADyWOlrS8PA68hTOyF0Us2QUMaiqBqAALoxDEbeJsoScKpmt9zoH5IAQADAgADeAADLAQ\", \"file_size\": 125910, \"file_unique_id\": \"AQAD6MQxG3ibKEl9\"}], \"caption\": \"Ой, а чой-то за такая метаморфоза с формулировками???))\\n\\nПервый вариант Б.Л. широко растиражировал с помощью своей команды  поправочников, а второй так же будет тиражировать?\", \"message_id\": 201, \"sender_chat\": {\"id\": -1001838577085, \"type\": \"channel\", \"title\": \"АНТИ-КРТ Движение жителей СПб\", \"username\": \"channel_anti_krt\"}, \"media_group_id\": \"13374417278647690\"}}'),(202,'2022-12-23 13:29:19.000000','Новое сообщение на нашем канале доступно!',NULL,'{\"update_id\": 14311080, \"channel_post\": {\"chat\": {\"id\": -1001838577085, \"type\": \"channel\", \"title\": \"АНТИ-КРТ Движение жителей СПб\", \"username\": \"channel_anti_krt\"}, \"date\": 1671802159, \"photo\": [{\"width\": 74, \"height\": 90, \"file_id\": \"AgACAgIAAx0CbZZ1vQADymOlrS_rJ9ESRog9bgEXK_4rnAE4AALpxDEbeJsoSZ036M4g0IgwAQADAgADcwADLAQ\", \"file_size\": 1672, \"file_unique_id\": \"AQAD6cQxG3ibKEl4\"}, {\"width\": 262, \"height\": 320, \"file_id\": \"AgACAgIAAx0CbZZ1vQADymOlrS_rJ9ESRog9bgEXK_4rnAE4AALpxDEbeJsoSZ036M4g0IgwAQADAgADbQADLAQ\", \"file_size\": 30599, \"file_unique_id\": \"AQAD6cQxG3ibKEly\"}, {\"width\": 656, \"height\": 800, \"file_id\": \"AgACAgIAAx0CbZZ1vQADymOlrS_rJ9ESRog9bgEXK_4rnAE4AALpxDEbeJsoSZ036M4g0IgwAQADAgADeAADLAQ\", \"file_size\": 127273, \"file_unique_id\": \"AQAD6cQxG3ibKEl9\"}, {\"width\": 822, \"height\": 1002, \"file_id\": \"AgACAgIAAx0CbZZ1vQADymOlrS_rJ9ESRog9bgEXK_4rnAE4AALpxDEbeJsoSZ036M4g0IgwAQADAgADeQADLAQ\", \"file_size\": 142805, \"file_unique_id\": \"AQAD6cQxG3ibKEl-\"}], \"message_id\": 202, \"sender_chat\": {\"id\": -1001838577085, \"type\": \"channel\", \"title\": \"АНТИ-КРТ Движение жителей СПб\", \"username\": \"channel_anti_krt\"}, \"media_group_id\": \"13374417278647690\"}}'),(203,'2022-12-23 13:29:54.000000','Новое сообщение на нашем канале доступно!',NULL,'{\"update_id\": 14311081, \"channel_post\": {\"chat\": {\"id\": -1001838577085, \"type\": \"channel\", \"title\": \"АНТИ-КРТ Движение жителей СПб\", \"username\": \"channel_anti_krt\"}, \"date\": 1671802194, \"photo\": [{\"width\": 59, \"height\": 90, \"file_id\": \"AgACAgIAAx0CbZZ1vQADy2OlrVHeg5tphEwRiSkPA-CQedgbAALsxDEbas4xSRY3Ds0fFpRZAQADAgADcwADLAQ\", \"file_size\": 1194, \"file_unique_id\": \"AQAD7MQxG2rOMUl4\"}, {\"width\": 209, \"height\": 320, \"file_id\": \"AgACAgIAAx0CbZZ1vQADy2OlrVHeg5tphEwRiSkPA-CQedgbAALsxDEbas4xSRY3Ds0fFpRZAQADAgADbQADLAQ\", \"file_size\": 22594, \"file_unique_id\": \"AQAD7MQxG2rOMUly\"}, {\"width\": 522, \"height\": 800, \"file_id\": \"AgACAgIAAx0CbZZ1vQADy2OlrVHeg5tphEwRiSkPA-CQedgbAALsxDEbas4xSRY3Ds0fFpRZAQADAgADeAADLAQ\", \"file_size\": 106600, \"file_unique_id\": \"AQAD7MQxG2rOMUl9\"}, {\"width\": 835, \"height\": 1280, \"file_id\": \"AgACAgIAAx0CbZZ1vQADy2OlrVHeg5tphEwRiSkPA-CQedgbAALsxDEbas4xSRY3Ds0fFpRZAQADAgADeQADLAQ\", \"file_size\": 144093, \"file_unique_id\": \"AQAD7MQxG2rOMUl-\"}], \"message_id\": 203, \"sender_chat\": {\"id\": -1001838577085, \"type\": \"channel\", \"title\": \"АНТИ-КРТ Движение жителей СПб\", \"username\": \"channel_anti_krt\"}}}'),(204,'2022-12-23 13:31:30.000000','Новое сообщение на нашем канале доступно!',NULL,'{\"update_id\": 14311082, \"channel_post\": {\"chat\": {\"id\": -1001838577085, \"type\": \"channel\", \"title\": \"АНТИ-КРТ Движение жителей СПб\", \"username\": \"channel_anti_krt\"}, \"date\": 1671802290, \"photo\": [{\"width\": 59, \"height\": 90, \"file_id\": \"AgACAgIAAx0CbZZ1vQADzGOlrbKsrqc8RWHQJOhZcx6-kZwiAALsxDEbas4xSRY3Ds0fFpRZAQADAgADcwADLAQ\", \"file_size\": 1194, \"file_unique_id\": \"AQAD7MQxG2rOMUl4\"}, {\"width\": 209, \"height\": 320, \"file_id\": \"AgACAgIAAx0CbZZ1vQADzGOlrbKsrqc8RWHQJOhZcx6-kZwiAALsxDEbas4xSRY3Ds0fFpRZAQADAgADbQADLAQ\", \"file_size\": 22594, \"file_unique_id\": \"AQAD7MQxG2rOMUly\"}, {\"width\": 522, \"height\": 800, \"file_id\": \"AgACAgIAAx0CbZZ1vQADzGOlrbKsrqc8RWHQJOhZcx6-kZwiAALsxDEbas4xSRY3Ds0fFpRZAQADAgADeAADLAQ\", \"file_size\": 106600, \"file_unique_id\": \"AQAD7MQxG2rOMUl9\"}, {\"width\": 835, \"height\": 1280, \"file_id\": \"AgACAgIAAx0CbZZ1vQADzGOlrbKsrqc8RWHQJOhZcx6-kZwiAALsxDEbas4xSRY3Ds0fFpRZAQADAgADeQADLAQ\", \"file_size\": 144093, \"file_unique_id\": \"AQAD7MQxG2rOMUl-\"}], \"message_id\": 204, \"sender_chat\": {\"id\": -1001838577085, \"type\": \"channel\", \"title\": \"АНТИ-КРТ Движение жителей СПб\", \"username\": \"channel_anti_krt\"}, \"media_group_id\": \"13374418323650866\"}}'),(205,'2022-12-23 13:31:30.000000','Новое сообщение на нашем канале доступно!',NULL,'{\"update_id\": 14311083, \"channel_post\": {\"chat\": {\"id\": -1001838577085, \"type\": \"channel\", \"title\": \"АНТИ-КРТ Движение жителей СПб\", \"username\": \"channel_anti_krt\"}, \"date\": 1671802290, \"photo\": [{\"width\": 64, \"height\": 90, \"file_id\": \"AgACAgIAAx0CbZZ1vQADzWOlrbI0OVSSo5paoYA1ZmDURlG5AALwxDEbas4xSboSecN55hNDAQADAgADcwADLAQ\", \"file_size\": 981, \"file_unique_id\": \"AQAD8MQxG2rOMUl4\"}, {\"width\": 229, \"height\": 320, \"file_id\": \"AgACAgIAAx0CbZZ1vQADzWOlrbI0OVSSo5paoYA1ZmDURlG5AALwxDEbas4xSboSecN55hNDAQADAgADbQADLAQ\", \"file_size\": 13464, \"file_unique_id\": \"AQAD8MQxG2rOMUly\"}, {\"width\": 572, \"height\": 800, \"file_id\": \"AgACAgIAAx0CbZZ1vQADzWOlrbI0OVSSo5paoYA1ZmDURlG5AALwxDEbas4xSboSecN55hNDAQADAgADeAADLAQ\", \"file_size\": 61592, \"file_unique_id\": \"AQAD8MQxG2rOMUl9\"}, {\"width\": 916, \"height\": 1280, \"file_id\": \"AgACAgIAAx0CbZZ1vQADzWOlrbI0OVSSo5paoYA1ZmDURlG5AALwxDEbas4xSboSecN55hNDAQADAgADeQADLAQ\", \"file_size\": 84348, \"file_unique_id\": \"AQAD8MQxG2rOMUl-\"}], \"message_id\": 205, \"sender_chat\": {\"id\": -1001838577085, \"type\": \"channel\", \"title\": \"АНТИ-КРТ Движение жителей СПб\", \"username\": \"channel_anti_krt\"}, \"media_group_id\": \"13374418323650866\"}}'),(206,'2022-12-23 13:31:30.000000','Новое сообщение на нашем канале доступно!',NULL,'{\"update_id\": 14311084, \"channel_post\": {\"chat\": {\"id\": -1001838577085, \"type\": \"channel\", \"title\": \"АНТИ-КРТ Движение жителей СПб\", \"username\": \"channel_anti_krt\"}, \"date\": 1671802290, \"photo\": [{\"width\": 65, \"height\": 90, \"file_id\": \"AgACAgIAAx0CbZZ1vQADzmOlrbLAgsZcX1Uia0ilOLern9jJAALxxDEbas4xSXpTKJtVWrT8AQADAgADcwADLAQ\", \"file_size\": 1114, \"file_unique_id\": \"AQAD8cQxG2rOMUl4\"}, {\"width\": 230, \"height\": 320, \"file_id\": \"AgACAgIAAx0CbZZ1vQADzmOlrbLAgsZcX1Uia0ilOLern9jJAALxxDEbas4xSXpTKJtVWrT8AQADAgADbQADLAQ\", \"file_size\": 20600, \"file_unique_id\": \"AQAD8cQxG2rOMUly\"}, {\"width\": 576, \"height\": 800, \"file_id\": \"AgACAgIAAx0CbZZ1vQADzmOlrbLAgsZcX1Uia0ilOLern9jJAALxxDEbas4xSXpTKJtVWrT8AQADAgADeAADLAQ\", \"file_size\": 99467, \"file_unique_id\": \"AQAD8cQxG2rOMUl9\"}, {\"width\": 921, \"height\": 1280, \"file_id\": \"AgACAgIAAx0CbZZ1vQADzmOlrbLAgsZcX1Uia0ilOLern9jJAALxxDEbas4xSXpTKJtVWrT8AQADAgADeQADLAQ\", \"file_size\": 138644, \"file_unique_id\": \"AQAD8cQxG2rOMUl-\"}], \"message_id\": 206, \"sender_chat\": {\"id\": -1001838577085, \"type\": \"channel\", \"title\": \"АНТИ-КРТ Движение жителей СПб\", \"username\": \"channel_anti_krt\"}, \"media_group_id\": \"13374418323650866\"}}'),(207,'2022-12-23 13:31:30.000000','Новое сообщение на нашем канале доступно!',NULL,'{\"update_id\": 14311085, \"channel_post\": {\"chat\": {\"id\": -1001838577085, \"type\": \"channel\", \"title\": \"АНТИ-КРТ Движение жителей СПб\", \"username\": \"channel_anti_krt\"}, \"date\": 1671802290, \"photo\": [{\"width\": 69, \"height\": 90, \"file_id\": \"AgACAgIAAx0CbZZ1vQADz2OlrbJzUK91v5lzVt34n6wqVph0AALyxDEbas4xSYXuMsi2IAhpAQADAgADcwADLAQ\", \"file_size\": 1381, \"file_unique_id\": \"AQAD8sQxG2rOMUl4\"}, {\"width\": 246, \"height\": 320, \"file_id\": \"AgACAgIAAx0CbZZ1vQADz2OlrbJzUK91v5lzVt34n6wqVph0AALyxDEbas4xSYXuMsi2IAhpAQADAgADbQADLAQ\", \"file_size\": 25923, \"file_unique_id\": \"AQAD8sQxG2rOMUly\"}, {\"width\": 615, \"height\": 800, \"file_id\": \"AgACAgIAAx0CbZZ1vQADz2OlrbJzUK91v5lzVt34n6wqVph0AALyxDEbas4xSYXuMsi2IAhpAQADAgADeAADLAQ\", \"file_size\": 122379, \"file_unique_id\": \"AQAD8sQxG2rOMUl9\"}, {\"width\": 984, \"height\": 1280, \"file_id\": \"AgACAgIAAx0CbZZ1vQADz2OlrbJzUK91v5lzVt34n6wqVph0AALyxDEbas4xSYXuMsi2IAhpAQADAgADeQADLAQ\", \"file_size\": 160173, \"file_unique_id\": \"AQAD8sQxG2rOMUl-\"}], \"message_id\": 207, \"sender_chat\": {\"id\": -1001838577085, \"type\": \"channel\", \"title\": \"АНТИ-КРТ Движение жителей СПб\", \"username\": \"channel_anti_krt\"}, \"media_group_id\": \"13374418323650866\"}}'),(208,'2022-12-23 18:38:52.000000','Реновация в Питере ещё не началась, а уже смешно. В одном из домов на Васильевском острове работники',NULL,'{\"update_id\": 14311086, \"channel_post\": {\"chat\": {\"id\": -1001838577085, \"type\": \"channel\", \"title\": \"АНТИ-КРТ Движение жителей СПб\", \"username\": \"channel_anti_krt\"}, \"date\": 1671820732, \"photo\": [{\"width\": 67, \"height\": 90, \"file_id\": \"AgACAgIAAx0CbZZ1vQAD0GOl9byZU_BarU9Mie-Jh3Z4ZypRAAJIwTEbyig5SbFfzGmlQNOKAQADAgADcwADLAQ\", \"file_size\": 1287, \"file_unique_id\": \"AQADSMExG8ooOUl4\"}, {\"width\": 240, \"height\": 320, \"file_id\": \"AgACAgIAAx0CbZZ1vQAD0GOl9byZU_BarU9Mie-Jh3Z4ZypRAAJIwTEbyig5SbFfzGmlQNOKAQADAgADbQADLAQ\", \"file_size\": 16359, \"file_unique_id\": \"AQADSMExG8ooOUly\"}, {\"width\": 600, \"height\": 800, \"file_id\": \"AgACAgIAAx0CbZZ1vQAD0GOl9byZU_BarU9Mie-Jh3Z4ZypRAAJIwTEbyig5SbFfzGmlQNOKAQADAgADeAADLAQ\", \"file_size\": 79869, \"file_unique_id\": \"AQADSMExG8ooOUl9\"}, {\"width\": 960, \"height\": 1280, \"file_id\": \"AgACAgIAAx0CbZZ1vQAD0GOl9byZU_BarU9Mie-Jh3Z4ZypRAAJIwTEbyig5SbFfzGmlQNOKAQADAgADeQADLAQ\", \"file_size\": 107250, \"file_unique_id\": \"AQADSMExG8ooOUl-\"}], \"caption\": \"Реновация в Питере ещё не началась, а уже смешно. \\n\\nВ одном из домов на Васильевском острове работники установили дверь задом наперёд.\", \"message_id\": 208, \"sender_chat\": {\"id\": -1001838577085, \"type\": \"channel\", \"title\": \"АНТИ-КРТ Движение жителей СПб\", \"username\": \"channel_anti_krt\"}, \"forward_date\": 1663499766, \"forward_from_chat\": {\"id\": -1001464785872, \"type\": \"channel\", \"title\": \"Домострой\", \"username\": \"domostroy_channel\"}, \"forward_from_message_id\": 6755}}'),(209,'2022-12-23 18:58:24.000000',' Как бороться с рейдерами, захватывающими управление жилыми домами? На эту тему в Мосгордуме прошел к',NULL,'{\"update_id\": 14311088, \"channel_post\": {\"chat\": {\"id\": -1001838577085, \"type\": \"channel\", \"title\": \"АНТИ-КРТ Движение жителей СПб\", \"username\": \"channel_anti_krt\"}, \"date\": 1671821904, \"text\": \" Как бороться с рейдерами, захватывающими управление жилыми домами?\\n\\nНа эту тему в Мосгордуме прошел круглый стол, организованный коллегой Зюгановым Л.А. Значение его в том, что участвовали не только пострадавшие жители и их представители (депутаты), но и высокопоставленные представители Мосгорсуда, МВД и других ведомств. Представитель Мосгорсуда высказала не терпящие двоякого толкования претензии к Мосжилинспекции в связи с отсутствием контроля за реестрами собственников и лицами, которые сдают протоколы общего собрания собственников на регистрацию. С учетом претензий к Мосжилинспекции со стороны жителей и депутатов, можно ставить перед руководством города вопроса о необходимости расформирования Мосжилинспекции в том виде, в каком она существует! \\n\\nЖители и депутаты высказали претензии не столько к самим рейдерам (с ними все ясно), сколько к Мосжилинспекции, которая очень быстро регистрирует поддельные протоколы общих собраний собственников (поддельность установлена возбужденными уголовными делами), совсем их не проверяя, даже не выявляя очевидных ошибок. \\n\\nНе проводится каких-либо проверок новых УК-однодневок. Например, ООО УК #Регионкомпроект, захватившая несколько десятков домов моего избирательного округа в #Жулебино. Гендиректор Данилов А.А., он же единственный сотрудник организации, также является директором еще в 5 организациях, уставный капитал 20 000 руб, то есть? контора имеет все признаки однодневки!! Мало того, организация создана в 2021 году, оборотов за этот год не имеет, но в 2022 на нее Мосжилинспекция без проблем регистрирует жилые дома для управления! \\n\\nВ итоге по заявлениям жителей дома 8/18 по Жулебинскому бульвару и моим письмам возбуждено уголовное дело по факту фальсификации протокола ОСС, но производство по нему приостановлено в связи с не установлением лица, подлежащего привлечению в качестве обвиняемого. \\n\\nВ связи с этим высказал предложения для изменения законодательства: \\n- обязать мосжилинспекцию и местные органы власти присутствовать на общих собраниях собственников с видеофиксацией происходящего (предложение частично высказано и Галиной Пищулиной);\\n- приостанавливать работу УК по объекту, где возбуждено уголовное дело по факту фальсификации протокола ОСС до принятия окончательного решения по делу, а при 2 случаях возбуждения уголовных дел - приостанавливать действие лицензии УК!!! \\n\\nВсе предложения коллега Зюганов Л.А.  пообещал представить в Госдуме. Он их принимает по своим контактам на сайте Мосгордумы. \\n\\nhttps://youtu.be/lJflp2-_sDE\\n\\nhttps://www.youtube.com/watch?v=lJflp2-_sDE\", \"entities\": [{\"url\": \"https://www.youtube.com/watch?v=lJflp2-_sDE\", \"type\": \"text_link\", \"length\": 1, \"offset\": 0}, {\"type\": \"bold\", \"length\": 1, \"offset\": 0}, {\"type\": \"bold\", \"length\": 67, \"offset\": 1}, {\"type\": \"hashtag\", \"length\": 16, \"offset\": 1147}, {\"type\": \"hashtag\", \"length\": 9, \"offset\": 1232}, {\"type\": \"url\", \"length\": 28, \"offset\": 2484}, {\"type\": \"url\", \"length\": 43, \"offset\": 2514}], \"message_id\": 209, \"sender_chat\": {\"id\": -1001838577085, \"type\": \"channel\", \"title\": \"АНТИ-КРТ Движение жителей СПб\", \"username\": \"channel_anti_krt\"}, \"forward_date\": 1671819069, \"forward_from_chat\": {\"id\": -1001645796363, \"type\": \"channel\", \"title\": \"ЖКХ-Telegraph\", \"username\": \"gkh_telegraf\"}, \"forward_from_message_id\": 442}}'),(211,'2022-12-23 19:57:14.000000','❗❗❗Сбор подписей за отмену закона 444-59 ❗❗❗ (для тех кто ещё не подписал) Сбор состоится в воскресенье 25.12 с 14.00 до 15.00 на детской площадке',NULL,'{\"update_id\": 14311090, \"channel_post\": {\"chat\": {\"id\": -1001838577085, \"type\": \"channel\", \"title\": \"АНТИ-КРТ Движение жителей СПб\", \"username\": \"channel_anti_krt\"}, \"date\": 1671825434, \"text\": \"❗❗❗Сбор подписей за отмену закона 444-59 ❗❗❗\\n\\n(для тех кто ещё не подписал)\\n\\nСбор состоится в воскресенье 25.12 с 14.00 до 15.00 на детской площадке между домом Ленсовета 80 и детским садом\\n\\nМы продолжаем бороться за отмену неправового закона 444-59. Наша цель - 2200 подписей, это треть жителей квартала. \\\"Что подписываем?\\\"\\nНаш подписной лист можно посмотреть в этом сообщении https://t.me/o_p_L_g/645\\n\\n#сборподписей\\n\\n💥Также можно будет подписаться за проведение санкционированного митинга за отмену закона.💥\", \"entities\": [{\"type\": \"url\", \"length\": 24, \"offset\": 378}, {\"type\": \"hashtag\", \"length\": 13, \"offset\": 404}], \"message_id\": 211, \"sender_chat\": {\"id\": -1001838577085, \"type\": \"channel\", \"title\": \"АНТИ-КРТ Движение жителей СПб\", \"username\": \"channel_anti_krt\"}, \"forward_date\": 1671792030, \"forward_from_chat\": {\"id\": -1001630746882, \"type\": \"supergroup\", \"title\": \"КРТ!!!Орджоникидзе-Пулковская-Звёздная-Ленсовета-Гагарина\", \"username\": \"o_p_L_g\"}}}'),(212,'2022-12-23 20:40:33.000000','Внимание❗️ В этом посте попробую донести просто о сложном, о Правилах землепользования и застройки (ПЗЗ), которые так же необходимы при град.анализе',NULL,'{\"update_id\": 14311091, \"channel_post\": {\"chat\": {\"id\": -1001838577085, \"type\": \"channel\", \"title\": \"АНТИ-КРТ Движение жителей СПб\", \"username\": \"channel_anti_krt\"}, \"date\": 1671828033, \"text\": \"Внимание❗️ \\n\\nВ этом посте попробую донести просто о сложном, о Правилах землепользования и застройки (ПЗЗ), которые так же необходимы при град.анализе территории.\\n\\nИнформация полезна тем, кто хочет построить дом, магазин, паркинг, да и вообще что угодно. Покупатели квартир узнают, где смотреть высоту ближайшей застройки. \\n\\nПЗЗ – это  документ, в котором содержится все требования по использованию и застройке земельного участка. Если кратко, то ПЗЗ содержат: \\n1️⃣Порядок  применения ПЗЗ и внесения изменений в указанные правила; \\n2️⃣Карту градостроительного зонирования \\n3️⃣Градостроительные регламенты \\n\\nНа карте градостроительного зонирования устанавливаются  территориальные зоны, которые уточняют и конкретизируют зоны ГенПлана. Допустим одна деловая зона Генплана делится ПЗЗ на две деловые зоны, в  одной из них можно стоить жилье в другой нет, или в одной зоне можно построить магазин максимум в 500 кв.м. а в другой в 5000 кв.м. и так далее (там еще тьма нюансов).\\nТак же на карте град.зонирования отображаются границы зон с особым условием использования территории, границы объектов культурного наследия, максимальная высота застройки и пр.  \\n\\nГрад.регламенты это конкретные требования к земельным участкам для каждой территориальной зоне. Регламенты содержат следующее: \\n◾️Перечень основных и условных видов разрешенного использования земельного участка (грубо говоря это перечень всех возможных объектов, которые можно построить на участке) \\n◾️Предельные параметры разрешенного строительства в т.ч.: \\n-Минимальные и максимальные площади земельного участка\\n-Минимальные общие площади объекта \\n-Минимальная доля озеленения \\n-Минимальное количество мест стоянок автотранспорта –\\nМинимальное количество велопарковок \\n-Минимальное количество мест стоянок большегрузов \\n-Отступы застройки от границ участка и красных линий \\n\\nБлагодаря этому документу вы, не отходя от компьютера сможете понять что можно построить на участке, а что нельзя… \\nЧтобы понять в каких объемах можно строить, то лучше обратиться к специалисту\\n\\nОзнакомиться с ПЗЗ можно по ссылке   - https://docs.cntd.ru/document/456007157 \\nСкачать ПЗЗ можно тут - https://kgainfo.spb.ru/zakon/pravila-zemlepolzovaniya-i-zast…\\n\\n#обучающийпост\\n\\nСхема тут ⤵️\", \"entities\": [{\"type\": \"bold\", \"length\": 8, \"offset\": 43}, {\"type\": \"bold\", \"length\": 7, \"offset\": 52}, {\"type\": \"bold\", \"length\": 3, \"offset\": 325}, {\"type\": \"bold\", \"length\": 14, \"offset\": 367}, {\"type\": \"bold\", \"length\": 25, \"offset\": 694}, {\"type\": \"url\", \"length\": 39, \"offset\": 2066}, {\"type\": \"url\", \"length\": 60, \"offset\": 2131}, {\"type\": \"hashtag\", \"length\": 14, \"offset\": 2194}], \"message_id\": 212, \"sender_chat\": {\"id\": -1001838577085, \"type\": \"channel\", \"title\": \"АНТИ-КРТ Движение жителей СПб\", \"username\": \"channel_anti_krt\"}, \"forward_date\": 1671822576, \"forward_from_chat\": {\"id\": -1001130822533, \"type\": \"channel\", \"title\": \"Застройка Санкт-Петербурга\", \"username\": \"zastroyka_spb\"}, \"forward_signature\": \"Анастасия Кутишенко\", \"forward_from_message_id\": 441}}'),(213,'2022-12-23 22:36:32.000000','Как я организовал общее собрание собственников онлайн И почему мне это не понравилось https://journal-tinkoff-ru.turbopages.org/journal.tinkoff',NULL,'{\"update_id\": 14311092, \"channel_post\": {\"chat\": {\"id\": -1001838577085, \"type\": \"channel\", \"title\": \"АНТИ-КРТ Движение жителей СПб\", \"username\": \"channel_anti_krt\"}, \"date\": 1671834992, \"photo\": [{\"width\": 90, \"height\": 51, \"file_id\": \"AgACAgQAAx0CbZZ1vQAD1WOmLXB7VjO5LAhGNm9qEzJlRiteAAI7rzEbr708UQTZJY6dvdcPAQADAgADcwADLAQ\", \"file_size\": 1336, \"file_unique_id\": \"AQADO68xG6-9PFF4\"}, {\"width\": 320, \"height\": 180, \"file_id\": \"AgACAgQAAx0CbZZ1vQAD1WOmLXB7VjO5LAhGNm9qEzJlRiteAAI7rzEbr708UQTZJY6dvdcPAQADAgADbQADLAQ\", \"file_size\": 20300, \"file_unique_id\": \"AQADO68xG6-9PFFy\"}, {\"width\": 800, \"height\": 450, \"file_id\": \"AgACAgQAAx0CbZZ1vQAD1WOmLXB7VjO5LAhGNm9qEzJlRiteAAI7rzEbr708UQTZJY6dvdcPAQADAgADeAADLAQ\", \"file_size\": 100151, \"file_unique_id\": \"AQADO68xG6-9PFF9\"}, {\"width\": 888, \"height\": 499, \"file_id\": \"AgACAgQAAx0CbZZ1vQAD1WOmLXB7VjO5LAhGNm9qEzJlRiteAAI7rzEbr708UQTZJY6dvdcPAQADAgADeQADLAQ\", \"file_size\": 114352, \"file_unique_id\": \"AQADO68xG6-9PFF-\"}], \"caption\": \"Как я организовал общее собрание собственников онлайн \\nИ почему мне это не понравилось\\n\\nhttps://journal-tinkoff-ru.turbopages.org/journal.tinkoff.ru/s/dom-gosuslugi-ru/\", \"message_id\": 213, \"sender_chat\": {\"id\": -1001838577085, \"type\": \"channel\", \"title\": \"АНТИ-КРТ Движение жителей СПб\", \"username\": \"channel_anti_krt\"}, \"forward_date\": 1671833289, \"caption_entities\": [{\"type\": \"url\", \"length\": 80, \"offset\": 88}], \"forward_from_chat\": {\"id\": -1001645796363, \"type\": \"channel\", \"title\": \"ЖКХ-Telegraph\", \"username\": \"gkh_telegraf\"}, \"forward_from_message_id\": 443}}'),(214,'2022-12-25 16:58:39.000000','КРТ в Самаре. Видеообращение жителей к губернатору Азарову. https://youtu.be/2zJCR8GM6mE https://t.me/snos2022/35',NULL,'{\"update_id\": 14311094, \"channel_post\": {\"chat\": {\"id\": -1001838577085, \"type\": \"channel\", \"title\": \"АНТИ-КРТ Движение жителей СПб\", \"username\": \"channel_anti_krt\"}, \"date\": 1671987519, \"text\": \"КРТ в Самаре. \\nВидеообращение жителей к губернатору Азарову.\\n\\nhttps://youtu.be/2zJCR8GM6mE\\n\\nhttps://t.me/snos2022/35\", \"entities\": [{\"type\": \"bold\", \"length\": 14, \"offset\": 0}, {\"type\": \"url\", \"length\": 28, \"offset\": 62}, {\"type\": \"url\", \"length\": 24, \"offset\": 92}], \"message_id\": 214, \"sender_chat\": {\"id\": -1001838577085, \"type\": \"channel\", \"title\": \"АНТИ-КРТ Движение жителей СПб\", \"username\": \"channel_anti_krt\"}, \"forward_date\": 1671985872, \"forward_from_chat\": {\"id\": -1001861760376, \"type\": \"channel\", \"title\": \"Igor KLENOV\", \"username\": \"IgorKLENOV\"}, \"forward_from_message_id\": 145}}'),(215,'2022-12-25 19:01:04.000000','Новое письмо от КомСтрой. Правильно ли я поняла, что в переводе на нормальный русский это означает: \" Вообще-то закон обратной силы не имеет, но если','BQACAgIAAx0CbZZ1vQAD12OonfDxVQb_ewow5U4YmpFym8m1AAICJgACP_JBSQnrkL_SIUiSLAQ','{\"update_id\": 14311095, \"channel_post\": {\"chat\": {\"id\": -1001838577085, \"type\": \"channel\", \"title\": \"АНТИ-КРТ Движение жителей СПб\", \"username\": \"channel_anti_krt\"}, \"date\": 1671994864, \"caption\": \"Новое письмо от КомСтрой.\\nПравильно ли я поняла, что в переводе на нормальный русский это означает: \\\" Вообще-то закон обратной силы не имеет, но если Правительство СПб решит, то к РЗТ будут применяться нормы КРТ\\\"?\\n\\nПривет соседям, надеющимся на новые квартиры той же площади в том же месте.\", \"document\": {\"thumb\": {\"width\": 227, \"height\": 320, \"file_id\": \"AAMCAgADHQJtlnW9AAPXY6id8PFVBv97CjDlThiakXKbybUAAgImAAI_8kFJCeuQv9IhSJIBAAdtAAMsBA\", \"file_size\": 20033, \"file_unique_id\": \"AQADAiYAAj_yQUly\"}, \"file_id\": \"BQACAgIAAx0CbZZ1vQAD12OonfDxVQb_ewow5U4YmpFym8m1AAICJgACP_JBSQnrkL_SIUiSLAQ\", \"file_name\": \"22-1-1.pdf\", \"file_size\": 55965, \"mime_type\": \"application/pdf\", \"file_unique_id\": \"AgADAiYAAj_yQUk\"}, \"message_id\": 215, \"sender_chat\": {\"id\": -1001838577085, \"type\": \"channel\", \"title\": \"АНТИ-КРТ Движение жителей СПб\", \"username\": \"channel_anti_krt\"}, \"forward_date\": 1671982772, \"forward_from\": {\"id\": 1581694973, \"is_bot\": false, \"username\": \"MarinaToni\", \"last_name\": \"Toni\", \"first_name\": \"Marina\"}}}'),(216,'2022-12-26 12:51:09.000000','ДЕНЬГИ ЕСТЬ, НО ВЫ ДЕРЖИТЕСЬ... ...потому что вам они не достанутся. С 1 января повысят цены на проезд в питерском метро, тарифы на вывоз мусора и на',NULL,'{\"update_id\": 14311096, \"channel_post\": {\"chat\": {\"id\": -1001838577085, \"type\": \"channel\", \"title\": \"АНТИ-КРТ Движение жителей СПб\", \"username\": \"channel_anti_krt\"}, \"date\": 1672059069, \"photo\": [{\"width\": 64, \"height\": 90, \"file_id\": \"AgACAgIAAx0CbZZ1vQAD2GOpmL2Uw3W36tXnwwm_QKqBvNfyAAIZwjEbA6RRSS7u3wiwpE-9AQADAgADcwADLAQ\", \"file_size\": 1127, \"file_unique_id\": \"AQADGcIxGwOkUUl4\"}, {\"width\": 226, \"height\": 320, \"file_id\": \"AgACAgIAAx0CbZZ1vQAD2GOpmL2Uw3W36tXnwwm_QKqBvNfyAAIZwjEbA6RRSS7u3wiwpE-9AQADAgADbQADLAQ\", \"file_size\": 22261, \"file_unique_id\": \"AQADGcIxGwOkUUly\"}, {\"width\": 565, \"height\": 800, \"file_id\": \"AgACAgIAAx0CbZZ1vQAD2GOpmL2Uw3W36tXnwwm_QKqBvNfyAAIZwjEbA6RRSS7u3wiwpE-9AQADAgADeAADLAQ\", \"file_size\": 114825, \"file_unique_id\": \"AQADGcIxGwOkUUl9\"}, {\"width\": 904, \"height\": 1280, \"file_id\": \"AgACAgIAAx0CbZZ1vQAD2GOpmL2Uw3W36tXnwwm_QKqBvNfyAAIZwjEbA6RRSS7u3wiwpE-9AQADAgADeQADLAQ\", \"file_size\": 187408, \"file_unique_id\": \"AQADGcIxGwOkUUl-\"}], \"caption\": \"ДЕНЬГИ ЕСТЬ, НО ВЫ ДЕРЖИТЕСЬ...\\n\\n...потому что вам они не достанутся.\\n\\nС 1 января повысят цены на проезд в питерском метро, тарифы на вывоз мусора и на капремонт. При этом капремонт остаётся недофинансированным. Сокращаются суммы на строительство метро.\\n\\nЗато Смольный нашёл снял с чего-то реально важного 9,5 миллиардов. Нет... Эта недостаточно доходчиво.\\n9500000000 рублей будет потрачено на реставрацию Мюзик-Холла.\\n\\nДля примера: стоимость строительства с нуля нового музея Блокады оценивалась в 6 миллиардов. Самые крутые в России школы стоят около 1,5 миллиардов. Стандартные высокого класса (с бассейном) около 900 миллионов. Поликлинику построить — меньше миллиарда.\\n\\nНо проблема не только в приоритетах расходования городских средств. Никто не собирается превращать Мюзик Холл в лучшую площадку мира или хотя бы России.  Комитет по госзаказу отклонил заявку победителя торгов, поскольку у фирмы нет опыта реставрации таких сложных объектов, кроме того цена работ была внезапно повышена в два раза и так далее. Желающий может почитать журналистское расследование целиком: там переплетено всё: от предвыборной кампании Беглова, закона о КРТ и реконструкции Петропавловской крепости.\\n\\nСлабо верится, что удастся побороть это безобразие, похоже наш город кто-то проклял (за какие грехи?!), но сидеть сложа руки всё равно что быть соучастником.\\n\\nЯ направил обращение в УФАС и главе СК Бастрыкину, потому что он при всей критике, следит за ситуацией в Санкт-Петербурге и ранее уже возбуждал уголовные дела.\", \"message_id\": 216, \"sender_chat\": {\"id\": -1001838577085, \"type\": \"channel\", \"title\": \"АНТИ-КРТ Движение жителей СПб\", \"username\": \"channel_anti_krt\"}, \"forward_date\": 1672058031, \"media_group_id\": \"13376472557418450\", \"caption_entities\": [{\"url\": \"https://www.zaks.ru/new/archive/view/234357\", \"type\": \"text_link\", \"length\": 32, \"offset\": 90}, {\"url\": \"https://www.zaks.ru/new/archive/view/233391\", \"type\": \"text_link\", \"length\": 12, \"offset\": 134}, {\"url\": \"https://www.zaks.ru/new/archive/view/232485\", \"type\": \"text_link\", \"length\": 12, \"offset\": 149}, {\"url\": \"https://www.zaks.ru/new/archive/view/234317\", \"type\": \"text_link\", \"length\": 19, \"offset\": 191}, {\"url\": \"https://vedomosti-spb.ru/technology/articles/2022/10/27/947572-smolnii-otdal-prioritet-dorogam-vmesto-metro\", \"type\": \"text_link\", \"length\": 28, \"offset\": 224}, {\"type\": \"strikethrough\", \"length\": 5, \"offset\": 269}, {\"type\": \"phone_number\", \"length\": 10, \"offset\": 357}, {\"type\": \"bold\", \"length\": 10, \"offset\": 357}, {\"type\": \"bold\", \"length\": 6, \"offset\": 368}, {\"url\": \"https://www.interfax.ru/russia/394073\", \"type\": \"text_link\", \"length\": 26, \"offset\": 485}, {\"url\": \"https://eddesignmag.com/znanye-dengi/\", \"type\": \"text_link\", \"length\": 26, \"offset\": 541}, {\"url\": \"https://ngs24.ru/text/realty/2021/09/13/70132343/\", \"type\": \"text_link\", \"length\": 16, \"offset\": 656}, {\"type\": \"bold\", \"length\": 54, \"offset\": 829}, {\"url\": \"https://argumenti.ru/society/2022/12/805856\", \"type\": \"text_link\", \"length\": 21, \"offset\": 903}, {\"type\": \"bold\", \"length\": 28, \"offset\": 976}, {\"url\": \"https://argumenti.ru/society/2022/12/805856\", \"type\": \"text_link\", \"length\": 27, \"offset\": 1042}, {\"type\": \"italic\", \"length\": 17, \"offset\": 1275}, {\"url\": \"https://t.me/Grudin/1247\", \"type\": \"text_link\", \"length\": 28, \"offset\": 1479}], \"forward_from_chat\": {\"id\": -1001438410895, \"type\": \"channel\", \"title\": \"ФЁДОР ГРУДИН\", \"username\": \"Grudin\"}, \"forward_from_message_id\": 1563}}'),(217,'2022-12-26 12:51:09.000000','Новость на канале',NULL,'{\"update_id\": 14311097, \"channel_post\": {\"chat\": {\"id\": -1001838577085, \"type\": \"channel\", \"title\": \"АНТИ-КРТ Движение жителей СПб\", \"username\": \"channel_anti_krt\"}, \"date\": 1672059069, \"photo\": [{\"width\": 64, \"height\": 90, \"file_id\": \"AgACAgIAAx0CbZZ1vQAD2WOpmL14ypFqyqntXZcSFls4M-BnAAIawjEbA6RRSfPYTgM_4H-qAQADAgADcwADLAQ\", \"file_size\": 1113, \"file_unique_id\": \"AQADGsIxGwOkUUl4\"}, {\"width\": 226, \"height\": 320, \"file_id\": \"AgACAgIAAx0CbZZ1vQAD2WOpmL14ypFqyqntXZcSFls4M-BnAAIawjEbA6RRSfPYTgM_4H-qAQADAgADbQADLAQ\", \"file_size\": 25008, \"file_unique_id\": \"AQADGsIxGwOkUUly\"}, {\"width\": 565, \"height\": 800, \"file_id\": \"AgACAgIAAx0CbZZ1vQAD2WOpmL14ypFqyqntXZcSFls4M-BnAAIawjEbA6RRSfPYTgM_4H-qAQADAgADeAADLAQ\", \"file_size\": 130982, \"file_unique_id\": \"AQADGsIxGwOkUUl9\"}, {\"width\": 904, \"height\": 1280, \"file_id\": \"AgACAgIAAx0CbZZ1vQAD2WOpmL14ypFqyqntXZcSFls4M-BnAAIawjEbA6RRSfPYTgM_4H-qAQADAgADeQADLAQ\", \"file_size\": 208101, \"file_unique_id\": \"AQADGsIxGwOkUUl-\"}], \"message_id\": 217, \"sender_chat\": {\"id\": -1001838577085, \"type\": \"channel\", \"title\": \"АНТИ-КРТ Движение жителей СПб\", \"username\": \"channel_anti_krt\"}, \"forward_date\": 1672058031, \"media_group_id\": \"13376472557418450\", \"forward_from_chat\": {\"id\": -1001438410895, \"type\": \"channel\", \"title\": \"ФЁДОР ГРУДИН\", \"username\": \"Grudin\"}, \"forward_from_message_id\": 1564}}'),(218,'2022-12-26 15:19:17.000000','Доигрался товарищ, это тот который не голосовал по КРТ и который на встрече с жителями 3 сентября под камеры заявлял , что 444-59 отменять не нужно.',NULL,'{\"update_id\": 14311098, \"channel_post\": {\"chat\": {\"id\": -1001838577085, \"type\": \"channel\", \"title\": \"АНТИ-КРТ Движение жителей СПб\", \"username\": \"channel_anti_krt\"}, \"date\": 1672067957, \"photo\": [{\"width\": 90, \"height\": 60, \"file_id\": \"AgACAgIAAx0CbZZ1vQAD2mOpu3UNCh5JixT-ykm2Tf6JXBw5AAL1xDEbI5JRSQMT7VNItWPvAQADAgADcwADLAQ\", \"file_size\": 1691, \"file_unique_id\": \"AQAD9cQxGyOSUUl4\"}, {\"width\": 320, \"height\": 214, \"file_id\": \"AgACAgIAAx0CbZZ1vQAD2mOpu3UNCh5JixT-ykm2Tf6JXBw5AAL1xDEbI5JRSQMT7VNItWPvAQADAgADbQADLAQ\", \"file_size\": 20081, \"file_unique_id\": \"AQAD9cQxGyOSUUly\"}, {\"width\": 1069, \"height\": 715, \"file_id\": \"AgACAgIAAx0CbZZ1vQAD2mOpu3UNCh5JixT-ykm2Tf6JXBw5AAL1xDEbI5JRSQMT7VNItWPvAQADAgADeQADLAQ\", \"file_size\": 73172, \"file_unique_id\": \"AQAD9cQxGyOSUUl-\"}, {\"width\": 800, \"height\": 535, \"file_id\": \"AgACAgIAAx0CbZZ1vQAD2mOpu3UNCh5JixT-ykm2Tf6JXBw5AAL1xDEbI5JRSQMT7VNItWPvAQADAgADeAADLAQ\", \"file_size\": 76017, \"file_unique_id\": \"AQAD9cQxGyOSUUl9\"}], \"caption\": \"Доигрался товарищ, это тот который не голосовал по КРТ и который на встрече с жителями 3 сентября под камеры заявлял , что 444-59 отменять не нужно.\\n\\nФракция КПРФ в ЗакСе прекратила сотрудничество с депутатом Борисом Зверевым. Он неоднократно голосовал солидарно с \\\"Единой Россией\\\".\\n\\nЛидер петербургского отделения КПРФ Роман Кононенко рассказал ЗАКС.Ру, что со Зверевым провели не одну беседы, но он продолжал действовать вразрез с линией фракции.\\n\\nФормально исключить из фракции Зверева не могут, но члены компартии намерены сделать так, чтобы он с ними не ассоциировался.\\n\\nhttps://www.zaks.ru/new/archive/view/234495\", \"message_id\": 218, \"sender_chat\": {\"id\": -1001838577085, \"type\": \"channel\", \"title\": \"АНТИ-КРТ Движение жителей СПб\", \"username\": \"channel_anti_krt\"}, \"caption_entities\": [{\"type\": \"bold\", \"length\": 149, \"offset\": 1}, {\"type\": \"url\", \"length\": 43, \"offset\": 576}]}}'),(219,'2022-12-26 15:54:52.000000','❗️В Госдуму РФ внесен законопроект о внесении изменений в Жилищный кодекс РФ в части проведения общих собраний и оформления их результатов. ????',NULL,'{\"update_id\": 14311099, \"channel_post\": {\"chat\": {\"id\": -1001838577085, \"type\": \"channel\", \"title\": \"АНТИ-КРТ Движение жителей СПб\", \"username\": \"channel_anti_krt\"}, \"date\": 1672070092, \"text\": \"❗️В Госдуму РФ внесен законопроект о внесении изменений в Жилищный кодекс РФ в части проведения общих собраний и оформления их результатов.\\n\\n🔸 Предлагается установить срок хранения электронных образов протоколов в ГИС ЖКХ – 10 лет.\\n\\n🔸 Подлинники, хранящиеся в ГЖИ, после истечения трехлетнего срока предлагается возвращать обратно собственникам.\\n\\n🔸 Авторы проекта хотят закрепить в ЖК РФ возможность изготовления дополнительных экземпляров протокола, которые будут заверяться инициатором и (или) ГЖИ.\\n[ох уж эти «и / или»! \\nКстати, кто хотел, тот делал несколько экземпляров протоколов и раньше - это не запрещено законом, а при создании ТСЖ - практически необходимость]\\n\\n🔸 Законопроект предусматривает доведение до сведения собственников результатов голосования каждого из них (без персональных данных).\\n\\n🔸 Предполагается, что ГЖИ, получив от собственника заявление о неучастии в собрании, должна будет провести проверку и при выявлении подделки направить документы в правоохранительные органы.\\n[сейчас ничего не мешает собственникам самим обратиться в полицию напрямую. Результат проверки сообщения о преступлении едва ли будет сильно меняться в зависимости от того, кто обратился в полицию. Печальное обобщение практики по подделке протоколов мы уже публиковали ранее]\\n\\n🔸 Предусматривается порядок подписания бюллетеней: собственник должен будет поставить подпись и ФИО на каждой странице.\\n\\n🔸 Предполагается, что сбор бюллетеней будет фиксироваться в «реестре решений собственников», где голосующий должен будет также расписаться и поставить свои ФИО. Этот реестр планируется считать еще одним приложением к протоколу общего собрания.\\n[сейчас Приказ Минстроя 44/пр и так предполагает, что все \\\"присутствующие\\\" (а под ними понимаются все участники, а не только \\\"очники\\\") должны расписаться в списке присутствующих (подп. \\\"в\\\" п 12 и подп. \\\"а\\\" п. 13)]\\n\\nЗаконопроект предполагает , что изменения при их принятии вступят в силу с 1 сентября 2023 года.\", \"entities\": [{\"type\": \"bold\", \"length\": 20, \"offset\": 2}, {\"url\": \"https://sozd.duma.gov.ru/bill/265996-8\", \"type\": \"text_link\", \"length\": 12, \"offset\": 22}, {\"type\": \"bold\", \"length\": 12, \"offset\": 22}, {\"type\": \"bold\", \"length\": 106, \"offset\": 35}, {\"type\": \"italic\", \"length\": 171, \"offset\": 504}, {\"type\": \"italic\", \"length\": 208, \"offset\": 1001}, {\"url\": \"https://gkhnews.ru/1477857-poddelka-protokola/\", \"type\": \"text_link\", \"length\": 9, \"offset\": 1209}, {\"type\": \"italic\", \"length\": 9, \"offset\": 1209}, {\"type\": \"italic\", \"length\": 59, \"offset\": 1219}, {\"url\": \"https://t.me/gkhnewsru/812\", \"type\": \"text_link\", \"length\": 2, \"offset\": 1278}, {\"url\": \"https://t.me/gkhnewsru/812\", \"type\": \"text_link\", \"length\": 2, \"offset\": 1400}, {\"type\": \"italic\", \"length\": 215, \"offset\": 1645}], \"message_id\": 219, \"sender_chat\": {\"id\": -1001838577085, \"type\": \"channel\", \"title\": \"АНТИ-КРТ Движение жителей СПб\", \"username\": \"channel_anti_krt\"}, \"forward_date\": 1672060709, \"forward_from_chat\": {\"id\": -1001317636508, \"type\": \"channel\", \"title\": \"ЖКХ Ньюс\", \"username\": \"gkhnewsru\"}, \"forward_from_message_id\": 812}}'),(220,'2022-12-26 15:56:20.000000','СТРОЙКОМПЛЕКС РЕШИЛ НАЖИТЬСЯ НА ЖИЛЬЦАХ АВАРИЙНЫХ КВАРТИР Минстрой вносит в свою стратегию развития отрасли до 2030 года прелюбопытное положение.',NULL,'{\"update_id\": 14311100, \"channel_post\": {\"chat\": {\"id\": -1001838577085, \"type\": \"channel\", \"title\": \"АНТИ-КРТ Движение жителей СПб\", \"username\": \"channel_anti_krt\"}, \"date\": 1672070180, \"text\": \"СТРОЙКОМПЛЕКС РЕШИЛ НАЖИТЬСЯ НА ЖИЛЬЦАХ АВАРИЙНЫХ КВАРТИР\\nМинстрой вносит в свою стратегию развития отрасли до 2030 года прелюбопытное положение. Жителей аварийных квартир будут переселять в специальные арендные дома. Там люди будут снимать квартиры по некоей суперльготной цене, да ещё и им будет предоставляться право выкупа, да к тому же выплатить надо будет не всю цену нового жилья, а всего лишь разницу между его стоимостью и стоимостью жилья старого. В общем, аттракцион невиданной щедрости.\\n\\nЛишь одна мелкая проблема отделяет нас от того, чтобы начать кланяться стройкомплексу в ноги. Дело в том, что жителям аварийного жилья, вообще-то, полагается новая жилплощадь совершенно бесплатно. Либо деньги на покупку таковой. Они ничего арендовать и выкупать не должны, они должны получить нормальные условия жизни вместо ненормальных за счёт государства. В аварийное состояние жилье привели не они, не им и платить.\\n\\nНо лукавое введение денег в схему предоставления жилья взамен аварийного открыло возможности для совершенно безобразных злоупотреблений на региональном уровне. Людям говорят, что свободных метров нет, а вот деньги – пожалуйста. Только это деньги, за которые не то что новое жилье, а и старое аварийное не выкупишь.\\nОднако вместо того, чтобы в каждом подобном случае вмешивалась прокуратура, вмешался стройкомлекс. И выдал на гора сиропную сказочку про заботу о людях. Дескать ведь лучше же выехать из аварийного жилья прямо сейчас за деньги, тем более – небольшие, чем годами ждать бесплатного варианта, который можно и не получить. Не говоря уже о безобразиях с денежными компенсациями.\\n\\nНа самом деле, ларчик открывается очень просто. Доля нераспроданных квартир в непригодных для нормальной жизни человейниках, которые безостановочно производит стройкомплекс, приближается к 70%. А когда Набиуллина прикроет наконец аферу с «льготной ипотекой» (напомним, что как только включаются льготы по ипотечному кредиту, застройщики задирают цену метра так, что без льгот было бы дешевле), доля неликвидных новостроек уверенно поползет к 100%. То, что они строят, людям объективно не нужно.\\n\\nЕдинственный выход для стройкомплекса – обязаловка. Ему нужны люди, которым некуда деваться, кроме как въезжать в неликвидные пятидесятиэтажные зиккураты без балконов и нормального дворового пространства вокруг. Вот жители аварийных квартир – это идеальная аудитория. Прирост аварийного жилья за последние пять лет составил 13 млн кв. метров, а сколько его всего, никто уверенно сказать не может. Для впаривальщиков строительного неликвида это золотое дно.\\n\\nОни уже несколько лет так и эдак проталкивают тему государственного выкупа никакому здоровому человеку не нужных метров. ДОМ.РФ во главе с президентским другом Мутко исстарался, отраслевые ассоциации челобитные пишут регулярно. Не проходит пока что – слишком крупная афера. Тогда Хуснуллин изобрёл гениальную по рэкетирскому нахрапу реновацию в Москве, которая, по счастью, перекалечив несколько хороших районов и несколько десятков тысяч человеческих судеб, захлебнулась в период ковидной недостачи денег и оттока рабочих. А ведь собирались уже на всю страну растянуть. И вот теперь новый креативчик.\\n\\nПричём стройкомплекс не был бы стройкомплексом, если бы не действовал с удвоенной наглостью. Мало того, что они хотят получать с людей живые деньги за аренду в своих недодомах, они тут же ещё и требуют у государства дополнительной поддержки, потому что льготная аренда не покроет их затрат.\\nОстаётся открытым только один вопрос: с какого перепугу кто бы то ни было – хоть государство, хоть граждане должны покрывать затраты стройкомплекса, возвращать ему деньги, им же бессмысленно и бестолково закопанные в землю\", \"entities\": [{\"type\": \"bold\", \"length\": 58, \"offset\": 0}, {\"type\": \"url\", \"length\": 6, \"offset\": 2685}], \"message_id\": 220, \"sender_chat\": {\"id\": -1001838577085, \"type\": \"channel\", \"title\": \"АНТИ-КРТ Движение жителей СПб\", \"username\": \"channel_anti_krt\"}, \"forward_date\": 1672052418, \"forward_from_chat\": {\"id\": -1001355577557, \"type\": \"channel\", \"title\": \"Новый Век\", \"username\": \"Wek_ru\"}, \"forward_from_message_id\": 21886}}'),(221,'2022-12-26 16:22:56.000000','????Сам проект и пояснительная записка к нему.','BQACAgIAAx0CbZZ1vQAD3WOpymFfJAhZOe8fGRs0p4__eouiAAJBJQACFwtQSdr-uLBQMKiBLAQ','{\"update_id\": 14311101, \"channel_post\": {\"chat\": {\"id\": -1001838577085, \"type\": \"channel\", \"title\": \"АНТИ-КРТ Движение жителей СПб\", \"username\": \"channel_anti_krt\"}, \"date\": 1672071776, \"caption\": \"👆Сам проект и пояснительная записка к нему.\", \"document\": {\"thumb\": {\"width\": 224, \"height\": 320, \"file_id\": \"AAMCAgADHQJtlnW9AAPdY6nKYV8kCFk57x8ZGzSnj_96i6IAAkElAAIXC1BJ2v64sFAwqIEBAAdtAAMsBA\", \"file_size\": 14536, \"file_unique_id\": \"AQADQSUAAhcLUEly\"}, \"file_id\": \"BQACAgIAAx0CbZZ1vQAD3WOpymFfJAhZOe8fGRs0p4__eouiAAJBJQACFwtQSdr-uLBQMKiBLAQ\", \"file_name\": \"241064790-241065584.pdf\", \"file_size\": 314953, \"mime_type\": \"application/pdf\", \"file_unique_id\": \"AgADQSUAAhcLUEk\"}, \"message_id\": 221, \"sender_chat\": {\"id\": -1001838577085, \"type\": \"channel\", \"title\": \"АНТИ-КРТ Движение жителей СПб\", \"username\": \"channel_anti_krt\"}, \"forward_date\": 1672061033, \"caption_entities\": [{\"url\": \"https://t.me/gkhnewsru/813\", \"type\": \"text_link\", \"length\": 2, \"offset\": 0}], \"forward_from_chat\": {\"id\": -1001317636508, \"type\": \"channel\", \"title\": \"ЖКХ Ньюс\", \"username\": \"gkhnewsru\"}, \"forward_from_message_id\": 813}}'),(222,'2022-12-27 01:05:23.000000','В России предложили изменить систему оплаты ЖКУ В фонде «Институт экономики города» предложили изменить систему сбора платы за жилищно-коммунальные',NULL,'{\"update_id\": 14311102, \"channel_post\": {\"chat\": {\"id\": -1001838577085, \"type\": \"channel\", \"title\": \"АНТИ-КРТ Движение жителей СПб\", \"username\": \"channel_anti_krt\"}, \"date\": 1672103123, \"text\": \"В России предложили изменить систему оплаты ЖКУ\\n\\nВ фонде «Институт экономики города» предложили изменить систему сбора платы за жилищно-коммунальные услуги — текущий ремонт, вывоз мусора, мытье подъездов, водоснабжение, отопление и т.д., и переводить средства не напрямую управляющей компании (УК), а на специально созданные счета.  \\n\\nСейчас жильцы перечисляют деньги сразу УК (за исключением прямых договоров с РСО) и не могут быть уверены в том, что средства используются по назначению.\\n\\nСогласно новому подходу платежи жильцов будут поступать на специальные счета. Как только совет дома убедится, что услуги оказаны качественно, он дает добро на перевод денег в пользу УК. Для контроля необходим активный совет дома. Выбрать такой способ сбора средств жители смогут по желанию.\\n\\nИнициативу поддерживают в Госдуме и могут внести на рассмотрение в 2023 году.\", \"entities\": [{\"type\": \"bold\", \"length\": 47, \"offset\": 0}, {\"url\": \"https://iz.ru/1441941/mariia-perevoshchikova/kontrol-zatratami-v-rossii-predlozhili-izmenit-sistemu-oplaty-zhku\", \"type\": \"text_link\", \"length\": 10, \"offset\": 85}], \"message_id\": 222, \"sender_chat\": {\"id\": -1001838577085, \"type\": \"channel\", \"title\": \"АНТИ-КРТ Движение жителей СПб\", \"username\": \"channel_anti_krt\"}, \"forward_date\": 1672102229, \"forward_from_chat\": {\"id\": -1001668009692, \"type\": \"channel\", \"title\": \"Новости КРТ\", \"username\": \"knyazhevokrt\"}, \"forward_from_message_id\": 2751}}'),(223,'2022-12-27 01:34:24.000000','Новость на канале',NULL,'{\"update_id\": 14311104, \"channel_post\": {\"chat\": {\"id\": -1001838577085, \"type\": \"channel\", \"title\": \"АНТИ-КРТ Движение жителей СПб\", \"username\": \"channel_anti_krt\"}, \"date\": 1672104864, \"video\": {\"thumb\": {\"width\": 320, \"height\": 259, \"file_id\": \"AAMCAgADHQJtlnW9AAPfY6pLoPn2noZZpogtkGBdeq5Mgo4AAvUgAAKbt1BJ0f0EHoFGOEgBAAdtAAMsBA\", \"file_size\": 19235, \"file_unique_id\": \"AQAD9SAAApu3UEly\"}, \"width\": 1280, \"height\": 1036, \"file_id\": \"BAACAgIAAx0CbZZ1vQAD32OqS6D59p6GWaaILZBgXXquTIKOAAL1IAACm7dQSdH9BB6BRjhILAQ\", \"duration\": 63, \"file_name\": \"_Слуги народа.mp4\", \"file_size\": 5386103, \"mime_type\": \"video/mp4\", \"file_unique_id\": \"AgAD9SAAApu3UEk\"}, \"message_id\": 223, \"sender_chat\": {\"id\": -1001838577085, \"type\": \"channel\", \"title\": \"АНТИ-КРТ Движение жителей СПб\", \"username\": \"channel_anti_krt\"}}}'),(224,'2022-12-27 01:48:21.000000','Новость на канале',NULL,'{\"update_id\": 14311105, \"channel_post\": {\"chat\": {\"id\": -1001838577085, \"type\": \"channel\", \"title\": \"АНТИ-КРТ Движение жителей СПб\", \"username\": \"channel_anti_krt\"}, \"date\": 1672105701, \"video\": {\"thumb\": {\"width\": 320, \"height\": 259, \"file_id\": \"AAMCAgADHQJtlnW9AAPgY6pO5UilpwABoioGEacpferTMVZLAAL_IAACm7dQScOuEqSOFTByAQAHbQADLAQ\", \"file_size\": 18590, \"file_unique_id\": \"AQAD_yAAApu3UEly\"}, \"width\": 1280, \"height\": 1036, \"file_id\": \"BAACAgIAAx0CbZZ1vQAD4GOqTuVIpacAAaIqBhGnKX3q0zFWSwAC_yAAApu3UEnDrhKkjhUwciwE\", \"duration\": 63, \"file_name\": \"0_Слуги народа (online-video-cutter.com).mp4\", \"file_size\": 11062488, \"mime_type\": \"video/mp4\", \"file_unique_id\": \"AgAD_yAAApu3UEk\"}, \"message_id\": 224, \"sender_chat\": {\"id\": -1001838577085, \"type\": \"channel\", \"title\": \"АНТИ-КРТ Движение жителей СПб\", \"username\": \"channel_anti_krt\"}}}'),(225,'2022-12-27 10:57:59.000000','❌ Будем надеяться, что законопроект будет отклонён ???? Практически все изменения вредные, так как усложняют и без того ужасно трудную процедуру',NULL,'{\"update_id\": 14311107, \"channel_post\": {\"chat\": {\"id\": -1001838577085, \"type\": \"channel\", \"title\": \"АНТИ-КРТ Движение жителей СПб\", \"username\": \"channel_anti_krt\"}, \"date\": 1672138679, \"text\": \"❌ Будем надеяться, что законопроект будет отклонён 🙏\\n\\nПрактически все изменения вредные, так как усложняют и без того ужасно трудную процедуру проведения общих собраний собственников помещений в МКД, при этом не добавляют защиты от фальсификаций ОСС, которые сейчас так широко распространены.\\n\\n➕Единственный полезный пункт - о введении обязанности ГЖИ при получении от собственника заявления о неучастии в собрании провести проверку и при выявлении подделки направить документы в правоохранительные органы.\\n\\nhttps://t.me/gkhnewsru/812\", \"entities\": [{\"type\": \"bold\", \"length\": 49, \"offset\": 2}, {\"type\": \"url\", \"length\": 26, \"offset\": 509}], \"message_id\": 225, \"sender_chat\": {\"id\": -1001838577085, \"type\": \"channel\", \"title\": \"АНТИ-КРТ Движение жителей СПб\", \"username\": \"channel_anti_krt\"}, \"forward_date\": 1672071952, \"forward_from_chat\": {\"id\": -1001496474113, \"type\": \"channel\", \"title\": \"Старший по дому (ЖКХ)\", \"username\": \"starshijpodomu\"}, \"forward_from_message_id\": 1493}}'),(226,'2022-12-27 17:12:10.000000','https://realty',NULL,'{\"update_id\": 14311108, \"channel_post\": {\"chat\": {\"id\": -1001838577085, \"type\": \"channel\", \"title\": \"АНТИ-КРТ Движение жителей СПб\", \"username\": \"channel_anti_krt\"}, \"date\": 1672161130, \"text\": \"https://realty.rbc.ru/news/63a9ab9f9a79476686cb3880\", \"entities\": [{\"type\": \"url\", \"length\": 51, \"offset\": 0}], \"message_id\": 226, \"sender_chat\": {\"id\": -1001838577085, \"type\": \"channel\", \"title\": \"АНТИ-КРТ Движение жителей СПб\", \"username\": \"channel_anti_krt\"}, \"forward_date\": 1672160730, \"forward_from_chat\": {\"id\": -1001668009692, \"type\": \"channel\", \"title\": \"Новости КРТ\", \"username\": \"knyazhevokrt\"}, \"forward_from_message_id\": 2761}}'),(227,'2022-12-28 02:03:26.000000','Новость на канале',NULL,'{\"update_id\": 14311109, \"channel_post\": {\"chat\": {\"id\": -1001838577085, \"type\": \"channel\", \"title\": \"АНТИ-КРТ Движение жителей СПб\", \"username\": \"channel_anti_krt\"}, \"date\": 1672193006, \"video\": {\"thumb\": {\"width\": 320, \"height\": 180, \"file_id\": \"AAMCAgADHQJtlnW9AAPjY6uj7p7zaKs_S3ym2SpNDciNuPYAApgoAAKbA1lJuTjhTbjFl2kBAAdtAAMsBA\", \"file_size\": 17433, \"file_unique_id\": \"AQADmCgAApsDWUly\"}, \"width\": 1280, \"height\": 720, \"file_id\": \"BAACAgIAAx0CbZZ1vQAD42Oro-6e82irP0t8ptkqTQ3Ijbj2AAKYKAACmwNZSbk44U24xZdpLAQ\", \"duration\": 92, \"file_name\": \"Реконструкция пятиэтажек.mp4\", \"file_size\": 18366765, \"mime_type\": \"video/mp4\", \"file_unique_id\": \"AgADmCgAApsDWUk\"}, \"message_id\": 227, \"sender_chat\": {\"id\": -1001838577085, \"type\": \"channel\", \"title\": \"АНТИ-КРТ Движение жителей СПб\", \"username\": \"channel_anti_krt\"}}}'),(228,'2022-12-28 02:08:30.000000','Росреестр сократит сроки регистрации прав на недвижимость до одного дня',NULL,'{\"update_id\": 14311111, \"channel_post\": {\"chat\": {\"id\": -1001838577085, \"type\": \"channel\", \"title\": \"АНТИ-КРТ Движение жителей СПб\", \"username\": \"channel_anti_krt\"}, \"date\": 1672193310, \"text\": \"Росреестр сократит сроки регистрации прав на недвижимость до одного дня.\", \"message_id\": 228, \"sender_chat\": {\"id\": -1001838577085, \"type\": \"channel\", \"title\": \"АНТИ-КРТ Движение жителей СПб\", \"username\": \"channel_anti_krt\"}}}'),(229,'2022-12-28 02:08:30.000000','https://realty',NULL,'{\"update_id\": 14311112, \"channel_post\": {\"chat\": {\"id\": -1001838577085, \"type\": \"channel\", \"title\": \"АНТИ-КРТ Движение жителей СПб\", \"username\": \"channel_anti_krt\"}, \"date\": 1672193310, \"text\": \"https://realty.rbc.ru/news/63a9ab9f9a79476686cb3880\", \"entities\": [{\"type\": \"url\", \"length\": 51, \"offset\": 0}], \"message_id\": 229, \"sender_chat\": {\"id\": -1001838577085, \"type\": \"channel\", \"title\": \"АНТИ-КРТ Движение жителей СПб\", \"username\": \"channel_anti_krt\"}, \"forward_date\": 1672160730, \"forward_from_chat\": {\"id\": -1001668009692, \"type\": \"channel\", \"title\": \"Новости КРТ\", \"username\": \"knyazhevokrt\"}, \"forward_from_message_id\": 2761}}'),(230,'2022-12-28 02:12:43.000000','❗️В Госдуму РФ внесен законопроект о внесении изменений в Жилищный кодекс РФ в части проведения общих собраний и оформления их результатов',NULL,'{\"update_id\": 14311114, \"channel_post\": {\"chat\": {\"id\": -1001838577085, \"type\": \"channel\", \"title\": \"АНТИ-КРТ Движение жителей СПб\", \"username\": \"channel_anti_krt\"}, \"date\": 1672193563, \"text\": \"❗️В Госдуму РФ внесен законопроект о внесении изменений в Жилищный кодекс РФ в части проведения общих собраний и оформления их результатов. \\n (https://sozd.duma.gov.ru/bill/265996-8) \\n \\n🔸 Предлагается установить срок хранения электронных образов протоколов в ГИС ЖКХ – 10 лет. \\n \\n🔸 Подлинники, хранящиеся в ГЖИ, после истечения трехлетнего срока предлагается возвращать обратно собственникам. \\n \\n🔸 Авторы проекта хотят закрепить в ЖК РФ возможность изготовления дополнительных экземпляров протокола, которые будут заверяться инициатором и (или) ГЖИ. \\n[ох уж эти «и / или»! \\nКстати, кто хотел, тот делал несколько экземпляров протоколов и раньше - это не запрещено законом, а при создании ТСЖ - практически необходимость] \\n \\n🔸 Законопроект предусматривает доведение до сведения собственников результатов голосования каждого из них (без персональных данных). \\n \\n🔸 Предполагается, что ГЖИ, получив от собственника заявление о неучастии в собрании, должна будет провести проверку и при выявлении подделки направить документы в правоохранительные органы. \\n[сейчас ничего не мешает собственникам самим обратиться в полицию напрямую. Результат проверки сообщения о преступлении едва ли будет сильно меняться в зависимости от того, кто обратился в полицию. Печальное обобщение (https://gkhnews.ru/1477857-poddelka-protokola/) практики по подделке протоколов мы уже публиковали ранее] \\n \\n🔸 (https://t.me/gkhnewsru/812) Предусматривается порядок подписания бюллетеней: собственник должен будет поставить подпись и ФИО на каждой странице. \\n \\n🔸 (https://t.me/gkhnewsru/812) Предполагается, что сбор бюллетеней будет фиксироваться в «реестре решений собственников», где голосующий должен будет также расписаться и поставить свои ФИО. Этот реестр планируется считать еще одним приложением к протоколу общего собрания. \\n[сейчас Приказ Минстроя 44/пр и так предполагает, что все \\\"присутствующие\\\" (а под ними понимаются все участники, а не только \\\"очники\\\") должны расписаться в списке присутствующих (подп. \\\"в\\\" п 12 и подп. \\\"а\\\" п. 13)] \\n \\nЗаконопроект предполагает , что изменения при их принятии вступят в силу с 1 сентября 2023 года.\", \"entities\": [{\"type\": \"bold\", \"length\": 141, \"offset\": 0}, {\"type\": \"url\", \"length\": 38, \"offset\": 143}, {\"type\": \"url\", \"length\": 46, \"offset\": 1275}, {\"type\": \"url\", \"length\": 26, \"offset\": 1388}, {\"type\": \"url\", \"length\": 26, \"offset\": 1541}], \"message_id\": 230, \"sender_chat\": {\"id\": -1001838577085, \"type\": \"channel\", \"title\": \"АНТИ-КРТ Движение жителей СПб\", \"username\": \"channel_anti_krt\"}, \"forward_date\": 1672079916, \"forward_from_chat\": {\"id\": -1001645796363, \"type\": \"channel\", \"title\": \"ЖКХ-Telegraph\", \"username\": \"gkh_telegraf\"}, \"forward_from_message_id\": 448}}'),(231,'2022-12-28 20:21:58.000000','Новость на канале',NULL,'{\"update_id\": 14311116, \"channel_post\": {\"chat\": {\"id\": -1001838577085, \"type\": \"channel\", \"title\": \"АНТИ-КРТ Движение жителей СПб\", \"username\": \"channel_anti_krt\"}, \"date\": 1672258918, \"video\": {\"thumb\": {\"width\": 320, \"height\": 180, \"file_id\": \"AAMCAgADHQJtlnW9AAPnY6ylZri2FhWYViXedjodvuzC5usAAmEmAAKbA2FJrSYeaUSeSTIBAAdtAAMsBA\", \"file_size\": 14071, \"file_unique_id\": \"AQADYSYAApsDYUly\"}, \"width\": 640, \"height\": 360, \"file_id\": \"BAACAgIAAx0CbZZ1vQAD52OspWa4thYVmFYl3nY6Hb7swubrAAJhJgACmwNhSa0mHmlEnkkyLAQ\", \"duration\": 184, \"file_name\": \"Город золотой-1.mp4\", \"file_size\": 13992706, \"mime_type\": \"video/mp4\", \"file_unique_id\": \"AgADYSYAApsDYUk\"}, \"message_id\": 231, \"sender_chat\": {\"id\": -1001838577085, \"type\": \"channel\", \"title\": \"АНТИ-КРТ Движение жителей СПб\", \"username\": \"channel_anti_krt\"}}}');
/*!40000 ALTER TABLE `krtnews_krtnews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taggit_tag`
--

DROP TABLE IF EXISTS `taggit_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `taggit_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `slug` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `slug` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taggit_tag`
--

LOCK TABLES `taggit_tag` WRITE;
/*!40000 ALTER TABLE `taggit_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `taggit_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taggit_taggeditem`
--

DROP TABLE IF EXISTS `taggit_taggeditem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `taggit_taggeditem` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `object_id` int(11) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `taggit_taggeditem_content_type_id_object_id_tag_id_4bb97a8e_uniq` (`content_type_id`,`object_id`,`tag_id`),
  KEY `taggit_taggeditem_tag_id_f4f5b767_fk_taggit_tag_id` (`tag_id`),
  KEY `taggit_taggeditem_object_id_e2d7d1df` (`object_id`),
  KEY `taggit_taggeditem_content_type_id_object_id_196cc965_idx` (`content_type_id`,`object_id`),
  CONSTRAINT `taggit_taggeditem_content_type_id_9957a03c_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `taggit_taggeditem_tag_id_f4f5b767_fk_taggit_tag_id` FOREIGN KEY (`tag_id`) REFERENCES `taggit_tag` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taggit_taggeditem`
--

LOCK TABLES `taggit_taggeditem` WRITE;
/*!40000 ALTER TABLE `taggit_taggeditem` DISABLE KEYS */;
/*!40000 ALTER TABLE `taggit_taggeditem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wagtailadmin_admin`
--

DROP TABLE IF EXISTS `wagtailadmin_admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wagtailadmin_admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wagtailadmin_admin`
--

LOCK TABLES `wagtailadmin_admin` WRITE;
/*!40000 ALTER TABLE `wagtailadmin_admin` DISABLE KEYS */;
/*!40000 ALTER TABLE `wagtailadmin_admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wagtailcore_collection`
--

DROP TABLE IF EXISTS `wagtailcore_collection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wagtailcore_collection` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `path` varchar(255) NOT NULL,
  `depth` int(10) unsigned NOT NULL,
  `numchild` int(10) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `path` (`path`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wagtailcore_collection`
--

LOCK TABLES `wagtailcore_collection` WRITE;
/*!40000 ALTER TABLE `wagtailcore_collection` DISABLE KEYS */;
INSERT INTO `wagtailcore_collection` VALUES (1,'0001',1,1,'Root'),(2,'00010001',2,0,'homepage');
/*!40000 ALTER TABLE `wagtailcore_collection` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wagtailcore_collectionviewrestriction`
--

DROP TABLE IF EXISTS `wagtailcore_collectionviewrestriction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wagtailcore_collectionviewrestriction` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `restriction_type` varchar(20) NOT NULL,
  `password` varchar(255) NOT NULL,
  `collection_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `wagtailcore_collecti_collection_id_761908ec_fk_wagtailco` (`collection_id`),
  CONSTRAINT `wagtailcore_collecti_collection_id_761908ec_fk_wagtailco` FOREIGN KEY (`collection_id`) REFERENCES `wagtailcore_collection` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wagtailcore_collectionviewrestriction`
--

LOCK TABLES `wagtailcore_collectionviewrestriction` WRITE;
/*!40000 ALTER TABLE `wagtailcore_collectionviewrestriction` DISABLE KEYS */;
/*!40000 ALTER TABLE `wagtailcore_collectionviewrestriction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wagtailcore_collectionviewrestriction_groups`
--

DROP TABLE IF EXISTS `wagtailcore_collectionviewrestriction_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wagtailcore_collectionviewrestriction_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `collectionviewrestriction_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `wagtailcore_collectionvi_collectionviewrestrictio_988995ae_uniq` (`collectionviewrestriction_id`,`group_id`),
  KEY `wagtailcore_collecti_group_id_1823f2a3_fk_auth_grou` (`group_id`),
  CONSTRAINT `wagtailcore_collecti_collectionviewrestri_47320efd_fk_wagtailco` FOREIGN KEY (`collectionviewrestriction_id`) REFERENCES `wagtailcore_collectionviewrestriction` (`id`),
  CONSTRAINT `wagtailcore_collecti_group_id_1823f2a3_fk_auth_grou` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wagtailcore_collectionviewrestriction_groups`
--

LOCK TABLES `wagtailcore_collectionviewrestriction_groups` WRITE;
/*!40000 ALTER TABLE `wagtailcore_collectionviewrestriction_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `wagtailcore_collectionviewrestriction_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wagtailcore_comment`
--

DROP TABLE IF EXISTS `wagtailcore_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wagtailcore_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `text` longtext NOT NULL,
  `contentpath` longtext NOT NULL,
  `position` longtext NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `resolved_at` datetime(6) DEFAULT NULL,
  `page_id` int(11) NOT NULL,
  `resolved_by_id` int(11) DEFAULT NULL,
  `revision_created_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `wagtailcore_comment_resolved_by_id_a282aa0e_fk_auth_user_id` (`resolved_by_id`),
  KEY `wagtailcore_comment_user_id_0c577ca6_fk_auth_user_id` (`user_id`),
  KEY `wagtailcore_comment_page_id_108444b5` (`page_id`),
  KEY `wagtailcore_comment_revision_created_id_1d058279_fk_wagtailco` (`revision_created_id`),
  CONSTRAINT `wagtailcore_comment_page_id_108444b5_fk_wagtailcore_page_id` FOREIGN KEY (`page_id`) REFERENCES `wagtailcore_page` (`id`),
  CONSTRAINT `wagtailcore_comment_resolved_by_id_a282aa0e_fk_auth_user_id` FOREIGN KEY (`resolved_by_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `wagtailcore_comment_revision_created_id_1d058279_fk_wagtailco` FOREIGN KEY (`revision_created_id`) REFERENCES `wagtailcore_revision` (`id`),
  CONSTRAINT `wagtailcore_comment_user_id_0c577ca6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wagtailcore_comment`
--

LOCK TABLES `wagtailcore_comment` WRITE;
/*!40000 ALTER TABLE `wagtailcore_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `wagtailcore_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wagtailcore_commentreply`
--

DROP TABLE IF EXISTS `wagtailcore_commentreply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wagtailcore_commentreply` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `text` longtext NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `comment_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `wagtailcore_commentreply_user_id_d0b3b9c3_fk_auth_user_id` (`user_id`),
  KEY `wagtailcore_commentreply_comment_id_afc7e027` (`comment_id`),
  CONSTRAINT `wagtailcore_commentr_comment_id_afc7e027_fk_wagtailco` FOREIGN KEY (`comment_id`) REFERENCES `wagtailcore_comment` (`id`),
  CONSTRAINT `wagtailcore_commentreply_user_id_d0b3b9c3_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wagtailcore_commentreply`
--

LOCK TABLES `wagtailcore_commentreply` WRITE;
/*!40000 ALTER TABLE `wagtailcore_commentreply` DISABLE KEYS */;
/*!40000 ALTER TABLE `wagtailcore_commentreply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wagtailcore_groupapprovaltask`
--

DROP TABLE IF EXISTS `wagtailcore_groupapprovaltask`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wagtailcore_groupapprovaltask` (
  `task_ptr_id` int(11) NOT NULL,
  PRIMARY KEY (`task_ptr_id`),
  CONSTRAINT `wagtailcore_groupapp_task_ptr_id_cfe58781_fk_wagtailco` FOREIGN KEY (`task_ptr_id`) REFERENCES `wagtailcore_task` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wagtailcore_groupapprovaltask`
--

LOCK TABLES `wagtailcore_groupapprovaltask` WRITE;
/*!40000 ALTER TABLE `wagtailcore_groupapprovaltask` DISABLE KEYS */;
INSERT INTO `wagtailcore_groupapprovaltask` VALUES (1);
/*!40000 ALTER TABLE `wagtailcore_groupapprovaltask` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wagtailcore_groupapprovaltask_groups`
--

DROP TABLE IF EXISTS `wagtailcore_groupapprovaltask_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wagtailcore_groupapprovaltask_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupapprovaltask_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `wagtailcore_groupapprova_groupapprovaltask_id_gro_bb5ee7eb_uniq` (`groupapprovaltask_id`,`group_id`),
  KEY `wagtailcore_groupapp_group_id_2e64b61f_fk_auth_grou` (`group_id`),
  CONSTRAINT `wagtailcore_groupapp_group_id_2e64b61f_fk_auth_grou` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `wagtailcore_groupapp_groupapprovaltask_id_9a9255ea_fk_wagtailco` FOREIGN KEY (`groupapprovaltask_id`) REFERENCES `wagtailcore_groupapprovaltask` (`task_ptr_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wagtailcore_groupapprovaltask_groups`
--

LOCK TABLES `wagtailcore_groupapprovaltask_groups` WRITE;
/*!40000 ALTER TABLE `wagtailcore_groupapprovaltask_groups` DISABLE KEYS */;
INSERT INTO `wagtailcore_groupapprovaltask_groups` VALUES (1,1,1);
/*!40000 ALTER TABLE `wagtailcore_groupapprovaltask_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wagtailcore_groupcollectionpermission`
--

DROP TABLE IF EXISTS `wagtailcore_groupcollectionpermission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wagtailcore_groupcollectionpermission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `collection_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `wagtailcore_groupcollect_group_id_collection_id_p_a21cefe9_uniq` (`group_id`,`collection_id`,`permission_id`),
  KEY `wagtailcore_groupcol_collection_id_5423575a_fk_wagtailco` (`collection_id`),
  KEY `wagtailcore_groupcol_permission_id_1b626275_fk_auth_perm` (`permission_id`),
  CONSTRAINT `wagtailcore_groupcol_collection_id_5423575a_fk_wagtailco` FOREIGN KEY (`collection_id`) REFERENCES `wagtailcore_collection` (`id`),
  CONSTRAINT `wagtailcore_groupcol_group_id_05d61460_fk_auth_grou` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `wagtailcore_groupcol_permission_id_1b626275_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wagtailcore_groupcollectionpermission`
--

LOCK TABLES `wagtailcore_groupcollectionpermission` WRITE;
/*!40000 ALTER TABLE `wagtailcore_groupcollectionpermission` DISABLE KEYS */;
INSERT INTO `wagtailcore_groupcollectionpermission` VALUES (2,1,1,1),(4,1,1,2),(6,1,1,6),(8,1,1,7),(10,1,1,9),(1,1,2,1),(3,1,2,2),(5,1,2,6),(7,1,2,7),(9,1,2,9),(15,2,3,1),(16,2,3,2),(14,2,3,4),(12,2,3,6),(13,2,3,7),(11,2,3,9);
/*!40000 ALTER TABLE `wagtailcore_groupcollectionpermission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wagtailcore_grouppagepermission`
--

DROP TABLE IF EXISTS `wagtailcore_grouppagepermission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wagtailcore_grouppagepermission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `permission_type` varchar(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `page_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `wagtailcore_grouppageper_group_id_page_id_permiss_0898bdf8_uniq` (`group_id`,`page_id`,`permission_type`),
  KEY `wagtailcore_grouppag_page_id_710b114a_fk_wagtailco` (`page_id`),
  CONSTRAINT `wagtailcore_grouppag_group_id_fc07e671_fk_auth_grou` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `wagtailcore_grouppag_page_id_710b114a_fk_wagtailco` FOREIGN KEY (`page_id`) REFERENCES `wagtailcore_page` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wagtailcore_grouppagepermission`
--

LOCK TABLES `wagtailcore_grouppagepermission` WRITE;
/*!40000 ALTER TABLE `wagtailcore_grouppagepermission` DISABLE KEYS */;
INSERT INTO `wagtailcore_grouppagepermission` VALUES (1,'add',1,1),(2,'edit',1,1),(6,'lock',1,1),(3,'publish',1,1),(7,'unlock',1,1),(4,'add',2,1),(5,'edit',2,1),(8,'edit',3,4),(9,'publish',3,4);
/*!40000 ALTER TABLE `wagtailcore_grouppagepermission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wagtailcore_locale`
--

DROP TABLE IF EXISTS `wagtailcore_locale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wagtailcore_locale` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `language_code` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `language_code` (`language_code`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wagtailcore_locale`
--

LOCK TABLES `wagtailcore_locale` WRITE;
/*!40000 ALTER TABLE `wagtailcore_locale` DISABLE KEYS */;
INSERT INTO `wagtailcore_locale` VALUES (1,'ru');
/*!40000 ALTER TABLE `wagtailcore_locale` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wagtailcore_modellogentry`
--

DROP TABLE IF EXISTS `wagtailcore_modellogentry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wagtailcore_modellogentry` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `label` longtext NOT NULL,
  `action` varchar(255) NOT NULL,
  `data` json NOT NULL,
  `timestamp` datetime(6) NOT NULL,
  `content_changed` tinyint(1) NOT NULL,
  `deleted` tinyint(1) NOT NULL,
  `object_id` varchar(255) NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `uuid` char(32) DEFAULT NULL,
  `revision_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `wagtailcore_modellog_content_type_id_68849e77_fk_django_co` (`content_type_id`),
  KEY `wagtailcore_modellogentry_action_d2d856ee` (`action`),
  KEY `wagtailcore_modellogentry_content_changed_8bc39742` (`content_changed`),
  KEY `wagtailcore_modellogentry_object_id_e0e7d4ef` (`object_id`),
  KEY `wagtailcore_modellogentry_user_id_0278d1bf` (`user_id`),
  KEY `wagtailcore_modellogentry_timestamp_9694521b` (`timestamp`),
  KEY `wagtailcore_modellogentry_revision_id_df6ca33a` (`revision_id`),
  CONSTRAINT `wagtailcore_modellog_content_type_id_68849e77_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wagtailcore_modellogentry`
--

LOCK TABLES `wagtailcore_modellogentry` WRITE;
/*!40000 ALTER TABLE `wagtailcore_modellogentry` DISABLE KEYS */;
INSERT INTO `wagtailcore_modellogentry` VALUES (1,'Andrey','wagtail.edit','{}','2022-12-02 15:41:07.013442',0,0,'1',43,1,'272a73a6e3f44d08adc47bd6db88a3c3',NULL),(2,'Andrey','wagtail.edit','{}','2022-12-02 15:41:23.559700',0,0,'1',43,1,'aa5d3bbaeef749aeabbffb13e23f90ee',NULL),(3,'localhost [по умолчанию]','wagtail.delete','{}','2022-12-02 15:41:38.960676',0,0,'1',20,1,'a500133b939f45579cf3116c5cbc162c',NULL),(4,'anti-krt [по умолчанию]','wagtail.create','{}','2022-12-02 15:42:09.596997',1,0,'2',20,1,'8585dc6ca2f44edbb211644838fbc61c',NULL),(5,'anti-krt [по умолчанию]','wagtail.create','{}','2022-12-02 15:46:35.882804',1,0,'3',20,1,'d69cafc6f1ad4b66abce2528cd7b30c1',NULL),(6,'homepage editors','wagtail.create','{}','2022-12-02 16:14:12.565461',1,0,'3',42,1,'3ee0542680694aaea107b9ebef00d34d',NULL),(7,'homepage editors','wagtail.edit','{}','2022-12-02 16:15:09.026602',0,0,'3',42,1,'75cc0de1840749328c64f799fe91a318',NULL),(8,'ArkadiyV','wagtail.create','{}','2022-12-02 16:16:54.328626',1,0,'2',43,1,'2ef18b9102854a1da730681fca638552',NULL),(9,'homepage editors','wagtail.edit','{}','2022-12-07 03:42:01.838994',1,0,'3',42,1,'ba33cb60b8d249e4a038039f4d065bd2',NULL),(10,'anti-krt [по умолчанию]','wagtail.edit','{}','2022-12-22 20:48:10.684982',1,0,'3',20,1,'57ab9ff7503345aa8ad45784de77ef5a',NULL),(11,'anti-krt [по умолчанию]','wagtail.edit','{}','2022-12-22 20:49:23.137576',0,0,'3',20,1,'ad741f6f89244989b575f2988a4570cb',NULL),(12,'anti-krt [по умолчанию]','wagtail.edit','{}','2022-12-22 20:50:53.053664',1,0,'3',20,1,'f67c3f1ac36243dfb8c36e7626dd8bd6',NULL);
/*!40000 ALTER TABLE `wagtailcore_modellogentry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wagtailcore_page`
--

DROP TABLE IF EXISTS `wagtailcore_page`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wagtailcore_page` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `path` varchar(255) NOT NULL,
  `depth` int(10) unsigned NOT NULL,
  `numchild` int(10) unsigned NOT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `live` tinyint(1) NOT NULL,
  `has_unpublished_changes` tinyint(1) NOT NULL,
  `url_path` longtext NOT NULL,
  `seo_title` varchar(255) NOT NULL,
  `show_in_menus` tinyint(1) NOT NULL,
  `search_description` longtext NOT NULL,
  `go_live_at` datetime(6) DEFAULT NULL,
  `expire_at` datetime(6) DEFAULT NULL,
  `expired` tinyint(1) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `locked` tinyint(1) NOT NULL,
  `latest_revision_created_at` datetime(6) DEFAULT NULL,
  `first_published_at` datetime(6) DEFAULT NULL,
  `live_revision_id` int(11) DEFAULT NULL,
  `last_published_at` datetime(6) DEFAULT NULL,
  `draft_title` varchar(255) NOT NULL,
  `locked_at` datetime(6) DEFAULT NULL,
  `locked_by_id` int(11) DEFAULT NULL,
  `translation_key` char(32) NOT NULL,
  `locale_id` int(11) NOT NULL,
  `alias_of_id` int(11) DEFAULT NULL,
  `latest_revision_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `path` (`path`),
  UNIQUE KEY `wagtailcore_page_translation_key_locale_id_9b041bad_uniq` (`translation_key`,`locale_id`),
  KEY `wagtailcore_page_content_type_id_c28424df_fk_django_co` (`content_type_id`),
  KEY `wagtailcore_page_owner_id_fbf7c332_fk_auth_user_id` (`owner_id`),
  KEY `wagtailcore_page_slug_e7c11b8f` (`slug`),
  KEY `wagtailcore_page_first_published_at_2b5dd637` (`first_published_at`),
  KEY `wagtailcore_page_live_revision_id_930bd822_fk_wagtailco` (`live_revision_id`),
  KEY `wagtailcore_page_locked_by_id_bcb86245_fk_auth_user_id` (`locked_by_id`),
  KEY `wagtailcore_page_locale_id_3c7e30a6_fk_wagtailcore_locale_id` (`locale_id`),
  KEY `wagtailcore_page_alias_of_id_12945502_fk_wagtailcore_page_id` (`alias_of_id`),
  KEY `wagtailcore_page_latest_revision_id_e60fef51_fk_wagtailco` (`latest_revision_id`),
  CONSTRAINT `wagtailcore_page_alias_of_id_12945502_fk_wagtailcore_page_id` FOREIGN KEY (`alias_of_id`) REFERENCES `wagtailcore_page` (`id`),
  CONSTRAINT `wagtailcore_page_content_type_id_c28424df_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `wagtailcore_page_latest_revision_id_e60fef51_fk_wagtailco` FOREIGN KEY (`latest_revision_id`) REFERENCES `wagtailcore_revision` (`id`),
  CONSTRAINT `wagtailcore_page_live_revision_id_930bd822_fk_wagtailco` FOREIGN KEY (`live_revision_id`) REFERENCES `wagtailcore_revision` (`id`),
  CONSTRAINT `wagtailcore_page_locale_id_3c7e30a6_fk_wagtailcore_locale_id` FOREIGN KEY (`locale_id`) REFERENCES `wagtailcore_locale` (`id`),
  CONSTRAINT `wagtailcore_page_locked_by_id_bcb86245_fk_auth_user_id` FOREIGN KEY (`locked_by_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `wagtailcore_page_owner_id_fbf7c332_fk_auth_user_id` FOREIGN KEY (`owner_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wagtailcore_page`
--

LOCK TABLES `wagtailcore_page` WRITE;
/*!40000 ALTER TABLE `wagtailcore_page` DISABLE KEYS */;
INSERT INTO `wagtailcore_page` VALUES (1,'0001',1,1,'Root','root',1,0,'/','',0,'',NULL,NULL,0,1,NULL,0,NULL,NULL,NULL,NULL,'Root',NULL,NULL,'f1b3e0a843114498981e2e7a6978a8ad',1,NULL,NULL),(3,'00010001',2,2,'HomePage','homepage',1,0,'/homepage/','',0,'',NULL,NULL,0,6,1,0,'2022-12-02 15:47:11.148116','2022-12-02 15:43:12.540449',3,'2022-12-02 15:47:11.189232','HomePage',NULL,NULL,'4dbe709149974e01bf648e2379a18528',1,NULL,3),(4,'000100010001',3,0,'Макет главной страницы','maket-glavnoj-stranicy123',1,0,'/homepage/maket-glavnoj-stranicy123/','',0,'',NULL,NULL,0,7,1,0,'2022-12-29 00:05:08.811574','2022-12-02 15:46:09.443277',22,'2022-12-29 00:05:08.849955','Макет главной страницы',NULL,NULL,'58a31905fbd64e69ab61ec32cfd2e259',1,NULL,22),(5,'000100010002',3,0,'Анти КРТ мероприятия','activity',1,0,'/homepage/activity/','',0,'',NULL,NULL,0,47,1,0,'2022-12-24 17:05:02.673853','2022-12-24 17:03:57.529603',20,'2022-12-24 17:05:02.746476','Анти КРТ мероприятия',NULL,NULL,'551e8db0fbe341d4ac55e7a6c2198b60',1,NULL,20);
/*!40000 ALTER TABLE `wagtailcore_page` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wagtailcore_pagelogentry`
--

DROP TABLE IF EXISTS `wagtailcore_pagelogentry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wagtailcore_pagelogentry` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `label` longtext NOT NULL,
  `action` varchar(255) NOT NULL,
  `data` json NOT NULL,
  `timestamp` datetime(6) NOT NULL,
  `content_changed` tinyint(1) NOT NULL,
  `deleted` tinyint(1) NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `page_id` int(11) NOT NULL,
  `revision_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `uuid` char(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `wagtailcore_pageloge_content_type_id_74e7708a_fk_django_co` (`content_type_id`),
  KEY `wagtailcore_pagelogentry_action_c2408198` (`action`),
  KEY `wagtailcore_pagelogentry_content_changed_99f27ade` (`content_changed`),
  KEY `wagtailcore_pagelogentry_page_id_8464e327` (`page_id`),
  KEY `wagtailcore_pagelogentry_revision_id_8043d103` (`revision_id`),
  KEY `wagtailcore_pagelogentry_user_id_604ccfd8` (`user_id`),
  KEY `wagtailcore_pagelogentry_timestamp_deb774c4` (`timestamp`),
  CONSTRAINT `wagtailcore_pageloge_content_type_id_74e7708a_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wagtailcore_pagelogentry`
--

LOCK TABLES `wagtailcore_pagelogentry` WRITE;
/*!40000 ALTER TABLE `wagtailcore_pagelogentry` DISABLE KEYS */;
INSERT INTO `wagtailcore_pagelogentry` VALUES (1,'Welcome to your new Wagtail site!','wagtail.delete','{}','2022-12-02 15:42:27.083119',0,1,1,2,NULL,1,'dd80f1607c804391aff57f3816165fe5'),(2,'HomePage','wagtail.create','{}','2022-12-02 15:43:12.497781',1,0,6,3,NULL,1,'7389e618a59c4fbcb9b2312f5848d1f5'),(3,'HomePage','wagtail.publish','{}','2022-12-02 15:43:12.574483',1,0,6,3,1,1,'7389e618a59c4fbcb9b2312f5848d1f5'),(4,'Макет главной страницы','wagtail.create','{}','2022-12-02 15:46:09.396276',1,0,7,4,NULL,1,'a589e648f90a4aff8edc5e190ff4263c'),(5,'Макет главной страницы','wagtail.publish','{}','2022-12-02 15:46:09.478520',1,0,7,4,2,1,'a589e648f90a4aff8edc5e190ff4263c'),(6,'HomePage','wagtail.edit','{}','2022-12-02 15:47:11.169879',1,0,6,3,3,1,'ff1ee3b414524d549b9b27cfcb7dcea5'),(7,'HomePage','wagtail.publish','{}','2022-12-02 15:47:11.230506',1,0,6,3,3,1,'ff1ee3b414524d549b9b27cfcb7dcea5'),(8,'Макет главной страницы','wagtail.edit','{}','2022-12-02 16:05:34.515026',1,0,7,4,4,1,'c12d7d475fac416093b437c2bfb4e849'),(9,'Макет главной страницы','wagtail.publish','{}','2022-12-02 16:05:34.573500',1,0,7,4,4,1,'c12d7d475fac416093b437c2bfb4e849'),(10,'Макет главной страницы','wagtail.edit','{}','2022-12-02 16:11:22.226875',1,0,7,4,5,1,'f9779355ee4547339844e77a4c490616'),(11,'Макет главной страницы','wagtail.publish','{}','2022-12-02 16:11:22.295303',1,0,7,4,5,1,'f9779355ee4547339844e77a4c490616'),(12,'Макет главной страницы','wagtail.edit','{}','2022-12-02 16:19:54.728034',1,0,7,4,6,1,'7cd0fe99e21640cfa0fc1c9b7c23a039'),(13,'Макет главной страницы','wagtail.publish','{}','2022-12-02 16:19:54.832412',1,0,7,4,6,1,'7cd0fe99e21640cfa0fc1c9b7c23a039'),(14,'Макет главной страницы','wagtail.edit','{}','2022-12-07 03:46:38.118862',1,0,7,4,7,2,'07b5b4dd337248cfb958840ad9f41f05'),(15,'Макет главной страницы','wagtail.edit','{}','2022-12-07 03:47:47.633162',1,0,7,4,8,2,'7ea3cee653b84fc098153758eff977a0'),(16,'Макет главной страницы','wagtail.publish','{}','2022-12-07 03:47:47.686454',0,0,7,4,8,2,'7ea3cee653b84fc098153758eff977a0'),(17,'Макет главной страницы','wagtail.edit','{}','2022-12-07 03:57:47.044391',1,0,7,4,9,1,'99627bc5302d416494eae48ba23a4a2a'),(18,'Макет главной страницы','wagtail.publish','{}','2022-12-07 03:57:47.107079',1,0,7,4,9,1,'99627bc5302d416494eae48ba23a4a2a'),(19,'Макет главной страницы','wagtail.edit','{}','2022-12-10 19:11:49.113368',1,0,7,4,10,2,'4f8d622ca570418e93743423158b8c41'),(20,'Макет главной страницы','wagtail.edit','{}','2022-12-10 19:11:54.325465',1,0,7,4,11,2,'b70cb96e35ea4600832329d451fe2ceb'),(21,'Макет главной страницы','wagtail.publish','{}','2022-12-10 19:11:54.379455',0,0,7,4,11,2,'b70cb96e35ea4600832329d451fe2ceb'),(22,'Макет главной страницы','wagtail.edit','{}','2022-12-10 19:15:28.409072',1,0,7,4,12,2,'0672f4f58e5141d986aba2bf3cdc3b5d'),(23,'Макет главной страницы','wagtail.edit','{}','2022-12-10 19:15:32.412120',1,0,7,4,13,2,'161675ef4ea84512a69d1ada334b981f'),(24,'Макет главной страницы','wagtail.publish','{}','2022-12-10 19:15:32.488171',0,0,7,4,13,2,'161675ef4ea84512a69d1ada334b981f'),(25,'Макет главной страницы','wagtail.edit','{}','2022-12-10 19:16:04.539577',1,0,7,4,14,2,'5af48aea4b1c42709a2bf558f8cda66f'),(26,'Макет главной страницы','wagtail.edit','{}','2022-12-10 19:16:08.404292',1,0,7,4,15,2,'2bf25c31be234200bcd77bf1a41cf772'),(27,'Макет главной страницы','wagtail.publish','{}','2022-12-10 19:16:08.458114',0,0,7,4,15,2,'2bf25c31be234200bcd77bf1a41cf772'),(28,'Макет главной страницы','wagtail.edit','{}','2022-12-10 19:20:36.348437',1,0,7,4,16,2,'595471958b9f427a89baa7547f24499b'),(29,'Макет главной страницы','wagtail.edit','{}','2022-12-10 19:20:40.124228',1,0,7,4,17,2,'6d5977384f914238a1dca1105edc1396'),(30,'Макет главной страницы','wagtail.publish','{}','2022-12-10 19:20:40.174976',1,0,7,4,17,2,'6d5977384f914238a1dca1105edc1396'),(31,'Макет главной страницы','wagtail.edit','{}','2022-12-11 07:03:19.254179',1,0,7,4,18,1,'d434f40a6d154965ae2b3e66f2b5d47c'),(32,'Макет главной страницы','wagtail.publish','{}','2022-12-11 07:03:19.314358',1,0,7,4,18,1,'d434f40a6d154965ae2b3e66f2b5d47c'),(33,'Анти КРТ мероприятия','wagtail.create','{}','2022-12-24 17:03:57.426099',1,0,47,5,NULL,1,'d46c914d1bab44cbbdf7927c7d6921c1'),(34,'Анти КРТ мероприятия','wagtail.publish','{}','2022-12-24 17:03:57.603516',1,0,47,5,19,1,'d46c914d1bab44cbbdf7927c7d6921c1'),(35,'Анти КРТ мероприятия','wagtail.edit','{}','2022-12-24 17:05:02.710437',1,0,47,5,20,1,'f8724906a54c4f4b801d2ddc5d74ea93'),(36,'Анти КРТ мероприятия','wagtail.publish','{}','2022-12-24 17:05:02.825198',1,0,47,5,20,1,'f8724906a54c4f4b801d2ddc5d74ea93'),(37,'Макет главной страницы','wagtail.edit','{}','2022-12-29 00:02:28.349487',1,0,7,4,21,1,'24464d7434b14e8582d39e3af14fa4b5'),(38,'Макет главной страницы','wagtail.publish','{}','2022-12-29 00:02:28.430245',1,0,7,4,21,1,'24464d7434b14e8582d39e3af14fa4b5'),(39,'Макет главной страницы','wagtail.edit','{}','2022-12-29 00:05:08.831248',1,0,7,4,22,1,'2e468fd194494983b739bdcb946eaecf'),(40,'Макет главной страницы','wagtail.publish','{}','2022-12-29 00:05:08.891437',0,0,7,4,22,1,'2e468fd194494983b739bdcb946eaecf');
/*!40000 ALTER TABLE `wagtailcore_pagelogentry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wagtailcore_pagesubscription`
--

DROP TABLE IF EXISTS `wagtailcore_pagesubscription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wagtailcore_pagesubscription` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `comment_notifications` tinyint(1) NOT NULL,
  `page_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `wagtailcore_pagesubscription_page_id_user_id_0cef73ed_uniq` (`page_id`,`user_id`),
  KEY `wagtailcore_pagesubscription_user_id_89d7def9_fk_auth_user_id` (`user_id`),
  CONSTRAINT `wagtailcore_pagesubs_page_id_a085e7a6_fk_wagtailco` FOREIGN KEY (`page_id`) REFERENCES `wagtailcore_page` (`id`),
  CONSTRAINT `wagtailcore_pagesubscription_user_id_89d7def9_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wagtailcore_pagesubscription`
--

LOCK TABLES `wagtailcore_pagesubscription` WRITE;
/*!40000 ALTER TABLE `wagtailcore_pagesubscription` DISABLE KEYS */;
INSERT INTO `wagtailcore_pagesubscription` VALUES (1,1,3,1),(2,1,4,1),(3,0,4,2),(4,1,5,1);
/*!40000 ALTER TABLE `wagtailcore_pagesubscription` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wagtailcore_pageviewrestriction`
--

DROP TABLE IF EXISTS `wagtailcore_pageviewrestriction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wagtailcore_pageviewrestriction` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(255) NOT NULL,
  `page_id` int(11) NOT NULL,
  `restriction_type` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `wagtailcore_pageview_page_id_15a8bea6_fk_wagtailco` (`page_id`),
  CONSTRAINT `wagtailcore_pageview_page_id_15a8bea6_fk_wagtailco` FOREIGN KEY (`page_id`) REFERENCES `wagtailcore_page` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wagtailcore_pageviewrestriction`
--

LOCK TABLES `wagtailcore_pageviewrestriction` WRITE;
/*!40000 ALTER TABLE `wagtailcore_pageviewrestriction` DISABLE KEYS */;
/*!40000 ALTER TABLE `wagtailcore_pageviewrestriction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wagtailcore_pageviewrestriction_groups`
--

DROP TABLE IF EXISTS `wagtailcore_pageviewrestriction_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wagtailcore_pageviewrestriction_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pageviewrestriction_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `wagtailcore_pageviewrest_pageviewrestriction_id_g_d23f80bb_uniq` (`pageviewrestriction_id`,`group_id`),
  KEY `wagtailcore_pageview_group_id_6460f223_fk_auth_grou` (`group_id`),
  CONSTRAINT `wagtailcore_pageview_group_id_6460f223_fk_auth_grou` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `wagtailcore_pageview_pageviewrestriction__f147a99a_fk_wagtailco` FOREIGN KEY (`pageviewrestriction_id`) REFERENCES `wagtailcore_pageviewrestriction` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wagtailcore_pageviewrestriction_groups`
--

LOCK TABLES `wagtailcore_pageviewrestriction_groups` WRITE;
/*!40000 ALTER TABLE `wagtailcore_pageviewrestriction_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `wagtailcore_pageviewrestriction_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wagtailcore_referenceindex`
--

DROP TABLE IF EXISTS `wagtailcore_referenceindex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wagtailcore_referenceindex` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `object_id` varchar(255) NOT NULL,
  `to_object_id` varchar(255) NOT NULL,
  `model_path` longtext NOT NULL,
  `content_path` longtext NOT NULL,
  `content_path_hash` char(32) NOT NULL,
  `base_content_type_id` int(11) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `to_content_type_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `wagtailcore_referenceind_base_content_type_id_obj_9e6ccd6a_uniq` (`base_content_type_id`,`object_id`,`to_content_type_id`,`to_object_id`,`content_path_hash`),
  KEY `wagtailcore_referenc_content_type_id_766e0336_fk_django_co` (`content_type_id`),
  KEY `wagtailcore_referenc_to_content_type_id_93690bbd_fk_django_co` (`to_content_type_id`),
  CONSTRAINT `wagtailcore_referenc_base_content_type_id_313cf40f_fk_django_co` FOREIGN KEY (`base_content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `wagtailcore_referenc_content_type_id_766e0336_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `wagtailcore_referenc_to_content_type_id_93690bbd_fk_django_co` FOREIGN KEY (`to_content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wagtailcore_referenceindex`
--

LOCK TABLES `wagtailcore_referenceindex` WRITE;
/*!40000 ALTER TABLE `wagtailcore_referenceindex` DISABLE KEYS */;
INSERT INTO `wagtailcore_referenceindex` VALUES (2,'1','1','user','user','b9395e53524359fd88fade4156683cf8',34,34,43),(3,'1','3','page','page','7b29538095fa511792c023c46a06e9b7',34,34,1),(4,'1','1','collection','collection','b40b1263e92957f2a7f89dbce56b887b',2,2,21),(6,'2','4','page','page','7b29538095fa511792c023c46a06e9b7',34,34,1),(7,'2','1','user','user','b9395e53524359fd88fade4156683cf8',34,34,43),(8,'3','3','root_page','root_page','2715dadcb575536493c07859ed193ef2',20,20,1),(9,'3','4','related_page','related_page','a93239a246695fa68d6f0ac9cca1eb20',1,6,1),(11,'4','2','bottomLogo','bottomLogo','f0fbea65543c5d60baf6cdb25937d269',1,7,2),(12,'3','2','user','user','b9395e53524359fd88fade4156683cf8',34,34,43),(13,'3','4','page','page','7b29538095fa511792c023c46a06e9b7',34,34,1),(14,'2','2','collection','collection','b40b1263e92957f2a7f89dbce56b887b',2,2,21),(15,'5','2','body.shortImage','body.e4837dd3-b119-4bba-a150-d6924631eadf','53b8eb4afd72577abd378b4865c6cd0b',1,47,2),(16,'4','1','user','user','b9395e53524359fd88fade4156683cf8',34,34,43),(17,'4','5','page','page','7b29538095fa511792c023c46a06e9b7',34,34,1);
/*!40000 ALTER TABLE `wagtailcore_referenceindex` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wagtailcore_revision`
--

DROP TABLE IF EXISTS `wagtailcore_revision`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wagtailcore_revision` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `submitted_for_moderation` tinyint(1) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `content` json NOT NULL,
  `approved_go_live_at` datetime(6) DEFAULT NULL,
  `object_id` varchar(255) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `content_type_id` int(11) NOT NULL,
  `base_content_type_id` int(11) NOT NULL,
  `object_str` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `wagtailcore_pagerevision_user_id_2409d2f4_fk_auth_user_id` (`user_id`),
  KEY `wagtailcore_pagerevision_submitted_for_moderation_c682e44c` (`submitted_for_moderation`),
  KEY `wagtailcore_pagerevision_created_at_66954e3b` (`created_at`),
  KEY `wagtailcore_pagerevision_approved_go_live_at_e56afc67` (`approved_go_live_at`),
  KEY `content_object_idx` (`content_type_id`,`object_id`),
  KEY `base_content_object_idx` (`base_content_type_id`,`object_id`),
  CONSTRAINT `wagtailcore_pagerevision_user_id_2409d2f4_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `wagtailcore_revision_base_content_type_id_5b4ef7bd_fk_django_co` FOREIGN KEY (`base_content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `wagtailcore_revision_content_type_id_c8cb69c0_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wagtailcore_revision`
--

LOCK TABLES `wagtailcore_revision` WRITE;
/*!40000 ALTER TABLE `wagtailcore_revision` DISABLE KEYS */;
INSERT INTO `wagtailcore_revision` VALUES (1,0,'2022-12-02 15:43:12.512406','{\"pk\": 3, \"live\": true, \"path\": \"00010001\", \"slug\": \"homepage\", \"depth\": 2, \"owner\": 1, \"title\": \"HomePage\", \"locale\": 1, \"locked\": false, \"expired\": false, \"alias_of\": null, \"numchild\": 0, \"url_path\": \"/homepage/\", \"expire_at\": null, \"locked_at\": null, \"locked_by\": null, \"seo_title\": \"\", \"go_live_at\": null, \"draft_title\": \"HomePage\", \"content_type\": 6, \"related_page\": null, \"live_revision\": null, \"show_in_menus\": false, \"latest_revision\": null, \"translation_key\": \"4dbe7091-4997-4e01-bf64-8e2379a18528\", \"last_published_at\": null, \"first_published_at\": null, \"search_description\": \"\", \"wagtail_admin_comments\": [], \"has_unpublished_changes\": false, \"latest_revision_created_at\": null}',NULL,'3',1,6,1,'HomePage'),(2,0,'2022-12-02 15:46:09.411213','{\"pk\": 4, \"r1\": \"<p data-block-key=\\\"7wq1u\\\"> В чем проблема КРТ, законодательство по нему и актуальную информацию о нем</p>\", \"r2\": \"<p data-block-key=\\\"bjarq\\\"> Как собрать соседей используя помогалочку и карту чатов</p>\", \"r3\": \"<p data-block-key=\\\"5wmtn\\\"> Как поучаствовать в общегородских мероприятиях движения</p>\", \"r4\": \"<p data-block-key=\\\"glnve\\\"> Как найти единомышленников в своем квартале, МО и получить от них помощь </p><p data-block-key=\\\"bvvn8\\\"> <a href=\\\"https://kpt.mo-spb.ru/\\\">(см. карту чатов)</a> </p>\", \"r5\": \"<p data-block-key=\\\"4xbof\\\"> Как внести свою лепту в стратегию и тактику борьбы в чате-дискуссионном клубе</p>\", \"r6\": \"<p data-block-key=\\\"nmixu\\\"> Как организовать подготовку и проведение ОСС по отказу от КРТ </p>\", \"live\": true, \"path\": \"000100010001\", \"slug\": \"maket-glavnoj-stranicy\", \"depth\": 3, \"owner\": 1, \"title\": \"Макет главной страницы\", \"locale\": 1, \"locked\": false, \"expired\": false, \"alias_of\": null, \"numchild\": 0, \"url_path\": \"/homepage/maket-glavnoj-stranicy/\", \"expire_at\": null, \"locked_at\": null, \"locked_by\": null, \"seo_title\": \"\", \"bottomLogo\": 1, \"go_live_at\": null, \"draft_title\": \"Макет главной страницы\", \"content_type\": 7, \"live_revision\": null, \"show_in_menus\": false, \"latest_revision\": null, \"translation_key\": \"58a31905-fbd6-4e69-ab61-ec32cfd2e259\", \"last_published_at\": null, \"first_published_at\": null, \"search_description\": \"\", \"wagtail_admin_comments\": [], \"has_unpublished_changes\": false, \"latest_revision_created_at\": null}',NULL,'4',1,7,1,'Макет главной страницы'),(3,0,'2022-12-02 15:47:11.148116','{\"pk\": 3, \"live\": true, \"path\": \"00010001\", \"slug\": \"homepage\", \"depth\": 2, \"owner\": 1, \"title\": \"HomePage\", \"locale\": 1, \"locked\": false, \"expired\": false, \"alias_of\": null, \"numchild\": 1, \"url_path\": \"/homepage/\", \"expire_at\": null, \"locked_at\": null, \"locked_by\": null, \"seo_title\": \"\", \"go_live_at\": null, \"draft_title\": \"HomePage\", \"content_type\": 6, \"related_page\": 4, \"live_revision\": 1, \"show_in_menus\": false, \"latest_revision\": 1, \"translation_key\": \"4dbe7091-4997-4e01-bf64-8e2379a18528\", \"last_published_at\": \"2022-12-02T15:43:12.540Z\", \"first_published_at\": \"2022-12-02T15:43:12.540Z\", \"search_description\": \"\", \"wagtail_admin_comments\": [], \"has_unpublished_changes\": false, \"latest_revision_created_at\": \"2022-12-02T15:43:12.512Z\"}',NULL,'3',1,6,1,'HomePage'),(4,0,'2022-12-02 16:05:34.490513','{\"pk\": 4, \"r1\": \"<p data-block-key=\\\"7wq1u\\\">В чем проблема КРТ, законодательство по нему и актуальную информацию о нем</p>\", \"r2\": \"<p data-block-key=\\\"bjarq\\\">Как собрать соседей используя помогалочку и карту чатов</p>\", \"r3\": \"<p data-block-key=\\\"5wmtn\\\">Как поучаствовать в общегородских мероприятиях движения</p>\", \"r4\": \"<p data-block-key=\\\"glnve\\\">Как найти единомышленников в своем квартале, МО и получить от них помощь</p><p data-block-key=\\\"bvvn8\\\"><a href=\\\"https://kpt.mo-spb.ru/\\\">(см. карту чатов)</a></p>\", \"r5\": \"<p data-block-key=\\\"4xbof\\\">Как внести свою лепту в стратегию и тактику борьбы в чате-дискуссионном клубе</p>\", \"r6\": \"<p data-block-key=\\\"nmixu\\\">Как организовать подготовку и проведение ОСС по отказу от КРТ</p>\", \"live\": true, \"path\": \"000100010001\", \"slug\": \"maket-glavnoj-stranicy\", \"depth\": 3, \"owner\": 1, \"title\": \"Макет главной страницы\", \"locale\": 1, \"locked\": false, \"expired\": false, \"alias_of\": null, \"numchild\": 0, \"url_path\": \"/homepage/maket-glavnoj-stranicy/\", \"expire_at\": null, \"locked_at\": null, \"locked_by\": null, \"seo_title\": \"\", \"bottomLogo\": 2, \"go_live_at\": null, \"draft_title\": \"Макет главной страницы\", \"content_type\": 7, \"live_revision\": 2, \"show_in_menus\": false, \"latest_revision\": 2, \"translation_key\": \"58a31905-fbd6-4e69-ab61-ec32cfd2e259\", \"last_published_at\": \"2022-12-02T15:46:09.443Z\", \"first_published_at\": \"2022-12-02T15:46:09.443Z\", \"search_description\": \"\", \"wagtail_admin_comments\": [], \"has_unpublished_changes\": false, \"latest_revision_created_at\": \"2022-12-02T15:46:09.411Z\"}',NULL,'4',1,7,1,'Макет главной страницы'),(5,0,'2022-12-02 16:11:22.192550','{\"pk\": 4, \"r1\": \"<p data-block-key=\\\"7wq1u\\\">В чем проблема КРТ, законодательство по нему и актуальную информацию о нем</p>\", \"r2\": \"<p data-block-key=\\\"bjarq\\\">Как собрать соседей используя помогалочку и карту чатов</p>\", \"r3\": \"<p data-block-key=\\\"5wmtn\\\">Как поучаствовать в общегородских мероприятиях движения</p>\", \"r4\": \"<p data-block-key=\\\"glnve\\\">Как найти единомышленников в своем квартале, МО и получить от них помощь</p><p data-block-key=\\\"bvvn8\\\"><a href=\\\"https://kpt.mo-spb.ru/\\\">(см. карту чатов)</a></p>\", \"r5\": \"<p data-block-key=\\\"4xbof\\\">Как внести свою лепту в стратегию и тактику борьбы в чате-дискуссионном клубе</p>\", \"r6\": \"<p data-block-key=\\\"nmixu\\\">Как организовать подготовку и проведение ОСС по отказу от КРТ</p><p data-block-key=\\\"97l9e\\\"> <a href=\\\"http://localhost:8000/\\\">(подготовить реестр собственников, узнать свою УК, организовать собрание. Памятки и шаблоны документов прилагаются)</a> </p>\", \"live\": true, \"path\": \"000100010001\", \"slug\": \"maket-glavnoj-stranicy\", \"depth\": 3, \"owner\": 1, \"title\": \"Макет главной страницы\", \"locale\": 1, \"locked\": false, \"expired\": false, \"alias_of\": null, \"numchild\": 0, \"url_path\": \"/homepage/maket-glavnoj-stranicy/\", \"expire_at\": null, \"locked_at\": null, \"locked_by\": null, \"seo_title\": \"\", \"bottomLogo\": 2, \"go_live_at\": null, \"draft_title\": \"Макет главной страницы\", \"content_type\": 7, \"live_revision\": 4, \"show_in_menus\": false, \"latest_revision\": 4, \"translation_key\": \"58a31905-fbd6-4e69-ab61-ec32cfd2e259\", \"last_published_at\": \"2022-12-02T16:05:34.532Z\", \"first_published_at\": \"2022-12-02T15:46:09.443Z\", \"search_description\": \"\", \"wagtail_admin_comments\": [], \"has_unpublished_changes\": false, \"latest_revision_created_at\": \"2022-12-02T16:05:34.490Z\"}',NULL,'4',1,7,1,'Макет главной страницы'),(6,0,'2022-12-02 16:19:54.705501','{\"pk\": 4, \"r1\": \"<p data-block-key=\\\"7wq1u\\\">В чем проблема КРТ, законодательство по нему и актуальную информацию о нем</p>\", \"r2\": \"<p data-block-key=\\\"bjarq\\\">Как собрать соседей используя помогалочку и карту чатов</p>\", \"r3\": \"<p data-block-key=\\\"5wmtn\\\">Как поучаствовать в общегородских мероприятиях движения</p>\", \"r4\": \"<p data-block-key=\\\"glnve\\\">Как найти единомышленников в своем квартале, МО и получить от них помощь</p><p data-block-key=\\\"bvvn8\\\"><a href=\\\"https://kpt.mo-spb.ru/\\\">(см. карту чатов)</a></p>\", \"r5\": \"<p data-block-key=\\\"4xbof\\\">Как внести свою лепту в стратегию и тактику борьбы в чате-дискуссионном клубе</p>\", \"r6\": \"<p data-block-key=\\\"nmixu\\\">Как организовать подготовку и проведение ОСС по отказу от КРТ</p><p data-block-key=\\\"97l9e\\\"><a href=\\\"http://localhost:8000/\\\">(подготовить реестр собственников, узнать свою УК, организовать собрание. Памятки и шаблоны документов прилагаются)</a></p>\", \"live\": true, \"path\": \"000100010001\", \"slug\": \"maket-glavnoj-stranicy123\", \"depth\": 3, \"owner\": 1, \"title\": \"Макет главной страницы\", \"locale\": 1, \"locked\": false, \"expired\": false, \"alias_of\": null, \"numchild\": 0, \"url_path\": \"/homepage/maket-glavnoj-stranicy/\", \"expire_at\": null, \"locked_at\": null, \"locked_by\": null, \"seo_title\": \"\", \"bottomLogo\": 2, \"go_live_at\": null, \"draft_title\": \"Макет главной страницы\", \"content_type\": 7, \"live_revision\": 5, \"show_in_menus\": false, \"latest_revision\": 5, \"translation_key\": \"58a31905-fbd6-4e69-ab61-ec32cfd2e259\", \"last_published_at\": \"2022-12-02T16:11:22.247Z\", \"first_published_at\": \"2022-12-02T15:46:09.443Z\", \"search_description\": \"\", \"wagtail_admin_comments\": [], \"has_unpublished_changes\": false, \"latest_revision_created_at\": \"2022-12-02T16:11:22.192Z\"}',NULL,'4',1,7,1,'Макет главной страницы'),(7,0,'2022-12-07 03:46:38.085262','{\"pk\": 4, \"r1\": \"<p data-block-key=\\\"7wq1u\\\">В чем проблема КРТ, законодательство по нему и актуальную информацию о нем</p>\", \"r2\": \"<p data-block-key=\\\"bjarq\\\">Как собрать соседей используя помогалочку и карту чатов</p>\", \"r3\": \"<p data-block-key=\\\"5wmtn\\\">Как поучаствовать в общегородских мероприятиях движения</p>\", \"r4\": \"<p data-block-key=\\\"glnve\\\">Как найти единомышленников в своем квартале, МО и получить от них помощь</p><p data-block-key=\\\"bvvn8\\\"></p>\", \"r5\": \"<p data-block-key=\\\"4xbof\\\">Как внести свою лепту в стратегию и тактику борьбы в чате-дискуссионном клубе</p>\", \"r6\": \"<p data-block-key=\\\"nmixu\\\">Как организовать подготовку и проведение ОСС по отказу от КРТ</p><p data-block-key=\\\"97l9e\\\"></p>\", \"live\": true, \"path\": \"000100010001\", \"slug\": \"maket-glavnoj-stranicy123\", \"depth\": 3, \"owner\": 1, \"title\": \"Макет главной страницы\", \"locale\": 1, \"locked\": false, \"expired\": false, \"alias_of\": null, \"numchild\": 0, \"url_path\": \"/homepage/maket-glavnoj-stranicy123/\", \"expire_at\": null, \"locked_at\": null, \"locked_by\": null, \"seo_title\": \"\", \"bottomLogo\": 2, \"go_live_at\": null, \"draft_title\": \"Макет главной страницы\", \"content_type\": 7, \"live_revision\": 6, \"show_in_menus\": false, \"latest_revision\": 6, \"translation_key\": \"58a31905-fbd6-4e69-ab61-ec32cfd2e259\", \"last_published_at\": \"2022-12-02T16:19:54.756Z\", \"first_published_at\": \"2022-12-02T15:46:09.443Z\", \"search_description\": \"\", \"wagtail_admin_comments\": [], \"has_unpublished_changes\": false, \"latest_revision_created_at\": \"2022-12-02T16:19:54.705Z\"}',NULL,'4',2,7,1,'Макет главной страницы'),(8,0,'2022-12-07 03:47:47.615138','{\"pk\": 4, \"r1\": \"<p data-block-key=\\\"7wq1u\\\">В чем проблема КРТ, законодательство по нему и актуальную информацию о нем</p>\", \"r2\": \"<p data-block-key=\\\"bjarq\\\">Как собрать соседей используя помогалочку и карту чатов</p>\", \"r3\": \"<p data-block-key=\\\"5wmtn\\\">Как поучаствовать в общегородских мероприятиях движения</p>\", \"r4\": \"<p data-block-key=\\\"glnve\\\">Как найти единомышленников в своем квартале, МО и получить от них помощь</p><p data-block-key=\\\"bvvn8\\\"></p>\", \"r5\": \"<p data-block-key=\\\"4xbof\\\">Как внести свою лепту в стратегию и тактику борьбы в чате-дискуссионном клубе</p>\", \"r6\": \"<p data-block-key=\\\"nmixu\\\">Как организовать подготовку и проведение ОСС по отказу от КРТ</p><p data-block-key=\\\"97l9e\\\"></p>\", \"live\": true, \"path\": \"000100010001\", \"slug\": \"maket-glavnoj-stranicy123\", \"depth\": 3, \"owner\": 1, \"title\": \"Макет главной страницы\", \"locale\": 1, \"locked\": false, \"expired\": false, \"alias_of\": null, \"numchild\": 0, \"url_path\": \"/homepage/maket-glavnoj-stranicy123/\", \"expire_at\": null, \"locked_at\": null, \"locked_by\": null, \"seo_title\": \"\", \"bottomLogo\": 2, \"go_live_at\": null, \"draft_title\": \"Макет главной страницы\", \"content_type\": 7, \"live_revision\": 6, \"show_in_menus\": false, \"latest_revision\": 7, \"translation_key\": \"58a31905-fbd6-4e69-ab61-ec32cfd2e259\", \"last_published_at\": \"2022-12-02T16:19:54.756Z\", \"first_published_at\": \"2022-12-02T15:46:09.443Z\", \"search_description\": \"\", \"wagtail_admin_comments\": [], \"has_unpublished_changes\": true, \"latest_revision_created_at\": \"2022-12-07T03:46:38.085Z\"}',NULL,'4',2,7,1,'Макет главной страницы'),(9,0,'2022-12-07 03:57:47.026266','{\"pk\": 4, \"r1\": \"<p data-block-key=\\\"7wq1u\\\">В чем проблема КРТ, законодательство по нему и актуальную информацию о нем</p>\", \"r2\": \"<p data-block-key=\\\"bjarq\\\">Как собрать соседей используя помогалочку и карту чатов</p>\", \"r3\": \"<p data-block-key=\\\"5wmtn\\\">Как поучаствовать в общегородских мероприятиях движения</p>\", \"r4\": \"<p data-block-key=\\\"glnve\\\">Как найти единомышленников в своем квартале, МО и получить от них помощь</p>\", \"r5\": \"<p data-block-key=\\\"4xbof\\\">Как внести свою лепту в стратегию и тактику борьбы в чате-дискуссионном клубе</p>\", \"r6\": \"<p data-block-key=\\\"nmixu\\\">Как организовать подготовку и проведение ОСС по отказу от КРТ</p>\", \"live\": true, \"path\": \"000100010001\", \"slug\": \"maket-glavnoj-stranicy123\", \"depth\": 3, \"owner\": 1, \"title\": \"Макет главной страницы\", \"locale\": 1, \"locked\": false, \"expired\": false, \"alias_of\": null, \"numchild\": 0, \"url_path\": \"/homepage/maket-glavnoj-stranicy123/\", \"expire_at\": null, \"locked_at\": null, \"locked_by\": null, \"seo_title\": \"\", \"bottomLogo\": 2, \"go_live_at\": null, \"draft_title\": \"Макет главной страницы\", \"content_type\": 7, \"live_revision\": 8, \"show_in_menus\": false, \"latest_revision\": 8, \"translation_key\": \"58a31905-fbd6-4e69-ab61-ec32cfd2e259\", \"last_published_at\": \"2022-12-07T03:47:47.647Z\", \"first_published_at\": \"2022-12-02T15:46:09.443Z\", \"search_description\": \"\", \"wagtail_admin_comments\": [], \"has_unpublished_changes\": false, \"latest_revision_created_at\": \"2022-12-07T03:47:47.615Z\"}',NULL,'4',1,7,1,'Макет главной страницы'),(10,0,'2022-12-10 19:11:49.079816','{\"pk\": 4, \"r1\": \"<p data-block-key=\\\"7wq1u\\\">В чем проблема КРТ, законодательство по нему и актуальную информацию о нем</p>\", \"r2\": \"<p data-block-key=\\\"bjarq\\\">Как собрать соседей, используя помогалочку и карту чатов</p>\", \"r3\": \"<p data-block-key=\\\"5wmtn\\\">Как поучаствовать в общегородских мероприятиях движения</p>\", \"r4\": \"<p data-block-key=\\\"glnve\\\">Как найти единомышленников в своем квартале, МО и получить от них помощь</p>\", \"r5\": \"<p data-block-key=\\\"4xbof\\\">Как внести свою лепту в стратегию и тактику борьбы в чате-дискуссионном клубе</p>\", \"r6\": \"<p data-block-key=\\\"nmixu\\\">Как организовать подготовку и проведение ОСС по отказу от КРТ</p>\", \"live\": true, \"path\": \"000100010001\", \"slug\": \"maket-glavnoj-stranicy123\", \"depth\": 3, \"owner\": 1, \"title\": \"Макет главной страницы\", \"locale\": 1, \"locked\": false, \"expired\": false, \"alias_of\": null, \"numchild\": 0, \"url_path\": \"/homepage/maket-glavnoj-stranicy123/\", \"expire_at\": null, \"locked_at\": null, \"locked_by\": null, \"seo_title\": \"\", \"bottomLogo\": 2, \"go_live_at\": null, \"draft_title\": \"Макет главной страницы\", \"content_type\": 7, \"live_revision\": 9, \"show_in_menus\": false, \"latest_revision\": 9, \"translation_key\": \"58a31905-fbd6-4e69-ab61-ec32cfd2e259\", \"last_published_at\": \"2022-12-07T03:57:47.062Z\", \"first_published_at\": \"2022-12-02T15:46:09.443Z\", \"search_description\": \"\", \"wagtail_admin_comments\": [], \"has_unpublished_changes\": false, \"latest_revision_created_at\": \"2022-12-07T03:57:47.026Z\"}',NULL,'4',2,7,1,'Макет главной страницы'),(11,0,'2022-12-10 19:11:54.307706','{\"pk\": 4, \"r1\": \"<p data-block-key=\\\"7wq1u\\\">В чем проблема КРТ, законодательство по нему и актуальную информацию о нем</p>\", \"r2\": \"<p data-block-key=\\\"bjarq\\\">Как собрать соседей, используя помогалочку и карту чатов</p>\", \"r3\": \"<p data-block-key=\\\"5wmtn\\\">Как поучаствовать в общегородских мероприятиях движения</p>\", \"r4\": \"<p data-block-key=\\\"glnve\\\">Как найти единомышленников в своем квартале, МО и получить от них помощь</p>\", \"r5\": \"<p data-block-key=\\\"4xbof\\\">Как внести свою лепту в стратегию и тактику борьбы в чате-дискуссионном клубе</p>\", \"r6\": \"<p data-block-key=\\\"nmixu\\\">Как организовать подготовку и проведение ОСС по отказу от КРТ</p>\", \"live\": true, \"path\": \"000100010001\", \"slug\": \"maket-glavnoj-stranicy123\", \"depth\": 3, \"owner\": 1, \"title\": \"Макет главной страницы\", \"locale\": 1, \"locked\": false, \"expired\": false, \"alias_of\": null, \"numchild\": 0, \"url_path\": \"/homepage/maket-glavnoj-stranicy123/\", \"expire_at\": null, \"locked_at\": null, \"locked_by\": null, \"seo_title\": \"\", \"bottomLogo\": 2, \"go_live_at\": null, \"draft_title\": \"Макет главной страницы\", \"content_type\": 7, \"live_revision\": 9, \"show_in_menus\": false, \"latest_revision\": 10, \"translation_key\": \"58a31905-fbd6-4e69-ab61-ec32cfd2e259\", \"last_published_at\": \"2022-12-07T03:57:47.062Z\", \"first_published_at\": \"2022-12-02T15:46:09.443Z\", \"search_description\": \"\", \"wagtail_admin_comments\": [], \"has_unpublished_changes\": true, \"latest_revision_created_at\": \"2022-12-10T19:11:49.079Z\"}',NULL,'4',2,7,1,'Макет главной страницы'),(12,0,'2022-12-10 19:15:28.384253','{\"pk\": 4, \"r1\": \"<p data-block-key=\\\"7wq1u\\\">В чем проблема КРТ, законодательство по нему и актуальную информацию о нем</p>\", \"r2\": \"<p data-block-key=\\\"bjarq\\\">Как собрать соседей, используя помогалочку и карту чатов</p><p data-block-key=\\\"375aj\\\"></p>\", \"r3\": \"<p data-block-key=\\\"5wmtn\\\">Как поучаствовать в общегородских мероприятиях движения</p>\", \"r4\": \"<p data-block-key=\\\"glnve\\\">Как найти единомышленников в своем квартале, МО и получить от них помощь</p>\", \"r5\": \"<p data-block-key=\\\"4xbof\\\">Как внести свою лепту в стратегию и тактику борьбы в чате-дискуссионном клубе</p>\", \"r6\": \"<p data-block-key=\\\"nmixu\\\">Как организовать подготовку и проведение ОСС по отказу от КРТ</p>\", \"live\": true, \"path\": \"000100010001\", \"slug\": \"maket-glavnoj-stranicy123\", \"depth\": 3, \"owner\": 1, \"title\": \"Макет главной страницы\", \"locale\": 1, \"locked\": false, \"expired\": false, \"alias_of\": null, \"numchild\": 0, \"url_path\": \"/homepage/maket-glavnoj-stranicy123/\", \"expire_at\": null, \"locked_at\": null, \"locked_by\": null, \"seo_title\": \"\", \"bottomLogo\": 2, \"go_live_at\": null, \"draft_title\": \"Макет главной страницы\", \"content_type\": 7, \"live_revision\": 11, \"show_in_menus\": false, \"latest_revision\": 11, \"translation_key\": \"58a31905-fbd6-4e69-ab61-ec32cfd2e259\", \"last_published_at\": \"2022-12-10T19:11:54.339Z\", \"first_published_at\": \"2022-12-02T15:46:09.443Z\", \"search_description\": \"\", \"wagtail_admin_comments\": [], \"has_unpublished_changes\": false, \"latest_revision_created_at\": \"2022-12-10T19:11:54.307Z\"}',NULL,'4',2,7,1,'Макет главной страницы'),(13,0,'2022-12-10 19:15:32.387516','{\"pk\": 4, \"r1\": \"<p data-block-key=\\\"7wq1u\\\">В чем проблема КРТ, законодательство по нему и актуальную информацию о нем</p>\", \"r2\": \"<p data-block-key=\\\"bjarq\\\">Как собрать соседей, используя помогалочку и карту чатов</p><p data-block-key=\\\"375aj\\\"></p>\", \"r3\": \"<p data-block-key=\\\"5wmtn\\\">Как поучаствовать в общегородских мероприятиях движения</p>\", \"r4\": \"<p data-block-key=\\\"glnve\\\">Как найти единомышленников в своем квартале, МО и получить от них помощь</p>\", \"r5\": \"<p data-block-key=\\\"4xbof\\\">Как внести свою лепту в стратегию и тактику борьбы в чате-дискуссионном клубе</p>\", \"r6\": \"<p data-block-key=\\\"nmixu\\\">Как организовать подготовку и проведение ОСС по отказу от КРТ</p>\", \"live\": true, \"path\": \"000100010001\", \"slug\": \"maket-glavnoj-stranicy123\", \"depth\": 3, \"owner\": 1, \"title\": \"Макет главной страницы\", \"locale\": 1, \"locked\": false, \"expired\": false, \"alias_of\": null, \"numchild\": 0, \"url_path\": \"/homepage/maket-glavnoj-stranicy123/\", \"expire_at\": null, \"locked_at\": null, \"locked_by\": null, \"seo_title\": \"\", \"bottomLogo\": 2, \"go_live_at\": null, \"draft_title\": \"Макет главной страницы\", \"content_type\": 7, \"live_revision\": 11, \"show_in_menus\": false, \"latest_revision\": 12, \"translation_key\": \"58a31905-fbd6-4e69-ab61-ec32cfd2e259\", \"last_published_at\": \"2022-12-10T19:11:54.339Z\", \"first_published_at\": \"2022-12-02T15:46:09.443Z\", \"search_description\": \"\", \"wagtail_admin_comments\": [], \"has_unpublished_changes\": true, \"latest_revision_created_at\": \"2022-12-10T19:15:28.384Z\"}',NULL,'4',2,7,1,'Макет главной страницы'),(14,0,'2022-12-10 19:16:04.523303','{\"pk\": 4, \"r1\": \"<p data-block-key=\\\"7wq1u\\\">В чем проблема КРТ, законодательство по нему и актуальную информацию о нем</p>\", \"r2\": \"<p data-block-key=\\\"bjarq\\\">Как собрать соседей, используя помогалочку и карту чатов</p><p data-block-key=\\\"375aj\\\"></p>\", \"r3\": \"<p data-block-key=\\\"5wmtn\\\"></p><p data-block-key=\\\"9qjru\\\">Как поучаствовать в общегородских мероприятиях движения</p>\", \"r4\": \"<p data-block-key=\\\"glnve\\\">Как найти единомышленников в своем квартале, МО и получить от них помощь</p>\", \"r5\": \"<p data-block-key=\\\"4xbof\\\">Как внести свою лепту в стратегию и тактику борьбы в чате-дискуссионном клубе</p>\", \"r6\": \"<p data-block-key=\\\"nmixu\\\">Как организовать подготовку и проведение ОСС по отказу от КРТ</p>\", \"live\": true, \"path\": \"000100010001\", \"slug\": \"maket-glavnoj-stranicy123\", \"depth\": 3, \"owner\": 1, \"title\": \"Макет главной страницы\", \"locale\": 1, \"locked\": false, \"expired\": false, \"alias_of\": null, \"numchild\": 0, \"url_path\": \"/homepage/maket-glavnoj-stranicy123/\", \"expire_at\": null, \"locked_at\": null, \"locked_by\": null, \"seo_title\": \"\", \"bottomLogo\": 2, \"go_live_at\": null, \"draft_title\": \"Макет главной страницы\", \"content_type\": 7, \"live_revision\": 13, \"show_in_menus\": false, \"latest_revision\": 13, \"translation_key\": \"58a31905-fbd6-4e69-ab61-ec32cfd2e259\", \"last_published_at\": \"2022-12-10T19:15:32.439Z\", \"first_published_at\": \"2022-12-02T15:46:09.443Z\", \"search_description\": \"\", \"wagtail_admin_comments\": [], \"has_unpublished_changes\": false, \"latest_revision_created_at\": \"2022-12-10T19:15:32.387Z\"}',NULL,'4',2,7,1,'Макет главной страницы'),(15,0,'2022-12-10 19:16:08.388487','{\"pk\": 4, \"r1\": \"<p data-block-key=\\\"7wq1u\\\">В чем проблема КРТ, законодательство по нему и актуальную информацию о нем</p>\", \"r2\": \"<p data-block-key=\\\"bjarq\\\">Как собрать соседей, используя помогалочку и карту чатов</p><p data-block-key=\\\"375aj\\\"></p>\", \"r3\": \"<p data-block-key=\\\"5wmtn\\\"></p><p data-block-key=\\\"9qjru\\\">Как поучаствовать в общегородских мероприятиях движения</p>\", \"r4\": \"<p data-block-key=\\\"glnve\\\">Как найти единомышленников в своем квартале, МО и получить от них помощь</p>\", \"r5\": \"<p data-block-key=\\\"4xbof\\\">Как внести свою лепту в стратегию и тактику борьбы в чате-дискуссионном клубе</p>\", \"r6\": \"<p data-block-key=\\\"nmixu\\\">Как организовать подготовку и проведение ОСС по отказу от КРТ</p>\", \"live\": true, \"path\": \"000100010001\", \"slug\": \"maket-glavnoj-stranicy123\", \"depth\": 3, \"owner\": 1, \"title\": \"Макет главной страницы\", \"locale\": 1, \"locked\": false, \"expired\": false, \"alias_of\": null, \"numchild\": 0, \"url_path\": \"/homepage/maket-glavnoj-stranicy123/\", \"expire_at\": null, \"locked_at\": null, \"locked_by\": null, \"seo_title\": \"\", \"bottomLogo\": 2, \"go_live_at\": null, \"draft_title\": \"Макет главной страницы\", \"content_type\": 7, \"live_revision\": 13, \"show_in_menus\": false, \"latest_revision\": 14, \"translation_key\": \"58a31905-fbd6-4e69-ab61-ec32cfd2e259\", \"last_published_at\": \"2022-12-10T19:15:32.439Z\", \"first_published_at\": \"2022-12-02T15:46:09.443Z\", \"search_description\": \"\", \"wagtail_admin_comments\": [], \"has_unpublished_changes\": true, \"latest_revision_created_at\": \"2022-12-10T19:16:04.523Z\"}',NULL,'4',2,7,1,'Макет главной страницы'),(16,0,'2022-12-10 19:20:36.327076','{\"pk\": 4, \"r1\": \"<p data-block-key=\\\"7wq1u\\\">В чем проблема КРТ, законодательство по нему и актуальную информацию о нем</p>\", \"r2\": \"<p data-block-key=\\\"bjarq\\\">Как собрать соседей, используя помогалочку и карту чатов</p>\", \"r3\": \"<p data-block-key=\\\"5wmtn\\\"> . </p><p data-block-key=\\\"9qjru\\\">Как поучаствовать в общегородских мероприятиях движения</p>\", \"r4\": \"<p data-block-key=\\\"glnve\\\">Как найти единомышленников в своем квартале, МО и получить от них помощь</p>\", \"r5\": \"<p data-block-key=\\\"4xbof\\\">Как внести свою лепту в стратегию и тактику борьбы в чате-дискуссионном клубе</p>\", \"r6\": \"<p data-block-key=\\\"nmixu\\\">Как организовать подготовку и проведение ОСС по отказу от КРТ</p>\", \"live\": true, \"path\": \"000100010001\", \"slug\": \"maket-glavnoj-stranicy123\", \"depth\": 3, \"owner\": 1, \"title\": \"Макет главной страницы\", \"locale\": 1, \"locked\": false, \"expired\": false, \"alias_of\": null, \"numchild\": 0, \"url_path\": \"/homepage/maket-glavnoj-stranicy123/\", \"expire_at\": null, \"locked_at\": null, \"locked_by\": null, \"seo_title\": \"\", \"bottomLogo\": 2, \"go_live_at\": null, \"draft_title\": \"Макет главной страницы\", \"content_type\": 7, \"live_revision\": 15, \"show_in_menus\": false, \"latest_revision\": 15, \"translation_key\": \"58a31905-fbd6-4e69-ab61-ec32cfd2e259\", \"last_published_at\": \"2022-12-10T19:16:08.419Z\", \"first_published_at\": \"2022-12-02T15:46:09.443Z\", \"search_description\": \"\", \"wagtail_admin_comments\": [], \"has_unpublished_changes\": false, \"latest_revision_created_at\": \"2022-12-10T19:16:08.388Z\"}',NULL,'4',2,7,1,'Макет главной страницы'),(17,0,'2022-12-10 19:20:40.107348','{\"pk\": 4, \"r1\": \"<p data-block-key=\\\"7wq1u\\\">В чем проблема КРТ, законодательство по нему и актуальную информацию о нем</p>\", \"r2\": \"<p data-block-key=\\\"bjarq\\\">Как собрать соседей, используя помогалочку и карту чатов</p>\", \"r3\": \"<p data-block-key=\\\"5wmtn\\\">.</p><p data-block-key=\\\"9qjru\\\">Как поучаствовать в общегородских мероприятиях движения</p>\", \"r4\": \"<p data-block-key=\\\"glnve\\\">Как найти единомышленников в своем квартале, МО и получить от них помощь</p>\", \"r5\": \"<p data-block-key=\\\"4xbof\\\">Как внести свою лепту в стратегию и тактику борьбы в чате-дискуссионном клубе</p>\", \"r6\": \"<p data-block-key=\\\"nmixu\\\">Как организовать подготовку и проведение ОСС по отказу от КРТ</p>\", \"live\": true, \"path\": \"000100010001\", \"slug\": \"maket-glavnoj-stranicy123\", \"depth\": 3, \"owner\": 1, \"title\": \"Макет главной страницы\", \"locale\": 1, \"locked\": false, \"expired\": false, \"alias_of\": null, \"numchild\": 0, \"url_path\": \"/homepage/maket-glavnoj-stranicy123/\", \"expire_at\": null, \"locked_at\": null, \"locked_by\": null, \"seo_title\": \"\", \"bottomLogo\": 2, \"go_live_at\": null, \"draft_title\": \"Макет главной страницы\", \"content_type\": 7, \"live_revision\": 15, \"show_in_menus\": false, \"latest_revision\": 16, \"translation_key\": \"58a31905-fbd6-4e69-ab61-ec32cfd2e259\", \"last_published_at\": \"2022-12-10T19:16:08.419Z\", \"first_published_at\": \"2022-12-02T15:46:09.443Z\", \"search_description\": \"\", \"wagtail_admin_comments\": [], \"has_unpublished_changes\": true, \"latest_revision_created_at\": \"2022-12-10T19:20:36.327Z\"}',NULL,'4',2,7,1,'Макет главной страницы'),(18,0,'2022-12-11 07:03:19.219251','{\"pk\": 4, \"r1\": \"<p data-block-key=\\\"7wq1u\\\">В чем проблема КРТ, законодательство по нему и актуальную информацию о нем</p>\", \"r2\": \"<p data-block-key=\\\"bjarq\\\">Как собрать соседей, используя помогалочку и карту чатов</p>\", \"r3\": \"<p data-block-key=\\\"5wmtn\\\">Как поучаствовать в общегородских мероприятиях движения</p>\", \"r4\": \"<p data-block-key=\\\"glnve\\\">Как найти единомышленников в своем квартале, МО и получить от них помощь</p>\", \"r5\": \"<p data-block-key=\\\"4xbof\\\">Как внести свою лепту в стратегию и тактику борьбы в чате-дискуссионном клубе</p>\", \"r6\": \"<p data-block-key=\\\"nmixu\\\">Как организовать подготовку и проведение ОСС по отказу от КРТ</p>\", \"live\": true, \"path\": \"000100010001\", \"slug\": \"maket-glavnoj-stranicy123\", \"depth\": 3, \"owner\": 1, \"title\": \"Макет главной страницы\", \"locale\": 1, \"locked\": false, \"expired\": false, \"alias_of\": null, \"numchild\": 0, \"url_path\": \"/homepage/maket-glavnoj-stranicy123/\", \"expire_at\": null, \"locked_at\": null, \"locked_by\": null, \"seo_title\": \"\", \"bottomLogo\": 2, \"go_live_at\": null, \"draft_title\": \"Макет главной страницы\", \"content_type\": 7, \"live_revision\": 17, \"show_in_menus\": false, \"latest_revision\": 17, \"translation_key\": \"58a31905-fbd6-4e69-ab61-ec32cfd2e259\", \"last_published_at\": \"2022-12-10T19:20:40.138Z\", \"first_published_at\": \"2022-12-02T15:46:09.443Z\", \"search_description\": \"\", \"wagtail_admin_comments\": [], \"has_unpublished_changes\": false, \"latest_revision_created_at\": \"2022-12-10T19:20:40.107Z\"}',NULL,'4',1,7,1,'Макет главной страницы'),(19,0,'2022-12-24 17:03:57.468769','{\"pk\": 5, \"body\": \"[{\\\"type\\\": \\\"title\\\", \\\"value\\\": \\\"\\\\u042d\\\\u0442\\\\u043e \\\\u0437\\\\u0430\\\\u0433\\\\u043e\\\\u043b\\\\u043e\\\\u0432\\\\u043e\\\\u043a\\\", \\\"id\\\": \\\"c5b41f96-403c-4233-a045-08717e59dad2\\\"}, {\\\"type\\\": \\\"subTitle\\\", \\\"value\\\": \\\"\\\\u041f\\\\u043e\\\\u0434\\\\u0437\\\\u0430\\\\u0433\\\\u043e\\\\u043b\\\\u043e\\\\u0432\\\\u043e\\\\u043a\\\", \\\"id\\\": \\\"77c09cdf-5130-4282-9b5d-861fcbcf18cf\\\"}, {\\\"type\\\": \\\"text\\\", \\\"value\\\": \\\"<p data-block-key=\\\\\\\"m81ml\\\\\\\">\\\\u041f\\\\u043e\\\\u0441\\\\u043b\\\\u0435 \\\\u044d\\\\u0442\\\\u043e\\\\u0433\\\\u043e \\\\u0437\\\\u0430\\\\u0433\\\\u043e\\\\u043b\\\\u043e\\\\u0432\\\\u043a\\\\u0430 \\\\u043c\\\\u043e\\\\u0436\\\\u0435\\\\u0442 \\\\u0431\\\\u044b\\\\u0442\\\\u044c \\\\u043b\\\\u044e\\\\u0431\\\\u043e\\\\u0439 \\\\u0442\\\\u0435\\\\u043a\\\\u0441\\\\u0442, \\\\u043d\\\\u0430\\\\u043f\\\\u0440\\\\u0438\\\\u043c\\\\u0435\\\\u0440 <b>\\\\u0432\\\\u044b\\\\u0434\\\\u0435\\\\u043b\\\\u0435\\\\u043d\\\\u043d\\\\u043d\\\\u044b\\\\u0439,</b> <a href=\\\\\\\"https://kpt.mo-spb.ru/\\\\\\\">\\\\u0441\\\\u0441\\\\u044b\\\\u043b\\\\u043a\\\\u0430 \\\\u043d\\\\u0430 \\\\u0441\\\\u0430\\\\u0439\\\\u0442</a> \\\\u0438\\\\u043b\\\\u0438 \\\\u0434\\\\u043e\\\\u043a\\\\u0443\\\\u043c\\\\u0435\\\\u043d\\\\u0442,</p>\\\", \\\"id\\\": \\\"791b0a16-fc2d-4c1b-81e2-31cc8cf02b08\\\"}, {\\\"type\\\": \\\"shortImage\\\", \\\"value\\\": 2, \\\"id\\\": \\\"e4837dd3-b119-4bba-a150-d6924631eadf\\\"}, {\\\"type\\\": \\\"text\\\", \\\"value\\\": \\\"<p data-block-key=\\\\\\\"m81ml\\\\\\\">\\\\u041a\\\\u0430\\\\u0440\\\\u0442\\\\u0438\\\\u043d\\\\u043a\\\\u0438, \\\\u0432\\\\u0438\\\\u0434\\\\u0435\\\\u043e, \\\\u0438 \\\\u043e\\\\u043f\\\\u044f\\\\u0442\\\\u044c \\\\u0442\\\\u0435\\\\u0441\\\\u0442\\\\u043a</p>\\\", \\\"id\\\": \\\"51e20f13-4453-48af-8040-4d9ff22b52fc\\\"}]\", \"live\": true, \"path\": \"000100010002\", \"slug\": \"anti-krt-meropriyatiya\", \"depth\": 3, \"owner\": 1, \"title\": \"Анти КРТ мероприятия\", \"locale\": 1, \"locked\": false, \"expired\": false, \"alias_of\": null, \"numchild\": 0, \"url_path\": \"/homepage/anti-krt-meropriyatiya/\", \"expire_at\": null, \"locked_at\": null, \"locked_by\": null, \"seo_title\": \"\", \"go_live_at\": null, \"description\": \"Анти КРТ мероприятия\", \"draft_title\": \"Анти КРТ мероприятия\", \"content_type\": 47, \"live_revision\": null, \"show_in_menus\": false, \"latest_revision\": null, \"translation_key\": \"551e8db0-fbe3-41d4-ac55-e7a6c2198b60\", \"last_published_at\": null, \"first_published_at\": null, \"search_description\": \"\", \"wagtail_admin_comments\": [], \"has_unpublished_changes\": false, \"latest_revision_created_at\": null}',NULL,'5',1,47,1,'Анти КРТ мероприятия'),(20,0,'2022-12-24 17:05:02.673853','{\"pk\": 5, \"body\": \"[{\\\"type\\\": \\\"title\\\", \\\"value\\\": \\\"\\\\u042d\\\\u0442\\\\u043e \\\\u0437\\\\u0430\\\\u0433\\\\u043e\\\\u043b\\\\u043e\\\\u0432\\\\u043e\\\\u043a\\\", \\\"id\\\": \\\"c5b41f96-403c-4233-a045-08717e59dad2\\\"}, {\\\"type\\\": \\\"subTitle\\\", \\\"value\\\": \\\"\\\\u041f\\\\u043e\\\\u0434\\\\u0437\\\\u0430\\\\u0433\\\\u043e\\\\u043b\\\\u043e\\\\u0432\\\\u043e\\\\u043a\\\", \\\"id\\\": \\\"77c09cdf-5130-4282-9b5d-861fcbcf18cf\\\"}, {\\\"type\\\": \\\"text\\\", \\\"value\\\": \\\"<p data-block-key=\\\\\\\"m81ml\\\\\\\">\\\\u041f\\\\u043e\\\\u0441\\\\u043b\\\\u0435 \\\\u044d\\\\u0442\\\\u043e\\\\u0433\\\\u043e \\\\u0437\\\\u0430\\\\u0433\\\\u043e\\\\u043b\\\\u043e\\\\u0432\\\\u043a\\\\u0430 \\\\u043c\\\\u043e\\\\u0436\\\\u0435\\\\u0442 \\\\u0431\\\\u044b\\\\u0442\\\\u044c \\\\u043b\\\\u044e\\\\u0431\\\\u043e\\\\u0439 \\\\u0442\\\\u0435\\\\u043a\\\\u0441\\\\u0442, \\\\u043d\\\\u0430\\\\u043f\\\\u0440\\\\u0438\\\\u043c\\\\u0435\\\\u0440 <b>\\\\u0432\\\\u044b\\\\u0434\\\\u0435\\\\u043b\\\\u0435\\\\u043d\\\\u043d\\\\u043d\\\\u044b\\\\u0439,</b> <a href=\\\\\\\"https://kpt.mo-spb.ru/\\\\\\\">\\\\u0441\\\\u0441\\\\u044b\\\\u043b\\\\u043a\\\\u0430 \\\\u043d\\\\u0430 \\\\u0441\\\\u0430\\\\u0439\\\\u0442</a> \\\\u0438\\\\u043b\\\\u0438 \\\\u0434\\\\u043e\\\\u043a\\\\u0443\\\\u043c\\\\u0435\\\\u043d\\\\u0442,</p>\\\", \\\"id\\\": \\\"791b0a16-fc2d-4c1b-81e2-31cc8cf02b08\\\"}, {\\\"type\\\": \\\"shortImage\\\", \\\"value\\\": 2, \\\"id\\\": \\\"e4837dd3-b119-4bba-a150-d6924631eadf\\\"}, {\\\"type\\\": \\\"text\\\", \\\"value\\\": \\\"<p data-block-key=\\\\\\\"m81ml\\\\\\\">\\\\u041a\\\\u0430\\\\u0440\\\\u0442\\\\u0438\\\\u043d\\\\u043a\\\\u0438, \\\\u0432\\\\u0438\\\\u0434\\\\u0435\\\\u043e, \\\\u0438 \\\\u043e\\\\u043f\\\\u044f\\\\u0442\\\\u044c \\\\u0442\\\\u0435\\\\u0441\\\\u0442\\\\u043a</p>\\\", \\\"id\\\": \\\"51e20f13-4453-48af-8040-4d9ff22b52fc\\\"}]\", \"live\": true, \"path\": \"000100010002\", \"slug\": \"activity\", \"depth\": 3, \"owner\": 1, \"title\": \"Анти КРТ мероприятия\", \"locale\": 1, \"locked\": false, \"expired\": false, \"alias_of\": null, \"numchild\": 0, \"url_path\": \"/homepage/anti-krt-meropriyatiya/\", \"expire_at\": null, \"locked_at\": null, \"locked_by\": null, \"seo_title\": \"\", \"go_live_at\": null, \"description\": \"Анти КРТ мероприятия\", \"draft_title\": \"Анти КРТ мероприятия\", \"content_type\": 47, \"live_revision\": 19, \"show_in_menus\": false, \"latest_revision\": 19, \"translation_key\": \"551e8db0-fbe3-41d4-ac55-e7a6c2198b60\", \"last_published_at\": \"2022-12-24T17:03:57.529Z\", \"first_published_at\": \"2022-12-24T17:03:57.529Z\", \"search_description\": \"\", \"wagtail_admin_comments\": [], \"has_unpublished_changes\": false, \"latest_revision_created_at\": \"2022-12-24T17:03:57.468Z\"}',NULL,'5',1,47,1,'Анти КРТ мероприятия'),(21,0,'2022-12-29 00:02:28.309483','{\"pk\": 4, \"r1\": \"<p data-block-key=\\\"7wq1u\\\">В чем проблема КРТ, законодательство по нему и актуальную информацию о нем</p>\", \"r2\": \"<p data-block-key=\\\"bjarq\\\">Как собрать соседей, используя помогалочку и карту чатов</p>\", \"r3\": \"<p data-block-key=\\\"5wmtn\\\">Как найти единомышленников в своем квартале, МО и получить от них помощь</p>\", \"r4\": \"<p data-block-key=\\\"glnve\\\">Как поучаствовать в общегородских мероприятиях движения</p>\", \"r5\": \"<p data-block-key=\\\"4xbof\\\">Как внести свою лепту в стратегию и тактику борьбы в чате-дискуссионном клубе</p>\", \"r6\": \"<p data-block-key=\\\"nmixu\\\">Как организовать подготовку и проведение ОСС по отказу от КРТ</p>\", \"live\": true, \"path\": \"000100010001\", \"slug\": \"maket-glavnoj-stranicy123\", \"depth\": 3, \"owner\": 1, \"title\": \"Макет главной страницы\", \"locale\": 1, \"locked\": false, \"expired\": false, \"alias_of\": null, \"numchild\": 0, \"url_path\": \"/homepage/maket-glavnoj-stranicy123/\", \"expire_at\": null, \"locked_at\": null, \"locked_by\": null, \"seo_title\": \"\", \"bottomLogo\": 2, \"go_live_at\": null, \"draft_title\": \"Макет главной страницы\", \"content_type\": 7, \"live_revision\": 18, \"show_in_menus\": false, \"latest_revision\": 18, \"translation_key\": \"58a31905-fbd6-4e69-ab61-ec32cfd2e259\", \"last_published_at\": \"2022-12-11T07:03:19.274Z\", \"first_published_at\": \"2022-12-02T15:46:09.443Z\", \"search_description\": \"\", \"wagtail_admin_comments\": [], \"has_unpublished_changes\": false, \"latest_revision_created_at\": \"2022-12-11T07:03:19.219Z\"}',NULL,'4',1,7,1,'Макет главной страницы'),(22,0,'2022-12-29 00:05:08.811574','{\"pk\": 4, \"r1\": \"<p data-block-key=\\\"7wq1u\\\">В чем проблема КРТ, законодательство по нему и актуальную информацию о нем</p>\", \"r2\": \"<p data-block-key=\\\"bjarq\\\">Как собрать соседей, используя помогалочку и карту чатов</p>\", \"r3\": \"<p data-block-key=\\\"5wmtn\\\">Как найти единомышленников в своем квартале, МО и получить от них помощь</p>\", \"r4\": \"<p data-block-key=\\\"glnve\\\">Как поучаствовать в общегородских мероприятиях движения</p>\", \"r5\": \"<p data-block-key=\\\"4xbof\\\">Как внести свою лепту в стратегию и тактику борьбы в чате-дискуссионном клубе</p>\", \"r6\": \"<p data-block-key=\\\"nmixu\\\">Как организовать подготовку и проведение ОСС по отказу от КРТ</p>\", \"live\": true, \"path\": \"000100010001\", \"slug\": \"maket-glavnoj-stranicy123\", \"depth\": 3, \"owner\": 1, \"title\": \"Макет главной страницы\", \"locale\": 1, \"locked\": false, \"expired\": false, \"alias_of\": null, \"numchild\": 0, \"url_path\": \"/homepage/maket-glavnoj-stranicy123/\", \"expire_at\": null, \"locked_at\": null, \"locked_by\": null, \"seo_title\": \"\", \"bottomLogo\": 2, \"go_live_at\": null, \"draft_title\": \"Макет главной страницы\", \"content_type\": 7, \"live_revision\": 21, \"show_in_menus\": false, \"latest_revision\": 21, \"translation_key\": \"58a31905-fbd6-4e69-ab61-ec32cfd2e259\", \"last_published_at\": \"2022-12-29T00:02:28.376Z\", \"first_published_at\": \"2022-12-02T15:46:09.443Z\", \"search_description\": \"\", \"wagtail_admin_comments\": [], \"has_unpublished_changes\": false, \"latest_revision_created_at\": \"2022-12-29T00:02:28.309Z\"}',NULL,'4',1,7,1,'Макет главной страницы');
/*!40000 ALTER TABLE `wagtailcore_revision` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wagtailcore_site`
--

DROP TABLE IF EXISTS `wagtailcore_site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wagtailcore_site` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hostname` varchar(255) NOT NULL,
  `port` int(11) NOT NULL,
  `is_default_site` tinyint(1) NOT NULL,
  `root_page_id` int(11) NOT NULL,
  `site_name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `wagtailcore_site_hostname_port_2c626d70_uniq` (`hostname`,`port`),
  KEY `wagtailcore_site_root_page_id_e02fb95c_fk_wagtailcore_page_id` (`root_page_id`),
  KEY `wagtailcore_site_hostname_96b20b46` (`hostname`),
  CONSTRAINT `wagtailcore_site_root_page_id_e02fb95c_fk_wagtailcore_page_id` FOREIGN KEY (`root_page_id`) REFERENCES `wagtailcore_page` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wagtailcore_site`
--

LOCK TABLES `wagtailcore_site` WRITE;
/*!40000 ALTER TABLE `wagtailcore_site` DISABLE KEYS */;
INSERT INTO `wagtailcore_site` VALUES (3,'anti-krt.spb.ru',80,1,3,'anti-krt');
/*!40000 ALTER TABLE `wagtailcore_site` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wagtailcore_task`
--

DROP TABLE IF EXISTS `wagtailcore_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wagtailcore_task` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `wagtailcore_task_content_type_id_249ab8ba_fk_django_co` (`content_type_id`),
  CONSTRAINT `wagtailcore_task_content_type_id_249ab8ba_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wagtailcore_task`
--

LOCK TABLES `wagtailcore_task` WRITE;
/*!40000 ALTER TABLE `wagtailcore_task` DISABLE KEYS */;
INSERT INTO `wagtailcore_task` VALUES (1,'Moderators approval',1,3);
/*!40000 ALTER TABLE `wagtailcore_task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wagtailcore_taskstate`
--

DROP TABLE IF EXISTS `wagtailcore_taskstate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wagtailcore_taskstate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` varchar(50) NOT NULL,
  `started_at` datetime(6) NOT NULL,
  `finished_at` datetime(6) DEFAULT NULL,
  `content_type_id` int(11) NOT NULL,
  `page_revision_id` int(11) NOT NULL,
  `task_id` int(11) NOT NULL,
  `workflow_state_id` int(11) NOT NULL,
  `finished_by_id` int(11) DEFAULT NULL,
  `comment` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `wagtailcore_taskstat_workflow_state_id_9239a775_fk_wagtailco` (`workflow_state_id`),
  KEY `wagtailcore_taskstat_content_type_id_0a758fdc_fk_django_co` (`content_type_id`),
  KEY `wagtailcore_taskstate_task_id_c3677c34_fk_wagtailcore_task_id` (`task_id`),
  KEY `wagtailcore_taskstate_finished_by_id_13f98229_fk_auth_user_id` (`finished_by_id`),
  KEY `wagtailcore_taskstat_page_revision_id_9f52c88e_fk_wagtailco` (`page_revision_id`),
  CONSTRAINT `wagtailcore_taskstat_content_type_id_0a758fdc_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `wagtailcore_taskstat_page_revision_id_9f52c88e_fk_wagtailco` FOREIGN KEY (`page_revision_id`) REFERENCES `wagtailcore_revision` (`id`),
  CONSTRAINT `wagtailcore_taskstat_workflow_state_id_9239a775_fk_wagtailco` FOREIGN KEY (`workflow_state_id`) REFERENCES `wagtailcore_workflowstate` (`id`),
  CONSTRAINT `wagtailcore_taskstate_finished_by_id_13f98229_fk_auth_user_id` FOREIGN KEY (`finished_by_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `wagtailcore_taskstate_task_id_c3677c34_fk_wagtailcore_task_id` FOREIGN KEY (`task_id`) REFERENCES `wagtailcore_task` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wagtailcore_taskstate`
--

LOCK TABLES `wagtailcore_taskstate` WRITE;
/*!40000 ALTER TABLE `wagtailcore_taskstate` DISABLE KEYS */;
/*!40000 ALTER TABLE `wagtailcore_taskstate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wagtailcore_workflow`
--

DROP TABLE IF EXISTS `wagtailcore_workflow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wagtailcore_workflow` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `active` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wagtailcore_workflow`
--

LOCK TABLES `wagtailcore_workflow` WRITE;
/*!40000 ALTER TABLE `wagtailcore_workflow` DISABLE KEYS */;
INSERT INTO `wagtailcore_workflow` VALUES (1,'Moderators approval',1);
/*!40000 ALTER TABLE `wagtailcore_workflow` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wagtailcore_workflowpage`
--

DROP TABLE IF EXISTS `wagtailcore_workflowpage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wagtailcore_workflowpage` (
  `page_id` int(11) NOT NULL,
  `workflow_id` int(11) NOT NULL,
  PRIMARY KEY (`page_id`),
  KEY `wagtailcore_workflow_workflow_id_56f56ff6_fk_wagtailco` (`workflow_id`),
  CONSTRAINT `wagtailcore_workflow_workflow_id_56f56ff6_fk_wagtailco` FOREIGN KEY (`workflow_id`) REFERENCES `wagtailcore_workflow` (`id`),
  CONSTRAINT `wagtailcore_workflowpage_page_id_81e7bab6_fk_wagtailcore_page_id` FOREIGN KEY (`page_id`) REFERENCES `wagtailcore_page` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wagtailcore_workflowpage`
--

LOCK TABLES `wagtailcore_workflowpage` WRITE;
/*!40000 ALTER TABLE `wagtailcore_workflowpage` DISABLE KEYS */;
INSERT INTO `wagtailcore_workflowpage` VALUES (1,1);
/*!40000 ALTER TABLE `wagtailcore_workflowpage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wagtailcore_workflowstate`
--

DROP TABLE IF EXISTS `wagtailcore_workflowstate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wagtailcore_workflowstate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` varchar(50) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `current_task_state_id` int(11) DEFAULT NULL,
  `page_id` int(11) NOT NULL,
  `requested_by_id` int(11) DEFAULT NULL,
  `workflow_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `current_task_state_id` (`current_task_state_id`),
  KEY `wagtailcore_workflow_page_id_6c962862_fk_wagtailco` (`page_id`),
  KEY `wagtailcore_workflow_requested_by_id_4090bca3_fk_auth_user` (`requested_by_id`),
  KEY `wagtailcore_workflow_workflow_id_1f18378f_fk_wagtailco` (`workflow_id`),
  CONSTRAINT `wagtailcore_workflow_current_task_state_i_3a1a0632_fk_wagtailco` FOREIGN KEY (`current_task_state_id`) REFERENCES `wagtailcore_taskstate` (`id`),
  CONSTRAINT `wagtailcore_workflow_page_id_6c962862_fk_wagtailco` FOREIGN KEY (`page_id`) REFERENCES `wagtailcore_page` (`id`),
  CONSTRAINT `wagtailcore_workflow_requested_by_id_4090bca3_fk_auth_user` FOREIGN KEY (`requested_by_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `wagtailcore_workflow_workflow_id_1f18378f_fk_wagtailco` FOREIGN KEY (`workflow_id`) REFERENCES `wagtailcore_workflow` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wagtailcore_workflowstate`
--

LOCK TABLES `wagtailcore_workflowstate` WRITE;
/*!40000 ALTER TABLE `wagtailcore_workflowstate` DISABLE KEYS */;
/*!40000 ALTER TABLE `wagtailcore_workflowstate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wagtailcore_workflowtask`
--

DROP TABLE IF EXISTS `wagtailcore_workflowtask`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wagtailcore_workflowtask` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sort_order` int(11) DEFAULT NULL,
  `task_id` int(11) NOT NULL,
  `workflow_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `wagtailcore_workflowtask_workflow_id_task_id_4ec7a62b_uniq` (`workflow_id`,`task_id`),
  KEY `wagtailcore_workflowtask_task_id_ce7716fe_fk_wagtailcore_task_id` (`task_id`),
  KEY `wagtailcore_workflowtask_workflow_id_b9717175` (`workflow_id`),
  CONSTRAINT `wagtailcore_workflow_workflow_id_b9717175_fk_wagtailco` FOREIGN KEY (`workflow_id`) REFERENCES `wagtailcore_workflow` (`id`),
  CONSTRAINT `wagtailcore_workflowtask_task_id_ce7716fe_fk_wagtailcore_task_id` FOREIGN KEY (`task_id`) REFERENCES `wagtailcore_task` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wagtailcore_workflowtask`
--

LOCK TABLES `wagtailcore_workflowtask` WRITE;
/*!40000 ALTER TABLE `wagtailcore_workflowtask` DISABLE KEYS */;
INSERT INTO `wagtailcore_workflowtask` VALUES (1,0,1,1);
/*!40000 ALTER TABLE `wagtailcore_workflowtask` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wagtaildocs_document`
--

DROP TABLE IF EXISTS `wagtaildocs_document`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wagtaildocs_document` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `file` varchar(100) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `uploaded_by_user_id` int(11) DEFAULT NULL,
  `collection_id` int(11) NOT NULL,
  `file_size` int(10) unsigned DEFAULT NULL,
  `file_hash` varchar(40) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `wagtaildocs_document_uploaded_by_user_id_17258b41_fk_auth_user` (`uploaded_by_user_id`),
  KEY `wagtaildocs_document_collection_id_23881625_fk_wagtailco` (`collection_id`),
  CONSTRAINT `wagtaildocs_document_collection_id_23881625_fk_wagtailco` FOREIGN KEY (`collection_id`) REFERENCES `wagtailcore_collection` (`id`),
  CONSTRAINT `wagtaildocs_document_uploaded_by_user_id_17258b41_fk_auth_user` FOREIGN KEY (`uploaded_by_user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wagtaildocs_document`
--

LOCK TABLES `wagtaildocs_document` WRITE;
/*!40000 ALTER TABLE `wagtaildocs_document` DISABLE KEYS */;
/*!40000 ALTER TABLE `wagtaildocs_document` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wagtaildocs_uploadeddocument`
--

DROP TABLE IF EXISTS `wagtaildocs_uploadeddocument`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wagtaildocs_uploadeddocument` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `file` varchar(200) NOT NULL,
  `uploaded_by_user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `wagtaildocs_uploaded_uploaded_by_user_id_8dd61a73_fk_auth_user` (`uploaded_by_user_id`),
  CONSTRAINT `wagtaildocs_uploaded_uploaded_by_user_id_8dd61a73_fk_auth_user` FOREIGN KEY (`uploaded_by_user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wagtaildocs_uploadeddocument`
--

LOCK TABLES `wagtaildocs_uploadeddocument` WRITE;
/*!40000 ALTER TABLE `wagtaildocs_uploadeddocument` DISABLE KEYS */;
/*!40000 ALTER TABLE `wagtaildocs_uploadeddocument` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wagtailembeds_embed`
--

DROP TABLE IF EXISTS `wagtailembeds_embed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wagtailembeds_embed` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` longtext NOT NULL,
  `max_width` smallint(6) DEFAULT NULL,
  `type` varchar(10) NOT NULL,
  `html` longtext NOT NULL,
  `title` longtext NOT NULL,
  `author_name` longtext NOT NULL,
  `provider_name` longtext NOT NULL,
  `thumbnail_url` longtext NOT NULL,
  `width` int(11) DEFAULT NULL,
  `height` int(11) DEFAULT NULL,
  `last_updated` datetime(6) NOT NULL,
  `hash` varchar(32) NOT NULL,
  `cache_until` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `wagtailembeds_embed_hash_c9bd8c9a_uniq` (`hash`),
  KEY `wagtailembeds_embed_cache_until_26c94bb0` (`cache_until`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wagtailembeds_embed`
--

LOCK TABLES `wagtailembeds_embed` WRITE;
/*!40000 ALTER TABLE `wagtailembeds_embed` DISABLE KEYS */;
/*!40000 ALTER TABLE `wagtailembeds_embed` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wagtailforms_formsubmission`
--

DROP TABLE IF EXISTS `wagtailforms_formsubmission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wagtailforms_formsubmission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `form_data` json NOT NULL,
  `submit_time` datetime(6) NOT NULL,
  `page_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `wagtailforms_formsub_page_id_e48e93e7_fk_wagtailco` (`page_id`),
  CONSTRAINT `wagtailforms_formsub_page_id_e48e93e7_fk_wagtailco` FOREIGN KEY (`page_id`) REFERENCES `wagtailcore_page` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wagtailforms_formsubmission`
--

LOCK TABLES `wagtailforms_formsubmission` WRITE;
/*!40000 ALTER TABLE `wagtailforms_formsubmission` DISABLE KEYS */;
/*!40000 ALTER TABLE `wagtailforms_formsubmission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wagtailimages_image`
--

DROP TABLE IF EXISTS `wagtailimages_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wagtailimages_image` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `file` varchar(100) NOT NULL,
  `width` int(11) NOT NULL,
  `height` int(11) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `focal_point_x` int(10) unsigned DEFAULT NULL,
  `focal_point_y` int(10) unsigned DEFAULT NULL,
  `focal_point_width` int(10) unsigned DEFAULT NULL,
  `focal_point_height` int(10) unsigned DEFAULT NULL,
  `uploaded_by_user_id` int(11) DEFAULT NULL,
  `file_size` int(10) unsigned DEFAULT NULL,
  `collection_id` int(11) NOT NULL,
  `file_hash` varchar(40) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `wagtailimages_image_uploaded_by_user_id_5d73dc75_fk_auth_user_id` (`uploaded_by_user_id`),
  KEY `wagtailimages_image_collection_id_c2f8af7e_fk_wagtailco` (`collection_id`),
  KEY `wagtailimages_image_created_at_86fa6cd4` (`created_at`),
  KEY `wagtailimages_image_file_hash_fb5bbb23` (`file_hash`),
  CONSTRAINT `wagtailimages_image_collection_id_c2f8af7e_fk_wagtailco` FOREIGN KEY (`collection_id`) REFERENCES `wagtailcore_collection` (`id`),
  CONSTRAINT `wagtailimages_image_uploaded_by_user_id_5d73dc75_fk_auth_user_id` FOREIGN KEY (`uploaded_by_user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wagtailimages_image`
--

LOCK TABLES `wagtailimages_image` WRITE;
/*!40000 ALTER TABLE `wagtailimages_image` DISABLE KEYS */;
INSERT INTO `wagtailimages_image` VALUES (1,'enotik2','original_images/enotik2.jpg',1280,890,'2022-12-02 15:45:37.955394',NULL,NULL,NULL,NULL,1,154914,1,'ba5173fa1112623bf2bf16812df8c5af4c9e7705'),(2,'enotik2','original_images/enotik2_9nyzGTI.jpg',1280,890,'2022-12-02 16:05:23.702171',NULL,NULL,NULL,NULL,1,154914,2,'ba5173fa1112623bf2bf16812df8c5af4c9e7705');
/*!40000 ALTER TABLE `wagtailimages_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wagtailimages_rendition`
--

DROP TABLE IF EXISTS `wagtailimages_rendition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wagtailimages_rendition` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `file` varchar(100) NOT NULL,
  `width` int(11) NOT NULL,
  `height` int(11) NOT NULL,
  `focal_point_key` varchar(16) NOT NULL,
  `filter_spec` varchar(255) NOT NULL,
  `image_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `wagtailimages_rendition_image_id_filter_spec_foc_323c8fe0_uniq` (`image_id`,`filter_spec`,`focal_point_key`),
  KEY `wagtailimages_rendition_filter_spec_1cba3201` (`filter_spec`),
  CONSTRAINT `wagtailimages_rendit_image_id_3e1fd774_fk_wagtailim` FOREIGN KEY (`image_id`) REFERENCES `wagtailimages_image` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wagtailimages_rendition`
--

LOCK TABLES `wagtailimages_rendition` WRITE;
/*!40000 ALTER TABLE `wagtailimages_rendition` DISABLE KEYS */;
INSERT INTO `wagtailimages_rendition` VALUES (1,'images/enotik2.max-165x165.jpg',165,114,'','max-165x165',1),(2,'images/enotik2.original.jpg',1280,890,'','original',1),(3,'images/enotik2.max-800x600.jpg',800,556,'','max-800x600',1),(4,'images/enotik2_9nyzGTI.max-800x600.jpg',800,556,'','max-800x600',2),(5,'images/enotik2_9nyzGTI.max-165x165.jpg',165,114,'','max-165x165',2),(6,'images/enotik2_9nyzGTI.width-550.jpg',550,382,'','width-550',2),(7,'images/enotik2_9nyzGTI.original.jpg',1280,890,'','original',2);
/*!40000 ALTER TABLE `wagtailimages_rendition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wagtailimages_uploadedimage`
--

DROP TABLE IF EXISTS `wagtailimages_uploadedimage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wagtailimages_uploadedimage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `file` varchar(200) NOT NULL,
  `uploaded_by_user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `wagtailimages_upload_uploaded_by_user_id_85921689_fk_auth_user` (`uploaded_by_user_id`),
  CONSTRAINT `wagtailimages_upload_uploaded_by_user_id_85921689_fk_auth_user` FOREIGN KEY (`uploaded_by_user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wagtailimages_uploadedimage`
--

LOCK TABLES `wagtailimages_uploadedimage` WRITE;
/*!40000 ALTER TABLE `wagtailimages_uploadedimage` DISABLE KEYS */;
/*!40000 ALTER TABLE `wagtailimages_uploadedimage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wagtailredirects_redirect`
--

DROP TABLE IF EXISTS `wagtailredirects_redirect`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wagtailredirects_redirect` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `old_path` varchar(255) NOT NULL,
  `is_permanent` tinyint(1) NOT NULL,
  `redirect_link` varchar(255) NOT NULL,
  `redirect_page_id` int(11) DEFAULT NULL,
  `site_id` int(11) DEFAULT NULL,
  `automatically_created` tinyint(1) NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `redirect_page_route_path` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `wagtailredirects_redirect_old_path_site_id_783622d7_uniq` (`old_path`,`site_id`),
  KEY `wagtailredirects_red_redirect_page_id_b5728a8f_fk_wagtailco` (`redirect_page_id`),
  KEY `wagtailredirects_red_site_id_780a0e1e_fk_wagtailco` (`site_id`),
  KEY `wagtailredirects_redirect_old_path_bb35247b` (`old_path`),
  CONSTRAINT `wagtailredirects_red_redirect_page_id_b5728a8f_fk_wagtailco` FOREIGN KEY (`redirect_page_id`) REFERENCES `wagtailcore_page` (`id`),
  CONSTRAINT `wagtailredirects_red_site_id_780a0e1e_fk_wagtailco` FOREIGN KEY (`site_id`) REFERENCES `wagtailcore_site` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wagtailredirects_redirect`
--

LOCK TABLES `wagtailredirects_redirect` WRITE;
/*!40000 ALTER TABLE `wagtailredirects_redirect` DISABLE KEYS */;
INSERT INTO `wagtailredirects_redirect` VALUES (1,'/maket-glavnoj-stranicy',1,'',4,3,1,'2022-12-02 16:19:54.821706',''),(2,'/anti-krt-meropriyatiya',1,'',5,3,1,'2022-12-24 17:05:02.812936','');
/*!40000 ALTER TABLE `wagtailredirects_redirect` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wagtailsearch_indexentry`
--

DROP TABLE IF EXISTS `wagtailsearch_indexentry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wagtailsearch_indexentry` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `object_id` varchar(50) NOT NULL,
  `title_norm` double NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `autocomplete` longtext,
  `body` longtext,
  `title` longtext NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `wagtailsearch_indexentry_content_type_id_object_id_bcd7ba73_uniq` (`content_type_id`,`object_id`),
  FULLTEXT KEY `fulltext_body` (`body`),
  FULLTEXT KEY `fulltext_title` (`title`),
  FULLTEXT KEY `fulltext_title_body` (`title`,`body`),
  FULLTEXT KEY `fulltext_autocomplete` (`autocomplete`) /*!50100 WITH PARSER `ngram` */ ,
  CONSTRAINT `wagtailsearch_indexe_content_type_id_62ed694f_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wagtailsearch_indexentry`
--

LOCK TABLES `wagtailsearch_indexentry` WRITE;
/*!40000 ALTER TABLE `wagtailsearch_indexentry` DISABLE KEYS */;
INSERT INTO `wagtailsearch_indexentry` VALUES (1,'1',1.5,1,'Root','','Root'),(2,'3',0.75,6,'HomePage','','HomePage'),(3,'1',0.9047571428571429,2,'enotik2','','enotik2'),(4,'4',0.4659090909090909,7,'Макет главной страницы','','Макет главной страницы'),(5,'2',1.3714285714285714,2,'enotik2','','enotik2'),(6,'5',0.566665,47,'Анти КРТ мероприятия','','Анти КРТ мероприятия');
/*!40000 ALTER TABLE `wagtailsearch_indexentry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wagtailsearch_query`
--

DROP TABLE IF EXISTS `wagtailsearch_query`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wagtailsearch_query` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `query_string` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `query_string` (`query_string`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wagtailsearch_query`
--

LOCK TABLES `wagtailsearch_query` WRITE;
/*!40000 ALTER TABLE `wagtailsearch_query` DISABLE KEYS */;
/*!40000 ALTER TABLE `wagtailsearch_query` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wagtailsearch_querydailyhits`
--

DROP TABLE IF EXISTS `wagtailsearch_querydailyhits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wagtailsearch_querydailyhits` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `hits` int(11) NOT NULL,
  `query_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `wagtailsearch_querydailyhits_query_id_date_1dd232e6_uniq` (`query_id`,`date`),
  CONSTRAINT `wagtailsearch_queryd_query_id_2185994b_fk_wagtailse` FOREIGN KEY (`query_id`) REFERENCES `wagtailsearch_query` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wagtailsearch_querydailyhits`
--

LOCK TABLES `wagtailsearch_querydailyhits` WRITE;
/*!40000 ALTER TABLE `wagtailsearch_querydailyhits` DISABLE KEYS */;
/*!40000 ALTER TABLE `wagtailsearch_querydailyhits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wagtailusers_userprofile`
--

DROP TABLE IF EXISTS `wagtailusers_userprofile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wagtailusers_userprofile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `submitted_notifications` tinyint(1) NOT NULL,
  `approved_notifications` tinyint(1) NOT NULL,
  `rejected_notifications` tinyint(1) NOT NULL,
  `user_id` int(11) NOT NULL,
  `preferred_language` varchar(10) NOT NULL,
  `current_time_zone` varchar(40) NOT NULL,
  `avatar` varchar(100) NOT NULL,
  `updated_comments_notifications` tinyint(1) NOT NULL,
  `dismissibles` json NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `wagtailusers_userprofile_user_id_59c92331_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wagtailusers_userprofile`
--

LOCK TABLES `wagtailusers_userprofile` WRITE;
/*!40000 ALTER TABLE `wagtailusers_userprofile` DISABLE KEYS */;
INSERT INTO `wagtailusers_userprofile` VALUES (1,1,1,1,1,'ru','Europe/Moscow','avatar_images/avatar_0f23ec96-3d09-409d-896d-42cdf7da86ef_OK-pzNuCK88.jpg',1,'{\"help\": true, \"editor-guide\": true, \"whats-new-in-wagtail-4.1\": true, \"whats_new_in_wagtail_version_4\": true}'),(2,1,1,1,2,'','','',1,'{\"help\": true, \"editor-guide\": true, \"whats-new-in-wagtail-4.1\": true, \"whats_new_in_wagtail_version_4\": true}');
/*!40000 ALTER TABLE `wagtailusers_userprofile` ENABLE KEYS */;
UNLOCK TABLES;
/*!50112 SET @disable_bulk_load = IF (@is_rocksdb_supported, 'SET SESSION rocksdb_bulk_load = @old_rocksdb_bulk_load', 'SET @dummy_rocksdb_bulk_load = 0') */;
/*!50112 PREPARE s FROM @disable_bulk_load */;
/*!50112 EXECUTE s */;
/*!50112 DEALLOCATE PREPARE s */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-12-29  3:40:47
