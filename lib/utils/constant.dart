import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
abstract class Constant{
  static const appName = "Law";
  static const splash_text1 ="إستشارة ";
  static const splash_text2 = "Consultation";
  static const signIn_text = "Sign in";
  static const signUp_text = "Sign up";
  static const signIn_welcome = "Welcome back!";
  static const signUP_welcome = "Welcome!";
  static const signIn_forget = "Forgot password?";
  static const signIn_account1 = "Don’t have an account?";
  static const signIn_account2 = "Create an account";
  static const email_text = "Email Eddress";
  static const password_text = "Create password";
  static const signuP_USERNAME = "User Name";
  static const signuP_nUMBER = "Phone number";
  static const signuP_CONFIRM = "Confirm password";
  static const signuP_TERMS = "By clicking, you agree to the terms and conditions of the application";
  static const signuP_ACCOUNT1 = "Already have an account? ";
  static const signuP_ACCOUNT2 = "Sign in";

  static const forgotpass_Txt = "Forgot password?";
  static const forgotpassWorry_Txt = "Dont worry we are here";
  static const Createpass_Txt = "Create New Password";
  static const Newpass_Txt = "Your new password must be different from previous used passwords.";
  static const NewpassCharac_Txt = "Must be at least 8 characters";
  static const Newpasspass_Txt = "Both password must match";
  static const otp_Txt = "please, enter the 4 Digits we have sent to you";
  static const otpWrong_Txt = "Wrong code, please type right code";

  static const Terms_conditionTxt = "Terms & Conditions";
  static const Terms_conditionTxt_desc = "Welcome to (Isteshara App), kindly read all terms and conditions carefully before using the app. Any service request from you would be considered an acknowledgment and agreement to the terms and conditions set forth below.";
  static const definations_Txt = "Definitions:";
  static const definations_descTxt = "Client: service seeker, who creates an account in the app to enjoy the service.\n\nService: it differs depending on the client’s request, however, we offer various of services such as ( Case Complaint, Defense Memo,  Contract Drafting). ";
  static const service_Txt = "Service provider: Istesharah App.";
  static const service_Desc_Txt = "Istesharah is a platform offering legal services to individuals in the field of legal litigation and commercial transaction.\n\nService request does not create an agent proncipal relationship neither lawyer client relationship between Istesharah App and the client. Service provider’s duty is limited to drafting ( Case Complaint, Defense Memo or Contract Drafting) as requested, and it ends  upon sending the requested document to the client through the app.\n\nIstesharah does not contract on a whole case. I,e begining from filing the case up to judgement, it mission is to help client with Case Complaint, Defense Memo or contract drafting seperately. If the client wishes to have an additional service, he/she must make another request.\n\nIt is understood that Istesharah obligation is not to achieve a result, but it is an obligation of a reasonable effort.\n\nThe client is committed to providing the service provider all information related to the work assigned, and any information the client thinks is a material information, otherwise, the client fully bears any damages might result from his/her negligence.\n\nThe client shall provide the service provider with a copy of the judgement after it is issued once he/she receives it.\n\nISTESHARAH APP WILL NOT BE LIABLE (WHETHER IN CONTRACT, WARRANTY, TORT (INCLUDING NEGLIGENCE) OR OTHERWISE) TO THE CLIENT OR ANY OTHER PERSON FOR DAMAGES FOR ANY INDIRECT, INCIDENTAL, OR CONSEQUENTIAL DAMAGES ARISING OUT OF OR RELATING TO THE CLIENT ABUSE OF HIS/HER RIGHTS IN ANY MATTER. AGREEMENT.";

  static const resetpass_Txt = "Create New Password";
  static const resetpassdesc_Txt = "Your new password must be different from previous used passwords.";

  static const home_title_Txt = "Choose one";
  static const contract_Txt = "Contract Drafting";
  static const consultation_Txt = "Consultation";
  static const lawsuit_Txt = "Case - Lawsuit";
  static const otherSRVC_Txt = "Other Services";
  static const corporate_Txt = "Corporate ";
  static const individual_Txt = "Individual ";
  static const upload_Txt = "Upload File ";

