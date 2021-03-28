/************************************************************************

	main.scad
    
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

// Rendering quality
$fn = 50;

module guide_pin()
{
    // Centre guide ring
    difference() {
        move([0,0,2]) cyl(l=2, d=27, center=false);
        move([0,0,1]) cyl(l=4, d=25, center=false);
    }

    // Centre guide cone
    move([0,0,3]) cyl(l=9, d1=7, d2=6, center=false);
}

module outer_lip()
{
    difference() {
        // Main outer lip
        difference() {
            move([0,0,0]) cyl(l=8, d=100, center=false);
            move([0,0,-1]) cyl(l=10, d=90, center=false);
        }

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

module central_part()
{
    difference() {
        move([0,0,0]) cyl(l=8, d=70, center=false);
        move([0,0,3]) cyl(l=6, d=69, center=false);
    }

    difference() {
        move([0,0,0]) cyl(l=8, d=90, center=false);
        move([0,0,-1]) cyl(l=10, d=89, center=false);
    }
}

module bracket()
{
    central_part();
    guide_pin();
    outer_lip();
}

// Main
bracket();