include <vic-birthday-box.scad>;
use <qrcode.scad>;

intersection() {
    cylinder(r = wheel_r, h = wall_t);
    scale([qr_xy_scale, qr_xy_scale, 0]) topography();
}