const rl = @import("raylib");
const std = @import("std");

pub fn main() anyerror!void {
    // Initialization
    //--------------------------------------------------------------------------------------
    const screenWidth = 800;
    const screenHeight = 450;
    const positionx = 190;

    rl.initWindow(screenWidth, screenHeight, "raylib-zig [core] example - basic window");
    defer rl.closeWindow(); // Close window and OpenGL context

    rl.setTargetFPS(60); // Set our game to run at 60 frames-per-second
    //--------------------------------------------------------------------------------------

    var positiony = [2]f32{ 200, 6 };

    while (!rl.windowShouldClose()) { // Detect window close button or ESC key
        // Update
        //----------------------------------------------------------------------------------
        // TODO: Update your variables here
        if (positiony[1] < 3) {
            positiony[1] = positiony[1] + 1;
        } else if (rl.isKeyPressed(rl.KeyboardKey.space)) {
            positiony[1] = -17;
        }
        positiony[0] = positiony[0] + positiony[1];
        // Draw
        //----------------------------------------------------------------------------------
        rl.beginDrawing();
        defer rl.endDrawing();

        rl.clearBackground(rl.Color.black);

        rl.drawText("Hallo world!", positionx, @intFromFloat(positiony[0]), 20, rl.Color.white);
        std.debug.print("{}", .{positiony[0]});
        //----------------------------------------------------------------------------------
    }
}
