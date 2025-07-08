const rl = @import("raylib");

fn draw_tiles() void {
    var tile_pos = [2]i32{ 0, 0 };
    while (tile_pos[0] < rl.getScreenWidth() and tile_pos[1] < rl.getScreenHeight()) {
        rl.drawRectangle(tile_pos[0], tile_pos[1], 100, 100, rl.Color.yellow);
        tile_pos[0] = tile_pos[0] + 101;
        if (tile_pos[0] > rl.getScreenWidth()) {
            tile_pos[1] = tile_pos[1] + 101;
            tile_pos[0] = 0;
        }
    }
    tile_pos[0] = 0;
    tile_pos[1] = 0;
}

pub fn main() anyerror!void {
    // Initialization
    //--------------------------------------------------------------------------------------
    const screenWidth = 800;
    const screenHeight = 450;

    rl.initWindow(screenWidth, screenHeight, "raylib-zig [core] example - basic window");
    defer rl.closeWindow(); // Close window and OpenGL context

    rl.setTargetFPS(60); // Set our game to run at 60 frames-per-second
    //--------------------------------------------------------------------------------------

    // Main game loop
    while (!rl.windowShouldClose()) { // Detect window close button or ESC key
        // Update
        //----------------------------------------------------------------------------------
        // TODO: Update your variables here
        //----------------------------------------------------------------------------------

        // Draw
        //----------------------------------------------------------------------------------
        rl.beginDrawing();
        defer rl.endDrawing();

        rl.clearBackground(.black);

        draw_tiles();

        //----------------------------------------------------------------------------------
    }
}
