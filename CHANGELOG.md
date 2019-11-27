## [0.0.1] - 25/08/2019.

* First release: Added application configuration.

## [0.0.2] - 26/08/2019.

* Changed localizationsDelegate field name to localizationsDelegates.

* Changed type of property from single delegate to list of localization delegates.
This allow an application configuration to provide multiple localization delegates

## [1.0.0] - 27/11/2019.

* Added support for dependencies inside of ApplicationConfiguration.
  This allow you to specify the dependency that an application configuration is depending on, 
  those dependency will be provided using provider library.

* Added possibility to update current application configuration on the fly,
  using FAppConfigurationApplication.update method.

* Added FAppConfigurationApplication class and FAppConfigurationApplicationState class 
  to allow custom implementation of application widget without loosing update the functionality.