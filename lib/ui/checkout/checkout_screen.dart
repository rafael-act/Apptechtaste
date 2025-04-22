import 'package:flutter/material.dart';
import 'package:myapp/model/dish.dart';
import 'package:myapp/ui/_core/app_colors.dart';
import 'package:myapp/ui/_core/bag_provider.dart';
import 'package:provider/provider.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    BagProvider bagProvider = Provider.of<BagProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Sacola', textAlign: TextAlign.center),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: () {
              bagProvider.clearBag();
            },
            child: Text("Limpar", style: TextStyle(color: AppColors.mainColor)),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                child: Text(
                  "Pedido",
                  style: TextStyle(
                    color: AppColors.lightOrange,
                    fontSize: 18.0,
                  ),
                ),
              ),
              ...List.generate(bagProvider.getMapByAmount().keys.length, (
                index,
              ) {
                Dish dish = bagProvider.getMapByAmount().keys.toList()[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 0.0,
                    vertical: 8.0,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.lightBackgroundColor,
                          blurRadius: 0,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: ListTile(
                      tileColor: AppColors.backgroundGrayCard,
                      minVerticalPadding: 0,
                      contentPadding: EdgeInsets.zero,
                      leading: ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8.0),
                          bottomLeft: Radius.circular(8.0),
                        ),
                        child: SizedBox(
                          width: 64,
                          height: double.infinity,
                          child: Image.asset(
                            'assets/dishes/default.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      title: Text(
                        dish.name,
                        style: TextStyle(
                          fontSize: 18.0,
                          color: AppColors.lightOrange,
                        ),
                      ),
                      subtitle: Text(
                        'R\$:${dish.price.toStringAsFixed(2)}',
                        style: TextStyle(color: AppColors.lightOrange),
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            onPressed: () {
                              context.read<BagProvider>().removeDish(dish);
                            },
                            icon: Icon(Icons.remove),
                          ),
                          Text(
                            bagProvider.getMapByAmount()[dish].toString(),
                            style: TextStyle(fontSize: 18.0),
                          ),
                          IconButton(
                            onPressed: () {
                              context.read<BagProvider>().addAllDishes([dish]);
                            },
                            icon: Icon(Icons.add),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }),
              SizedBox(height: 20),
              Text(
                "Pagamento",
                style: TextStyle(color: AppColors.lightOrange, fontSize: 18.0),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 18.0),
                child: ListTile(
                  tileColor: AppColors.backgroundGrayCard,
                  minVerticalPadding: 0,
                  contentPadding: EdgeInsets.zero,
                  leading: ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8.0),
                      bottomLeft: Radius.circular(8.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: SizedBox(
                        width: 32,
                        height: double.infinity,
                        child: Image.asset('assets/others/visa.png'),
                      ),
                    ),
                  ),
                  title: Text(
                    'Rua das Flores, 123',
                    style: TextStyle(
                      fontSize: 18.0,
                      color: AppColors.lightOrange,
                    ),
                  ),
                  subtitle: Text(
                    'Bairro Centro, Cidade',
                    style: TextStyle(color: AppColors.lightOrange),
                  ),
                  trailing: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.mainColor,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 22),
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.chevron_right, color: Colors.black),
                        padding: EdgeInsets.all(12.0),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text(
                "Entregar no endereço:",
                style: TextStyle(color: AppColors.lightOrange, fontSize: 18.0),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 18.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.backgroundGrayCard, // cor do card
                    borderRadius: BorderRadius.circular(
                      12,
                    ), // bordas arredondadas
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.lightBackgroundColor,
                        blurRadius: 2,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: ListTile(
                    tileColor: AppColors.backgroundGrayCard,
                    minVerticalPadding: 0,
                    contentPadding: EdgeInsets.zero,
                    leading: ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12.0),
                        bottomLeft: Radius.circular(12.0),
                      ),
                      child: SizedBox(
                        width: 64,
                        height: double.infinity,
                        child: Icon(Icons.place),
                      ),
                    ),
                    title: Text(
                      'Rua das Flores, 123',
                      style: TextStyle(
                        fontSize: 18.0,
                        color: AppColors.lightOrange,
                      ),
                    ),
                    subtitle: Text(
                      'Bairro Centro, Cidade',
                      style: TextStyle(color: AppColors.lightOrange),
                    ),
                    trailing: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.mainColor,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 22),
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.chevron_right, color: Colors.black),
                          padding: EdgeInsets.all(12.0),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Text(
                "Confirmar",
                style: TextStyle(color: AppColors.lightOrange, fontSize: 18.0),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 18.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.backgroundGrayCard, // cor do card
                    borderRadius: BorderRadius.circular(
                      12,
                    ), // bordas arredondadas
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.lightBackgroundColor,
                        blurRadius: 2,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.backgroundGrayCard, // cor do card
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Suggested code may be subject to a license. Learn more: ~LicenseLog:4124574479.
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 14.0,
                            left: 18.0,
                            right: 18.0,
                            bottom: 3,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Pedido:',
                                style: TextStyle(
                                  color: AppColors.lightOrange,
                                  fontSize: 14.0,
                                ),
                              ),
                              Text(
                                'R\$: 53,90',
                                style: TextStyle(
                                  color: AppColors.mainColor,
                                  fontSize: 14.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 18.0,
                            vertical: 3,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Entrega:',
                                style: TextStyle(
                                  color: AppColors.lightOrange,
                                  fontSize: 14.0,
                                ),
                              ),
                              Text(
                                'R\$ 6,00',
                                style: TextStyle(
                                  color: AppColors.lightOrange,
                                  fontSize: 14.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 18.0,
                            vertical: 3,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Total:',
                                style: TextStyle(
                                  color: AppColors.lightOrange,
                                  fontSize: 14.0,
                                ),
                              ),
                              Text(
                                'R\$ 59,90',
                                style: TextStyle(
                                  color: AppColors.mainColor,
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: SizedBox(
                            width: double.infinity,
                            child: ElevatedButton.icon(
                              onPressed: () {},
                              icon: Icon(
                                Icons.account_balance_wallet_outlined,
                                color: Colors.black,
                              ),
                              label: Text(
                                'Pedir',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18.0,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
