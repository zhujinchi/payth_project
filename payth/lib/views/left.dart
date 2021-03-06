import 'package:flutter/material.dart';
import 'package:payth/state/shopping_cart.dart';
import 'package:payth/state/user_login_register.dart';
import 'package:payth/views/product_items.dart';
import 'package:provider/provider.dart';


class LeftView extends StatefulWidget {
  const LeftView({Key? key}) : super(key: key);

  @override
  State<LeftView> createState() => _LeftViewState();
}

class _LeftViewState extends State<LeftView> {

  @override
  void initState(){
    super.initState();
    var provider = context.read<ShoppingCartProvider>();
    provider.initProduct();
    print(provider.product);
  }


  @override
  Widget build(BuildContext context) {
    var headingTextStyle = const TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 18.0,
    );
    var subHeadingTextStyle = const TextStyle(
      color: Colors.grey,
      fontSize: 12.0,
    );
    return Container(
      padding: const EdgeInsets.all(32.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text('Card Payth', style: headingTextStyle),
              Consumer<ShoppingCartProvider>(builder: (context, value, state) {
                return Text('${value.product.length} Items',
                    style: headingTextStyle);
              }),
            ],
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 16.0),
            height: 1.0,
            color: Colors.grey,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('PRODUCT DETAILS', style: subHeadingTextStyle),
              Text('QUANTITY', style: subHeadingTextStyle),
              Text('PRICE', style: subHeadingTextStyle),
              Text('TOTAL', style: subHeadingTextStyle),
            ],
          ),
          Consumer<ShoppingCartProvider>(builder: (context, value, state) {
            return Container(
              height: 700,
              child: ListView.builder(

                // physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => ProductItemView(
                  productModel: value.product[index],
                ),
                itemCount: value.product.length,
                shrinkWrap: true,
              ),
            );
          }),
          const Spacer(),
          ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.contact_phone),
              label: const Text("Contact with us: Angzeng@iCloud.com")),
        ],
      ),
    );
  }
}
