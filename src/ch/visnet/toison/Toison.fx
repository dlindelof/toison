package ch.visnet.toison;

import javafx.stage.Stage;
import javafx.scene.Scene;
import javafx.scene.text.Text;
import javafx.scene.text.Font;
import javafx.animation.Timeline;
import javafx.animation.KeyFrame;
import javafx.util.Math;
import javafx.animation.Interpolator;

/**
 * @author dlindelof
 */

var STOPPED : Integer = 0;
var TIMING : Integer = 1;
var PAUSED : Integer = 2;
var UNTIMING : Integer = 3;
var state : Integer = STOPPED;

var displayContent : String = "00:00.000";
function timeToString(timeInMs : Integer) : String {
    var myTimeInMs = timeInMs;
    var minutes = myTimeInMs / 60000; // XXX
    myTimeInMs -= minutes * 60000;
    var seconds = myTimeInMs / 1000; // XXX
    myTimeInMs -= seconds * 1000;
    return "{minutes}:{seconds}.{myTimeInMs}";
}


var clock : Timeline = Timeline {
	repeatCount: Timeline.INDEFINITE
	keyFrames:
            KeyFrame {
                time: 1ms
                action: function() {

                }

            }

}


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