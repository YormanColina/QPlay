<div align='center'>
<a href="url"><img src="https://github.com/YormanColina/QPlay/blob/main/QPlay/Resources/Login.png" align="leading" height=500></a>
<a href="url"><img src="https://github.com/YormanColina/QPlay/blob/main/QPlay/Resources/Home.png" align="center" height=500></a>
<a href="url"><img src="https://github.com/YormanColina/QPlay/blob/main/QPlay/Resources/Detail.png" align="trailing" height=500></a>
</div>

# Descripcion

Qplay es una aplicación que reproduce videos de videojuegos, permite al usuario hacer Login con su cuenta Google y Facebook, consta de 3 Modulos: Login, Home y Detail, la Home le permite al usuario selecionar el video que quiera y puede abrir la información del videojuego o reproducir el video de presentación del videojuego

# Librerias y Frameworks 
- UIKit (Creación y configuración de vistas)
- RXSwift y RXCocoa (Comunicación entre las partes de la arquitectura para el pase de información)
- Firebase (Crear acceso a Google y Facebook)
- GoogleSignIn (Acceso con cuenta Google)
- ObjectMappper (Mapeo de información)
- UserDefaults (Guarddar información en el dispositivo)
- Cocoapods (Manejo de dependencias)
- Alamofire (Consumo de API)
- Kingfisher (descarga de imagenes)
- AVKit (reproduccion de los videos)

# Arquitectura

Este proyecto esta estructurado con la arquitectuta VIPER, cada módulo tiene su arquitectura para el manejo de sus funciones y cada parte tiene sus responsabilidades definidas, en esta ocasiòn implemente una extension de la arquitectura llamada Module

- V iew (Se encarga unicamente de configurar la vista)
- I nteractor (Contiene logica de negocio)
- P restenter (El puente de conexion entre todas las partes de la arquitectura)
- E ntity (Modelo de datos)
- R outer (Maneja las transiciones entre modulos)
- Module(extension) se encarga de crear el modulo

# Como esta estructurado el proyecto

- Qplay: Carpeta base del proyecto
    - Info
    - GoogleService-Info
    - Resources: Imagenes y colores
    - Base: SceneDelegate, AppDelegate
    - Modules
        - Login: Se encarga de darle el ingreso al usuario a la aplicación mediante su cuenta de Google o su cuenta de Facebook y hace autenticación de el usuario que ingresó
        - Home: Muestra una colleccion de vistas con los videojuegos, tiene una seccion de explorar todos los videojuegos y una seccion de los que ya se han visto, se pueden repoducir los videos directamente oprimiendo play
        - Detail: Muestra información del juego, el raiting que tiene, descripcion y da la opcion de reproducir el video

# Como correr el proyecto

- git clone git@github.com:YormanColina/QPlay.git
- cd Qplay/
- pod install
- open Qplay.xworkspace
- command + R

Nota, las imágenes estan tomadas desde un simulador de iphone 11, de preferencia escoger este simulador para correr la app
  
