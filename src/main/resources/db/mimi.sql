-- --------------------------------------------------------
-- Máy chủ:                      127.0.0.1
-- Server version:               11.1.2-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Phiên bản:           12.6.0.6765
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for webstore
DROP DATABASE IF EXISTS `webstore`;
CREATE DATABASE IF NOT EXISTS `webstore` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */;
USE `webstore`;

-- Dumping structure for table webstore.danhmuc
DROP TABLE IF EXISTS `danhmuc`;
CREATE TABLE IF NOT EXISTS `danhmuc` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=176 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table webstore.danhmuc: ~9 rows (approximately)
REPLACE INTO `danhmuc` (`id`, `name`) VALUES
	(148, 'Iphone'),
	(149, 'Watch'),
	(150, 'iPad'),
	(151, 'Mac'),
	(152, 'AirPods'),
	(153, 'Phụ kiện'),
	(169, 'admin'),
	(174, 'LÃ  anh');

-- Dumping structure for table webstore.giohang
DROP TABLE IF EXISTS `giohang`;
CREATE TABLE IF NOT EXISTS `giohang` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idpro` int(11) DEFAULT NULL,
  `iduser` int(11) DEFAULT NULL,
  `soluong` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_giohang_taikhoan` (`iduser`),
  KEY `FK_giohang_sanpham` (`idpro`),
  CONSTRAINT `FK_giohang_sanpham` FOREIGN KEY (`idpro`) REFERENCES `sanpham` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_giohang_taikhoan` FOREIGN KEY (`iduser`) REFERENCES `taikhoan` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=133 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table webstore.giohang: ~3 rows (approximately)
REPLACE INTO `giohang` (`id`, `idpro`, `iduser`, `soluong`) VALUES
	(128, 87, 48, 1),
	(129, 86, 48, 1),
	(132, 88, 48, 1);

-- Dumping structure for table webstore.hoadon
DROP TABLE IF EXISTS `hoadon`;
CREATE TABLE IF NOT EXISTS `hoadon` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idpro` int(11) DEFAULT NULL,
  `iduser` int(11) DEFAULT NULL,
  `dongia` double(10,2) DEFAULT NULL,
  `soluong` int(11) DEFAULT NULL,
  `tinhtrang` int(11) DEFAULT NULL,
  `ngaytao` date DEFAULT NULL,
  `ngaythanhtoan` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_hoadon_taikhoan` (`iduser`),
  KEY `FK_hoadon_sanpham` (`idpro`),
  CONSTRAINT `FK_hoadon_sanpham` FOREIGN KEY (`idpro`) REFERENCES `sanpham` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_hoadon_taikhoan` FOREIGN KEY (`iduser`) REFERENCES `taikhoan` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table webstore.hoadon: ~0 rows (approximately)

