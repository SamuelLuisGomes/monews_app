import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:monews_app/components/app_bar_static_components.dart';
import 'package:provider/provider.dart';
import 'package:monews_app/themes/theme_provider.dart';

class ConfiguracoesView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarStatic(),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              const Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: Row(
                  children: [
                    Text(
                      'Configurações',
                      style: TextStyle(
                          // color:
                          //     Theme.of(context).textTheme.displaySmall!.color,
                          fontSize: 26,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 16),
                      child: Text(
                        'Gerais',
                        style: TextStyle(
                          //color: Theme.of(context).textTheme.displaySmall!.color,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Expanded(
                        child: Divider(
                      //color: Colors.white,
                      thickness: 0.8,
                    ))
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Tema escuro',
                      style: TextStyle(
                        //color: Theme.of(context).textTheme.displaySmall!.color,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Consumer<ThemeProvider>(
                      builder: (context, themeProvider, _) {
                        return Switch(
                          value: themeProvider.isDarkMode,
                          onChanged: (value) {
                            themeProvider.toggleTheme();
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
              const Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 16),
                      child: Text(
                        'Notícias',
                        style: TextStyle(
                          //color: Theme.of(context).textTheme.displaySmall!.color,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Expanded(
                        child: Divider(
                      //color: Colors.white,
                      thickness: 0.8,
                    ))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
