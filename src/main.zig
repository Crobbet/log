const rl = @import("raylib");
const std = @import("std");

fn printd(p: f32) !void {
    std.debug.print("{}", .{p});
}

pub fn main() anyerror!void {
    const screenWidth = 800;
    const screenHeight = 450;

    const positionx = 190;
    var positiony = [2]f32{ 200, 10 };

    rl.initWindow(screenWidth, screenHeight, "raylib-zig [core] example - basic window");
    defer rl.closeWindow();
    rl.setTargetFPS(60);

    while (!rl.windowShouldClose()) {
        if (positiony[1] < 10) {
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
        try printd(positiony[1]);
    }
}
