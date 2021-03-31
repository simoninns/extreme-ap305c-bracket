/************************************************************************

	springs.scad
    
	Extreme Networks AP305C Bracket
    Copyright (C) 2021 Simon Inns
    
    This program is free software: you can redistribute it and/or modify
	it under the terms of the GNU General Public License as published by
	the Free Software Foundation, either version 3 of the License, or
	(at your option) any later version.
    
    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.
    
    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.
	
    Email: simon.inns@gmail.com
    
************************************************************************/

include <BOSL/constants.scad>
use <BOSL/transforms.scad>
use <BOSL/shapes.scad>

module large_dividers()
{
    difference() {
        union() {
            rotate([0,0,0]) {
                move([0,50,4]) rotate([90,0,0]) prismoid(size1=[50,8], size2=[0,8], h=50);
            }

            rotate([0,0,360/3]) {
                move([0,50,4]) rotate([90,0,0]) prismoid(size1=[50,8], size2=[0,8], h=50);
            }

            rotate([0,0,-360/3]) {
                move([0,50,4]) rotate([90,0,0]) prismoid(size1=[50,8], size2=[0,8], h=50);
            }
        }

        // Inner cutout
        move([0,0,-2]) cyl(l=12, d=70, center=false); // should be 72

        // outer cutout
        difference() {
            move([0,0,-2]) cyl(l=12, d=120, center=false);
            move([0,0,-3]) cyl(l=14, d=88, center=false);
        }
    }
}

module small_dividers()
{
    difference() {
        union() {
            rotate([0,0,60]) {
                move([0,50,4]) rotate([90,0,0]) prismoid(size1=[7,8], size2=[0,8], h=50);
            }

            rotate([0,0,(360/3) + 60]) {
                move([0,50,4]) rotate([90,0,0]) prismoid(size1=[7,8], size2=[0,8], h=50);
            }

            rotate([0,0,(-360/3 + 60)]) {
                move([0,50,4]) rotate([90,0,0]) prismoid(size1=[7,8], size2=[0,8], h=50);
            }
        }

        // Inner cutout
        move([0,0,-2]) cyl(l=12, d=72.01, center=false);

        // outer cutout
        difference() {
            move([0,0,-2]) cyl(l=12, d=110, center=false);
            move([0,0,-3]) cyl(l=14, d=88, center=false);
        }
    }
}

module levers()
{
    difference() {
        // Render the material for the levers
        move([0,0,6]) tube(h=2, od=86, id=74);

        // Cut out the end of each lever to form a 1mm gap
        rotate([0,0,60]) {
            move([0,50,6]) rotate([90,0,0]) prismoid(size1=[9,8], size2=[0,8], h=50);
        }

        rotate([0,0,(360/3) + 60]) {
            move([0,50,6]) rotate([90,0,0]) prismoid(size1=[9,8], size2=[0,8], h=50);
        }

        rotate([0,0,(-360/3 + 60)]) {
            move([0,50,6]) rotate([90,0,0]) prismoid(size1=[9,8], size2=[0,8], h=50);
        }

        // Add a mounting hole to the end of each lever
        rotate([0,0,60]) {
            rotate([0,0, 10]) move([0,40,6]) {
                cube([4,3,10], center=true);
                move([0,2,0]) cube([2.75,2,10], center=true);
            }
            rotate([0,0,-10]) move([0,40,6]) {
                cube([4,3,10], center=true);
                move([0,2,0]) cube([2.75,2,10], center=true);
            }
        }
        rotate([0,0,(360/3) + 60]) {
            rotate([0,0, 10]) move([0,40,6]) {
                cube([4,3,10], center=true);
                move([0,2,0]) cube([2.75,2,10], center=true);
            }
            rotate([0,0,-10]) move([0,40,6]) {
                cube([4,3,10], center=true);
                move([0,2,0]) cube([2.75,2,10], center=true);
            }
        }
        rotate([0,0,(-360/3 + 60)]) {
            rotate([0,0, 10]) move([0,40,6]) {
                cube([4,3,10], center=true);
                move([0,2,0]) cube([2.75,2,10], center=true);
            }
            rotate([0,0,-10]) move([0,40,6]) {
                cube([4,3,10], center=true);
                move([0,2,0]) cube([2.75,2,10], center=true);
            }
        }
    }
}

module bump()
{
    // Shaft
    move([0,0,0.5]) cube([3.75,2.75,3.5], center=true);

    // Clips
    move([0,0,-1.25]) cube([5,2.75,2], center=true);

    // Head
    move([0,0,2]) prismoid(size1=[6,2.75], size2=[3,2.75], h=3);
}

module lever_bumps_print()
{
    move([-5,27,6.625]) {
        rotate([90,0,0]) {
            move([7,0,0]) bump();
            move([0,0,0]) bump();
            move([-7,0,0]) bump();

            move([7,0,9]) bump();
            move([0,0,9]) bump();
            move([-7,0,9]) bump();
        }
    }
}

module outer_edge()
{
    tube(h=8, od=90, id=88);
}

module springs()
{
    difference() {
        union() {
            // Large dividers
            large_dividers();

            // Small dividers
            small_dividers();

            // Draw the levers
            levers();

            // Edges
            outer_edge();
        }

        // Remove some material from underneath
        move([0,0,-3]) tube(h=8, od=88.01, id=50);

        // Red dot marker
        move([0,40,8]) cyl(h=16, d=3);
    }

    // Add the lever bumps in print position
    lever_bumps_print();
}