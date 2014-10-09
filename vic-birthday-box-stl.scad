include <scad-meta/env.scad>;

emboss_depth = 2;
box_depth = 40;
box_wall_twist = 15;
wheel_r = 178;

module translate_wheel_centre_to_origin() {
	y_tweak = 6;
	translate([-wheel_r, -wheel_r + y_tweak, 0]) {
		children();
	}
}

module box_solid(h) {
	linear_extrude(height = h, twist = box_wall_twist) {
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

translate([0, 0, -box_depth]) {
	rotate([0, 0, box_wall_twist]) {
		box_solid(box_depth + eps);
	}
}
lid_emboss();