-- Dumping structure for table webstore.sanpham
DROP TABLE IF EXISTS `sanpham`;
CREATE TABLE IF NOT EXISTS `sanpham` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `price` double(10,2) NOT NULL,
  `soluong` int(11) NOT NULL,
  `img` varchar(255) NOT NULL,
  `mota` text NOT NULL,
  `iddm` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Fk_sanpham_danhmuc` (`iddm`),
  CONSTRAINT `Fk_sanpham_danhmuc` FOREIGN KEY (`iddm`) REFERENCES `danhmuc` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=113 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table webstore.sanpham: ~26 rows (approximately)
REPLACE INTO `sanpham` (`id`, `name`, `price`, `soluong`, `img`, `mota`, `iddm`) VALUES
	(86, 'Iphone 15 Pro', 999.00, 13, 'iphone15pro-digitalmat-gallery-3-202309.png', 'Màn hình Super Retina XDR 6,1 inchChú thích¹ có ProMotion, Always-On và Dynamic Island\r\nThiết kế titan mạnh mẽ và nhẹ với nút Hành động — theo dõi nhanh tính năng yêu thích của bạn\r\nCamera chính 48MP cho ảnh độ phân giải siêu cao và camera tele 3x\r\nChip A17 Pro mang đến một bước nhảy vọt về hiệu suất đồ họa, biến đổi chơi game trên thiết bị di động\r\nĐầu nối USB-C với USB 3 cho tốc độ truyền nhanh hơn tới 20 lầnChú thích² và quy trình làm việc chuyên nghiệp mới', 148),
	(87, 'Iphone 15', 799.00, 26, 'iphone15-digitalmat-gallery-4-202309.png', 'Thiết kế nhôm và kính màu bền bỉ 6,1 inchChú thích◊ với mặt trước Ceramic Shield\r\nDynamic Island tạo bong bóng cảnh báo và Hoạt động trực tiếp - vì vậy bạn không bỏ lỡ chúng trong khi bạn đang làm việc khác\r\nCamera chính 48MP với 2x Tele chụp chi tiết ngoạn mục ở gần hoặc xa\r\nA16 Bionic hỗ trợ khả năng chụp ảnh tính toán và hiệu suất chơi game mượt mà với hiệu quả tuyệt vời cho thời lượng pin cả ngày\r\nKết nối và sạc bằng USB-C', 148),
	(88, 'Iphone 14', 699.00, 6, 'iphone14-digitalmat-gallery-3-202209.png', 'Thiết kế nhôm và kính màu bền bỉ 6,1 inchChú thích◊ với mặt trước Ceramic Shield\r\nDynamic Island tạo bong bóng cảnh báo và Hoạt động trực tiếp - vì vậy bạn không bỏ lỡ chúng trong khi bạn đang làm việc khác\r\nCamera chính 48MP với 2x Tele chụp chi tiết ngoạn mục ở gần hoặc xa\r\nA16 Bionic hỗ trợ khả năng chụp ảnh tính toán và hiệu suất chơi game mượt mà với hiệu quả tuyệt vời cho thời lượng pin cả ngày\r\nKết nối và sạc bằng USB-C', 148),
	(89, 'Iphone 13', 599.00, 8, 'iphone13-digitalmat-gallery-3-202203.png', 'Màn hình Super Retina XDR 6,1 inchChú thích¹\r\nHệ thống camera kép cho hình ảnh và video ánh sáng yếu đáng kinh ngạc\r\nA15 Bionic với GPU 4 lõi cho hiệu suất nhanh như chớp\r\nLá chắn gốm, và khả năng chống nước và bụiChú thích²\r\n5G để tải xuống siêu nhanh và phát trực tuyến chất lượng caoChú thích³', 148),
	(90, 'Iphone SE', 429.00, 10, 'iphonese-digitalmat-gallery-3-202203.png', 'Màn hình Retina HD 4,7 inchChú thích¹ tươi sáng, đầy màu sắc và sắc nét\r\nA15 Bionic, con chip siêu mạnh tương tự có trong iPhone 13\r\n5G để tải xuống nhanh và phát trực tuyến chất lượng caoChú thích²\r\nMáy ảnh thông minh hơn giúp điều chỉnh tự động để khuôn mặt, địa điểm, mọi thứ trông tuyệt vời\r\nNút Home với Touch ID — mở khóa an toàn, đăng nhập vào ứng dụng và sử dụng Apple Pay', 148),
	(91, 'Apple Watch Series 9', 399.00, 9, 'watch-s9-digitalmat-gallery-5-202309.png', 'Màn hình Retina Always-On sáng hơn với tinh thể phía trước bền, chống nứt\r\nNhận thông tin chi tiết sâu sắc về sức khỏe thể chất và tinh thần của bạn bao gồm nhịp tim,Chú thích1 nồng độ oxy trong máu,Chú thích2 tâm trạng và hơn thế nữa\r\nVới số liệu và chế độ xem tập luyện nâng cao\r\nS9 SiP hoàn toàn mới cung cấp năng lượng cho một cách mới kỳ diệu để sử dụng đồng hồ của bạn mà không cần chạm vào màn hình\r\nCác tính năng an toàn sáng tạo bao gồm SOS khẩn cấp,Chú thích3 Phát hiện ngã và phát hiện va chạm', 149),
	(92, 'Apple Watch Ultra 2', 799.00, 13, 'watch-ultra2-digitalmat-gallery-3-202309.png', 'Vỏ titan 49mm cứng cáp với nút Hành động có thể tùy chỉnh tạo ra sự cân bằng với trọng lượng, độ chắc chắn và khả năng chống ăn mòn\r\nS9 SiP hoàn toàn mới cung cấp năng lượng cho màn hình sáng nhất của chúng tôi từ trước đến nay và một cách mới kỳ diệu để sử dụng đồng hồ của bạn mà không cần chạm vào màn hình\r\nGPS chính xác nhất trong đồng hồ thể thao trong môi trường đô thị dày đặcChú thích1\r\nThời lượng pin lên đến 36 giờ, lên đến 72 giờ ở cài đặt năng lượng thấp,Chú thích2 và lên đến 17 giờ sử dụng tập luyện ở Chế độ nguồn điện thấpChú thích3\r\nKết hợp với ba phong cách ban nhạc chuyên biệt cho cuộc phiêu lưu ngoài trời, thể thao dưới nước và tất cả các loại tập luyện', 149),
	(93, 'Apple Watch SE', 249.00, 12, 'watch-se-digitalmat-gallery-1-202309.png', 'Gọi và nhắn tin ngay cả khi bạn không có iPhone ở gần với các kiểu máy GPS + CellularChú thích1\r\nNhận số liệu và lượt xem bài tập nâng cao\r\nTheo dõi các giai đoạn giấc ngủ của bạn với ứng dụng Ngủ và kiểm tra nhịp tim của bạn bất cứ lúc nào\r\nCác tính năng an toàn sáng tạo bao gồm SOS khẩn cấp,Chú thích2 Phát hiện ngã và phát hiện va chạm\r\nThiết lập gia đình cho phép bạn ghép nối đồng hồ cho các thành viên gia đình mà không cần iPhoneChú thích3', 149),
	(94, 'Apple Hermès Watch', 1249.00, 11, 'watch-card-40-hermes-202309.jpg', 'Dây đeo và mặt đồng hồ độc quyền của Hermès\r\nMàn hình Retina Always-On sáng hơn với tinh thể phía trước bền, chống nứt\r\nNhận thông tin chi tiết sâu sắc về sức khỏe thể chất và tinh thần của bạn bao gồm nhịp tim,Chú thích1 nồng độ oxy trong máu,Chú thích2 tâm trạng và hơn thế nữa\r\nS9 SiP hoàn toàn mới cung cấp năng lượng cho một cách mới kỳ diệu để sử dụng đồng hồ của bạn mà không cần chạm vào màn hình\r\nCác tính năng an toàn sáng tạo bao gồm SOS khẩn cấp,Chú thích3 Phát hiện ngã và phát hiện va chạm', 149),
	(95, 'iPad Pro 11 inch', 799.00, 18, 'ipadpro11-digitalmat-gallery-1-202210.png', 'Chip Apple M2 mang lại bước nhảy vọt lớn về hiệu suất cho quy trình làm việc chuyên nghiệp và thời lượng pin cả ngày¹\r\nMàn hình Liquid Retina 11 inchChú thích² với ProMotion, True Tone và màu rộng P3\r\nMáy ảnh chuyên nghiệp với Máy quét LiDAR và camera trước Ultra Wide với Sân khấu trung tâm\r\nWi-Fi 6E cho kết nối Wi-Fi nhanh nhất. Và 5G để tải xuống siêu nhanh và phát trực tuyến chất lượng cao.³\r\nTương thích với Apple Pencil (thế hệ 2), Magic Keyboard và Smart Keyboard FolioChú thích⁴', 150),
	(96, 'iPad Pro 12.9 inch', 1099.00, 39, 'ipadpro12-digitalmat-gallery-3-202210.png', 'Chip Apple M2 mang lại bước nhảy vọt lớn về hiệu suất cho quy trình làm việc chuyên nghiệp và thời lượng pin cả ngày¹\r\nMàn hình Liquid Retina XDR 12,9 inchChú thích² với ProMotion, True Tone và màu rộng P3\r\nMáy ảnh chuyên nghiệp với Máy quét LiDAR và camera trước Ultra Wide với Sân khấu trung tâm\r\nWi-Fi 6E cho kết nối Wi-Fi nhanh nhất. Và 5G để tải xuống siêu nhanh và phát trực tuyến chất lượng cao.³\r\nTương thích với Apple Pencil (thế hệ 2), Magic Keyboard và Smart Keyboard FolioChú thích⁴', 150),
	(97, 'iPad Air', 599.00, 38, 'ipadair-digitalmat-gallery-2-202203_GEO_US.png', 'Chip Apple M1 cung cấp hiệu suất cấp độ tiếp theo và thời lượng pin cả ngàyChú thích¹\r\nMàn hình Liquid Retina 10,9 inch mang đến trải nghiệm xem đắm chìmChú thích²\r\nCamera trước siêu rộng 12MP với Center Stage cho các cuộc gọi video tự nhiên hơn\r\nNhận 5G cực nhanh trên các kiểu máy di động và Wi-Fi siêu nhanh với Wi-Fi 6Chú thích³\r\nTương thích với Apple Pencil (thế hệ 2), Magic Keyboard và Smart Keyboard FolioChú thích⁴', 150),
	(98, 'iPad Gen 10', 449.00, 41, 'ipad-digitalmat-gallery-3-202210.png', 'Chip A14 Bionic cho phép bạn chạy nhiều ứng dụng và hoạt động trơn tru giữa chúng\r\nThiết kế toàn màn hình với màn hình Liquid Retina 10,9 inch¹ mang đến trải nghiệm xem tuyệt vời\r\nCamera trước Landscape 12MP Ultra Wide với Center Stage cho trải nghiệm gọi điện video tuyệt vời\r\nDuy trì kết nối với Wi-Fi 6 và 5G không dây siêu nhanh²\r\nTương thích với Apple Pencil (thế hệ 1), ³ Magic Keyboard Folio và Smart Folio⁴', 150),
	(99, 'iPad Gen 9', 329.00, 30, 'ipad-digitalmat-gallery-1-202111.png', 'Chip A13 Bionic với Neural Engine giúp mọi thứ bạn làm trở nên cực kỳ nhạy\r\nMàn hình Retina 10,2 inch với True Tone cho chi tiết đáng kinh ngạc và màu sắc sống động\r\nCamera trước siêu rộng 12MP với Center Stage cho các cuộc gọi video tuyệt vời\r\nKết nối nhanh với Wi-Fi 802.11ac và dữ liệu di động LTE lớp GigabitChú thích¹\r\nTương thích với Apple Pencil (thế hệ 1) và Bàn phím thông minh²', 150),
	(100, 'iPad Mini', 499.00, 52, 'ipad-mini-digitalmat-gallery-1-202111.png', 'Chip A15 Bionic cho hiệu suất đáng kinh ngạc và thời lượng pin cả ngàyChú thích¹\r\nMàn hình Liquid Retina 8,3 inch tuyệt đẹp với True Tone và màu rộng P3Chú thích²\r\nCamera trước siêu rộng 12MP với Center Stage cho các cuộc gọi video tuyệt vời\r\n5G và Wi-Fi 6 cho kết nối cực nhanhChú thích³\r\nTouch ID được tích hợp vào nút trên cùng để xác thực an toàn và Apple Pay', 150),
	(101, 'Macbook Air 13 inch', 999.00, 64, 'mac11_13inch.png', 'Chip Apple M1 mang lại hiệu suất CPU, GPU và máy học mạnh mẽ\r\nThời lượng pin lên đến 18 giờ để bạn có thể sử dụng lâu hơn bao giờ hếtChú thích1\r\nMàn hình Retina với màu sắc rực rỡ và chi tiết đáng kinh ngạc\r\nBộ nhớ SSD siêu nhanh mở ứng dụng và tệp ngay lập tức\r\nThiết kế không quạt cho hoạt động im lặng', 151),
	(102, 'Macbook Pro 13 inch', 1299.00, 73, 'mbp-digitalmat-gallery-1-202206.png', 'Hoàn thành nhiều việc nhanh hơn với chip Apple M2 thế hệ tiếp theo và hệ thống làm mát chủ động duy trì mức hiệu suất chuyên nghiệp\r\nĐi cả ngày lẫn đêm với thời lượng pin lên đến 20 giờChú thích¹\r\nMàn hình Retina với độ sáng 500 nits mang lại màu sắc rực rỡ và chi tiết đáng kinh ngạc\r\nHai cổng Thunderbolt cho phép bạn kết nối và cấp nguồn cho các phụ kiện tốc độ cao', 151),
	(103, 'Macbook Pro 14 inch', 1999.00, 75, 'mbp-14-digitalmat-gallery-1-202301.png', 'M2 Pro hoặc M2 Max - chip mạnh mẽ và hiệu quả nhất từng có trong máy tính xách tay chuyên nghiệp - giúp bạn đảm nhận các dự án đòi hỏi khắt khe nhất\r\nSử dụng cả ngày với thời lượng pin lên đến 18 giờ,¹ nhờ hiệu quả của Apple silicon\r\nMàn hình Liquid Retina XDR là màn hình tốt nhất từ trước đến nay trong máy tính xách tay, với Dải động cực cao, độ tương phản đáng kinh ngạc và màu sắc chân thực\r\nNhìn sắc nét và âm thanh rõ ràng - ở bất cứ đâu - với camera FaceTime HD 1080p, ba micrô chất lượng phòng thu và sáu loa với Âm thanh không gian\r\nKết nối mọi thứ bạn cần với ba cổng Thunderbolt 4, khe cắm thẻ SDXC, cổng HDMI và cổng MagSafe 3', 151),
	(104, 'iMac 24 inch', 1299.00, 19, 'imac24-digitalmat-gallery-2-202111.png', 'Chip Apple M1 mang lại hiệu suất CPU, GPU và máy học mạnh mẽ\r\nMàn hình Retina 4.5K sống độngChú thích¹\r\nThiết kế mỏng 11,5 mm nổi bật với bảy màu sắc rực rỡ\r\nCamera FaceTime HD 1080p, hệ thống âm thanh sáu loa có độ trung thực cao và dãy micrô chất lượng phòng thu\r\nMagic Mouse và Magic Keyboard phù hợp với màu sắc', 151),
	(105, 'AirPod Gen 2', 129.00, 15, 'og__bz8g5g9sbyoi_specs.png', 'Cảm biến AirPods (mỗi):\r\nMicrô tạo chùm tia kép\r\n\r\nCảm biến quang học kép\r\n\r\nGia tốc kế phát hiện chuyển động\r\n\r\nGia tốc kế phát hiện giọng nói\r\n\r\nChip\r\nChip tai nghe H1\r\n\r\nĐiều khiển\r\nNhấn đúp để phát, chuyển tiếp hoặc trả lời cuộc gọi điện thoại\r\n\r\nNói "Hey Siri" để thực hiện những việc như phát bài hát, thực hiện cuộc gọi hoặc nhận chỉ đường\r\n\r\nKích thước và trọng lượng\r\nAirPods (mỗi chiếc): 0,65 x 0,71 x 1,59 inch (16,5 x 18,0 x 40,5 mm)⁷\r\n\r\nHộp sạc Lightning: 1.74 x 0.84 x 2.11 inch (44.3 x 21.3 x 53.5 mm)⁷\r\n\r\nAirPods (mỗi): 0,14 ounce (4 g)⁷\r\n\r\nHộp sạc Lightning: 1,35 ounce (38,2 g)⁷\r\n\r\nHộp sạc\r\nHoạt động với đầu nối Lightning\r\n', 152),
	(106, 'AirPod Gen 3', 169.00, 17, 'airpods3-e1634579735355.png', 'Cập nhật thiết kế\r\nAirPods có trọng lượng nhẹ và có thiết kế đường viền. Chúng nằm ở góc vừa phải để tạo sự thoải mái và hướng âm thanh đến tai bạn tốt hơn. Thân máy ngắn hơn 33% so với AirPods (thế hệ 2) và bao gồm cảm biến lực để dễ dàng điều khiển nhạc và cuộc gọi.', 152),
	(107, 'AirPod Max', 549.00, 29, 'airpods-max-select-pink-202011.png', 'Chế độ trong suốt và khử tiếng ồn chủ động\r\n\r\n—\r\n\r\n\r\nÂm thanh không gian được cá nhân hóa với tính năng theo dõi chuyển động đầu chủ độngᴼ\r\n\r\n—\r\n\r\n\r\nỐp lưng thông minh\r\n\r\n20 giờ\r\n\r\nThời gian nghe lên đến 20 giờ với một lần sạcOOO', 152),
	(108, 'Ốp lưng MagSafe', 69.00, 8, 'MT4J3.png', 'Được làm từ microtwill, chất liệu bền bỉ đem lại cảm giác mềm mại, giống như da lộn. Chất liệu Vải Tinh Dệt cũng được thiết kế thân thiện với môi trường. Chất liệu này làm từ 68% thành phần được tái chế sau tiêu dùng và giảm đáng kể lượng khí thải carbon so với chất liệu da. Ốp lưng nhanh chóng hút vào đúng vị trí và vừa khít với iPhone mà không bị cộm.\r\n\r\nVới các nam châm tích hợp có thể căn chuẩn vị trí sạc của iPhone 15 Pro, bạn luôn có thể tháo và gắn ốp lưng này vào điện thoại một cách hết sức dễ dàng, thuận tiện và sạc không dây nhanh hơn. Đến lúc cần sạc, cứ gắn cả iPhone đang có ốp lưng vào bộ sạc MagSafe hoặc đặt lên bộ sạc chuẩn Qi.', 153),
	(109, 'Ốp trong suốt MagSafe', 55.00, 36, 'MT223.png', 'Mỏng, nhẹ và dễ cầm, ốp lưng do Apple thiết kế này phô diễn được màu sắc tuyệt vời của iPhone 15 Pro, đồng thời còn là lớp bảo vệ tăng cường.\r\n\r\nĐược chế tạo từ hỗn hợp chất liệu polycarbonate trong suốt và chất liệu dẻo, ốp lưng vừa khít với các nút bấm của điện thoại, vô cùng tiện dụng. Bề mặt bên ngoài và cả bên trong đều được phủ một lớp chống trầy. Toàn bộ vật liệu và lớp phủ được tối ưu hóa để không ngả vàng theo thời gian.', 153),
	(110, 'Bộ sạc MagSafe', 51.00, 42, 'MHXH3.png', 'Bộ Sạc MagSafe khiến cho việc sạc không dây trở nên cực kỳ dễ dàng. Các nam châm cân chỉnh vị trí sạc này gắn với iPhone 12 trở lên, giúp sạc không dây nhanh hơn với công suất lên đến 15W.\r\n\r\nBộ sạc MagSafe tương thích với bộ sạc Qi, vì vậy bộ sạc này có thể được dùng để sạc không dây iPhone 8 hoặc các phiên bản cao hơn cũng như các phiên bản AirPods có hộp sạc không dây, tương tự như cách sử dụng các bộ sạc không dây chuẩn Qi.', 153),
	(111, 'Dây đồng hồ Nike', 60.00, 83, 'MTL53.png', '\r\nDây Quấn Thể Thao Nike được thiết kế lại để tận dụng sợi dư từ các mùa trước để tạo ra một loại dây đeo mềm, nhẹ và thoáng khí cùng họa tiết táo bạo. Nút cài băng dính dán và một vấu kéo bện hình Nike Swoosh giúp bạn dễ dàng điều chỉnh khi di chuyển. Kiểu bện nylon 2 lớp tạo ra các đường vòng kín ở mặt tiếp xúc với da, tạo nên lớp đệm êm ái nhưng vẫn có thể thoát ẩm.\r\n\r\nDây Quấn Thể Thao Nike chứa ít nhất 68% sợi dư từ các mùa trước, giúp tiết kiệm hơn 3 tấn sợi sơ cấp.', 153);

-- Dumping structure for table webstore.taikhoan
DROP TABLE IF EXISTS `taikhoan`;
CREATE TABLE IF NOT EXISTS `taikhoan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` varchar(255) NOT NULL,
  `pass` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `tel` varchar(20) NOT NULL,
  `role` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table webstore.taikhoan: ~2 rows (approximately)
REPLACE INTO `taikhoan` (`id`, `user`, `pass`, `email`, `address`, `tel`, `role`) VALUES
	(48, 'admin', '1234', 'khanhhqph20927@fpt.edu.vn', 'hà nội', '0346540479', 'ADMIN'),
	(57, 'oni', '1234', 'oni@gmail.com', 'HÃ  Ná»i', '0123456789', 'USER'),
	(58, 'haokki', '1234', 'hah2@gmail.com', 'Nghệ An', '0789654123l', 'USER');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
