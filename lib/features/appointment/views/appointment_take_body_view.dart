part of '../appointment_screen.dart';

class _AppointmentTakeBodyView extends StatefulWidget {
  const _AppointmentTakeBodyView({super.key});

  @override
  State<_AppointmentTakeBodyView> createState() =>
      __AppointmentTakeBodyViewState();
}

class __AppointmentTakeBodyViewState extends State<_AppointmentTakeBodyView> {
  // Future olarak saklayıp UI'ya doğrudan ileteceğiz

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppointmentAppbar(title: AppStrings.appName),
      body: SafeArea(
        // _appointmentSearchLocationCard daha önce Future<List<Il>> kabul edecek şekilde güncellenmişti
        child: _appointmentSearchLocationCard(context, () {
          setState(() {
            // setState içinde sadece UI'yı güncellemek için boş bırakıyoruz
            // Asıl veri yükleme işlemi _AppointmentSearchLocationCard içinde yapılacak
            // Bu yüzden burada herhangi bir veri yükleme işlemi yapmıyoruz
            // Sadece UI'yı yeniden çiziyoruz
            // Eğer farklı bir işlem yapılacaksa, o işlem burada tanımlanabilir
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const _AppointmentDeleteBodyView(),
              ),
            );
          });
        }),
      ),
    );
  }
}
