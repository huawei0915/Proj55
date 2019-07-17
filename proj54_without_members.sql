-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- �D���G 127.0.0.1
-- ���ͮɶ��G 2019 �~ 07 �� 17 �� 04:54
-- ���A�������G 10.3.16-MariaDB
-- PHP �����G 7.2.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- ��Ʈw�G `proj54`
--

-- --------------------------------------------------------

--
-- ��ƪ��c `categories`
--

CREATE TABLE `categories` (
  `sid` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `parent_sid` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- �ɦL��ƪ���� `categories`
--

INSERT INTO `categories` (`sid`, `name`, `parent_sid`) VALUES
(1, '�{���]�p', 0),
(2, 'ø�ϳn��', 0),
(3, '���ں�������', 0),
(4, 'PHP', 1),
(5, 'JavaScript', 1),
(7, 'PS', 2),
(8, 'Chrome', 3),
(9, '�F����', 3),
(10, 'C++', 1),
(16, '�ȩ�', 2);

-- --------------------------------------------------------

--
-- ��ƪ��c `orders`
--

CREATE TABLE `orders` (
  `sid` int(11) NOT NULL,
  `member_sid` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  `order_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- �ɦL��ƪ���� `orders`
--

INSERT INTO `orders` (`sid`, `member_sid`, `amount`, `order_date`) VALUES
(4, 1, 1820, '2016-03-25 12:15:08'),
(5, 1, 1820, '2016-03-25 12:19:05'),
(9, 1, 2070, '2016-06-01 11:01:37'),
(10, 13, 1460, '2016-06-01 11:15:53'),
(11, 1, 2030, '2017-10-03 13:49:20'),
(12, 3, 3260, '2019-01-11 10:25:39');

-- --------------------------------------------------------

--
-- ��ƪ��c `order_details`
--

CREATE TABLE `order_details` (
  `sid` int(11) NOT NULL,
  `order_sid` int(11) NOT NULL,
  `product_sid` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- �ɦL��ƪ���� `order_details`
--

INSERT INTO `order_details` (`sid`, `order_sid`, `product_sid`, `price`, `quantity`) VALUES
(1, 4, 22, 580, 1),
(2, 4, 17, 620, 2),
(3, 4, 22, 580, 1),
(4, 5, 22, 580, 1),
(5, 5, 17, 620, 2),
(6, 9, 6, 450, 1),
(7, 9, 8, 520, 2),
(8, 9, 22, 580, 1),
(9, 10, 1, 560, 1),
(10, 10, 2, 420, 1),
(11, 10, 3, 480, 1),
(12, 11, 5, 690, 2),
(13, 11, 15, 650, 1);

-- --------------------------------------------------------

--
-- ��ƪ��c `products`
--

CREATE TABLE `products` (
  `sid` int(11) NOT NULL,
  `author` varchar(50) NOT NULL,
  `bookname` varchar(60) NOT NULL,
  `category_sid` int(11) NOT NULL DEFAULT 1,
  `book_id` varchar(30) NOT NULL,
  `publish_date` date NOT NULL,
  `pages` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `isbn` varchar(30) NOT NULL,
  `on_sale` tinyint(1) NOT NULL DEFAULT 1,
  `introduction` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- �ɦL��ƪ���� `products`
--

INSERT INTO `products` (`sid`, `author`, `bookname`, `category_sid`, `book_id`, `publish_date`, `pages`, `price`, `isbn`, `on_sale`, `introduction`) VALUES
(1, '�x�@�s�B�\���', '�ϸ�C++�{���]�p\r\n', 16, 'PG30036', '2010-02-08', 624, 560, '978-986-201-306-9 ', 1, 'C++�y���ĦX�F�ǲΪ��{�Ǧ��y���B����ɦV�]�p�H��C++�˪��T�ؤ��P�{���]�p�覡�A�ϥ�������N�̨������B���Ϊ��{���y���C\r\n���ѱj�ղz�׻P��@�í��A��C++�\��`�Ǻ��i�B�ѲL�J�`�A�Թ�a�����FC++�y���������y�k�A�Ѥ��ĤJ�j�q���{���d�ҡA�C�@�ӽd�ҵ{�����g�L���աA�i�H���T�L�~�a����A�åB�q��@�����x�U�ص{���]�p�ޥ��C\r\n���F�Ҥ夺�j�q���{���d�ҥ~�A�C�������u�W����߽ҵ{�v�椸�A�i�H���ϥΪ̦���h����ںt�m���|�C�b�ҫ�j�q��߳]�p�����D�A�禬�ǲߦ��ġA���ѧ�h���{����@�g��C'),
(2, '�d���T', '�ϸѸ�Ƶ��c-�ϥ�JAVA', 1, 'PG30035', '2009-12-15', 384, 420, '978-986-201-281-9 ', 1, '��Ƶ��c�@���O�q����ǻ��D�`���n����¦�ҵ{�A���ѬO�H�оɦp��N��Ƶ��c������Java�{���y���ӹ�@�����n�ۧ@�C��S��b��N�������z�׻��H�Ϥ�íZ���ѻ��覡�A�f�t�״I���Ϫ�νd�Ҥ��СA�N��Ƶ��c�����n���[���κt��k�[�H�����A�����ǲߵJ�I�C\r\n�C�����n�z�ק����d�ҹ�@�A�Ѥ������F��ت��t��k�ε{��������e���A�H�ѥ��Ыh���P���㪺�d�ҵ{���A���ѸԺɪ����Q�A���@�ǲߪ����ġC\r\n\r\n�����e�[�c����A�޿�M���A�ĥ��״I���ϨҨ��ĭz���[�������ΡA���Ĵ����iŪ�ʡC\r\n���HJAVA�{���y����@��Ƶ��c�������n�z�סA�H�d�ҵ{��������Ƶ��c�����[�C\r\n����ﭫ�I���D�A�ѷr��a���n���ҸթR�D���I�A�ҫ�ߧY�ƲߡA�F��ƥb�\�����ĪG�C'),
(3, '���a�e�B���ɧ�', 'Visual C# 2008�����C���{���]�p', 1, 'PG30034', '2009-11-27', 424, 480, '978-986-201-278-9 ', 1, '���ѯS��b������P�C�������X�A�p���ʵe�[�J�b�C�����e�{�A�åB���g�X��²���n���{���X�C�A�ӬO�����{�����g�����A�p�������\��[�J��C���̭��F�쪱�a�P���a���q���ĪG�A���X�C�������P�����{������@�ϹC���ܪ�����C\r\n���Ѧ@���T�g16���A���e�ѲL�J�`�A��������Visual C#���򥻻y�k�P����ϥΤ覡�A���S��Ĳ�LVisual C#��Ū�̯���ֳt�W��C����²�檺�������������A�ñЦU��p��Q��Visual C#�ӼgSocket�����{���A�i�ӧ����@��²�檺��ѫǡC�ӲĤG�B�T�g�h�O��@�򥻻P�i���������C���C�z�L���_����@�A��Ū�̯���q����o��h���g��ȡC\r\n���ѹ��Q�i�J�C���]�p���e�̦Ө��i���O�̨ξǲ߳~�|�A���ȧֳt�ⲤVisual C# 2008�{���]�p����¦�A���ǥѦU�ӽd�ҵ{���A�ѵ����{���������]�p�ޥ��A���ϥ��ѯ��Ū�̦b�����{���]�p�঳���۪��i�B�C'),
(4, '���� �E', 'Java ���c- Java Refactoring', 1, 'PG20252', '2010-01-21', 432, 490, '978-986-201-087-7 ', 1, '���Ѫ��S�x���H�U�X�I�G\r\n����Java�y���Ҽg�����d�ҵ{��\r\n�]�����c�̥D�n���ت��O�ﵽ�n�骺���A�ҥH�Ψ��骺�d�ҵ{���Ӹѻ��O���i�ίʪ��C\r\n���ԲӦa�ѻ����n�����c\r\n�bMartin Fowler���yRefactoring�z�@�Ѥ��A�@�ΤF70�ӭ��c���Ҥl�ӻ����C�M�ӥ��ѨèS���w��Ҧ����c�H�P�˪��g�T�ӻ����A�ӬO�w�ﭫ�n�����c��z�X�n�I�A�ð��ԲӪ������C�ܩ�b���Ѥ��L�k�ԲӸѻ��쪺���c�����A�ڭ̾ܭn�b�ѥ�������A�������л����C\r\n���Q�νm�߰��D�ӽT�{��¦���ѬO�_�Ϲ�\r\n���c���ѻ��ѩ�X�{�F�\�h�ӿ����B�J�A�]�������|�]���d���ө����F���I�������C�b���Ѫ��U���`���������������m�߰��D�A�i�H���A�w��o���`���ҾǨ쪺��¦���ѦA���@���ƲߡC\r\n���z�L�m�߰��D�ӵo�{�u�������x���v\r\n��A�b�i�歫�c�ɡA�ήɧ�X�{���Ҵ��o�X���u�������x���v���m�ߤ]�O�ܭ��n���@���C�b���Ѫ��m�߰��D���A���ȥ]�A�p��h��X�{���X�ҵo�X���u�������x���v���m�ߡC�ѩ�s�����μ��g�{���]�వ�T�{�����c�A�]���Y�ϩ⤣�X�ɶ��ǲߪ��H�]�໴�P�a�D�ԡC'),
(5, '�����T', 'Linux Device Driver Programming �X�ʵ{���]�p', 1, 'PG20280', '2009-01-05', 624, 690, '978-986-201-186-7 ', 1, '���ѬO�@���g��Linux�˸m�X�ʵ{���}�o�̪����y�C�H�즸�}�o�˸m�X�ʵ{�����}�o�̤]�e���z�Ѫ����סA�q��¦�����}�l�ԥ[�ѻ��C\r\n\r\n���ѫe�b���H�ۭ���˸m�X�ʵ{���}�o�e���򥻪��ѤΨ��Ҥ�k�����D�n���СA�b��b���h�̨C�Ӥ��P���w�鰵�M�������Q�C��ù�q�p�ɾ��B�O����B���_����¦�� PCI Express�BACPI�BIPMI���̷s���w�骾�ѡC�������~�A�٥]�t�����k�B������k�B�P�B�P��w�K�����D�D�A�@�����Ū�J���X�ʵ{���X���ޥ��A���������b���Ѥ��C\r\n\r\n������o�饻AmazonŪ�̲��來���P���C���A�Ѥ��H�����Ф��󦬿��F�Ѥ��d�ҵ{���X�C���޹�J���̩άO�M�~�� Linux�{���]�p�v�ӻ��A���Ѥ��Ҵ��Ϊ��}�o�X�ʵ{������ءA����|���z�ܧִN�����X�ʵ{�����}�o�ԤO�C '),
(6, '���E��', 'Excel VBA 2007�{���]�p - �W�q�s��', 1, 'PG20271', '2008-05-27', 400, 450, '978-986-201-129-4', 1, '���Ѫ��]�p�D�b�A�Y�O�H���~�H���ثe�ҭ��{�쪺������ά����D�A�H�`�J�L�X���覡�A�Q�γ�²�檺VBA�y���u��A�ֳt�Ӧ��Ĳv���B�z�b���~���ҷ|���{�쪺�|�p�b�ȳB�z�B��P�ݨ���X�B�~�ȸg�P��Ʀ����p��Ϊ̬O��F�H���ҭ��{���H�ƥX�ʮu�p�ⵥ���D�A�άJ��������ï��ơA���HVBA�{���A�ֳt���p��X�b�ȸ�ơB�g�P�����ΥX�ʮu��ơK�����D�C\r\n\r\n�z�L���ѡAŪ�̥i�H�`�J�ǲ�Excel�̸g�媺�����A�g�Ѳ`�J�L�X�������A�޾�Ū�̤@�B�B���x VBA�bExcel�������ΡA��Ū�̫إ�VBA�{���]�p����¦�F�f�t�״I���Ϥ�ѻ��A�ɤ޾ǲߨü��xVBA�y�k�ά[�c�A��Ū�̹���D��b�ӸѪ��̨Ϊk�h�I'),
(7, '���M��', '�mø�Ѱ�Painter�Ʀ촡�e���P��', 2, 'GH20187', '2009-09-14', 448, 550, '978-986-201-255-0', 1, '�U���U�˪�����t�X�v�������t�X\r\n�гy�m���ܥت����N�~�I\r\n��Painter���Ĥ@����\r\n��Ǫ��ڦV��ȳ]�p�̤���\r\n�n�A��ø�Ϧ����δ��e�B�v���s��ĪG�I\r\n�i�{��ø��P���U�اުk�P��Ȥu�@�̪��{���X�͡I\r\n\r\n���u�n5�����APainter�򥻥\��P����OK�I\r\n���q�ʲ`�J���Q�b�e���W�e�{���ڿW�L���N�P���W�jø�ϳn��Painter�A��Ʀ촡�e���]�p�L�{�C\r\n�����P�ǲߥH��Ȭ����ߪ��֤߽d��\r\n���������P���P�ǽm�߬O��Ǫ̥�Ū�����e�C�Y��T���A�Ѧ����������e�A�W��painter��Ǫ̨����N�L�e�m�áC\r\n���Ϧۨ��]�p��O�ʪ@���z~�����Ū����Know How\r\n��i�@�B����Painter���[�c�C�HPainter���D�b���ϥΪ̭̥��ƪ���T�A�b�d�Ҿǲ߹L�{���A�Y�Q��`�J�ǲߡA���{�u��Ū�C\r\n���{�Npainter��Ȥu�@�̭̪��u�@�g��\r\n�z�L�X�ͬ��D��U�ӻ�쪺��Ȥu�@�̡A��������U��쪺��ڤu�@���ҡC�良��ť�D���s���Τw���o�W�L���|���[�{�����H�Ө��A�N�O���Ϊ���ȫ��n�C'),
(8, '���f��', '���@�˪��Ч@�]�p����- Photoshop Artworks Stylebook ', 2, 'GH20200', '2009-11-30', 304, 520, '978-986-201-276-5', 1, '�p�G�z�Q�n�F�Ѵx���@�ɤW�Ʀ����N�Ч@���ͶաA�þǲߤ@�y�W�S���ުk�A���ѬO�z���ݪ���ܡC�Q�n�F�Ѧp���Photoshop�Ч@�w�}�E�U������������A�άO�Ч@���X�ө_�B�W�{��D�q�B�ڤۥP�ҭ���B�_�j�y�檺��{��k�F�t�~�٦��n�ܶ����檺�����B��������e����B���m�ί����e�����Ч@...���A���Ѥ��t�@�ɯŶW���Ǫ�20�է@�~�A�Թ�a�N�Ч@�ޥ��P��@��k�������}�A�t�X�H�Ѫ��WDVD�����ѪR�ק@�~�����ɮרӾǲߡA���z�ڦV�@�ɯŪ��Ч@���C\r\n\r\n���Ѥ@�}�l�K��z�X�Ч@���@�˳]�p�ɭn���D���T��Photoshop�֤ߥ\��A���ۥH20�ӱM�D��ҡA���O�O�����e����Ч@�B���m�e���X�@�Ч@�B�����e�Ч@�B�������N���������B�X�ө_�B�W�{��D�q�B�ڤۥP�ҭ���B�_�j�y�檺��{��k�B�n�ܶ����檺����...�����A�U�ط�e�@�ɤW�D�y�]�p���|�@�~�C�̫�󦳩����ǲߪ��зN�����o�Q�ޥ��B�����s�@�ޥ��A�H�Τ@�y�@�~�Y��C\r\n'),
(9, '�j��??? Hajime', '�馡�������N���˯����ﶰ', 2, 'GH20182', '2009-03-09', 128, 350, '978-986-201-203-1', 1, '�b�馡���檺�]�p�@�~�̡Aĭ�[�۾��P²�䪺�W���S��A���ٻ��ܥD���I�����˧��Ũ���X�j�P���馡�������s�b�P�C\r\n\r\n���Ѧ���521�إH�����B���ϡB�˹��ؽu���T�j�������馡�ǲιϯ��A�`�p��3900�ӥH�W��EPS�BJPG�BGIF�����ɡC�Ѥ������Ϯ׬Ҩ������״I���۵M���g�B���ΰʪ��B���Ӫ��P�ǲδ��e�A�g�Ѥ��Ъ��զX�ƦC�A�غc�X�W�S���������P�P�u���N�H�C\r\n\r\n*�H��DVD�A��Mac & Win,���tEPS�BJPG�BGIF��o���ɡC���F��KŪ�̨ϥΡA�����C���������m�B�b�m�B�¥յ��T�خĪG�C'),
(10, '���q�ѹ�', 'Illustrator GOODS COLLECTION', 2, 'GH20173', '2008-10-29', 192, 350, '978-986-201-172-0 ', 1, '���R�����P�w�g�Ӧh�A²���Τ~���g�H\r\n�Φۤv������A�@��@�ΩҰ��X�ӻ����g�H���@�~�A�`�O���ػ����X�Ӫ��y�O�I�q�}�ҽd���B�M�ιϼˡB��L�B���ΡB�_�s�짹���A�C�ӹL�{�γ\��O���ɶ��ä��h�A���q�ʤⰵ�����@��}�l�A�@���������r���Φ��N�P�K�����R���ۤ��ߡC\r\n���O��@����y�u�a��Ū�̳�譱�����СA���ѵۭ���ʤ�s�@�P�n��ާ@���ۤ��f�t�A���M�ۤv�ʤ����K�u���n�סB���~�]���ɧ����A����媺��P�o�O�q���ҵL�k�������C�C�@�ӻs�@���L�{�B�C�@�������G���O�H�������ݡF�s�@�������@�~�A���F���[���~�A��i�H�̦ۤv�ߦn�B�Φb��`�ͬ��W�A�ݨ���P�P��Ωʡгo�A�N�O���ѩұa���z���L�a�y�O�C\r\n\r\n�����ѵۭ���ʤ�s�@�P�n��ާ@���ۤ��f�t�A�è̷������צ@����5�ӬP���A�����C�@�ӻs�@�B�J����²��A�L�ݷǳƤӦh���u��P��O�Ӧh�ɶ��A�N�໴�P���X�ݩ�ۤv���@�~�C\r\n���z�L���ѱN��50�ӧ@�~�d�Ҫ��ǲߡA�E�oŪ�̹�ͬ����F�P�A�N�����H��i�o�����~�A�Q�Τ@�I����]�p�s�@�A�����i�W�[�ͬ��ֽ�A���ƦA�ͧQ�Ϊ����O�����C\r\n�����ѶK�ߦ����HPDF�榡���x�s�������ɡA���S���w��Illustrator�n�骺Ū�̡A�i�H�����}��PDF�ɮ׫�A�����C�L�ϥΡA�J�ٮɤS�K�Q�C'),
(11, '�[�̭�a�B�W�ЯE', 'Wireshark ������w���R�P�޲z', 3, 'NE20287', '2010-01-12', 400, 480, '978-986-201-292-5', 1, '�Ƿ|�q�T��w�P�������D�����ƸѪ�Wireshark���޳N�I\r\n�o�O�@���M���Q�����F��Wireshark�κ�����w��Ū�̭̩Ҽ��g�����y�C���Ѥ����E�j���`�A�b�e�������`�O�HWireshark��Ǫ̥��ƪ����ѧ@���}�ݡA�����������򥻤�Wireshark�����n�C�Ӧb��b�q���F�n��Ū�̦b�d�\�W��[��K�A���O�H���P�ت��@��������¦�A�������^���ާ@�B�ɮ׾ާ@�B�ۭq�]�w�B��w�B�����BTips�B�����Ƹѵ��C�ӥD�D�i�满���C\r\n\r\n���Ѥ����M���B�ϸѲ��h�A���F�i�H�Ƿ|�q�T��w�~�A�]�A�Ω�Q�i������ƸѪ������޲z�̡C�O�@�����������z��M�����A���z�����x���o�@�M��X�ק��㪺 Wireshark�n��C '),
(12, '���ش@', 'Flash CS4�ʵe�]�p���ζ�', 3, 'NE30021', '2010-01-07', 464, 520, '978-986-201-290-1', 1, '���H�d�Ҭ��ɦV�A���X��¦�[���������P��νd�Ҫ��B�J�ާ@�A�d�Һ�m�ʤH�A�`�Ǻ��i�оɾǲߪ̶i�JFlash����C\r\n�����e�]�t��¦�����B�Ϥ�]�p�B�ʵe�s�@�B���s�]�w�B��ActionScript���{�����ΡA���ǲߪ̻��P�Ƿ|Flash���U���ޥ��\��C\r\n���d�Ҿާ@�B�J�ԺɲM���A���ǲߪ̲{�ǥ\��{�Χޥ��A����A�|�@�ϤT�A�ۧ��禬���G�C\r\n����Ū���ѡA���P�Ƿ|�s�@�Ŭ��ʵe�κ륩Flash�C���C '),
(13, '���F��', 'Internet������ȻP����', 3, 'NE30018', '2010-01-04', 512, 500, '978-986-201-286-4', 1, '���Ѵx��Internet�̷s���[���A���X�ɩ|���s���P���ΡA�оɦp��Q�γo�Ǻ����귽�ӱj�ƤH�߸g��B���U�ǲߡB�ӷ~���ΡB���s�g��B�L���x�إߩM�������ơA�������w�����{�ѻP���d�B��T�۲z�B�q�l�ӰȡB��ʰӰȡA�]�O�������ߪ����I�C�b���e�w�ƤW�A����O�@���u������x�����ں��������J�����Ѥγ̷s������Ϊ����I���y�C�S��p�U�G\r\n\r\n�����e�R�꧹��\r\n�[�\���D�D�]�A�̷s���ں����s���P������ΡA���e���ƥB�״I�A�̳椸�i�����G�����J���g�B�H�߸g��g�B�귽���νg�B�����ӷ~�g�B��ı���ƽg�C\r\n���f�t�Ϩҭ�z\r\n�w�藍���z�Ѫ���z�A�[�J�j�q���ϨҤΥܷN�ϨӼW�[�z�ѵ{�סA���H�̻��P���覡�A�l��Internet�������Ϊ���ظ�T�C\r\n���ĤJ��Ҿާ@\r\n�N���n���n��\��f�t��Һt�m�A�ǥѴ`�ǨB�J�����ާ@���L�{�q���ǲ߹�Ϊ��\��C\r\n���ҫ�j�q���D\r\n�U�����|���w�Ʋ��D����A���Ѿǥͽҫ�m�ߪ����|�A�i�@���Ѯv�禬�оǦ��Ī����祭�x�C'),
(14, '���s�إv', '���}�N��Ϊ��㯸�����]�p�d�Ҷ�', 3, 'NE20286', '2009-12-23', 176, 380, '978-986-201-284-0', 1, '�ѱM�~�]�p�v�J�㶰���F��U�̨���P�������]�p��ҡA�z�A�]���ݭn�]���S���F�P�Ӯ��O���_�Q���ɶ��A�����H���ɩ|�������]�p�����A�ߧY���z�֦��]�p�j�v���W���ǡI\r\n���Ѧ@�����ө��������]�p�[�c�B�M�����Фj�q�ӫ~�ҳ]�p�������[�c�B�H�Ϥ����D��²������[�c�B�M����X�ζǹF��T�ҳ]�p�������[�c�B�M���ӤH�����ҳ]�p���[�c��5�ӳ椸�A�ñq�����R�F���ŷP���]�p�B�M�s�h�m���]�p�B�H��P���]�p�B�H�Ϥ��ǹF��T���]�p��14���U�����㯸�����]�p�A�O�@���i�H�ۥѨϥΪ��㯸�����]�p�d�Ҷ��C�C�ӳ]�p�ܤֳ��ǳƤF�@�ӳ̰򥻪������d���A�u�n�̷ӥ��ѩҼg���B�J�@�B�B����A�h�L�׬O�֡A�ҥi�@�X�}�G���[�������C\r\n�����H�����Ц����Ѥ��Ҥ��г]�p��HTML�ɮפ�CSS�ɮסA�t�A���ŷP���]�p�B�M�s�h�m���]�p�B�H��P���]�p�B���b�M�n�P���]�p�B�H�Ϥ��ǹF��T���]�p��14���㯸�]�p�C���}�����ɮץi�H�H�קY�ΡA�[�t�����]�p�C'),
(15, 'Time��s�� ���A��', 'ASP.NET 3.5��ǫ���-�ϥ�Visual Basic 2008', 3, 'NE30015', '2009-10-29', 896, 650, '978-986-201-270-3', 1, '���Ѩϥ�VWD�ĩ�Ԥ覡�]�p���������A�H�ƥ�B�z�Ҧ��}�oASP.NET�{�����D�b�A�H�Ψϥβ{���������귽�ӫظm�����C�Ҧp�ϥ�Login����������s�@�|���n�J�{���A�Q�����ұ���i���J�d�򪺿z��A�R���i�{ASP.NET�}�o�����{������K�ʡC\r\n�������~�A������Ʈw�P�s���A��AJAX�����]�p�]�]�t�b���ѽd�򤧤��C������Ʈw�譱�i�ϥβ{������Ʊ���A�X�G���μ��g�{���N�i�H���o��Ʈw����ơA��M�]����z�L���w��SQL�R�O�i���Ʈw���s���C\r\n�b�[���譱�A���ѱN����ASP.NET�{�����y�{�A�øԲӻ���ASP.NET�������H�ƥ�B�z�Ҧ��}�oASP.NET�{���A�]�t���s��PostBack�P�S�w����AutoPostBack���欰�C�������~�A�]�N����AJAX�B�@����z�P�@��������󤣦P�C\r\n\r\n���ѯS��\r\n�� �H�u�ϸѡv���覡�Ӹѻ������B�@�y�{�C\r\n���z�L�j�q�u��ҡv�����U�ر���A�H��@�إ�ASP.NET�����C\r\n���z�L��ѫǡB�����ѧ��B������ï����X��ҡA�ܽd�p��}�o�㦳�S�w�\�઺�����C\r\n���ĥΤ��O�{���X���μҫ�(Inline Code Separation Model�A��@�ɮ׼Ҧ�)�}�oASP.NET�{���AŪ�̤����`�JVB2008�y�k��i�Ƿ|�]�pASP.NET�C\r\n���H�Ѫ���Visual Web Developer 2008 Express�]���tSQL Server Express 2008�^�}�o�����{���A�åB�j�h�ƽd�ҨϥΡi�ɮרt�Ρj�覡�ظm�A���ݲo�AIIS�P��L��Ʈw�Y�i����C\r\n��Ū�̤���������t�Ƿ|�ϥ� ASP.NET�]�p�����A��i�W�i��h���������ѡA�W�j�����]�p���\�O�C'),
(16, '�a�ܬ�� �G�b��', 'Dreamweaver CS4�����]�p���ζ�', 3, 'NE30020', '2009-09-07', 480, 520, '978-986-201-261-1', 1, '���ѥH�d�ҾɦV�A�Q��Step by step�覡�A�޾ɪ�Ǫ̶i�JDreamweaver CS4���@�ɡC�z�L�Ѥ��B�J���оǡA��b�u�ɶ������x�����]�p�ظm���U���\��ޥ��P���ΡC\r\n���e���|�g�A�@�Q�����A��K�Юv�W���@�Ǵ����оǽҵ{�A�ҫ���q���W�U�����D�P��@�D�m�ߡA�i�����ǲ߮ĪG�C�b�U���`����ҳW�e���u���νd�ҡv�A�N�����@�ӧ��㪺�����s�@�C�[�\�d��p�U�G\r\n���������e�m�W��\r\n�Ĥ@���q���Ч����������e�m�@�~�A�ǲߦp��W���������e�A���Ѫ�Ǫ̦b�]�p�����e�������[���P�[�c�C\r\n�������]�p��¦\r\n�ĤG���q�������]�p��¦�A�]�A�إߺ����B�]�w��r�H�j�ƭ��I�B�[�J���H�s�ƭ����B�Ϥ��s�ƥH���ƺ����B�]�w�W�s���H�Z��L���B�H�κ������W�ǻP�޲z�C\r\n�� �h�C��ظm�g\r\n�ĤT���q�ۭ��b�h�C��ظm�A�]�ADiv�]�w�H�F�������B�[�J���إH�h���ƺ����B���J�h�C�骫��BSpry�ե����ΡB�H��CSS�˦��ĪG���B�ΡC\r\n�������޲z�g\r\n�ĥ|���q�����ʡB�u�Ƥλ��P�޲z�����A���и귽�B�Ϯw�P�d�����ϥΡA���ʦ����A�H�Φ欰���O���ϥΡC'),
(17, '��T�͡B�J�j���B�\�@��', 'Java���ʺ�����@ -JSP�P��Ʈw', 3, 'NE30017', '2009-08-13', 656, 620, '978-986-201-250-5', 1, '���ѥH��ǰ�¦�[�I�A���P���JJSP/Html/Java/Access�]�p��Ʈw�����ʺ����ާ@�{���A�C�@�Ӿǲ߭��I���[�\�FJSP�����PAccess ��Ʈw���]�p�P���ΡA�ǥ�148�h�d�ҧ�����RJSP/Access��¦�{���]�p���U�����D�A�̫�H�T�ӹ�Ҩt�γe����ѡA�a��Ū�ֳ̧t�i�J������Ϊ����C\r\n\r\n���ѯS��p�U�G\r\n* JSP/Access/JAVA���ҡGJSP�ϥ�jdk6.0�BTomcat6.0��Access 2007���̷s���t�ΡA���Цp��HJava�y���䴩JSP/Html�����P��Ʈw�����ΡA�إ߲Ĥ@��JSP������Ʈw�C\r\n*���ʦ������]�p�G�]�A���󷧩��B��J���ʡB�w�]����BJava Bean���ΡB��Ʈw��¦�ާ@�B�ϥΪ̻{�ҵ��C\r\n* JSP�P��Ʈw���O�G�]�AJava Bean�P��Ʈw�B��Ƭd�ߡB���X�B��B�E�X��ơB�_���l�d�ߵ��C\r\n*����޲z�]�p�G�H�Ȧ�����b���ҡA�ԲӰQ�ץ���B�z�B��b����P�G�٭׸ɡC\r\n* ��¦�����ج[�G�]�A�����ج[�]�p�P���ΡC�N�������j���ƭӦ������A�U�Ӧ����������������s�A�Ϻ����h���ͰʡA���W�\�����ΡC\r\n* JSP/Access���ι�ҡG�]�A�¸ջP�d�]�t�ΡB�����Ȧ�t�ΡB�ǥ;ަ榨�Z�q���ƨt�ΡA�T�M�t�ι�Ҥ޾ɧ���]�p�P�ާ@�C'),
(18, '�Ф��d�աB�L�ݤ]', 'ActionScript 3.0 ���νd�Ҥj���', 3, 'NE20280', '2009-03-23', 544, 550, '978-986-201-207-9', 1, '���ѯS��\r\n���̷�ActionScript 3.0���U�ع�����Υ\��ӹ�����280�ӳ椸�A��Ū�̥i�H�ֳt�����������e�C\r\n���Բӻ����U���ݩʻP��k���榡�B���A�B�Ǧ^�ȡB�γ~�A�H�Ω������O�C\r\n���H�Ϥ���ܪ����浲�G�A�f�t�d�ҵ{���X�M�y�k�����A���z������q ActionScript 3.0�C\r\n���H�����Ц����F���ѩҦ��d�Ҫ�fla�ɡBswf�ɡBhtml�ɡA��K�z�i��ǲߩM�ק�ϥΡC'),
(19, '�Ʀ�s��', '�����]�p���ζ� -Dreamweaver+PhotoImpact+Flash', 3, 'NE30007', '2009-03-16', 464, 520, '978-986-201-202-4', 1, '�Q�n�s�@��o�ʤH�������κ����ä��O���ơA������Ǫ̨ӻ����������Ӧp���ܳn��A���ѱN���˥HFlash�ӻs�@�����ʵe�A�HPhotoImpact�s�׼v���B�s�@��������A�HDreamweaver�Ӱ���������X�B�z�C�۫H�ݧ����Ѥ���A�]�p�@�Ө�M�~���ǤS��Ϊ������A��z�ӻ�����O��e�����ơC\r\n�Ѥ����e�@�������g�A�����w����������P�]�p�n��@���СA���۱qDreamweaver CS3���s��P��X�}�l�A��PhotoImpact X3���v���s��s�@�A���۷f�tFlash CS3���Ŭ��ʵe�A�T���W�j�����]�p�n��A�H�@�Ϥ@�B�J�ԲӪ��Ϥ�ѻ��覡�A�a��z�`�Ǿާ@�A���P�Ƿ|�Ѥ��Ҧ��ޥ��A�̫�@�g���X���ѩҦ��n�骺�ޥ��A���㪺���ΡA���z�P�������s�@�W�@��������ַP�C�åB���@�����]�p���\�O�A���P�����㦳�ӤH�W�S���檺�����C'),
(20, '���� ', '��������(�ĤG��)', 3, 'NE30010', '2008-12-30', 592, 580, '978-986-201-187-4', 1, '���Ѧҥ���h��Ѯv�оǸg��]�p�s���A�M���j�M�������שҳ]�p���оǥήѡC\r\n���Ѥ��H�ϸѩM�Ӯרӽͽ׺������B�@�����A�קK�}�`�޳N�A��K�Ѯv�½ҡC\r\n���Ѥ��]�w��²����������@�m�ߡA��Ū�̥i�ۦ�ǲߤ��ΡC\r\n��������¦�g�������к������U�إγ~�P�����F�q�T��w�M�����ҫ��h���Э��n��OSI�C�h��w�MDoD�|�h��w�F�Ӷǿ�C���M�M�����]�ơA�h���Хثe��ڹB�Ϊ��C���M�����A��Ū�̪��D��ں���������զ��C\r\n��������z�g�w������B�@����z�Ӷi�����`�J���ͽסC�`�J���аϰ�������D�y-�A�Ӻ����M�s������A�]�AADSL�MCable Modem���F�t�~����DoD�ҫ��̭��n��IP�h�MTCP�h��������z�C\r\n�����μh�g�Y�Q�׺������μh���n���������ΩM���z�C�Ҧp�GDNS�M DHCP�BWWW�B�ɮ׶ǿ��w(FTP)�P�I���I�ǿ�(P2P)�B�q�l�l��POP3�MSMTP��w�B�Y�ɳq�n��M�����q�ܵ����C\r\n���L�u�����M��T�w���g�h���Q�L�u�����M��T�w���������ΩM��z�C'),
(21, '�L�u�_', 'Joomla�ϸѬ[���������', 3, 'NE20279', '2008-11-25', 560, 490, '978-986-201-178-2', 1, '���z���P�[�]�κ޲z���ʦ����������L�Q��-Joomla\r\n���ѬO�H��B�����Ū�Ū�̬��ɦV�A�NJoomla���ާ@�{�Ǥά[�]�������\��A�Q�ιϸѥ[�W��ҾɦV���覡�A���z�`�J�L�X�a�޻��Joomla���̰�����C���Ѥ��e�����]�t���ݥD�����[�]��Joomla�����޲z�B���e�޲z�B����޲z���A�t�~�ٱM���`�J��Ū�̤���Joomla���X�R�M��C�z�L�H�����Ъ��ʺA�ާ@�ܽd�ι�a�غc�A���ѵ���O�z�b�[�]Joomla���ʦ������ɪ����Ƥu��ѡC\r\n\r\n���Q�ΨB�J�����ϸѻ����A�a�z�@�B�B�x��Joomla������\r\n���H�Ӯ׹�Ҫ��ѪR��k�A��a���i�z��Joomla��Ըg��\r\n�� �M�����R�����B���B���e�B���󵥺޲z�A���z�����P�P����Joomla�F�H\r\n���z�L�H�����Ф����ʺA�оǾާ@�ܽd�A�a�z�������[�����ֽ�\r\n�� ���вŦXŪ�̻ݨD���X�R�M��A�[�]�ӤH�ƪ�Joomla���ʦ�����\r\n���ѧ@�̺���ù�u�W���[���귽�A���z��������[�״I�� '),
(22, '�e�u��� ����', 'Web CSS�����]�p�j��', 3, 'NE20277', '2008-10-29', 448, 580, '978-986-201-169-0', 1, '�����e�`�J�L�X�A�t�X�d�ҸԲӸѻ�\r\n���ѥH�W�S�������覡�w��CSS�]�p�޳N����z�M��k�i�����ѡA�ŦX�۾Ǧۭת��ѦһP���ΡC�t�X�Ѥ����ѤΥ��Ъ��d�ҡAŪ�̤�������M�A�ӥB����ҥH�M�A���դF�D�z����A���ΰ_�ӴN��C�b���l�C\r\n���@�y�@�~���d�ҹ�@�ޥ��P�g�����\r\n���ѱa��j�a�`�J�����A�óz�L��@�P����A��Ū�̦ۤv��|�C��U�س]�p���`�Ϊ����������M�����t�m���]�p���ѧ��㪺����M�s�@��k�A��ǲߩM�u�@�L�{���J�쪺���D���ѹL�ӤH���g����ɡC\r\n���ɤU�̬y�檺�]�p���Χޥ��P��@\r\n��U�غ��������M�����t�m�覡�A�]�A�U�ؾɯ�B�����\���]�������B�������B�T�w�e�ת��B�ۧڽվ�e�ת��B�U�Ԫ����^�ATab���O�B�i���X�����O�M���|�����O�A�H�ΦU�ئh�榡�s�ƪ������t�m�]�T�w�e�ת��B�ܤƼe�ת��B�T�w�e�׻P�ܤƼe�׵��X���^�K�����A�����ѸԲӪ������M�k�ǡA�K��Ū�̦b�z�Ѫ���¦�W�A�����ק��ϥΡC\r\n�@�̻P�uCSS�I�N���v���Ыت�Dave Shea���o�F�s���A����o�F�ϥ��I�N���@�~�����v�C���ѷ|���X�I�N�����������@�Ǻ�m�רҡA���X�ޥ��P�]�p�����R�M�����C�̫�N��X�e���ҾǡA�q�зN�B����������ڧ��������L�{�A���i��ڻs�@�X�@�y�@�~����O�C'),
(23, '�L�s�w', 'Flash CS3 ActionScript 3.0���ε{���]�p', 3, 'NE20265', '2007-11-22', 560, 520, '978-986-201-067-9', 1, '���ԭz ActionScript 3.0 ���[��\r\nActionScript 3.0 ���y�k�u���򥻪������M ActionScript 2.0 �ۦP�A�ƥ�B�z�B���O�w�q�M API �������h���t���C�ϥ�Flash CS3��M�n�ϥ�ActionScript 3.0�A�Y�u�O�ϥ�ActionScript 2.0�A��M�O���d�b�Q�^�O����t�A�M�ϥ��ª�����Flash�ۮt�L�X�C���ѱq�̰򥻪��y�k�B�̰򥻪��[���}�l�A�@�B�B�a��Ū�̶i�J ActionScript 3.0����_�@�ɡC\r\n�����C����ɦV���ǲߪ��e\r\n�H�A��Ĵ�뻡������ɦV�{���]�p�A�åH�d�ҦL���[���A��MActionScript 3.0�M�䥦����ɦV�{���y�������P�C\r\n���ӻ���ı����P�ե󪺨ϥ�\r\n�J�ӻ�����ı���󪺬[�c�άۤ����Y�A�åH�d�һ����U�Ӳե󪺥Ϊk�����ΡC\r\n���O�[���Ѥ]�O�d�Ү�\r\n���ѲĤ@�����u��¦�y�k�P����ɦV�v������бԭz���[���A�åH�d�һ����[���A��íActionScript 3.0��¦�C�ĤG�����u��ı����P�ե�v�M�ĤT�����u��ƥ洫�PXML�v�ϥΤj�q�d�һ����`�����O���Ϊk�A��Ū�̶}�o�M�׮ɯ��o������C');

-- --------------------------------------------------------

--
-- ��ƪ��c `product_color`
--

CREATE TABLE `product_color` (
  `sid` int(11) NOT NULL,
  `product_sid` int(11) NOT NULL,
  `color` varchar(255) NOT NULL,
  `size` int(11) NOT NULL,
  `p_no` varchar(255) NOT NULL,
  `imgs` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- �ɦL��ƪ���� `product_color`
--

INSERT INTO `product_color` (`sid`, `product_sid`, `color`, `size`, `p_no`, `imgs`) VALUES
(1, 2, '����', 10, 'bbb_red_10_001', 'a.png,bb.png,c.jpg'),
(2, 2, '�Ŧ�', 15, '', ''),
(3, 2, '����', 20, 'bbb_red_20_002', ''),
(4, 2, '�Ŧ�', 30, '', '');

--
-- �w�ɦL��ƪ�����
--

--
-- ��ƪ���� `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`sid`);

--
-- ��ƪ���� `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`sid`);

--
-- ��ƪ���� `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`sid`),
  ADD KEY `order_sid` (`order_sid`),
  ADD KEY `product_sid` (`product_sid`);

--
-- ��ƪ���� `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`sid`);

--
-- ��ƪ���� `product_color`
--
ALTER TABLE `product_color`
  ADD PRIMARY KEY (`sid`),
  ADD KEY `product_sid` (`product_sid`);

--
-- �b�ɦL����ƪ�ϥΦ۰ʻ��W(AUTO_INCREMENT)
--

--
-- �ϥθ�ƪ�۰ʻ��W(AUTO_INCREMENT) `categories`
--
ALTER TABLE `categories`
  MODIFY `sid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- �ϥθ�ƪ�۰ʻ��W(AUTO_INCREMENT) `orders`
--
ALTER TABLE `orders`
  MODIFY `sid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- �ϥθ�ƪ�۰ʻ��W(AUTO_INCREMENT) `order_details`
--
ALTER TABLE `order_details`
  MODIFY `sid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- �ϥθ�ƪ�۰ʻ��W(AUTO_INCREMENT) `products`
--
ALTER TABLE `products`
  MODIFY `sid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- �ϥθ�ƪ�۰ʻ��W(AUTO_INCREMENT) `product_color`
--
ALTER TABLE `product_color`
  MODIFY `sid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
