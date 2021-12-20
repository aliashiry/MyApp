import 'package:flutter/material.dart';

Widget defaultButton({
  double width = double.infinity,
  Color background = Colors.blue,
  bool isUpperCase = true,
  double radius =10.0,
  @required Function function,
  @required String text,
}) =>
    Container(
      width: width,
      height: 40.0,
      child: MaterialButton(
        onPressed: function,
        child: Text(isUpperCase ? text.toUpperCase() : text,
            style: TextStyle(
              color: Colors.white,
            )),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: background,
      ),
    );
Widget defaultFormFiled(
{
  @required TextEditingController controller,
  @required TextInputType type,
  Function onSubmit,
  Function onChanged,
  @required Function validate,
  @required String label,
  @required IconData prefix,
  bool isPassword = false,
  IconData suffix,
}
) => TextFormField(
  controller: controller,
  keyboardType: type,
  obscureText: isPassword,
  onFieldSubmitted:onSubmit,
  onChanged:onChanged,
  validator: validate,
  decoration: InputDecoration(
    labelText: label,
    prefixIcon: Icon(prefix),
    suffixIcon:suffix != null ? Icon(suffix):null,
    border: OutlineInputBorder(),
  ),
);