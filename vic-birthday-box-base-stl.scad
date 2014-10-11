include <vic-birthday-box.scad>;
use <qrcode.scad>;

clearance = 1.5;
base_xy_scale = 1 - (2*wall_t + clearance)/wheel_r;
base_twist = box_wall_twist*wall_t/box_depth;


rotate([180, 0, 0]) {
    difference() {
        union() {
            scale([base_xy_scale, base_xy_scale, 1]) {
                box_shell();
            }
            translate([0, 0, -wall_t]) {
                rotate([0, 0, base_twist]) {
                    box_solid(h = 2*wall_t, t = 2*base_twist);
                }
            }
        }
        scale([qr_xy_scale, qr_xy_scale, 0]) topography();
    }
}
