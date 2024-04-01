import 'package:abu_s_application7/presentation/all_store/all_store_screen.dart';
import 'package:abu_s_application7/presentation/all_store/bindings/all_store_binding.dart';
import 'package:abu_s_application7/presentation/bottom_bar/bottom_bar.dart';
import 'package:abu_s_application7/presentation/bottom_bar/bottom_binding.dart';
import 'package:abu_s_application7/presentation/complete_profile/binding/complete_profile_binding.dart';
import 'package:abu_s_application7/presentation/complete_profile/complete_profile_screen.dart';
import 'package:abu_s_application7/presentation/all_products/all_Product.dart';
import 'package:abu_s_application7/presentation/all_products/biinding/all_product_binding.dart';
import 'package:abu_s_application7/presentation/product_detail/binding/product_detail_binding.dart';
import 'package:abu_s_application7/presentation/product_detail/controller/product_detail_controller.dart';
import 'package:abu_s_application7/presentation/product_detail/product_detail_screen.dart';
import 'package:abu_s_application7/presentation/seller_pannel/seller_detail/seller_binding/seller_binding.dart';
import 'package:abu_s_application7/presentation/seller_pannel/seller_detail/seller_pannle_screen.dart';
import 'package:abu_s_application7/presentation/seller_pannel/add_category/add_category.dart';
import 'package:abu_s_application7/presentation/seller_pannel/add_category/add_category_binding/add_category_binding.dart';
import 'package:abu_s_application7/presentation/seller_pannel/seller_screens/add_new_seller/binding/seller_detail_binding.dart';
import 'package:abu_s_application7/presentation/seller_pannel/selller_cart_product/binding/cart_binding.dart';
import 'package:abu_s_application7/presentation/seller_pannel/selller_cart_product/cart_screen.dart';
import 'package:abu_s_application7/presentation/store_detail_page/binding/store_detal_binding.dart';
import 'package:abu_s_application7/presentation/store_detail_page/store_detal_page.dart';
import 'package:abu_s_application7/presentation/store_info_screen/binding/store_info_binding.dart';
import 'package:abu_s_application7/presentation/store_info_screen/store_info_screen.dart';
import 'package:abu_s_application7/presentation/user_cart_products/bindings/user_cart_binding.dart';
import '../../presentation/splash_screen/splash_screen.dart';
import '../../presentation/splash_screen/binding/splash_binding.dart';
import '../../presentation/onboarding_one_screen/onboarding_one_screen.dart';
import '../../presentation/onboarding_one_screen/binding/onboarding_one_binding.dart';
import '../../presentation/onboarding_two_screen/onboarding_two_screen.dart';
import '../../presentation/onboarding_two_screen/binding/onboarding_two_binding.dart';
import '../../presentation/onboarding_three_screen/onboarding_three_screen.dart';
import '../../presentation/onboarding_three_screen/binding/onboarding_three_binding.dart';
import '../../presentation/log_in_screen/log_in_screen.dart';
import '../../presentation/log_in_screen/binding/log_in_binding.dart';
import '../../presentation/forgot_password_screen/forgot_password_screen.dart';
import '../../presentation/forgot_password_screen/binding/forgot_password_binding.dart';
import '../../presentation/verification_screen/verification_screen.dart';
import '../../presentation/verification_screen/binding/verification_binding.dart';
import '../../presentation/sign_up_screen/sign_up_screen.dart';
import '../../presentation/sign_up_screen/binding/sign_up_binding.dart';
import '../../presentation/location_access_screen/location_access_screen.dart';
import '../../presentation/location_access_screen/binding/location_access_binding.dart';
import '../../presentation/search_tab_container_screen/search_tab_container_screen.dart';
import '../../presentation/search_tab_container_screen/binding/search_tab_container_binding.dart';
import '../../presentation/catagories_screen/catagories_screen.dart';
import '../../presentation/catagories_screen/binding/catagories_binding.dart';
import '../../presentation/item_detail_one_screen/item_detail_one_screen.dart';
import '../../presentation/item_detail_one_screen/binding/item_detail_one_binding.dart';
import '../../presentation/item_detail_two_screen/item_detail_two_screen.dart';
import '../../presentation/item_detail_two_screen/binding/item_detail_two_binding.dart';
import '../../presentation/store_view_one_tab_container_screen/store_view_one_tab_container_screen.dart';
import '../../presentation/store_view_one_tab_container_screen/binding/store_view_one_tab_container_binding.dart';
import '../../presentation/store_view_two_tab_container_screen/store_view_two_tab_container_screen.dart';
import '../../presentation/store_view_two_tab_container_screen/binding/store_view_two_tab_container_binding.dart';
import '../../presentation/message_screen/message_screen.dart';
import '../../presentation/message_screen/binding/message_binding.dart';
import '../../presentation/orders_container_screen/orders_container_screen.dart';
import '../../presentation/orders_container_screen/binding/orders_container_binding.dart';
import '../../presentation/edit_cart_screen/edit_cart_screen.dart';
import '../../presentation/edit_cart_screen/binding/edit_cart_binding.dart';
import '../../presentation/my_cart_screen/my_cart_screen.dart';
import '../../presentation/my_cart_screen/binding/my_cart_binding.dart';
import '../../presentation/track_schedule_order_screen/track_schedule_order_screen.dart';
import '../../presentation/track_schedule_order_screen/binding/track_schedule_order_binding.dart';
import '../../presentation/payment_method_tab_container_screen/payment_method_tab_container_screen.dart';
import '../../presentation/payment_method_tab_container_screen/binding/payment_method_tab_container_binding.dart';
import '../../presentation/add_new_card_screen/add_new_card_screen.dart';
import '../../presentation/add_new_card_screen/binding/add_new_card_binding.dart';
import '../../presentation/payment_successfull_screen/payment_successfull_screen.dart';
import '../../presentation/payment_successfull_screen/binding/payment_successfull_binding.dart';
import '../../presentation/settings_screen/settings_screen.dart';
import '../../presentation/settings_screen/binding/settings_binding.dart';
import '../../presentation/personal_profiles_screen/personal_profiles_screen.dart';
import '../../presentation/personal_profiles_screen/binding/personal_profiles_binding.dart';
import '../../presentation/edit_profile_screen/edit_profile_screen.dart';
import '../../presentation/edit_profile_screen/binding/edit_profile_binding.dart';
import '../../presentation/address_screen/address_screen.dart';
import '../../presentation/address_screen/binding/address_binding.dart';
import '../../presentation/add_new_address_screen/add_new_address_screen.dart';
import '../../presentation/add_new_address_screen/binding/add_new_address_binding.dart';
import '../../presentation/app_navigation_screen/app_navigation_screen.dart';
import '../../presentation/app_navigation_screen/binding/app_navigation_binding.dart';
import 'package:get/get.dart';
import '../presentation/search/binding/search_inding.dart';
import '../presentation/search/search_location.dart';
import '../presentation/seller_pannel/seller_screens/add_new_seller/sellert_detail_screen.dart';
import '../presentation/user_cart_products/user_cart_sceen.dart';

