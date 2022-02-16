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
  Function onTap,
  @required Function validate,
  @required String label,
  @required IconData prefix,
  bool isPassword = false,
  IconData suffix,
  Function suffixPressed,
  bool  isClickable = true,
}
) => TextFormField(
  controller: controller,
  keyboardType: type,
  obscureText: isPassword,
  onFieldSubmitted:onSubmit,
  onChanged:onChanged,
  enabled: isClickable,
  onTap:onTap,
  validator: validate,
  decoration: InputDecoration(
    labelText: label,
    prefixIcon: Icon(prefix),
    suffixIcon:suffix != null ? IconButton(
      onPressed:suffixPressed,
     icon:Icon(suffix)):null,
    border: OutlineInputBorder(),
  ),
);
Widget bulidTaskItem(Map model) => Padding(
  padding: const EdgeInsets.all(20.0),
  child: Row(
    children: [
      CircleAvatar(
        radius:35.0,
        child: Text(
          '${model['time']}',
        ),
      ),
      SizedBox(
        width: 20.0,
      ),
      Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment:CrossAxisAlignment.start,
          children: [
            Text(
                '${model['title']} ',
                style: TextStyle(
                  fontSize:18.0,
                  fontWeight: FontWeight.bold,
                )
            ),
            Text(
                '${model['data']} ',
                style: TextStyle(
                  color:Colors.grey ,

                )
            )
          ]
      )
    ],
  ),
);