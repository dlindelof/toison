package ch.visnet.toison;

import javafx.stage.Stage;
import javafx.scene.Scene;
import javafx.scene.text.Text;
import javafx.scene.text.Font;

/**
 * @author dlindelof
 */

Stage {
    title: "Toison"
    scene: Scene {
        width: 250
        height: 80
        content: [
            Text {
                font : Font {
                    size : 16
                }
                x: 10
                y: 30
                content: "Le Tic Toc"
            }
        ]
    }
}