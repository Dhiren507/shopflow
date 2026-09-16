import 'package:shopflow/core/constants/app_images.dart';
import 'package:shopflow/core/constants/app_routes.dart';

class AppStrings {
  static const String appName = 'ShopFlow';
  static const String splashLoadingText = 'Elevating Your retail experience.';

  // on boarding stepper screen text
  static const String introScreenOneTitle = 'Discover Everything You Need';
  static const String introScreenOneSubtitle =
      'Browse thousands of products curated just for you.';

  static const String introScreenTwoTitle = 'Track Your Orders Easily';
  static const String introScreenTwoSubTitle =
      'Get real-time updates from cart to doorstep.';

  static const String introScreenThreeTitle = 'Fast & Secure Checkout';
  static const String introScreenThreeSubtitle =
      'Shop with confidence, every single time.';

  static const String getStartedText = 'Get Started';
  static const String nextText = 'Next';
  static const String skipText = 'Skip';

  // Login Screen Text
  static const String usernameText = 'Username';
  static const String usernameHintText = 'Enter your Username';

  static const String passwordText = 'Password';
  static const String passwordHintText = 'Enter your Password';

  static const String loginErrorText = 'Invalid Credentials';
  static const String loginButtonText = 'Log In';

  static const String helperText = 'Use Demo Account';
  static const String greetingText = 'Welcome Back';

  // Tab Bar Bottom Label Text
  static const String tabBarLabelOne = 'Home';
  static const String tabBarLabelTwo = 'Cart';
  static const String tabBarLabelThree = 'My Products';
  static const String tabBarLabelFour = 'Profile';

  // Product Detail Screen Text
  static const String addToCartText = 'Add to Cart';
  static const String totalPriceText = 'Total Price';
  static const String reviewSectionHeaderText = 'Customer Reviews';
  static const String showLessReviewsText = 'Show Less Reviews';
  static const String viewAllReviews = 'View All Reviews';
  static const String productDescriptionHeaderText = 'Product Description';
  static const String quantitySectionText = 'Quantity';
  static const String noProductReviewsText = 'No Product Reviews';

  // Cart Screen Text
  static const String yourCartTitle = 'Your Cart';
  static const String subTotalText = 'SubTotal';
  static const String discountText = 'Discount';
  static const String deliveryText = 'Delivery';
  static const String freeText = 'Free';
  static const String totalText = 'Total';
  static const String checkoutNowButtonText = 'Checkout Now';

  // Empty Cart Screen Text
  static const String startShoppingText = 'Start Shopping';
  static const String emptyCartMainText = 'Your cart is empty';
  static const String emptyCartSubText =
      "Looks like you haven't added anything to your cart yet.";

  // Add Product Screen Text
  static const String addProductTitle = 'Add Product';
  static const String addProductHelperText = 'Helper Test when clicked on';
  static const String productImagesText = 'Product Images';
  static const String uploadImagesSubText = 'Upload up to 4 high-quality images.';
  static const String productTitleLabel = 'Product Title';
  static const String productTitleHint = 'e.g. Minimalist Ceramic Mug';
  static const String productTitleError = 'Title is Required';
  static const String productDescriptionLabel = 'Description';
  static const String productDescriptionHint =
      "Describe your product's features and benefits...";
  static const String productDescriptionError = 'Description is Required';
  static const String originalPriceLabel = 'Original Price';
  static const String originalPriceHint = '99.99';
  static const String discountLabel = 'Discount %';
  static const String categoryLabel = 'Category';
  static const String selectCategoryHint = 'Select a Product Category';
  static const String selectCategoryError = 'Please Select Product Category';
  static const String inventoryStockLabel = 'Inventory Stock';
  static const String saveProductButtonText = 'Save Product';

  // Profile Screen Text
  static const String logOutButtonText = 'Log Out';

  // seller dashboard constant Strings
  // top level heading
  static const sellerDashboardText = 'Seller Dashboard';
  static const sellerDashboardSubheadingText =
      "Overview of your store's performance today.";

  // stat card strings
  static const totalStockText = 'TOTAL STOCK';
  static const totalProductsText = 'TOTAL PRODUCTS';
  static const averageRatingText = 'AVG. RATING';

  // section heading
  static const categoryBreakdownText = 'Category Breakdown';
  static const stockLevelsText = 'Stock Levels';
  static const topRatedProductsText = 'Top Rated Products';

  // onboarding screen constants
  static const List<Map<String, String>> stepperPages = [
    {
      'image': AppImages.introImageOne,
      'title': AppStrings.introScreenOneTitle,
      'subTitle': AppStrings.introScreenOneSubtitle,
    },
    {
      'image': AppImages.introImageTwo,
      'title': AppStrings.introScreenTwoTitle,
      'subTitle': AppStrings.introScreenTwoSubTitle,
    },
    {
      'image': AppImages.introImageThree,
      'title': AppStrings.introScreenThreeTitle,
      'subTitle': AppStrings.introScreenThreeSubtitle,
    },
  ];


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
