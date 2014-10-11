include <scad-meta/env.scad>;

emboss_depth = 2;
box_depth = 100;
box_wall_twist = 30;
wheel_r = 178;
wall_t = 2;
inside_xy_scale = 1 - wall_t/wheel_r;
qr_xy_scale = 1.5;

module translate_wheel_centre_to_origin() {
    y_tweak = 6;
    translate([-wheel_r, -wheel_r + y_tweak, 0]) {
        children();
    }
}

module box_solid(h, t = box_wall_twist) {
    linear_extrude(height = h, twist = t, slices = 10) {
        translate_wheel_centre_to_origin() {
            import(file = "wheel-solid.dxf");
        }
    }
}

module lid_emboss() {
    linear_extrude(height = emboss_depth) {
        translate_wheel_centre_to_origin() {
            import(file = "bioluminati-2014-sticker.dxf");
        }
    }
}

box_hole_twist = box_wall_twist*(box_depth - wall_t)/box_depth;

module box_shell() {
    translate([0, 0, -box_depth]) {
        rotate([0, 0, box_wall_twist]) {
            difference() {
                box_solid(box_depth + eps);
                scale([inside_xy_scale, inside_xy_scale, 1]) {
                    translate([0, 0, -eps]) {
                        box_solid(
                                  h = box_depth - wall_t + eps,
                                  t = box_hole_twist
                        );
                    }
                }
            }
        }
    }    
}

