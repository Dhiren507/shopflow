import 'package:shopflow/core/constants/app_images.dart';

class ProfileConstants {
  static const List<Map<String, dynamic>> profileOptions = [
    {
      'leadingIcon' : AppImages.editProfilePerson,
      'optionText' : 'Edit Profile'
    },
    {
      'leadingIcon' : AppImages.documentPaperIcon,
      'optionText' : 'Order History'
    },
    {
      'leadingIcon' : AppImages.locationMarkIcon,
      'optionText' : 'Addresses'
    },
    {
      'leadingIcon' : AppImages.bellIcon,
      'optionText' : 'Notifications'
    },
    {
      'leadingIcon' : AppImages.helperTooltipIcon,
      'optionText' : 'Help & Support'
    },
  ];
}