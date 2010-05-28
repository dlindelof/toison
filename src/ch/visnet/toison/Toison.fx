package ch.visnet.toison;

import javafx.stage.Stage;
import javafx.scene.Scene;
import javafx.scene.text.Text;
import javafx.scene.text.Font;
import javafx.animation.Timeline;
import javafx.animation.KeyFrame;
import javafx.util.Math;
import javafx.animation.Interpolator;
import java.text.SimpleDateFormat;
import java.util.Date;
import javafx.scene.input.KeyEvent;
import java.lang.System;
import javafx.scene.input.MouseEvent;
import javafx.scene.shape.Rectangle;
import javafx.scene.paint.Color;
import javafx.scene.layout.Flow;
import javafx.scene.image.Image;
import javafx.scene.image.ImageView;
import javafx.date.DateTime;

/**
 * @author dlindelof
 */
var STOPPED: Integer = 0;
var TIMING: Integer = 1;
var PAUSED: Integer = 2;
var UNTIMING: Integer = 3;
var state: Integer = STOPPED;

var sdf = new SimpleDateFormat("mmssSSS");

var elapsedMillis = 0;
var clockMillis = 0;


def images: Image[] = for(i in [0..11]){Image {url: "{__DIR__}{i}.png"};}

var currImgs: Image[];
updateClock(0);
currImgs[6] = images[10];
currImgs[7] = images[11];


function updateClock(millis: Integer) {
    def mmssSSS = sdf.format(millis);
    // Finally, map strings to images
    currImgs[0] = images[Integer.parseInt(mmssSSS.substring(0, 1))];
    currImgs[1] = images[Integer.parseInt(mmssSSS.substring(1, 2))];
    currImgs[2] = images[Integer.parseInt(mmssSSS.substring(2, 3))];
    currImgs[3] = images[Integer.parseInt(mmssSSS.substring(3, 4))];
    currImgs[4] = images[Integer.parseInt(mmssSSS.substring(4, 5))];
    currImgs[5] = images[Integer.parseInt(mmssSSS.substring(5, 6))];
}

function computeTime() {
    if (clockMillis == 0) clockMillis = System.currentTimeMillis();
    var now = System.currentTimeMillis();
    elapsedMillis = now - clockMillis;
}


var duration : Duration;
var clock : Timeline = Timeline {
	repeatCount: Timeline.INDEFINITE
	keyFrames:
            KeyFrame {
                time: 47ms
                action: function () {
                    computeTime();
                    updateClock(elapsedMillis);
                    //displayContent = durationToString(clock.totalDuration)
                }
            }
        };

clock.play();

Stage {
    title: "Toison"
    fullScreen: true
    scene: Scene {
        width: 1024
        height: 600
        fill: Color.BLACK
        content: Flow {
            hgap: 8
            layoutX: 512
            layoutY: 300
            content: [ImageView {image: bind currImgs[0] },
                ImageView {image: bind currImgs[1] },
                ImageView {image: bind currImgs[6] }, // LED dots
                ImageView {image: bind currImgs[2] },
                ImageView {image: bind currImgs[3] },
                ImageView {image: bind currImgs[7] }, // LED period
                ImageView {image: bind currImgs[4] },
                ImageView {image: bind currImgs[5] }]
        }
    }
}
