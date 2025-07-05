const rl = @import("raylib");
const std = @import("std");

const Pipe = struct {
    x_pipes: i32,
    pub fn draw_pipe(self: *Pipe) void {
        rl.drawRectangle(self.x_pipes, 0, 100, rl.getScreenHeight(), rl.Color.white);
    }
    pub fn move_pipe(self: *Pipe) void {
        self.x_pipes = self.x_pipes + 1;
    }
};

fn death(players_y_position: i32) bool {
    return players_y_position > rl.getScreenHeight();
}

pub fn main() anyerror!void {
    const screenWidth = 800;
    const screenHeight = 450;

    const positionx = 190;
    var color: rl.Color = rl.Color.yellow;

    var positiony = [2]i32{ 200, 10 };

    rl.initWindow(screenWidth, screenHeight, "raylib-zig [core] example - basic window");

    defer rl.closeWindow();
    rl.setTargetFPS(60);

    var pipe = Pipe{ .x_pipes = rl.getScreenWidth() };

    while (!rl.windowShouldClose()) {
        if (positiony[1] < 10) {
            color = rl.Color.green;
            positiony[1] = positiony[1] + 1;
        } else if (rl.isKeyPressed(rl.KeyboardKey.space)) {
            positiony[1] = -17;
        } else {
            color = rl.Color.red;
        }
        positiony[0] = positiony[0] + positiony[1];

        // Draw
        //----------------------------------------------------------------------------------
        rl.beginDrawing();
        defer rl.endDrawing();

        rl.clearBackground(rl.Color.black);
        rl.drawCircle(positionx, positiony[0], 20, color);

        pipe.draw_pipe();

        pipe.move_pipe();

        if (death(positiony[0])) {
            break;
        }
    }
}
