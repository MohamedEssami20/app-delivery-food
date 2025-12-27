import 'dart:developer';

import 'package:app_delivey_food/core/function/global_validation_email.dart';
import 'package:app_delivey_food/core/helper/app_theme_helper.dart';
import 'package:app_delivey_food/core/utils/custom_button.dart';
import 'package:app_delivey_food/core/utils/custom_text_field.dart';
import 'package:app_delivey_food/features/cart/domain/entities/cart_item_entity.dart';
import 'package:app_delivey_food/features/checkout/entities/address_input_entity.dart';
import 'package:flutter/material.dart';

import '../../../../../core/function/global_validation_address_inputs.dart';

class AddressViewBody extends StatefulWidget {
  const AddressViewBody({super.key});

  @override
  State<AddressViewBody> createState() => _AddressViewBodyState();
}

class _AddressViewBodyState extends State<AddressViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? name, email, country, city, street;
  int? houseNumber, apartmentNumber, phone;
  
  late List<CartItemEntity> cartItemEntity;
  @override
  void initState() {
    super.initState();
    cartItemEntity = ModalRoute.of(context)!.settings.arguments as List<CartItemEntity>;
  }

  @override
  Widget build(BuildContext context) {
    final theme = AppThemeHelper(context);
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 40),
      child: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 12,
            children: [
              CustomTextFormFiled(
                hintText: "Your name",
                textInputType: TextInputType.text,
                onSaved: (value)=> name = value,
                validator: (value) {
                  return globalValidationAddressInputs(
                    value: value!,
                    message: "Please enter your name",
                  );
                },
              ),
              CustomTextFormFiled(
                hintText: "Email address",
                textInputType: TextInputType.text,
                onSaved: (value) => email = value,
                validator: (value) {
                  return globalValidtaionEmail(value);
                },
              ),
              CustomTextFormFiled(
                hintText: "Country name",
                textInputType: TextInputType.text,
                onSaved: (value) => country = value,
                validator: (value) => globalValidationAddressInputs(
                  value: value!,
                  message: "Please enter your country name",
                ),
              ),
              CustomTextFormFiled(
                hintText: "City name",
                onSaved: (value) => city = value,
                textInputType: TextInputType.text,
                validator: (value) => globalValidationAddressInputs(
                  value: value!,
                  message: "Please enter your city name",
                ),
              ),
              CustomTextFormFiled(
                hintText: "Street name",
                textInputType: TextInputType.text,
                onSaved: (value) => street = value,
                validator: (value) => globalValidationAddressInputs(
                  value: value!,
                  message: "Please enter your street name",
                ),
              ),
              CustomTextFormFiled(
                hintText: "House number",
                textInputType: TextInputType.number,
                onSaved: (value) => houseNumber,
                validator: (value) => globalValidationAddressInputs(
                  value: value!,
                  message: "Please enter your house number",
                ),
              ),
              CustomTextFormFiled(
                hintText: "Apartment number",
                textInputType: TextInputType.text,
                onSaved: (value) => apartmentNumber,
                validator: (value) => globalValidationAddressInputs(
                  value: value!,
                  message: "Please enter your Apartment number",
                ),
              ),
              CustomTextFormFiled(
                hintText: "Phone number",
                textInputType: TextInputType.phone,
                onSaved: (value) => phone,
                validator: (value) => globalValidationAddressInputs(
                  value: value!,
                  message: "Please enter your phone number",
                ),
              ),
              // Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                spacing: 12,
                children: [
                  Expanded(
                    child: Text(
                      "\$ 0.00",
                      style: theme.textStyles.displaySmall!.copyWith(
                        color: theme.colors.typography500,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: CustomButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          formKey.currentState!.save();
                          final AddressInputEntity addressInputEntity = AddressInputEntity(
                            name: name!,
                            email: email!,
                            country: country!,
                            city: city!,
                            street: street!,
                            houseNumber: houseNumber!,
                            apartmentNumber: apartmentNumber!,
                            phoneNumber: phone!,
                            dateTime: DateTime.now(),
                            cartItemEntity: cartItemEntity,
                          );

                          log("cart item entity = ${addressInputEntity.cartItemEntity}");
                        }
                        else{
                          autovalidateMode = AutovalidateMode.always;
                        }
                      },
                      label: "Pay with Pay pal",
                      padding: EdgeInsetsDirectional.symmetric(vertical: 12),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
