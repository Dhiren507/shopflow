import 'package:shopflow/core/constants/app_images.dart';
import 'package:shopflow/core/constants/app_routes.dart';

class ProfileConstants {
  static const List<Map<String, dynamic>> profileOptions = [
    {
      'leadingIcon' : AppImages.editProfilePerson,
      'optionText' : 'Edit Profile',
       'navigateTo' : AppRoutes.sellerDashboardScreen
    },
    {
      'leadingIcon' : AppImages.documentPaperIcon,
      'optionText' : 'Order History',
      'navigateTo' : AppRoutes.sellerDashboardScreen
    },
    {
      'leadingIcon' : AppImages.locationMarkIcon,
      'optionText' : 'Addresses',
      'navigateTo' : AppRoutes.sellerDashboardScreen
    },
    {
      'leadingIcon' : AppImages.bellIcon,
      'optionText' : 'Notifications',
      'navigateTo' : AppRoutes.sellerDashboardScreen
    },
    {
      'leadingIcon' : AppImages.helperTooltipIcon,
      'optionText' : 'Help & Support',
      'navigateTo' : AppRoutes.sellerDashboardScreen
    },
  ];
}