class AppRoutes {
  static const String splashScreen = '/splash_screen';

  static const String onboardingOneScreen = '/onboarding_one_screen';

  static const String onboardingTwoScreen = '/onboarding_two_screen';

  static const String onboardingThreeScreen = '/onboarding_three_screen';

  static const String logInScreen = '/log_in_screen';

  static const String forgotPasswordScreen = '/forgot_password_screen';

  static const String verificationScreen = '/verification_screen';

  static const String signUpScreen = '/sign_up_screen';

  static const String locationAccessScreen = '/location_access_screen';

  static const String homePage = '/home_page';
  static const String storeDetailPage = '/store_detail_page';

  static const String searchPage = '/search_page';

  static const String searchTabContainerScreen = '/search_tab_container_screen';

  static const String catagoriesScreen = '/catagories_screen';

  static const String allStoreScreen = '/all_store_screen';

  static const String itemDetailOneScreen = '/item_detail_one_screen';

  static const String itemDetailTwoScreen = '/item_detail_two_screen';

  static const String storeViewOnePage = '/store_view_one_page';

  static const String storeViewOneTabContainerScreen =
      '/store_view_one_tab_container_screen';

  static const String storeViewTwoPage = '/store_view_two_page';

  static const String storeViewTwoTabContainerScreen =
      '/store_view_two_tab_container_screen';

  static const String pickupPage = '/pickup_page';

  static const String messageScreen = '/message_screen';

  static const String ordersPage = '/orders_page';

  static const String ordersTabContainerPage = '/orders_tab_container_page';

