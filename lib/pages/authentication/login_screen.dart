import 'package:demo/data/store/login_store.dart';
import 'package:demo/utils/colors/app_colors.dart';
import 'package:demo/utils/common_views/about_demo.dart';
import 'package:demo/utils/common_views/app_bar_title.dart';
import 'package:demo/utils/common_views/center_logo.dart';
import 'package:demo/utils/common_views/create_account_field.dart';
import 'package:demo/utils/common_views/divider_edit_field.dart';
import 'package:demo/utils/common_views/icon_edit_field.dart';
import 'package:demo/utils/common_views/language_bia.dart';
import 'package:demo/utils/common_views/signin_text.dart';
import 'package:demo/utils/config.dart';
import 'package:demo/utils/language/demo_localization.dart';
import 'package:demo/utils/styles/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:states_rebuilder/states_rebuilder.dart';


class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}


class _LoginScreenState extends State<LoginScreen> {
  final _userNameController = TextEditingController();
  final _passwordController = TextEditingController();


  //dispose all unused fields and data
  @override
  void dispose() {
    _userNameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }


  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 375, height: 812)..init(context);

    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: AppColors.colorBlueDark,
      appBar: AppBar(
          backgroundColor: AppColors.colorGrayBar,
          elevation: 0.0,
          centerTitle: true,
          title: AppBarTitle("login")),
      body:  SingleChildScrollView(
          child:
          Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child:
              Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      AboutDemo("login"),
                      LanguageDrop(),
                    ],
                  ),
                  CentreLogo("login"),
                  SignIn("login"),
                  _userNameFieldWidget(),
                  _passwordFieldWidget(),
                  _nextButtonField(),
                  CreateAccountText("login")
                ],
              )
          )
      )
    );
  }



  /*
  * widget for user name*/
  Widget _userNameFieldWidget() {
    return Column(children: <Widget>[
      SizedBox(
        height: MediaQuery.of(context).size.height * 0.050,
      ),
      Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Expanded(
            child: Container(
              margin: EdgeInsets.fromLTRB(
                  ScreenUtil.getInstance().setHeight(40),
                  0,
                  ScreenUtil.getInstance().setHeight(5),
                  ScreenUtil.getInstance().setHeight(0)),
              child: TextFormField(
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.emailAddress,
                maxLines: 1,
                controller: _userNameController,
                style: Style.userStyle,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 5.0),
                  isDense: true,
                  hintText:
                  DemoLocalizations.of(context).trans('username'),
                  hintStyle: Style.hintStyle,
                  counterText: "",
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                ),
              ),
            ),
          ),
          IconEditField("username"),

        ],
      ),

      DividerEditField("login")
    ]);
  }


  /*
  * widget to add password*/
  Widget _passwordFieldWidget() {
    return Column(children: <Widget>[
      SizedBox(
        height: MediaQuery.of(context).size.height * 0.050,
      ),
      Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Expanded(
            child: Container(
              margin: EdgeInsets.fromLTRB(
                  ScreenUtil.getInstance().setHeight(40),
                  0,
                  ScreenUtil.getInstance().setHeight(5),
                  ScreenUtil.getInstance().setHeight(0)),
              child: TextFormField(
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.text,
                maxLines: 1,
                controller: _passwordController,
                style: Style.userStyle,
                obscureText: true,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 5.0),
                  isDense: true,
                  hintText:
                  DemoLocalizations.of(context).trans('password'),
                  hintStyle: Style.hintStyle,
                  counterText: "",
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                ),
              ),
            ),
          ),

          IconEditField("confirm"),

        ],
      ),

      DividerEditField("register")
    ]);
  }


  /*
  * next button
  * tap to sign in*/
  Widget _nextButtonField(){
    return
      Container(
        height: ScreenUtil.getInstance().setHeight(50),
        width: ScreenUtil.getInstance().setWidth(840),
        margin: EdgeInsets.fromLTRB(ScreenUtil.getInstance().setHeight(40), ScreenUtil.getInstance().setHeight(20),
            ScreenUtil.getInstance().setHeight(40), 0),
        child: RaisedButton(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(28.0),
              side: BorderSide(color: AppColors.colorYellowButton)),
          onPressed: () async{
            if (_userNameController.text.isEmpty) {
              //if user name is not entered
              Config.showToastCenter(DemoLocalizations.of(context).trans('err_username'));
            }else if (_passwordController.text.isEmpty) {
              //if password is not entered
              Config.showToastCenter(DemoLocalizations.of(context).trans('err_password'));
            }else{
             //submit data at backend
              submitData(context,"");
            }
          },
          color: AppColors.colorYellowButton,
          textColor: AppColors.colorBlueDark,
          child: Stack(
            children: <Widget>[
              Align(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                       DemoLocalizations.of(context).trans('next').toUpperCase(),
                      style: Style.nextButtonStyle,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
  }


  /*
  * inject data at store for
  * login api*/
  void submitData(BuildContext context, String cityName) {
    final reactiveModel = Injector.getAsReactive<LoginStore>();
    reactiveModel.setState(
          (store) => store.loginUser(cityName),
      //add callbacks here below

    );
  }

}

