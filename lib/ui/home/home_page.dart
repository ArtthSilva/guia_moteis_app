import 'package:flutter/material.dart';
import 'package:guia_moteis_app/config/dependencies.dart';
import 'package:guia_moteis_app/ui/home/viewmodels/home_viewmodel.dart';
import 'package:guia_moteis_app/ui/themes/theme_app.dart';
import 'package:guia_moteis_app/ui/widgets/card_motel.dart';
import 'package:guia_moteis_app/ui/widgets/filter_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeViewModel homeViewModel = getIt<HomeViewModel>();
  bool selectedOption = true;
  @override
  void initState() {
    super.initState();
    homeViewModel.getAllMotels();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          alignment: AlignmentDirectional.topCenter,
          children: [
            Container(
              color: Color(0xFFD11521),
              width: MediaQuery.sizeOf(context).width,
              height: MediaQuery.sizeOf(context).height * 0.18,
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10, top: 15),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          Icons.format_align_left_rounded,
                          color: Colors.white,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: ThemeApp.red1,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Row(
                            children: [
                              _buildToggleButton(
                                text: "Ir agora",
                                icon: Icons.flash_on,
                                isSelected: selectedOption,
                                onTap: () {
                                  setState(() {
                                    selectedOption = true;
                                  });
                                },
                              ),
                              _buildToggleButton(
                                text: "Ir outro dia",
                                icon: Icons.calendar_today,
                                isSelected: !selectedOption,
                                onTap: () {
                                  setState(() {
                                    selectedOption = false;
                                  });
                                },
                              )
                            ],
                          ),
                        ),
                        Icon(
                          Icons.search,
                          size: 28,
                          color: Colors.white,
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'cabedelo',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Icon(Icons.keyboard_arrow_down_rounded,
                            color: Colors.white),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: MediaQuery.sizeOf(context).width,
                height: MediaQuery.sizeOf(context).height * 0.82,
                decoration: BoxDecoration(
                  color: Color(0xFFF7F9FB),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Column(
                  children: [
                    SingleChildScrollView(
                      padding: EdgeInsets.all(5),
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          FilterButton(
                              labelText: "filtros",
                              filterIcon: Icons.filter_list),
                          FilterButton(labelText: "com desconto"),
                          FilterButton(labelText: "disponíveis"),
                          FilterButton(labelText: "hidro"),
                        ],
                      ),
                    ),
                    Divider(
                      color: ThemeApp.gray,
                    ),
                    ValueListenableBuilder<bool>(
                      valueListenable: homeViewModel.isLoading,
                      builder: (context, isLoading, child) {
                        if (isLoading) {
                          return Center(child: CircularProgressIndicator());
                        }

                        return ValueListenableBuilder<List<dynamic>>(
                          valueListenable: homeViewModel.motels,
                          builder: (context, motels, child) {
                            if (motels.isEmpty) {
                              return Center(
                                  child: Text("Nenhum motel encontrado"));
                            }

                            return Flexible(
                              child: ListView.builder(
                                padding: EdgeInsets.all(8),
                                itemCount: motels.length,
                                itemBuilder: (context, index) {
                                  final motel = motels[index];
                                  return CardMotel(motelOption: motel);
                                },
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildToggleButton({
    required String text,
    required IconData icon,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        decoration: BoxDecoration(
          color: isSelected ? Colors.white : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: isSelected ? ThemeApp.red1 : Colors.white,
              size: 20,
            ),
            SizedBox(width: 8),
            Text(
              text,
              style: TextStyle(
                color: isSelected ? ThemeApp.red1 : Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