  static const String ordersContainerScreen = '/orders_container_screen';

  static const String editCartScreen = '/edit_cart_screen';

  static const String myCartScreen = '/my_cart_screen';

  static const String scheduleOrderScreen = '/schedule_order_screen';

  static const String trackScheduleOrderScreen = '/track_schedule_order_screen';

  static const String paymentMethodPage = '/payment_method_page';

  static const String paymentMethodTabContainerScreen =
      '/payment_method_tab_container_screen';

  static const String addNewCardScreen = '/add_new_card_screen';

  static const String paymentMethodOnePage = '/payment_method_one_page';

  static const String paymentSuccessfullScreen = '/payment_successfull_screen';

  static const String settingsScreen = '/settings_screen';

  static const String personalProfilesScreen = '/personal_profiles_screen';

  static const String editProfileScreen = '/edit_profile_screen';

  static const String addressScreen = '/address_screen';

  static const String addNewAddressScreen = '/add_new_address_screen';

  static const String appNavigationScreen = '/app_navigation_screen';

  static const String initialRoute = '/initialRoute';
  static const String bottomBarScreen = '/bottom_bar_screen';
  static const String completeProfile = '/complete_profile';
  static const String sellerDetailScreen = '/seller_detail_screen';
  static const String sellerPannelScreen = '/seller_pannel_screen';
  static const String addCategoryScreen = '/add_category_screen';
  static const String allProductScreen = '/all_product_screen';
  static const String productDetail = '/all_product_detail';
  static const String sellerCartScreen = '/seller_cart_screen';
  static const String userCartScreen = '/user_cart_screen';
  static const String searchLocation = '/search_location';
  static const String storeinfo = '/store_info';