  //contract Drafting text
  static const CD_clientname_hint = "Client’s Name";
  static const CD_Purpose_hint = "Purpose of the contract";
  static const CD_Term_hint = "Contract Term";
  static const CD_Amount_hint = "Amount";
  static const CD_Deadline_hint = "Deadline";
  static const CD_Details_hint = "Details";
  static const CD_Details_text = "I need a Construction Agreement for my house.";

  //upload
  static const upload = "Upload";
  static const add_doc_txt = "+ Add Documents";
  static const PDF_txt = "PDF";
  static const Google_Drive_txt = "Google Drive";
  static const Photos_txt = "Photos";
  static const Camera_txt = "Camera";
  static const Others_txt = "Others";
  static const docdesc_txt = "Document Description";
  static const Date_txt = "Date";
  static const Save_txt = "Save";
  static const Pay_txt = "Pay";
  static const thanku_txt = "Order has been sent.\nThank you! We will contact you if we need more information.";

  //order details
  static const information = "information";
  static const Documents = "Documents";
  static const extra_serv_txt = "Extra service";
  static const chat_provide_txt = "Chat with provider";
  static const service_provide_txt = "Service provided on";
  static const attachment_txt = "Order Attactment";

  //extra service
  static const servicetype_txt = "Type of service";
  static const amount_txt = "Amount requested";


  //Payment
  static const payment_txt = "Payment method";

  //my Order
  static const my_order_txt = "My Orders";
  static const closed_txt = "Closed";
  static const open_txt = "Open";

  //Consultion
  static const consultion_txt = "Consultation";
  static const Subject_txt = "Subject";
  static const Today_sdate_txt = "Today’s date";


  //lawsuit
  static const Capacity_txt = "Capacity";
  static const Agaist_txt = "Agaist";
  static const CourtLocationtxt = "Court Location";
  static const Court_Chambertxt = "Court/ Chamber";
  static const Floor_Roomtxt = "Floor/ Room";
  static const Automated_Notxt = "Automated No";
  static const Expert_Notxt = "Expert Location - Floor/ Office";
  static const CaseNo_Notxt = "Case No";
  static const Write_Detailstxt = "Write Details";

  //menuscreen
  static const Profile_txt = "Profile";
  static const Schedule_txt = "My Schedule";
  static const Orders_txt = "My Orders";
  static const Customer_Support_txt = "Customer Support";
  static const pricelist_txt = "Price List";
  static const FAQs_txt = "FAQs";
  static const Language_txt = "Language";
  static const Sign_out_txt = "Sign-out";


  //profile
  static const My_profile_txt = "My profile";
  static const Edit_Profile_txt = "Edit Profile";
  static const Changepass_txt = "Change your password";
  static const Balance_txt = "Balance";
  static const Name_txt = "Name";
  static const Email_txt = "Email";
  static const Phone_txt = "Phone";
  static const Gender_txt = "Gender";
  static const profile_upload_txt = "Upload new photo";
  static const DOB_txt = "D.O.B";


  //pricelist
  static const individual_txt = "individual";
  static const Corporate_txt = "individual";


  //about us
  static const Aboutus_txt = "About us";


  //faqs
  static const FAqs_txt = "FAQs";

  //customer support
  static const Customersprt_txt = "Customer Support";
  static const helpingtxt = "how can I help you?";


  //language
  static const Languagetxt = "Language";









}
class ApiRoute{
  static const createcase = "user/create/case";
  static const case_details = "common/case/details/";
  static const case_orders = "user/my/orders";
  static const  case_updates = "update/case/";
  static const  profile = "/api/common/myprofile";
  static const  update_profile = "user/update/profile";
  static const  price_list = "common/price/list";
  static const  about_description = "/api/common/about/english/user";
}

class AppColors {
  static const whitecolour = const Color(0xFFD9D9D9);
  static const hintcolour = const Color(0xFF9A9A9D);
  static const boxbackground = const Color(0xFFF1F1F1);
  static const blue_light = const Color(0xFF3A4D63);
  static const blue_light_grid = const Color(0xB33A4D63);
  static const profile_pref_nameclr= const Color(0xFF4F4F4F);
  static const pricecolor= const Color(0xFF03172D);


}