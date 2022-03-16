//
//  SceneDelegate.swift
//  Presentation
//
//  Created by Arlin Lisette Ropero Infante - Ceiba Software on 9/02/22.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var globalNavigationController: UINavigationController?

    func scene(_ scene: UIScene,
               willConnectTo session: UISceneSession,
               options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window`
        // to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see
        // `application:configurationForConnectingSceneSession` instead).
        guard let windowScene = (scene as? UIWindowScene) else { return }

        let window = UIWindow(windowScene: windowScene)
        window.backgroundColor = .white

        let viewController = HomeRouter.createHomeModule()
        let navigation = UINavigationController(rootViewController: viewController)

        window.rootViewController = navigation

        self.window = window
        window.makeKeyAndVisible()
    }

    func sceneDidDisconnect(_ scene: UIScene) {
//        La escena que UIKit desconectó de tu aplicación.

//        Utilice este método para realizar cualquier limpieza final antes de que la escena se elimine de la memoria.
//        Por ejemplo, utilícelo para liberar referencias a archivos o
//        recursos compartidos y para guardar datos de usuario.
//
//        La eliminación de una escena es un precursor de la destrucción de esa escena.
//        UIKit desconecta una escena cuando el usuario la cierra explícitamente en el selector de aplicaciones.
//        UIKit también puede desconectar una escena para recuperar memoria para otros procesos.
//        UIKit no desconecta automáticamente una escena cuando el usuario cambia a otra aplicación.
//
//        UIKit también publica una notificación además de llamar a este método. didDisconnectNotification

        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded
        // (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
//        La escena que se activó y ahora responde a los eventos de los usuarios.
//
//        Para usar este método, debe implementar el protocolo y configurar escenas para su aplicación
//        (consulte Especificación de las escenas que admite su aplicación ).UISceneDelegate
//
//        Utilice este método para preparar su escena para estar en pantalla.
//        UIKit llama a este método después de cargar la interfaz para su escena,
//        pero antes de que esa interfaz aparezca en pantalla.
//        Úselo para actualizar el contenido de las vistas,
//        iniciar temporizadores o aumentar la velocidad de fotogramas de su interfaz de usuario.
//
//        Además de llamar a este método, UIKit publica un y un .didActivateNotificationdidBecomeActiveNotification
//
//        Para obtener más información sobre qué hacer cuando su aplicación se activa,
//        consulte Preparar su interfaz de usuario para que se ejecute en primer plano .

        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
//        La escena que está a punto de dejar de responder a los eventos del usuario.
//
//        Para usar este método, debe implementar el protocolo y configurar escenas para su aplicación
//        (consulte Especificación de las escenas que admite su aplicación ).UISceneDelegate
//
//        UIKit llama a este método para interrupciones temporales, como cuando se muestran alertas del sistema.
//        También llama al método antes de hacer la transición de su aplicación al estado de fondo.
//
//        Utilice este método para silenciar su interfaz y prepararla para dejar de interactuar con el usuario.
//        Específicamente, pause las tareas en curso, deshabilite los temporizadores y
//        reduzca la velocidad de fotogramas o deje de actualizar su interfaz por completo.
//        Los juegos deben usar este método para pausar el juego. Para cuando este método regrese,
//        su aplicación debería estar haciendo un trabajo mínimo mientras espera
//        la transición al segundo plano o al primer plano nuevamente.
//
//        Si su escena tiene datos de usuario sin guardar,
//        guárdelos con este método para asegurarse de que no se pierdan.
//        Sin embargo, nunca guarde datos únicamente con este método.
//        En su lugar, guárdelo en los puntos apropiados de sus controladores de vista,
//        generalmente en respuesta a las acciones del usuario.
//        Por ejemplo, guarde los datos cuando el usuario descarte una pantalla de ingreso de datos.
//        No confíe en transiciones de aplicaciones específicas para guardar todos los datos críticos de su aplicación.
//
//        Además de llamar a este método, UIKit publica un y un .willDeactivateNotificationwillResignActiveNotification
//
//        Para obtener más información sobre qué hacer cuando su aplicación renuncia al estado activo,
//        consulte Preparar su IU para ejecutarse en segundo plano .

        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
//        La escena que está a punto de entrar en primer plano.
//
//        Para usar este método, debe implementar el protocolo y configurar escenas para su aplicación
//        (consulte Especificación de las escenas que admite su aplicación ).UISceneDelegate
//
//        UIKit llama a este método antes de mover una escena al primer plano.
//        Esta transición se produce tanto para escenas recién creadas y conectadas,
//        como para escenas que se estaban ejecutando en segundo plano y que el sistema o
//        la acción del usuario pusieron en primer plano.
//        Una escena entra en primer plano como precursora de hacerse visible en la pantalla,
//        por lo que este método va seguido invariablemente de una llamada al método.sceneDidBecomeActive(_:)
//
//        Además de llamar a este método, UIKit publica un y un .didActivateNotificationwillEnterForegroundNotification
//
//        Para obtener más información sobre qué hacer cuando su aplicación está a punto de pasar al primer plano,
//        consulte Preparación de la interfaz de usuario para que se ejecute en primer plano .

        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
//        La escena que pasó a un segundo plano.
//
//        Para usar este método, debe implementar el protocolo y configurar escenas para su aplicación
//        (consulte Especificación de las escenas que admite su aplicación ).UISceneDelegate
//
//        Utilice este método para reducir el uso de memoria de su escena,
//        liberar recursos compartidos y limpiar la interfaz de usuario de su escena.
//        Poco después de que este método regrese,
//        UIKit toma una instantánea de la interfaz de su escena para mostrarla en el selector de aplicaciones.
//        Asegúrese de que su interfaz no contenga información confidencial del usuario.
//
//        Además de llamar a este método, UIKit publica una notificación de y
//        .didEnterBackgroundNotificationUIApplicationUIScene
//
//        Para obtener más información sobre qué hacer cuando su aplicación pasa a segundo plano,
//        consulte Preparar la interfaz de usuario para que se ejecute en segundo plano.

        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }
}