  static List<GetPage> pages = [
    GetPage(
        name: userCartScreen,
        page: () => UserCartScreen(),
        binding: UserCartBinding()),
    GetPage(
        name: storeinfo,
        page: () => StoreInfoScreen(),
        binding: StoreInfoBinding()),
    GetPage(
        name: searchLocation,
        page: () => SearchLocation(),
        binding: SearchBinding()),
    GetPage(
        name: allProductScreen,
        page: () => AllProductScreen(),
        binding: AllProductBinding()),
    GetPage(
        name: sellerCartScreen,
        page: () => CartScreen(),
        binding: SellerCartBinding()),
    GetPage(
        name: storeDetailPage,
        page: () => StoreDetailScreen(),
        binding: StoreDetailBinding()),
    GetPage(
        name: productDetail,
        page: () => ProductDetailPage(),
        binding: ProductDetailBinding()),
    GetPage(
      name: splashScreen,
      page: () => SplashScreen(),
      bindings: [
        SplashBinding(),
      ],
    ),
    GetPage(
        name: addCategoryScreen,
        page: () => AddCategoryScreen(),
        binding: AddCartegoryBinding()),
    GetPage(
        name: sellerPannelScreen,
        page: () => SellerPannelScreen(),
        binding: SellerPannelBinding()),
    GetPage(
        name: sellerDetailScreen,
        page: () => SellerDetailScreen(),
        binding: SellerDetailBinding()),
    GetPage(
      name: completeProfile,
      page: () => CompleteProfile(),
      bindings: [
        CompleteProfileBinding(),
      ],
    ),
    GetPage(
      name: bottomBarScreen,
      page: () => BottomBarScreen(),
      bindings: [
        BottomBinding(),
      ],
    ),
    GetPage(
      name: onboardingOneScreen,
      page: () => OnboardingOneScreen(),
      bindings: [
        OnboardingOneBinding(),
      ],
    ),
    GetPage(
      name: onboardingTwoScreen,
      page: () => OnboardingTwoScreen(),
      bindings: [
        OnboardingTwoBinding(),
      ],
    ),
    GetPage(
      name: onboardingThreeScreen,
      page: () => OnboardingThreeScreen(),
      bindings: [
        OnboardingThreeBinding(),
      ],
    ),
    GetPage(
      name: logInScreen,
      page: () => LogInScreen(),
      bindings: [
        LogInBinding(),
      ],
    ),
    GetPage(
      name: forgotPasswordScreen,
      page: () => ForgotPasswordScreen(),
      bindings: [
        ForgotPasswordBinding(),
      ],
    ),
    GetPage(
      name: verificationScreen,
      page: () => VerificationScreen(),
      bindings: [
        VerificationBinding(),
      ],
    ),
    GetPage(
      name: signUpScreen,
      page: () => SignUpScreen(),
      bindings: [
        SignUpBinding(),
      ],
    ),
    GetPage(
      name: locationAccessScreen,
      page: () => LocationAccessScreen(),
      bindings: [
        LocationAccessBinding(),
      ],
    ),
    GetPage(
      name: searchTabContainerScreen,
      page: () => SearchTabContainerScreen(),
      bindings: [
        SearchTabContainerBinding(),
      ],
    ),
    GetPage(
      name: catagoriesScreen,
      page: () => CatagoriesScreen(),
      bindings: [
        CatagoriesBinding(),
      ],
    ),
    GetPage(
      name: allStoreScreen,
      page: () => AllStoreScreen(),
      bindings: [
        AllStoreBinding(),
      ],
    ),
    GetPage(
      name: itemDetailOneScreen,
      page: () => ItemDetailOneScreen(),
      bindings: [
        ItemDetailOneBinding(),
      ],
    ),
    GetPage(
      name: itemDetailTwoScreen,
      page: () => ItemDetailTwoScreen(),
      bindings: [
        ItemDetailTwoBinding(),
      ],
    ),
    GetPage(
      name: storeViewOneTabContainerScreen,
      page: () => StoreViewOneTabContainerScreen(),
      bindings: [
        StoreViewOneTabContainerBinding(),
      ],
    ),
    GetPage(
      name: storeViewTwoTabContainerScreen,
      page: () => StoreViewTwoTabContainerScreen(),
      bindings: [
        StoreViewTwoTabContainerBinding(),
      ],
    ),
    GetPage(
      name: messageScreen,
      page: () => MessageScreen(),
      bindings: [
        MessageBinding(),
      ],
    ),
    GetPage(
      name: ordersContainerScreen,
      page: () => OrdersContainerScreen(),
      bindings: [
        OrdersContainerBinding(),
      ],
    ),
    GetPage(
      name: editCartScreen,
      page: () => EditCartScreen(),
      bindings: [
        EditCartBinding(),
      ],
    ),
    GetPage(
      name: myCartScreen,
      page: () => MyCartScreen(),
      bindings: [
        MyCartBinding(),
      ],
    ),
    // GetPage(
    //   name: scheduleOrderScreen,
    //   page: () => ScheduleOrderScreen(),
    //   bindings: [
    //     ScheduleOrderBinding(),
    //   ],
    // ),
    GetPage(
      name: trackScheduleOrderScreen,
      page: () => TrackScheduleOrderScreen(),
      bindings: [
        TrackScheduleOrderBinding(),
      ],
    ),
    GetPage(
      name: paymentMethodTabContainerScreen,
      page: () => PaymentMethodTabContainerScreen(),
      bindings: [
        PaymentMethodTabContainerBinding(),
      ],
    ),
    GetPage(
      name: addNewCardScreen,
      page: () => AddNewCardScreen(),
      bindings: [
        AddNewCardBinding(),
      ],
    ),
    GetPage(
      name: paymentSuccessfullScreen,
      page: () => PaymentSuccessfullScreen(),
      bindings: [
        PaymentSuccessfullBinding(),
      ],
    ),
    GetPage(
      name: settingsScreen,
      page: () => SettingsScreen(),
      bindings: [
        SettingsBinding(),
      ],
    ),
    GetPage(
      name: personalProfilesScreen,
      page: () => PersonalProfilesScreen(),
      bindings: [
        PersonalProfilesBinding(),
      ],
    ),
    GetPage(
      name: editProfileScreen,
      page: () => EditProfileScreen(),
      bindings: [
        EditProfileBinding(),
      ],
    ),
    GetPage(
      name: addressScreen,
      page: () => AddressScreen(),
      bindings: [
        AddressBinding(),
      ],
    ),
    GetPage(
      name: addNewAddressScreen,
      page: () => AddNewAddressScreen(),
      bindings: [
        AddNewAddressBinding(),
      ],
    ),
    GetPage(
      name: appNavigationScreen,
      page: () => AppNavigationScreen(),
      bindings: [
        AppNavigationBinding(),
      ],
    ),
    GetPage(
      name: initialRoute,
      page: () => SplashScreen(),
      bindings: [
        SplashBinding(),
      ],
    )
  ];
}
