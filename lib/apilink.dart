class LinkApp{

  static const String server="https://dr-mohammad-taamnha.com/app_zaid/app_zaid";
  ///images
  static const String imagestatic="https://universityofvictoria.us/newtest/upload";
  static const String imageCategories="$imagestatic/categories";
  static const String imageItems="$imagestatic/items";
  ///images
  static const String test="$server/test.php";

  //Auth////////////
  static const String signup="$server/auth/signup.php";
  static const String verifycodesignup="$server/auth/verfiyCode.php";

  static const String login="$server/auth/login.php";
  static const String resend="$server/auth/resend.php";

//forgetpassword////////////
  static const String checkEmail="$server/forgetpassowrd/checkemail.php";
  static const String resetPassword="$server/forgetpassowrd/resetpassowrd.php";
  static const String   verfiycodeForgetpassword="$server/forgetpassowrd/verfiycode.php";

//home//
  static const String homepage="$server/home.php";
//items
  static const String items="$server/items/items.php";
  static const String searchItems="$server/items/search.php";

  //favorite

  static const String favoriteAdd="$server/favorite/add.php";
  static const String favoriteremove="$server/favorite/remove.php";
  static const String favoriteview="$server/favorite/view.php";
  static const String deletefromfavorite="$server/favorite/deletefromfavorite.php";
//cart

  static const String cartview="$server/cart/view.php";
  static const String cartadd="$server/cart/add.php";
  static const String cartdelete="$server/cart/delete.php";

  static const String cartgetcountitems="$server/cart/getcountitems.php";
//address

  static const String addressView="$server/address/view.php";
  static const String addressAdd="$server/address/add.php";
  static const String addressDelete="$server/address/delete.php";

  static const String addressEdit="$server/address/edit.php";

//testapp

  static const String testapp="$server/test/test.php";
//addresult
  static const String addresult="$server/test/addresult.php";

  static const String getuserresult="$server/test/getuserresult.php";

//update profile

  static const String updateProfile="$server/auth/update.php";
//pdfresult

  static const String pdfresult="$server/test/perResult/";

//showfitures


  static const String showfitures="$server/test/showfitures.php";

  //contact
  static const String contactUs="$server/test/contact.php";
  //  getquestion
  static const String getquestion="$server/test/getquestion.php";
//paypal data
  static const String getpaypalinfo="$server/test/getpaypalinfo.php";
  // static const String getquestion="$server/test/getquestion.php";


//cPanel users
  static const String addNewUserCpanel="$server/test/cpanel/addnewuser.php";
  static const String getallusersCpanel="$server/test/cpanel/getalluser.php";
  static const String updateUserDataCpanel="$server/test/cpanel/edituser.php";
  static const String deleteUserDataCpanel="$server/test/cpanel/deleteuser.php";

//cPanel users end
//cPanel contact
  static const String getcontactCpanel="$server/test/cpanel/getcontact.php";
  static const String editcontactCpanel="$server/test/cpanel/editcontact.php";
//cPanel contact end

  static const String showfituriespositive="$server/test/cpanel/showfituriespositive.php";
  static const String showfituriesnegative="$server/test/cpanel/showfituriesnegative.php";

  static const String getfituriescpanel="$server/test/cpanel/getfeturesdata.php";


//cPanel getallpeyments
  static const String addnewcoponCpanel="$server/test/cpanel/addnewcopon.php";
  static const String getallpeyments="$server/test/cpanel/getallpeyments.php";
  static const String getallcoponsCpanel="$server/test/cpanel/getallcopons.php";
  static const String deletecoponsCpanel="$server/test/cpanel/deletecopon.php";

  //cPanel getallpeyments end

  //cpanel statistic
  static const String getstatisticuser="$server/test/cpanel/getstatisticuser.php";
//cpanel login

  static const String loginCpanel="$server/test/cpanel/logincpanel.php";
//payments copon
  static const String getamountpayments="$server/test/getamountpayments.php";
  static const String getcopon="$server/test/getcopon.php";
//answare data
  static const String getallanswareCpanel="$server/test/cpanel/getallanswer.php";
  static const String editarAnswareCpanel="$server/test/cpanel/updatearanswer.php";
  static const String editenAnswareCpanel="$server/test/cpanel/updateenansware.php";
//payments add
  static const String addpements="$server/test/addpements.php";
//question data
  static const String getmainquistionCpanel="$server/test/cpanel/getmainquestion.php";
  static const String editmainquistionArCpanel="$server/test/cpanel/updatemainquestion.php";
  static const String editmainquistionEnCpanel="$server/test/cpanel/updatemainquestionen.php";
//amount data
  static const String getamountCpanel="$server/test/cpanel/getamount.php";
  static const String updateamountCpanel="$server/test/cpanel/editamount.php";
//paypalInfo data Cpanel
  static const String getinfoPaypalCpanel="$server/test/cpanel/getpaypalinfo.php";
  static const String updateInfoPaypalCpanel="$server/test/cpanel/updatepaypalinfo.php";


}