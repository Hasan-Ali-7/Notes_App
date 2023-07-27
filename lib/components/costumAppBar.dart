import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../logic/cubits/app_cubit.dart';
import 'constants.dart';

class CostumeAppBar extends StatelessWidget {

  const CostumeAppBar({
    Key? key, 
    required this.title, 
    this.icon, 
    this.iconPressed
    }): super(key: key);

    final String title;
    final IconData? icon;
    final void Function()? iconPressed;

  @override
  Widget build(BuildContext context) {

    App_Cubit cubit = BlocProvider.of<App_Cubit>(context);

    return Padding(
      padding: const EdgeInsets.only(
          top: 20,
          bottom: 10,
          left: 20,
          right: 10),
      child: Row(
        mainAxisAlignment:
            MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 34,
            ),
          ),
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: kColor,
                    borderRadius:
                        BorderRadius.circular(7)),
                child: IconButton(
                    onPressed: () =>
                        cubit.changeAppMode(),
                    icon: Icon(
                      cubit.isDark
                          ? Icons.brightness_6
                          : Icons.brightness_2,
                      size: 25,
                      color: Colors.white,
                    )),
              ),
              icon != null ? const SizedBox(
                width: 10,
              ): const Padding(padding: EdgeInsets.all(0)),
              icon != null ? Container(
                decoration: BoxDecoration(
                    color: kColor,
                    borderRadius:
                        BorderRadius.circular(7)),
                child: IconButton(
                  onPressed: iconPressed,
                  icon: Icon(
                    icon,
                    size: 25,
                    color: Colors.white,
                  )
                ),
              ): const Padding(padding: EdgeInsets.all(0))
            ],
          ),
        ],
      ),
    );
  }
}
