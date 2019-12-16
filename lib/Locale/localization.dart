import 'package:flutter/material.dart';

class MyLocalizations {

  MyLocalizations(this.locale);

  final Locale locale;

  static MyLocalizations of(BuildContext context) {
    return Localizations.of<MyLocalizations>(context, MyLocalizations);
  }

  static Map<String, Map<String, String>> _localizedValues = {
    'en': {
      'appTitle': 'Social Wakfu',
      'updateGeneral': "Updating Database",
      'update1-1': 'Downloading Item Types',
      'update1-2': 'Updating Item Types',
      'update2-1': 'Downloading Actions',
      'update2-2': 'Updating Actions',
      'update3-1': 'Downloading Properties',
      'update3-2': 'Updating Properties',
      'update4-1': 'Downloading Items',
      'update4-2': 'Updating Items',
      'home': 'HOME',
      'builds': 'BUILDS',
      'market': 'MARKET',
    },
    'pt': {
      'appTitle': 'Social Wakfu',
      'updateGeneral': "Atualizando Banco de Dados",
      'update1-1': 'Baixando Tipos De Itens',
      'update1-2': 'Salvando Tipos De Itens',
      'update2-1': 'Baixando Ações',
      'update2-2': 'Salvando Ações',
      'update3-1': 'Baixando Propriedades',
      'update3-2': 'Salvando Propriedades',
      'update4-1': 'Baixando Itens',
      'update4-2': 'Salvando Itens',
      'home': 'INICIO',
      'builds': 'BUILDS',
      'market': 'MERCADO',
    },
    'es': {
      'appTitle': 'Social Wakfu',
    },
    'fr': {
      'appTitle': 'Social Wakfu',
    }
  };

  //App title
  String get title => _localizedValues[locale.languageCode]['appTitle'];
  
  //menus
  String get home => _localizedValues[locale.languageCode]['home'];
  String get build => _localizedValues[locale.languageCode]['builds'];
  String get market => _localizedValues[locale.languageCode]['market'];

  //Updates
  String get update => _localizedValues[locale.languageCode]['updateGeneral'];
  String get update11 => _localizedValues[locale.languageCode]['update1-1'];
  String get update12 => _localizedValues[locale.languageCode]['update1-2'];
  String get update21 => _localizedValues[locale.languageCode]['update2-1'];
  String get update22 => _localizedValues[locale.languageCode]['update2-2'];
  String get update31 => _localizedValues[locale.languageCode]['update3-1'];
  String get update32 => _localizedValues[locale.languageCode]['update3-2'];
  String get update41 => _localizedValues[locale.languageCode]['update4-1'];
  String get update42 => _localizedValues[locale.languageCode]['update4-2'];
}