///[ApiExchangeKeys] contains the api exchange keys for all APIs called in this application
///for both request and response bodies

// ignore_for_file: constant_identifier_names

class ApiExchangeKeys {
  // Common for all APIs
  static const String statusMessage = 'statusMessage';
  static const String statusCode = 'statusCode';
  static const String result = 'result';
  static const String data = 'data';

  // Login API
  static const String loginAPI_Email = 'email';
  static const String loginAPI_Password = 'password';

  // User
  static const String loginAPI_User = 'user';
  static const String loginAPI_UserId = 'id';
  static const String loginAPI_FirstName = 'firstName';
  static const String loginAPI_LastName = 'lastName';
  static const String loginAPI_Fullname = 'fullname';
  static const String loginAPI_OrganizationId = 'organizationid';
  static const String loginAPI_PrepareFlag = 'prepareFlag';
  static const String loginAPI_ConductFlag = 'conductFlag';
  static const String loginAPI_ExploreFlag = 'exploreFlag';
  static const String loginAPI_EffectiveAccessRights =
      'effective_access_rights';
  static const String loginAPI_AccessRightAllowClass = 'allow_class';
  static const String loginAPI_AccessRightAllowDailyGym = 'allow_daily_gym';
  static const String loginAPI_AccessRightAllowRevive = 'allow_revice';
  static const String loginAPI_AccessRightAllowPrepare = 'allow_prepare';

  // Token
  static const String loginAPI_Tokens = 'tokens';
  static const String loginAPI_Token = 'token';
  static const String loginAPI_Access = 'access';
  static const String loginAPI_Refresh = 'refresh';
  static const String loginAPI_Expires = 'expires';

  // Registration API
  static const String registrationApi_Param1 = 'param1';
}
