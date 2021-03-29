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
                move([0,50,4]) rotate([90,0,0]) prismoid(size1=[34,8], size2=[0,8], h=50);
            }

            rotate([0,0,360/3]) {
                move([0,50,4]) rotate([90,0,0]) prismoid(size1=[34,8], size2=[0,8], h=50);
            }

            rotate([0,0,-360/3]) {
                move([0,50,4]) rotate([90,0,0]) prismoid(size1=[34,8], size2=[0,8], h=50);
            }
        }

        // Inner cutout
        move([0,0,-2]) cyl(l=12, d=72, center=false);

        // outer cutout
        difference() {
            move([0,0,-2]) cyl(l=12, d=110, center=false);
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
        move([0,0,-2]) cyl(l=12, d=72, center=false);

        // outer cutout
        difference() {
            move([0,0,-2]) cyl(l=12, d=110, center=false);
            move([0,0,-3]) cyl(l=14, d=88, center=false);
        }
    }
}

module lever_bumps()
{
    difference() {
        union() {
            rotate([0,0,0]) {
                rotate([0,0,5.1]) {
                    move([2,-40,8]) rotate([90,0,0]) cyl(h=8, d=4);
                }

                rotate([0,0,-5.1]) {
                    move([-2,-40,8]) rotate([90,0,0]) cyl(h=8, d=4);
                }
            }

            rotate([0,0,(360/3)]) {
                rotate([0,0,5.1]) {
                    move([2,-40,8]) rotate([90,0,0]) cyl(h=8, d=4);
                }

                rotate([0,0,-5.1]) {
                    move([-2,-40,8]) rotate([90,0,0]) cyl(h=8, d=4);
                }
            }

            rotate([0,0,(-360/3)]) {
                rotate([0,0,5.1]) {
                    move([2,-40,8]) rotate([90,0,0]) cyl(h=8, d=4);
                }

                rotate([0,0,-5.1]) {
                    move([-2,-40,8]) rotate([90,0,0]) cyl(h=8, d=4);
                }
            }
        }

        // Remove the lower side of the cylinder
        move([0,0,4]) tube(h=4, od=90, id=70);

        // Trim the outer edges
        move([0,0,4]) tube(h=8, od=90, id=86);

        // Trim the inner edges
        move([0,0,4]) tube(h=8, od=74, id=70);

        // Trim the front edges
        union() {
            rotate([0,0,60]) {
                move([0,50,8]) rotate([90,0,0]) prismoid(size1=[9,8], size2=[0,8], h=50);
            }

            rotate([0,0,(360/3) + 60]) {
                move([0,50,8]) rotate([90,0,0]) prismoid(size1=[9,8], size2=[0,8], h=50);
            }

            rotate([0,0,(-360/3 + 60)]) {
                move([0,50,8]) rotate([90,0,0]) prismoid(size1=[9,8], size2=[0,8], h=50);
            }
        }
    }
}

module levers()
{
    difference() {
        // Render the material for the levers
        move([0,0,7]) tube(h=1, od=86, id=74); // 8 mm thick

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
    }

    // Add a raised area to the end of each lever
    lever_bumps();
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

            // Outer edge
            outer_edge();
        }

        // Red dot marker point indentation
        move([0,39.5,7]) cyl(l=2, d=4, center=false);
    }
}