import 'package:demo/data/store/register_store.dart';
import 'package:demo/utils/colors/app_colors.dart';
import 'package:demo/utils/common_views/app_bar_title.dart';
import 'package:demo/utils/common_views/center_logo.dart';
import 'package:demo/utils/common_views/create_account_field.dart';
import 'package:demo/utils/common_views/divider_edit_field.dart';
import 'package:demo/utils/common_views/icon_edit_field.dart';
import 'package:demo/utils/common_views/signin_text.dart';
import 'package:demo/utils/config.dart';
import 'package:demo/utils/language/demo_localization.dart';
import 'package:demo/utils/styles/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:states_rebuilder/states_rebuilder.dart';


class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}


class _RegisterScreenState extends State<RegisterScreen> {
  final _userNameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _emailController = TextEditingController();
  final _confirmPasswordController = TextEditingController();


  //dispose off all values when screen destroyed
  @override
  void dispose() {
    _userNameController.dispose();
    _passwordController.dispose();
    _emailController.dispose();
    _confirmPasswordController.dispose();
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
          title: AppBarTitle("register")),
      body: SingleChildScrollView(
        child:
        Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child:
            Column(
              children: <Widget>[
                CentreLogo("register"),
                SignIn("register"),
                _userNameFieldWidget(),
                _emailFieldWidget(),
                _passwordFieldWidget(),
                _confirmPasswordFieldWidget(),
                _registerButton(),
                CreateAccountText("register")
              ],
            )
        ),
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
                keyboardType: TextInputType.text,
                maxLines: 1,
                maxLength: 20,
                style: Style.userStyle,
                controller: _userNameController,
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

      DividerEditField("register")
    ]);
  }


  /*
  * widget for email address*/
  Widget _emailFieldWidget() {
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
                style: Style.userStyle,
                controller: _emailController,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 5.0),
                  isDense: true,
                  hintText:
                  DemoLocalizations.of(context).trans('email'),
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
          IconEditField("email"),
        ],
      ),

      DividerEditField("register")
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
                style: Style.userStyle,
                controller: _passwordController,
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
  * widget to confirm user password*/
  Widget _confirmPasswordFieldWidget() {
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
                style: Style.userStyle,
                obscureText: true,
                controller: _confirmPasswordController,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 5.0),
                  isDense: true,
                  hintText:
                  DemoLocalizations.of(context).trans('confirm'),
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
  * submit button*/
  Widget _registerButton(){
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
          onPressed: () {
            _submitFields();
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
                      DemoLocalizations.of(context).trans('reg').toUpperCase(),
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
  * on tap of register, validate data and submit at backend*/
  Future _submitFields()async{
    if (_userNameController.text.isEmpty) {
      //if user name is not entered
      Config.showToastCenter(DemoLocalizations.of(context).trans('err_username'));
    }else if (_emailController.text.isEmpty) {
      //if password is not entered
      Config.showToastCenter(DemoLocalizations.of(context).trans('err_email'));
    }else if (_passwordController.text.isEmpty) {
      //if password is not entered
      Config.showToastCenter(DemoLocalizations.of(context).trans('err_password'));
    }else if (_confirmPasswordController.text.isEmpty) {
      //if password is not entered
      Config.showToastCenter(DemoLocalizations.of(context).trans('err_cnfirm'));
    }else if (_confirmPasswordController.text != _passwordController.text) {
      //if password is not entered
      Config.showToastCenter(DemoLocalizations.of(context).trans('err_cnfirm_same'));
    }else{
      //submit data at backend
      submitData(context);
    }
  }


  void submitData(BuildContext context) {
    final reactiveModel = Injector.getAsReactive<RegisterStore>();
    reactiveModel.setState(
          (store) => store.registerUser(_userNameController.text, _emailController.text, _passwordController.text),
      onError: (context, error){

      },
      onData: (context, data){

      }
    );
  }
}

