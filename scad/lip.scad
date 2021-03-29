/************************************************************************

	lip.scad
    
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

module solid_parts()
{
    difference() {
        union() {
            cutWidth = 37;
            rotation = 31.5;

            // Cut out 1
            rotate([0,0,0 + rotation]) {
                move([0,50,4]) rotate([90,0,0]) prismoid(size1=[cutWidth,8], size2=[0,8], h=50);
            }

            // Cut out 2
            rotate([0,0,(360/3) + rotation]) {
                move([0,50,4]) rotate([90,0,0]) prismoid(size1=[cutWidth,8], size2=[0,8], h=50);
            }

            // Cut out 3
            rotate([0,0,(-360/3) + rotation]) {
                move([0,50,4]) rotate([90,0,0]) prismoid(size1=[cutWidth,8], size2=[0,8], h=50);
            }
        }

        // Inner cutout
        move([0,0,-1]) cyl(h=10, d=90, center=false);

        // Outer cutout
        move([0,0,-1]) tube(h=10, od=110, id=100);
    }
}

module upper_lip()
{
    difference() {
        // Main outer lip
        move([0,0,6]) tube(h=2, od=100, id=90);

        // Cut out 1
        rotate([0,0,0]) {
            move([0,50,4]) rotate([90,0,0]) prismoid(size1=[20,10], size2=[0,10], h=50);
        }

        // Cut out 2
        rotate([0,0,360/3]) {
            move([0,50,4]) rotate([90,0,0]) prismoid(size1=[20,10], size2=[0,10], h=50);
        }

        // Cut out 3
        rotate([0,0,-360/3]) {
            move([0,50,4]) rotate([90,0,0]) prismoid(size1=[20,10], size2=[0,10], h=50);
        }
    }
}

module lip()
{
    upper_lip();
    solid_parts();
}