# Yu-Gi-Oh Cards App

Esta es una aplicación Flutter para mostrar y administrar cartas de Yu-Gi-Oh. La aplicación utiliza la arquitectura limpia (Clean Architecture) y el diseño atómico (Atomic Design) para mantener el código organizado y fácil de mantener.

## Características

- Ver una lista de cartas de Yu-Gi-Oh
- Ver detalles de una carta seleccionada
- Añadir una carta aleatoria a la lista de cartas seleccionadas
- Barajar las cartas
- Eliminar cartas de la lista

## Requisitos previos

Antes de comenzar, asegúrate de tener instalado lo siguiente:

- [Flutter](https://flutter.dev/docs/get-started/install) (SDK)
- [Dart](https://dart.dev/get-dart) (incluido con Flutter)
- Un editor de código como [Visual Studio Code](https://code.visualstudio.com/) o [Android Studio](https://developer.android.com/studio)

## Configuración del proyecto

1. **Clona el repositorio:**

    ```sh
    git clone https://github.com/tu-usuario/yugioh_app.git
    cd yugioh_app
    ```

2. **Instala las dependencias:**

    ```sh
    flutter pub get
    ```

3. **Corre la aplicación:**

    Conecta tu dispositivo físico o inicia un emulador, luego ejecuta:

    ```sh
    flutter run
    ```

## Estructura del Proyecto

El proyecto sigue la arquitectura limpia (Clean Architecture) y el diseño atómico (Atomic Design). A continuación, se describe la estructura principal de carpetas y archivos:

lib/
├── data/
│ ├── models/
│ │ └── yugioh_card.dart
│ ├── repositories/
│ │ └── yugioh_card_repository.dart
│ └── services/
│ └── yugioh_card_service.dart
├── domain/
│ ├── repositories/
│ │ └── yugioh_card_repository.dart
│ └── usecases/
│ └── get_yugioh_cards.dart
├── presentation/
│ ├── atoms/
│ │ ├── card_image.dart
│ │ ├── close_button.dart
│ │ ├── delete_button.dart
│ │ ├── elevated_action_button.dart
│ │ └── icon_button.dart
│ ├── molecules/
│ │ ├── card_item.dart
│ │ ├── detail_card_item.dart
│ │ └── selected_card_item.dart
│ ├── organisms/
│ │ ├── card_list.dart
│ │ ├── card_page_view.dart
│ │ └── detail_card_page_view.dart
│ ├── providers/
│ │ └── yugioh_card_provider.dart
│ └── views/
│ ├── card_detail_view.dart
│ └── card_list_view.dart
├── shared/
│ └── constants/
│ ├── api_constants.dart
│ └── constants.dart
└── main.dart

## Uso

### Agregar una carta aleatoria

Para agregar una carta aleatoria a la lista de cartas seleccionadas, toca el botón "Add Random Card". Si ya hay 5 cartas seleccionadas, se mostrará una alerta indicando que no se pueden agregar más cartas.

### Barajar cartas

Para barajar las cartas, toca el botón "Shuffle Cards". Esto reorganizará aleatoriamente las cartas en la lista.

### Eliminar una carta

Para eliminar una carta, toca el ícono de eliminar en la parte superior derecha de la carta que deseas eliminar.

### Ver detalles de una carta

Para ver los detalles de una carta, simplemente toca la carta en la lista. Se abrirá una nueva vista mostrando los detalles completos de la carta seleccionada.

## Contribuir

Las contribuciones son bienvenidas. Puedes contribuir de las siguientes maneras:

- Reportando errores y problemas
- Enviando nuevas características y mejoras
- Mejorando la documentación

Para comenzar, bifurca el repositorio, realiza tus cambios y envía una solicitud de extracción (pull request).

## Licencia

Este proyecto está bajo la Licencia MIT. Consulta el archivo [LICENSE](LICENSE) para obtener más detalles.
