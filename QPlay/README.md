# Descripcion

Qplay es una aplicación que reproduce videos de videojuegos, permite al usuario hacer Login con su cuenta Google y Facebook, consta de 3 Modulos: Login, Home y Detail, la Home le permite al usuario selecionar el video que quiera y puede abrir la información del videojuego o reproducir el video de presentación del videojuego

# Librerias y Frameworks 
- UIKit
- RXSwift y RXCocoa
- Firebase
- GoogleSignIn
- ObjectMappper
- UserDefaults
- Cocoapods
- Alamofire
- Kingfisher
- AVKit

# Arquitectura

Este proyecto esta estructurado con la arquitectuta VIPER, cada módulo tiene su arquitectura para el manejo de sus funciones y cada parte tiene sus responsabilidades definidas

- V iew (Se encarga unicamente de configurar la vista)
- I nteractor (Contiene logica de negocio)
- P restenter (El puente de conexion entre todas las partes de la arquitectura)
- E ntity (Modelo de datos)
- R outer (Maneja las transiciones entre modulos)
