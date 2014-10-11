include <vic-birthday-box.scad>;

cog_margin = 15;

rotate([180, 0, 0]) {
    difference() {
        cylinder(h = emboss_depth - eps2, r = wheel_r - cog_margin);
        translate([0, 0, -eps]) lid_emboss();
    }
}